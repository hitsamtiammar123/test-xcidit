const router = require('express').Router();
const authenticate = require('../middleware/authenticate');
const { makeReservation } = require('./implementations/reservation');

router.use(authenticate('admin'));
router.post('/:mealmasterId', makeReservation);

module.exports = router;
