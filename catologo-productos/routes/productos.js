const express = require('express')
const router = express.Router()
const controller = require('../controllers/productosController')


router.get('/producto', controller.index)
router.get('/detalle', controller.detalle)


module.exports = router
