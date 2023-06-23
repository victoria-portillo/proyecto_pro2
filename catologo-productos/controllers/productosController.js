const db = require("../database/models");
const Producto = db.Producto;
const Usuario = db.Usuario;
const Comentario = db.Comentario;

const productosController = {
    vistaDetalle: function (req, res) {
        let id = req.params.id;

        let filtro = {
            include: [ {association: "usuario"}, {association: "comentarios", include: [{association: "usuario"}]} ]
        };

        Producto.findByPk(id, filtro)
            .then(function(result) {
                if (result == null) {
                    res.send("No se encontró el producto")
                } else {
                    res.render('product_detalle', { producto : result })
                }
            })
            .catch(function(error) {
                res.send(error)
            })
    },

    vistaEditar: function (req, res) {
        if ( req.session.user ) {
            
            Usuario.findByPk( req.session.user.id )
                .then(function(result) {
                    if ( result ) {
                        if ( req.session.user.id === result.id ) {
                            res.render('product-edit')
                        } else {
                            res.send("No tiene permisos para editar este producto")
                        }
                    } else {
                        res.send("No se encontró el usuario")
                    }
                })
                .catch(function(error) {
                    res.send(error)
                })
        } else {
            res.redirect('/users/login')
        }
    },

    vistaAgregar: function (req, res) {
        if ( req.session.user ) {
            res.render('product-add')
        } else {
            res.redirect('/users/login')
        }
    },

    vistaBuscar: function (req, res) {
        let busqueda = req.query.search;

        let filtro = {
            include: {
                all: true,
                nested: true
            },
            where: [
                {
                    [op.or]: [
                        { nombre: { [op.like]: '%' + busqueda + '%' } },
                        { descripcion: { [op.like]: '%' + busqueda + '%' } }
                    ]
                }
            ],
            order: [["createdAt", "DESC"]]
        }
        producto.findAll(filtro)
            .then((result) => {
                return res.render("search-results", {
                    busqueda: busqueda,
                    productosResultados: result
                })

            })
            .catch((err) => {
                console.log(err);
            })
    },

    funcionAgregar: function (req, res) {
        let producto_nuevo = {}

        if ( req.body.imagen === "" ) {
            res.send("No puede quedar vacío el campo de imagen")
        } else {
            producto_editado.image = req.body.imagen
        }

        if ( req.body.nombre_producto === "" ) {
            res.send("No puede quedar vacío el campo de nombre")
        } else {
            producto_editado.nombre_producto = req.body.nombre_producto
        }

        if ( req.body.descripcion_producto === "" ) {
            res.send("No puede quedar vacío el campo de descripción")
        } else {
            producto_editado.descripcion_producto = req.body.descripcion_producto
        }

        producto_nuevo.id_usuario = req.session.user.id

        Producto.create( producto_editado)
            .then(function(resultado) {
                res.redirect("/productos/detalle/" + resultado.id)
            })
            .catch(function(error) {
                res.send(error)
            })

    },

    funcionEditar: function (req, res) {
        if (req.session.user) {
            Producto.findByPk( req.params.id )
                .then(function(resultado) {
                    if (resultado) {
                        if (resultado.id_usuario === req.session.user.id) {
                            let producto_editado = {}
                            let filtro = {
                                where: req.params.id
                            }
                            if ( req.body.imagen === "" ) {
                                producto_editado.image = resultado.image
                            } else {
                                producto_editado.image = req.body.imagen
                            }
                    
                            if ( req.body.nombre_producto === "" ) {
                                producto_editado.nombre_producto = resultado.nombre_producto
                            } else {
                                producto_editado.nombre_producto = req.body.nombre_producto
                            }
                    
                            if ( req.body.descripcion_producto === "" ) {
                                producto_editado.descripcion_producto = resultado.descripcion_producto
                            } else {
                                producto_editado.descripcion_producto = req.body.descripcion_producto
                            }
                    
                            producto_editado.id_usuario = resultado.id_usuario
                            
                            Producto.update( producto_editado, filtro )
                                .then(function(resultado) {
                                    res.redirect("/productos/detalle/" + req.params.id)
                                })
                                .catch(function(error) {
                                    res.send(error)
                                })
                        } else {
                            res.send("No tiene permisos para editar este producto")
                        }
    
                    } else {
                        res.send("Producto no encontrado")
                    }
                })
                .catch(function(error) {
                    res.send(error)
                })
        } else {
            res.send("No tiene permisos para editar este producto")
        }
    },
    
    funcionComentar: function (req, res) {
        if (req.session.user) {
            let comentario_nuevo = {
                id_usuario : req.session.user.id,
                id_producto : req.params.id,
            }

            if ( req.body.comentario === "" ) {
                res.send("No puede quedar vacío el campo de comentario")
            } else {
                comentario_nuevo.comentario = req.body.comentario
            }

            Comentario.create(comentario_nuevo)
                .then(function(resultado) {
                    res.redirect("/productos/detalle/" + req.params.id)
                })
                .catch(function(error) {
                    res.send(error)
                })

        } else {

            res.locals.error = "No puede comentar si no está logueado"
            res.render('product_detalle')

        }
    },

    funcionBorrar: function (req, res) {
        if (req.session.user) {
            Producto.findByPk( req.params.id )
                .then(function(resultado) {
                    if (resultado) {
                        if (resultado.id_usuario === req.session.id) {
                            let filtro = {
                                where : req.params.id
                            }
                            Producto.destroy(filtro)
                                .then(function(resultado) {
                                    res.redirect("/")
                                })
                                .catch(function(error) {
                                    res.send(error)
                                })
                        } else {
                            res.send("No tiene permisos para eliminar este producto")
                        }
                    } else {
                        res.send("No se ha encontrado este producto")
                    }
                })
                .catch(function(error) {
                    res.send(error)
                })
        } else {
            res.send("No tiene permisos para eliminar este producto")
        }
    },
}

module.exports = productosController