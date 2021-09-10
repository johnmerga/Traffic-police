const mongoose = require('mongoose');

const OfficerSchema = new mongoose.Schema({
    email: {
        required: true,
        type: String,
        unique: [true, 'An officer with that email already exists'],
    },
    password: {
        required: true,
        type: String,
        minlength: [8, 'Password should be at least 8 characters long']
    },
    birthOfDate: {
        type: Date,
    },
    firstName:{
        type: String,
    },
    lastName:{
        type: String,
    },
    sex:{
        type: String,
    },
    position:{
        type: String,
    },
    state:{
        type: String,
    },
    phoneNumber:{
        type: String,
    },
    startDate:{
        type: Date,
        default: Date.now()
    },
    is_admin: { type: Boolean, default:false },
    is_deleted: { type: Boolean, default:false },
})


module.exports = mongoose.model('Officer', OfficerSchema);