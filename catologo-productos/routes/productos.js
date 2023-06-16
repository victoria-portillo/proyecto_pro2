const express = require('express')
const router = express.Router()
const productosController = require('../controllers/productosController')


router.get('/producto', productosController.index)


router.get('/detalle', productosController.detalle)


router.get('/add', productosController.add)
router.post('/add', productosController.create)

router.get('/search', productosController.search)


module.exports = router
