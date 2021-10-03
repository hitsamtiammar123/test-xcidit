const router = require('express').Router();
const { getAllBranch, createBranch, updateBranch, deleteBranch } = require('./implementations/branch');

router.get('/', getAllBranch);
router.post('/', createBranch);
router.put('/:id', updateBranch);
router.delete('/:id', deleteBranch);

module.exports = router;