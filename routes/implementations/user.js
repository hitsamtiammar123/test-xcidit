const { User } = require('../../models');

const getAllUser = async (req, res) => {
  try{
    const users = await User.findAll({ attributes: { exclude: ['password'] }});
    res.status(200).json({
      status: 200,
      message: 'Success',
      data: {
        users
      }
    });
  }catch(err){
    res.status(500).json(err);
    // next(err);
  }
}

module.exports = {
  getAllUser
};
