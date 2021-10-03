const router = require('express').Router();
const authenticate = require('../middleware/authenticate');
const { updateMealTime } = require('./implementations/meal-time');

router.use(authenticate('admin'));
router.put('/:id', updateMealTime);

module.exports = router;
