'use strict';
const {
  Model, Op, ValidationError, ValidationErrorItem,
} = require('sequelize');
const moment = require('moment');
module.exports = (sequelize, DataTypes) => {
  let listModels = {};
  class Reservation extends Model {
    async getMealTimebyTimeBooking(){
      const mealmasterid = this.mealmasterid;
      const time = moment(this.reservationtime).format('HH:mm');
      const options = {
        include: listModels.MealMaster,
        where: {
          mealMasterId: mealmasterid,
          starttime: {
            [Op.lte]: time,
          },
          endtime: {
            [Op.gte]: time
          }
        }
      };
      
      const mealtime = await listModels.MealTime.findOne(options);
      const mealextra = await listModels.MealMasterExtra.findOne({
        where: {
          mealmasterid: mealmasterid,
          starttime: {
            [Op.lte]: time,
          },
          endtime: {
            [Op.gte]: time
          }
        }
      });

      if(mealextra){
        return mealextra;
      }

      return mealtime;

    }

    static associate(models) {
      // define association here
      listModels = models;
      Reservation.belongsTo(models.User, { foreignKey: 'userid' });
      Reservation.belongsTo(models.MealMaster, { foreignKey: 'mealmasterid'});
    }
  };
  Reservation.init({
    reservationtime: DataTypes.DATE,
    capacity: DataTypes.INTEGER,
    paidprice: {
      type: DataTypes.NUMBER,
    },
    mealmasterid: {
      type: DataTypes.INTEGER,
      validate: {
       notEmpty: true
      }
    },
    userid: DataTypes.INTEGER,
    isExtra: DataTypes.BOOLEAN
  }, {
    sequelize,
    modelName: 'Reservation',
  });

  Reservation.addHook('beforeSave', (instance) => {
    return new Promise(async (resolve, reject) => {
      const errorList = new ValidationError();      
      const mealtime = await instance.getMealTimebyTimeBooking();
      const reservationtime = instance.reservationtime;
      const mreservationtime = moment(reservationtime);
      const day = mreservationtime.format('dddd').toLowerCase();

      instance.reservationtime = mreservationtime.toDate();
      if(mealtime instanceof listModels.MealTime){
        instance.paidprice = mealtime.price;
        instance.isExtra = false;
      }
      else if(mealtime instanceof listModels.MealMasterExtra){
        instance.paidprice = mealtime.price;
        instance.isExtra = true;
      }

      if(instance.capacity > mealtime.maxcapacity){
        const type = 'capacity'
        const message = 'Capacity is overload';
        errorList.errors.push(new ValidationErrorItem(message, null, null, instance.capacity, instance, type));
      }

      if(day !== mealtime.MealMaster.day){
        const type = 'day'
        const message = 'Day is not suitable';
        errorList.errors.push(new ValidationErrorItem(message, null, null, instance.reservationtime, instance, type));
      }

      if(errorList.errors.length === 0){
        resolve();
      }
      else{
        reject(errorList)
      }
    });
  })
  
  return Reservation;
};