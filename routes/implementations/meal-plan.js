const { MealPlan } = require('../../models');

const getAllMealPlan = async (req, res, next) => {
  try{
    const mealplans = await MealPlan.findAndCountAll({
      order: ['id']
    })
    res.status(200).json({
      status: 200,
      message: 'Success',
      data: {
        mealplans
      }
    });
  }catch(err){
    next(err);
  }
}

const createMealPlan = async (req,res) => {
  try{
    const data = req.body;
    const mealplan = MealPlan.build({
      name: data.name,
    });
    const resSave = await mealplan.save();
    if(res){
      res.status(201).json({
        status: 201,
        message: 'Meal Plan has been created',
        data: {
          branch: resSave
        }
      });
    }
    else{
      res.status(400).json({
        status: 400,
        message: 'Meal Plan failed to be created'
      });
    }
  }catch(err){
    next(err);
  }
}

const updateMealPlan = async (req,res) => {
  try{
    const id = req.params.id;
    const mealplan = await MealPlan.findByPk(id);
    if(!mealplan){
      res.send(404).json({
        status: 404,
        message: 'Meal Plan data not found',
        data: {
          branch
        }
      })
      return;
    }

    mealplan.name = req.body.name;
    const resSave = await mealplan.save();

    if(resSave){
      res.status(200).json({
        status: 200,
        message: 'Successfully update mealplan',
        data: {
          mealplan
        }
      });
    }
    else{
      res.status(400).json({
        status: 400,
        message: 'Failed to update mealplan',
        data: {
          mealplan
        }
      });
    }
  }catch(err){
    next(err);
  }
}

const deleteMealPlan = async (req,res) => {
  try{
    const id = req.params.id;
    const mealplan = await MealPlan.findByPk(id);
    if(mealplan){
      const resDelete = await mealplan.destroy();
      if(resDelete){
        res.status(200).json({
          status: 200,
          messge: 'Meal Plan has been deleted',
          data: {
            branch: resDelete
          }
        });
        return;
      }
      res.status(400).json({
        status: 400,
        messge: 'Failed to delete Meal Plan',
        data: {
          branch: resDelete
        }
      })
    }
    res.status(404).json({
      status: 404,
      messge: 'Meal Plan not found',
      data: { branch: null }
    });
    
  }catch(err){
    next(err);
  }
}

module.exports = {
  getAllMealPlan,
  createMealPlan,
  updateMealPlan,
  deleteMealPlan
}