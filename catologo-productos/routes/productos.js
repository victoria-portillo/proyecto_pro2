const express = require('express')
const router = express.Router()
const productosController = require('../controllers/productosController')

router.get('/add', productosController.vistaAgregar)
router.get('/search', productosController.vistaBuscar)
router.get('/editar/:id', productosController.vistaEditar)

// // FUNCIONALIDAD ASOCIADA A LA VISTA DE AGREGAR PRODUCTO
router.post('/add', productosController.funcionAgregar)

// // FUNCIONALIDADES ASOCIADAS AL DETALLE DE UN PRODUCTO
router.post('/comentar', productosController.funcionComentar)
router.post('/borrar', productosController.funcionBorrar)

// // FUNCIONALIDAD ASOCIADA A LA VISTA DE EDITAR PRODUCTO
router.post('/editar/:id', productosController.funcionEditar)

router.get('/detalle/:id', productosController.vistaDetalle)

module.exports = router