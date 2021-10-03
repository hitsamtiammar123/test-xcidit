const { MealTime } = require('../../models');

const updateMealTime = async (req, res, next) => {
  try{
    const id = req.params.id;
    const body = req.body;
    const mealtime = await MealTime.findByPk(id);
    if(mealtime){
      mealtime.price = body.price;
      mealtime.starttime = body.starttime;
      mealtime.endtime = body.endtime;
      mealtime.mealPlanId = body.mealPlanId;
      mealtime.maxcapacity = body.maxcapacity;
      const resSave = await mealtime.save();
      if(resSave){
        res.status(200).json({
          status: 200,
          message: 'Mealtime has been updated',
          data: {
           mealtime: resSave 
          }
        })
      }
      else{
        res.status(400).json({
          status: 400,
          message: 'Failed to save MealTime'
        })
      }
    }
    else{
      res.status(404).json({
        status: 404,
        message:'Mealtime not found'
      })
    }
  }catch(err){
    next(err);
  }
}

module.exports = {
  updateMealTime
}