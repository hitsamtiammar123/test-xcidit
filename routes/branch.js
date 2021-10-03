const router = require('express').Router();
const authenticate = require('../middleware/authenticate');
const { getAllBranch, createBranch, updateBranch, deleteBranch } = require('./implementations/branch');

router.use(authenticate('admin'));
router.get('/', getAllBranch);
router.post('/', createBranch);
router.put('/:id', updateBranch);
router.delete('/:id', deleteBranch);

module.exports = router;