const express = require('express')
const router = express.Router()
const controller = require('../controllers/productosController')


router.get('/producto', controller.index)
router.get('/detalle', controller.detalle)
router.get('/add', controller.add)


module.exports = router
