const isAdmin = async(req, res, next) => {

    if(req.officer.is_admin == true){
            return next();
    }
    return res.status(200).json({
        status: true,
        msg: 'Authorization Failed'
    })
}

module.exports = isAdmin;