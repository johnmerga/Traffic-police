const mongoose = require('mongoose');

const HelpSchema = new mongoose.Schema({
    officerId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Officer',
        required:true,
    },
    findAssistance: {
        type: Boolean,
        default:false,
    },
    subcity: {
        required: true,
        type: String
    },
    description:{
        required: true,
        type: String
    },
    date: {
        required: true,
        type: Date,
        default: Date.now()
    },
})



module.exports = mongoose.model('Help', HelpSchema);