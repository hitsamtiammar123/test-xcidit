const router = require('express').Router();
const authenticate = require('../middleware/authenticate');
const {
  getMealMasterOfBranch,
  createMealMaasterOfBranch,
  createMealTimeOfMaster,
} = require('./implementations/meal-master');

router.use(authenticate());
router.get('/get-by-branch/:branchId', getMealMasterOfBranch);
router.post('/create-by-branch/:branchId', createMealMaasterOfBranch)
router.post('/create-mealtime/:mealmasterId', createMealTimeOfMaster);

module.exports = router;
