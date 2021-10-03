const router = require('express').Router();
const authenticate = require('../middleware/authenticate');
const { getAllMealPlan, createMealPlan, deleteMealPlan, updateMealPlan } = require('./implementations/meal-plan');

router.use(authenticate('admin'));
router.get('/', getAllMealPlan);
router.post('/', createMealPlan);
router.put('/:id', updateMealPlan);
router.delete('/:id', deleteMealPlan)

module.exports = router;
