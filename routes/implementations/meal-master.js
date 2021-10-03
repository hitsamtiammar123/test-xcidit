const { keyBy } = require('lodash');
const { Op } = require('sequelize');
const { MealMaster, MealTime, MealPlan, Branch } = require('../../models');

const getExtraFilterForMasterBranch = (req) => {
  const extraFilterMealPlan = {
    where: {}
  };
  const extraFilterMealTime = {
    where: {}
  };
  if(req.query.name){
    extraFilterMealPlan.where = {
      name: {
        [Op.iLike]: `%${req.query.name}%`
      }
    }
  }

  if(req.query.starttime){
    extraFilterMealTime.where = {
      ...extraFilterMealTime.where,
      starttime: req.query.starttime
    }
  }

  if(req.query.endtime){
    extraFilterMealTime.where = {
      ...extraFilterMealTime.where,
      endtime: req.query.endtime
    }
  }

  return { extraFilterMealPlan, extraFilterMealTime }
}

const getMealMasterOfBranch = async (req,res,next) => {
  try{
    const { extraFilterMealPlan, extraFilterMealTime} = getExtraFilterForMasterBranch(req);
    
    const branchId = req.params.branchId;
    const branch = await Branch.findByPk(branchId);
    const mealmasters = await MealMaster.findAll({
      where: { branchId },
      include: {
        model: MealTime,
        ...extraFilterMealTime,
        include: {
          model: MealPlan,
          ...extraFilterMealPlan
        }
      },
      order: [
        [MealTime, 'starttime', 'ASC']
      ],
    });

    // console.log({ mealmasters });
    const mealMastersArr = await Promise.all(mealmasters.map(async (m) => {
      const obj = m.toJSON();
      return {
        ...obj,
        startingPrice: await m.getStartingPrice(),
      }
    }))

    res.status(200).json({
      status: 200,
      message: 'Success',
      data: {
        branch,
        mealmasters: keyBy(mealMastersArr, 'day')
      }
    });

  }catch(err){
    if(err.name === 'SequelizeForeignKeyConstraintError'){
      res.status(404).json({
        status: 404,
        message: `Branch with id ${branchId} is not found`
      })
      return;
    }
    next(err);
  }
}

const createMealMaasterOfBranch = async (req,res, next) => {
  const branchId = req.params.branchId;
  const data = req.body;
  try{
    const mealmaster = MealMaster.build({
      day: data.day,
      branchId: Number(branchId)
    });

    const resSave = await mealmaster.save();

    if(resSave){
      res.status(200).json({
        status: 200,
        message: 'Success',
        data: {
          mealmaster: resSave
        }
      });
    }
    else{
      res.status(400).json({
        status: 400,
        message: 'Failed to create new meal master'
      })
    }

  }catch(err){
    if(err.name === 'SequelizeForeignKeyConstraintError'){
      res.status(404).json({
        status: 404,
        message: `Branch with id ${branchId} is not found`
      })
      return;
    }
    next(err);
  }
}

const createMealTimeOfMaster = async (req, res, next) => {
  const mealmasterId = req.params.mealmasterId;
  const data = req.body;

  try{
    const mealtime = MealTime.build({
      price: data.price,
      starttime: data.starttime,
      endtime: data.endtime,
      maxcapacity: data.maxcapacity,
      mealPlanId: data.mealPlanId,
    });
    const mealmaster = await MealMaster.findByPk(mealmasterId);
    if(mealmaster){
      mealtime.mealMasterId = mealmaster.id;
      const r = await mealtime.save();
      if(r){
        res.status(201).json({
          status: 201,
          message: 'Successfully add new meal time',
          data: {
            mealtime,
          }
        })
      }
      else{
        res.status(400).json({ status: 400, message: 'Failed to save new mealtime', data: { request: req.body} })
      }
    }
    else{
      res.status(404).json({ status: 404, message: 'Meal master not found' })
    }
  }catch(err){
    if(err.name === 'SequelizeForeignKeyConstraintError'){
      res.status(404).json({
        status: 404,
        message: `Meal Master with id ${mealmasterId} is not found`
      })
      return;
    }
    // console.log('going to error', err);
    next(err);
  }
}

module.exports = {
  getMealMasterOfBranch,
  createMealMaasterOfBranch,
  createMealTimeOfMaster
};
