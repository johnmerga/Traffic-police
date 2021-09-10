const express = require('express');
const helpController = require('../controllers/helpController');


const isAuth = require('../middleware/isAuth');
const isAdmin = require('../middleware/isAdmin');
const router = express.Router();


router.post('/', isAuth, helpController.create);
router.delete('/:id', isAuth, helpController.delete);

router.put('/:id', isAuth, helpController.update);

router.get('/mine', isAuth, helpController.getMine);
router.get('/getAllAdmin', isAuth,isAdmin, helpController.getAllAdmin);

router.get('/', isAuth, helpController.getAll);





module.exports = router;