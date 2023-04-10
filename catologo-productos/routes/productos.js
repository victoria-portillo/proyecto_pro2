const express = require('express')
const router = express.Router()
const controller = require('../controllers/productosController')


router.get('/producto', controller.index)


module.exports = router
