'use strict';
const {
  ValidationError, ValidationErrorItem, QueryTypes
} = require('sequelize');
const WithTimeModel = require('../commons/WithTimeModel');

module.exports = (sequelize, DataTypes) => {
  class MealMasterExtra extends WithTimeModel {
    async checkIntersectDate(time = null){
      if(time === null){
        return false;
      }
      const mealMasterId = this.mealmasterid;
      const q = `SELECT  * FROM "MealMasterExtras" AS "MealMasterExtra" 
      WHERE "MealMasterExtra"."mealmasterid" = :mealMasterId AND :time >= "MealMasterExtra"."starttime" and :time <= "MealMasterExtra"."endtime"`;

      const check = await sequelize.query(q, { type: QueryTypes.SELECT, replacements: { time, mealMasterId } });
      if(check.length){
        return true;
      }
      return false;
    }

    static associate(models) {
      // define association here
      MealMasterExtra.belongsTo(models.MealMaster, { foreignKey: 'mealmasterid' });
    }
  };
  MealMasterExtra.init({
    mealmasterid: DataTypes.INTEGER,
    maxcapacity: DataTypes.INTEGER,
    starttime: DataTypes.TIME,
    endtime: DataTypes.TIME,
    price: DataTypes.NUMBER
  }, {
    sequelize,
    modelName: 'MealMasterExtra',
  });

  MealMasterExtra.addHook('afterValidate', (mealextra) => {
    return new Promise(async (resolve, reject) => {
      const checkStartTime = await mealextra.checkIntersectDate(mealextra.starttime);
      const checkEndTime = await mealextra.checkIntersectDate(mealextra.endtime);
      const validDate = mealextra.checkBetweenDate();
      const errorList = new ValidationError();

      if(checkStartTime){
        // console.log('start time error')
        const type = 'starttime'
        const message = 'Start time is between the existing other time';
        errorList.errors.push(new ValidationErrorItem(message, null, null, mealextra.starttime, mealextra, type));
      }

      if(checkEndTime){
        // console.log('end time error')
        const type = 'endtime'
        const message = 'End time is between the existing other time';
        errorList.errors.push(new ValidationErrorItem(message, null, null, mealextra.endtime, mealextra, type));
      }


      if(!validDate){
        // console.log('valid date error')
        const type = 'starttime-endtime'
        const message = 'Endtime must be larger than starttime';
        errorList.errors.push(new ValidationErrorItem(message, null, null, mealextra.starttime, mealextra, type));
      }

      if(errorList.errors.length === 0){
        resolve();
      }
      else{
        reject(errorList)
      }

    })
  })

  return MealMasterExtra;
};