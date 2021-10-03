const router = require('express').Router();
const {
  getMealMasterOfBranch,
  createMealMaasterOfBranch,
  createMealTimeOfMaster,
} = require('./implementations/meal-master');

router.get('/get-by-branch/:branchId', getMealMasterOfBranch);
router.post('/create-by-branch/:branchId', createMealMaasterOfBranch)
router.post('/create-mealtime/:mealmasterId', createMealTimeOfMaster);

module.exports = router;
