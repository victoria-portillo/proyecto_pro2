const express = require('express');
const router = express.Router();
const controller = require('../controllers/usersController')

/* GET users listing. */
router.get('/login', controller.login)
router.get('/register', controller.Register)
router.get('/profile', controller.profile)
router.get('/edit-profile', controller.editProfile)


module.exports = router;
