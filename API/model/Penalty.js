const mongoose = require('mongoose');

const PenaltySchema = new mongoose.Schema({
    officerId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Officer',
        required:true,
    },
    subcity: {
        required: true,
        type: String
    },
    victimName:{
        required: true,
        type: String
    },
    victimLastName:{
        required: true,
        type: String
    },
    license_number:{
        required: true,
        type: String
    },
    plate_number:{
        required: true,
        type: String
    },
    description:{
        required: true,
        type: String
    },
    penalty_in_birr:{
        required: true,
        type: Number
    },
    dateOfIssue: {
        required: true,
        type: Date,
        default: Date.now()
    },
})
 


module.exports = mongoose.model('Penalty', PenaltySchema);