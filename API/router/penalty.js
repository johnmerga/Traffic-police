const express = require('express');
const penaltyController = require('../controllers/penaltyController');


const isAuth = require('../middleware/isAuth');
const isAdmin = require('../middleware/isAdmin');
const router = express.Router();


router.post('/', isAuth, penaltyController.create);
router.delete('/:id', isAuth, penaltyController.delete);

router.put('/:id', isAuth, penaltyController.update);


router.get('/getAllAdmin', isAuth,isAdmin, penaltyController.getAllAdmin);

router.get('/', isAuth, penaltyController.getOfficersPenalty);




module.exports = router;