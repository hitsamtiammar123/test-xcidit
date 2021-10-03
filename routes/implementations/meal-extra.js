const { MealMasterExtra } = require('../../models');

const getAllMealExtra = async (req,res,next) => {
  try{
    const mealExtras = await MealMasterExtra.findAll();
    res.status(200).json({
      status: 200,
      message: 'Success',
      data: {
        mealExtras
      }
    })
  }catch(err){
    next(err);
  }
}

const createMealExtra = async (req, res, next) => {
  try{
    const body = req.body;
    const mealextra = MealMasterExtra.build({
      maxcapacity: body.maxcapacity,
      starttime: body.starttime,
      endtime: body.endtime,
      price: body.price,
      mealmasterid: body.mealmasterid,
    });
    const resSave = await mealextra.save();
    if(resSave){
      res.status(201).json({
        status: 200,
        message: 'Meal Extra Has been saved',
        data: {
          mealextra: resSave
        }
      })
    }
    else{
      res.status(400).json({
        status: 400,
        message: 'Failed to saved meal data'
      })
    }
  }catch(err){
    next(err);
  }
}

const updateMealExtra = async (req,res, next) => {
  try{
    const body = req.body;
    const id = req.params.id;

    const mealExtra = await MealMasterExtra.findByPk(id);
    mealExtra.maxcapacity = body.maxcapacity;
    mealExtra.starttime = body.starttime;
    mealExtra.endtime = body.endtime;
    mealExtra.price = body.price;

    const resSave = await mealExtra.save();
    if(resSave){
      res.status(201).json({
        status: 200,
        message: 'Meal Extra Has been Updated',
        data: {
          mealExtra: resSave
        }
      })
    }
    else{
      res.status(400).json({
        status: 400,
        message: 'Failed to Updated meal data'
      })
    }

  }catch(err){
    next(err);
  }
}

module.exports = {
  createMealExtra,
  updateMealExtra,
  getAllMealExtra
}