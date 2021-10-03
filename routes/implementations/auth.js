const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const { User } = require('../../models');

const login = async (req,res, next) => {
  try{
    const users = await User.findAll();
    const email = req.body.email;
    const password = req.body.password;
    let u = null;
    for(let i = 0; i < users.length; i++){
      const user = users[i];
      if(user.email === email && bcrypt.compareSync(password, user.password)){
        u = user;
        break;
      }
    }
    if(u){
      const userJSON = u.toJSON();
      delete userJSON.password;
      const token = jwt.sign(userJSON, process.env.JWT_SECRET);
      res.status(200).json({
        status: 200,
        message: 'Login success',
        data: {
          ...userJSON,
          token
        }
      })
    }
    else{
      res.status(200).json({
        status: 400,
        message: 'Login Failed',
      })
    }
  }catch(err){
    next(err);
  }
}

module.exports = {
  login
}