const express = require('express')
const router = express.Router()
const controller = require('../controllers/productosController')


router.get('/producto', controller.index)
router.get('/product_detalle', controller.detalle)


module.exports = router
