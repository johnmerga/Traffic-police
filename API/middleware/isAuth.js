const jwt = require('jsonwebtoken');
const Officer = require('../model/Officer');
const asyncHandler = require('../middleware/asyncHandler');

const isAuth = async(req, res, next) => {
    if ((req.headers.authorization) && (req.headers.authorization.startsWith('Bearer'))) {
        const token = req.headers.authorization.split(' ')[1];
        try {
            const officerId = jwt.verify(token, process.env.JWT_SECRET_KEY);

            // @ts-ignore
            const officer = await Officer.findById(officerId.id);
            if (!officer) {
                return res.status(404).json({
                    status: false,
                    msg: 'Authorization Failed'
                })
            }

            req.officer = officer;
            return next();
        } catch (error) {
            return res.status(200).json({
                status: false,
                msg: 'Error Verifying officer'
            })
        }
    }
    return res.status(200).json({
        status: true,
        msg: 'Authorization Failed'
    })
}

module.exports = isAuth;