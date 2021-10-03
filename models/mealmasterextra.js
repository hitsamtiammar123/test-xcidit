'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class MealMasterExtra extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      MealMasterExtra.belongsTo(models.MealMaster, { foreignKey: 'mealmasterid' });
    }
  };
  MealMasterExtra.init({
    mealmasterid: DataTypes.INTEGER,
    maxcapacity: DataTypes.INTEGER,
    price: DataTypes.NUMBER
  }, {
    sequelize,
    modelName: 'MealMasterExtra',
  });
  return MealMasterExtra;
};