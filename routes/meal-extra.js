const router = require('express').Router();
const authenticate = require('../middleware/authenticate');
const { createMealExtra, updateMealExtra, getAllMealExtra } = require('./implementations/meal-extra');

router.use(authenticate('admin'));
router.get('/', getAllMealExtra);
router.post('/', createMealExtra);
router.put('/:id', updateMealExtra);

module.exports = router;
