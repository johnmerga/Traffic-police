const express = require('express');
const officerController = require('../controllers/officerController');

const isAuth = require('../middleware/isAuth');
const isAdmin = require('../middleware/isAdmin');

const router = express.Router();

router.post('/makeOfficerAdmin/:id', isAuth,isAdmin, officerController.makeOfficerAdmin)
router.delete('/:id', isAuth,isAdmin, officerController.delete)

router.put('/:id', isAuth,isAdmin, officerController.update)

router.get('/', isAuth,isAdmin, officerController.getAll)


module.exports = router;