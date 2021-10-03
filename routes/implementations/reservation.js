const { Reservation } = require('../../models');

const makeReservation = async (req, res, next) => {
  try{
    const mealmasterId = req.params.mealmasterId;
    const body = req.body;
    const mReservationTime = body.reservationtime;
    const reservation = Reservation.build({
      reservationtime: mReservationTime,
      capacity: body.capacity,
      mealmasterid: Number(mealmasterId),
      userid: 5,
    });
    
    const resSave = await reservation.save();

    if(resSave){
      res.status(201).json({
        status: 201,
        message: 'Reservation has been created',
        data: {
          reservation: resSave
        }
      })
    }
    else{
      res.status(400).json({
        status: 400,
        message: 'Failed to make new Reservation',
      })
    }

  }catch(err){
    next(err);
  }
}

module.exports = {
  makeReservation
}