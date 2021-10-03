const router = require('express').Router();
const { getAllUser } = require('./implementations/user');

router.get('/', getAllUser)

module.exports = router;
