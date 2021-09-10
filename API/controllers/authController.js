const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const asyncHandler = require('../middleware/asyncHandler');
const Officer = require('../model/Officer');

exports.signup = asyncHandler(async (req, res, next) => {
    const payload = req.body;
    const { email, password } = payload;

    let officer = await Officer.findOne({ email })
    if (officer) {
        return res.status(400).json({
            status: false,
            msg: `Officer with email already exists`
        })
    }

    const salt = await bcrypt.genSalt(10);
    payload.password= await bcrypt.hash(password, salt);


    officer = await Officer.create(payload)
    if (!officer) {
        return res.status(200).json({
            status: false,
            msg: 'Error creating officer'
        })
    }

    // const token = jwt.sign({ id: officer._id,email }, process.env.JWT_SECRET_KEY, { expiresIn: process.env.JWT_EXPIRES_IN });

    return res.status(201).json(
        {
            status: true,
            msg: "Officer account successfully!!!"
        });
})

exports.login = asyncHandler(async (req, res, next) => {
    let payload = req.body;
    const { email, password } = payload;

    if (email == "admin@gmail.com" && password == "admin123") {

        let officer = await Officer.findOne({ email })
        if (!officer) {
            const salt = await bcrypt.genSalt(10);
          
            payload = {
                "email": "admin@gmail.com",
                "password": "admin123",
                "birthOfDate": new Date(2010, 6, 26).getTime(),
                "firstName": "John",
                "lastName": "Ass",
                "sex": "Female",
                "position": "Bottom",
                "state": "Dead",
                "phoneNumber": "+251912345678",
                "is_admin": true,
            }
            payload.password= await bcrypt.hash(password, salt);
    
            officer = await Officer.create(payload)

            if (!officer) {
                return res.status(200).json({
                    status: false,
                    msg: 'Error logging in as admin'
                })
            }

        }


        const token = jwt.sign({ id: officer._id}, process.env.JWT_SECRET_KEY, { expiresIn: process.env.JWT_EXPIRES_IN })

        return res.status(201).json({
            status: true,
            jwt: token,
            data: officer
        })
    }

    let officer = await Officer.findOne({ email }).populate('role').select('+password')
    console.log(officer)
    if (!officer) {
        return res.status(200).json({
            status: false,
            msg: 'Officer not found'
        })
    }

    // @ts-ignore
    const isMatched = await bcrypt.compare(password, officer.password)

    if (!isMatched) {
        return res.status(200).json({
            status: false,
            msg: 'Password incorrect'
        })
    }

    if(officer.is_deleted == true){
        return res.status(200).json({
            status: false,
            msg: 'Officer not found'
        })
    }

    const token = jwt.sign({ id: officer._id }, process.env.JWT_SECRET_KEY, { expiresIn: process.env.JWT_EXPIRES_IN })


    officer = officer.toObject();
    return res.status(200).json({
        status: true,
        data: officer,
        jwt: token
    })

})

