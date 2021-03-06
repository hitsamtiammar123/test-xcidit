const router = require('express').Router();
const authenticate = require('../middleware/authenticate');
const { getAllUser } = require('./implementations/user');

router.use(authenticate('admin'));
router.get('/', getAllUser)

module.exports = router;
