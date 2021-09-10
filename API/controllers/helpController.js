
const Help = require('../model/Help');
const asyncHandler = require('../middleware/asyncHandler');
var mongoose = require('mongoose');


exports.create = asyncHandler(async(req, res, next) => {

    const payload = req.body;

    payload.officerId = req.officer._id;

    help = await Help.create(payload);

    return res.status(201).json({
        status: true,
        data: help,
    })
})

exports.delete = asyncHandler(async(req, res, next) => {
    const id = req.params.id


    let help = await Help.findById(id)

    if (!help) {
        return res.status(201).json({
            status: false,
            msg: 'Help not found'
        })
    }

    help = await Help.findByIdAndDelete(id)

    return res.status(201).json({
        status: true,
        data: help,
    })
})


exports.update = asyncHandler(async(req, res, next) => {
    const id = req.params.id
    const payload = req.body;
    payload.officerId = req.officer._id;


    let help = await Help.findById(id)

    if (!help) {
        return res.status(201).json({
            status: false,
            msg: 'Help not found'
        })
    }

    help = await Help.findByIdAndUpdate(id, payload,{new: true})

    return res.status(201).json({
        status: true,
        data: help,
    })
})


exports.getAll = asyncHandler(async(req, res, next) => {
    const help = await Help.find({ findAssistance: false,officerId:{ "$ne": req.officer._id}});

    return res.status(201).json({
        status: true,
        data: help,
    })
})

exports.getMine = asyncHandler(async(req, res, next) => {
    const help = await Help.find({officerId: req.officer._id });

    return res.status(201).json({
        status: true,
        data: help,
    })
})


exports.getAllAdmin = asyncHandler(async(req, res, next) => {
    help = await Help.find({});

    return res.status(201).json({
        status: true,
        data: help,
    })
})

