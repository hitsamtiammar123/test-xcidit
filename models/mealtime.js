'use strict';
const { QueryTypes , ValidationError, ValidationErrorItem } = require('sequelize');
const WithTimeModel = require('../commons/WithTimeModel');

module.exports = (sequelize, DataTypes) => {
  class MealTime extends WithTimeModel {
    async checkIntersectDate(time = null){
      if(time === null){
        return false;
      }
      const mealMasterId = this.mealMasterId;
      const q = `SELECT "id", "price", "starttime", "endtime", "maxcapacity", "mealMasterId", "mealPlanId", "createdAt", "updatedAt" 
      FROM "MealTimes" AS "MealTime" 
      WHERE "MealTime"."mealMasterId" = :mealMasterId AND :time >= "MealTime"."starttime" and :time <= "MealTime"."endtime"`;

      const check = await sequelize.query(q, { type: QueryTypes.SELECT, replacements: { time, mealMasterId } });
      if(check.length){
        return true;
      }
      return false;
    }

    static associate(models) {
      // define association here
      MealTime.belongsTo(models.MealMaster, { foreignKey: 'mealMasterId' });
      MealTime.belongsTo(models.MealPlan, { foreignKey: 'mealPlanId' })
    }
  };

  MealTime.init({
    price: DataTypes.DECIMAL,
    starttime: DataTypes.TIME,
    endtime: DataTypes.TIME,
    maxcapacity: DataTypes.INTEGER,
    mealMasterId: DataTypes.INTEGER,
    mealPlanId: {
      type: DataTypes.INTEGER,
      validate: {
        notEmpty: true,
      }
    }
  }, {
    sequelize,
    modelName: 'MealTime',
  });

  MealTime.addHook('afterValidate', (mealtime) => {
    return new Promise(async (resolve, reject) => {
      // const errorList = [];
      const checkStartTime = await mealtime.checkIntersectDate(mealtime.starttime);
      const checkEndTime = await mealtime.checkIntersectDate(mealtime.endtime);
      const validDate = mealtime.checkBetweenDate();
      const errorList = new ValidationError();


      if(checkStartTime){
        // console.log('start time error')
        const type = 'starttime'
        const message = 'Start time is between the existing other time';
        errorList.errors.push(new ValidationErrorItem(message, null, null, mealtime.starttime, mealtime, type));
      }

      if(checkEndTime){
        // console.log('end time error')
        const type = 'endtime'
        const message = 'End time is between the existing other time';
        errorList.errors.push(new ValidationErrorItem(message, null, null, mealtime.endtime, mealtime, type));
      }

      if(!validDate){
        // console.log('valid date error')
        const type = 'starttime-endtime'
        const message = 'Endtime must be larger than starttime';
        errorList.errors.push(new ValidationErrorItem(message, null, null, mealtime.starttime, mealtime, type));
      }

      // console.log({e: errorList.errors})
      if(errorList.errors.length === 0){
        resolve();
      }
      else{
        reject(errorList)
      }

    })
  })
  return MealTime;
};