'use strict';
const {
  Model,
  ValidationError,
  ValidationErrorItem
} = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  class MealMaster extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */

    async checkUniqueDays(){
      const branchId = this.branchId;
      const day = this.day;
      const check = await MealMaster.findOne({ where: { branchId, day } });
      if(check){
        return true;
      }
      return false;
    }

    static associate(models) {
      // define association here
      MealMaster.belongsTo(models.Branch, { foreignKey: 'branchId' });
      MealMaster.hasMany(models.MealTime, { foreignKey: 'mealMasterId' } );
      MealMaster.hasMany(models.MealMasterExtra, { foreignKey: 'mealmasterid' } )
    }
  };
  MealMaster.init({
    day: {
      type: DataTypes.ENUM('monday','tuesday','wednesday','thursday','friday','saturday','sunday'),
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    branchId: DataTypes.INTEGER,
  }, {
    sequelize,
    modelName: 'MealMaster',
  });

  MealMaster.addHook('afterValidate', (mealmaster) => {
    // console.log('after validate', {mealmaster});
    return new Promise(async (resolve, reject) => {
        const r = await mealmaster.checkUniqueDays();
        if(r){
          const validationError = new ValidationError();
          validationError.errors.push(new ValidationErrorItem('Day already exist on this branch', 'day', null, mealmaster.day, mealmaster, 'day'))
          reject(validationError);
        }
        else{
          resolve();
        }
    })
  })

  return MealMaster;
};