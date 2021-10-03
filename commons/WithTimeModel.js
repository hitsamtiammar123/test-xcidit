const { Model } = require('sequelize');
const moment = require('moment');

module.exports = class WithTimeModel extends Model{
  checkBetweenDate(){
    if(this.starttime && this.endtime){
      const mStart = moment(this.starttime, 'HH:ii');
      const mEnd = moment(this.endtime, 'HH:ii');
      if(mEnd.diff(mStart, 'minute') > 0){
        return true;
      }
      return false;
    }
    return true;
  }
}