const jwt=require('jsonwebtoken');

module.exports = (role) => {
  return (req,res,next) => {
    let { authorization }=req.headers;

    if(authorization){
        let secret=process.env.JWT_SECRET;

        try{
            req.user = jwt.verify(authorization, secret);
            console.log({ u: req.user, role})
            if(role && req.user.role !== role){
              res.status(401).json({status:401,message:'You have no authorization to access this api'});
              return;
            }
        }
        catch(err){
            res.status(400).json({status:400,message:'Token invalid'});
            return;
        }
        next();
    }
    else{
        res.status(401).json({status:401,message:'Unauthenticated'});
    }
  }
}
