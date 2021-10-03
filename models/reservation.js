'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Reservation extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Reservation.belongsTo
    }
  };
  Reservation.init({
    reservationtime: DataTypes.DATE,
    capacity: DataTypes.INTEGER,
    paidprice: DataTypes.NUMBER,
    mealmasterid: DataTypes.INTEGER,
    userid: DataTypes.INTEGER,
    isExtra: DataTypes.BOOLEAN
  }, {
    sequelize,
    modelName: 'Reservation',
  });
  return Reservation;
};