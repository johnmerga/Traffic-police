const Penalty = require("../model/Penalty");
const asyncHandler = require("../middleware/asyncHandler");
var mongoose = require("mongoose");

exports.create = asyncHandler(async (req, res, next) => {
    const payload = req.body;

    payload.officerId = req.officer._id;

    penalty = await Penalty.create(payload);

    return res.status(201).json({
        status: true,
        data: penalty,
    });
});

exports.delete = asyncHandler(async (req, res, next) => {
    const id = req.params.id;

    let penalty = await Penalty.findById(id);

    if (!penalty) {
        return res.status(201).json({
            status: false,
            msg: "Penalty not found",
        });
    }

    penalty = await Penalty.findByIdAndDelete(id);

    return res.status(201).json({
        status: true,
        data: penalty,
    });
});

exports.update = asyncHandler(async (req, res, next) => {
    const id = req.params.id;
    const payload = req.body;
    payload.officerId = req.officer._id;

    let penalty = await Penalty.findById(id);

    if (!penalty) {
        return res.status(201).json({
            status: false,
            msg: "Penalty not found",
        });
    }

    penalty = await Penalty.findByIdAndUpdate(id, payload, { new: true });

    return res.status(201).json({
        status: true,
        data: penalty,
    });
});

exports.getOfficersPenalty = asyncHandler(async (req, res, next) => {
    penalty = await Penalty.find({ officerId: req.officer._id });

    return res.status(201).json({
        status: true,
        data: penalty,
    });
});

exports.getAllAdmin = asyncHandler(async (req, res, next) => {
    penalties = await Penalty.find({});

    return res.status(201).json({
        status: true,
        data: penalties,
    });
});
