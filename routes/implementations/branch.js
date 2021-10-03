const { Branch } = require('../../models');

const getAllBranch = async (req, res, next) => {
  try{
    const branches = await Branch.findAll({
      order: ['id'],
    });
    const lon = req.query.lon ? Number(req.query.lon) : 0;
    const lat = req.query.lat ? Number(req.query.lat) : 0;
    res.status(200).json({
      status: 200,
      message: 'Success',
      data: {
        branches: branches.map(b => ({
          ...b.toJSON(),
          distanch: b.getDistance(lon, lat)
        }))
      }
    });
  }catch(err){
    next(err);
  }
}

const createBranch = async (req,res) => {
  try{
    const data = req.body;
    const branch = Branch.build({
      name: data.name,
      latitude: data.latitude,
      longitude: data.longitude,
      openinghours: data.openinghours
    });
    const resSave = await branch.save();
    if(res){
      res.status(201).json({
        status: 201,
        message: 'Branch has been created',
        data: {
          branch: resSave
        }
      });
    }
    else{
      res.status(400).json({
        status: 400,
        message: 'Branch failed to be created'
      });
    }
  }catch(err){
    next(err);
  }
}

const updateBranch = async (req,res) => {
  try{
    const id = req.params.id;
    const branch = await Branch.findByPk(id);
    if(!branch){
      res.send(404).json({
        status: 404,
        message: 'Branch data not found',
        data: {
          branch
        }
      })
      return;
    }

    branch.name = req.body.name;
    branch.latitude = req.body.latitude;
    branch.longitude = req.body.longitude;
    branch.openinghours = req.body.openinghours;

    const resSave = await branch.save();

    if(resSave){
      res.status(200).json({
        status: 200,
        message: 'Successfully update branch',
        data: {
          branch: branch
        }
      });
    }
    else{
      res.status(400).json({
        status: 400,
        message: 'Failed to update branch',
        data: {
          branch: branch
        }
      });
    }
  }catch(err){
    next(err);
  }
}

const deleteBranch = async (req,res) => {
  try{
    const id = req.params.id;
    const branch = await Branch.findByPk(id);
    if(branch){
      const resDelete = await branch.destroy();
      if(resDelete){
        res.status(200).json({
          status: 200,
          messge: 'Branch has been deleted',
          data: {
            branch: resDelete
          }
        });
        return;
      }
    }
    res.status(404).json({
      status: 404,
      messge: 'Branch not found',
      data: { branch: null }
    });
    
  }catch(err){
    next(err);
  }
}

module.exports = {
  getAllBranch,
  createBranch,
  updateBranch,
  deleteBranch
}