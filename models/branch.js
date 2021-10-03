'use strict';
const {
  Model
} = require('sequelize');

function toRad(Value) 
{
    return Value * Math.PI / 180;
}

module.exports = (sequelize, DataTypes) => {
  class Branch extends Model {

    getDistance(lon, lat){
      const R = 6371; // km
      const dLat = toRad(lat - this.latitude);
      const dLon = toRad(lon - this.longitude);
      const lat1 = toRad(this.latitude);
      const lat2 = toRad(lat);

      const a = Math.sin(dLat/2) * Math.sin(dLat/2) +
        Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2); 
      const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
      const d = R * c;
      return d;
    }

    static associate(models) {
      // define association here
      Branch.hasMany(models.MealMaster, { foreignKey: 'branchId' })
    }
  };
  Branch.init({
    name: DataTypes.STRING,
    latitude: DataTypes.DOUBLE,
    longitude: DataTypes.DOUBLE,
    openinghours: DataTypes.TIME
  }, {
    sequelize,
    modelName: 'Branch',
  });
  return Branch;
};