const router = require('express').Router();
const { login } = require('./implementations/auth');

router.post('/login', login)

module.exports = router;
