'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class MealMaster extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  MealMaster.init({
    maxcapacity: DataTypes.INTEGER,
    price: DataTypes.NUMBER,
    day: DataTypes.ENUM,
    branchId: DataTypes.INTEGER,
    mealMasterId: DataTypes.INTEGER,
    starttime: DataTypes.TIME,
    endtime: DataTypes.TIME
  }, {
    sequelize,
    modelName: 'MealMaster',
  });
  return MealMaster;
};