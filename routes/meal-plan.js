const router = require('express').Router();
const { getAllMealPlan, createMealPlan, deleteMealPlan, updateMealPlan } = require('./implementations/meal-plan');

router.get('/', getAllMealPlan);
router.post('/', createMealPlan);
router.put('/:id', updateMealPlan);
router.delete('/:id', deleteMealPlan)

module.exports = router;
