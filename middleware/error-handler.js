
const { makeErrorResponse } = require('../commons/data');

function getRequest(req){
  const paramsLength = Object.keys(req.params).length;
  const bodyLength = Object.keys(req.body).length;
  const queryLength = Object.keys(req.query).length;
  if(queryLength > 0){
    return req.query;
  }
  if(paramsLength > 0){
    return req.params;
  }
  if(bodyLength > 0){
    return req.body;
  }
}

module.exports=(err, req, res, next)=>{
  if(err.name === 'SequelizeValidationError' || err.name === 'SequelizeForeignKeyConstraintError'){
      res.status(400).json({
        status: 400,
        message: err.message,
        err: {
          request: getRequest(req),
          detail: err.errors.map(v => ({
            message: v.message,
            instance: v.instance,
            value: v.value,
            key: v.validatorKey
          }))
        },
      });
    }
  else{
      console.log({ err });
      res.status(500).json(makeErrorResponse(err));
  }
}