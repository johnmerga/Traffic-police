const Officer = require("../model/Officer");
const asyncHandler = require("../middleware/asyncHandler");
var mongoose = require("mongoose");

exports.makeOfficerAdmin = asyncHandler(async (req, res, next) => {
    const id = req.params.id;

    let officer = await Officer.findById(id);

    if (!officer) {
        return res.status(201).json({
            status: false,
            msg: "Officer profile not found",
        });
    }

    officer = await Officer.findByIdAndUpdate(
        id,
        { is_admin: true },
        { new: true }
    );

    return res.status(201).json({
        status: true,
        data: officer,
    });
});

exports.delete = asyncHandler(async (req, res, next) => {
    const id = req.params.id;

    let officer = await Officer.findById(id);

    if (!officer) {
        return res.status(201).json({
            status: false,
            msg: "Officer profile not found",
        });
    }

    officer = await Officer.findByIdAndUpdate(
        id,
        { is_deleted: true },
        { new: true }
    );

    return res.status(201).json({
        status: true,
        data: officer,
    });
});

exports.update = asyncHandler(async (req, res, next) => {
    const id = req.params.id;
    const payload = req.body;

    let officer = await Officer.findById(id);

    if (!officer) {
        return res.status(201).json({
            status: false,
            msg: "Officer profile not found",
        });
    }

    officer = await Officer.findByIdAndUpdate(id, payload, { new: true });

    return res.status(201).json({
        status: true,
        data: officer,
    });
});

exports.getAll = asyncHandler(async (req, res, next) => {
    officers = await Officer.find({ is_deleted: false });

    return res.status(201).json({
        status: true,
        data: officers,
    });
});
