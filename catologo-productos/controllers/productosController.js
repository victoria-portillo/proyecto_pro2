const controller = {
index: function(req, res){
    res.send('Aca se encuentran todos los productos', {usuarioLogueado: false})
},

detalle: function(req, res){
    res.render('product_detalle', {usuarioLogueado: false})
},

add: function(req, res){
    res.render('product-add', {usuarioLogueado: false})



},

}

module.exports = controller