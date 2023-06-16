const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController')

//router.get('/id/:id', usersController.show);

// REGISTER
router.get('/register', usersController.register); 
router.post('/register', usersController.store); 

// LOGIN
router.get('/login', usersController.login);
router.post('/login', usersController.loginPost);
//EDIT
router.get('/edit-profile', usersController.editProfile);
router.post('/edit-profile', usersController.editProfilePost);
//LOGOUT
router.post('/logout', usersController.logout);

module.exports = router;