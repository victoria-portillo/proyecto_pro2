const controller = {
index: function(req, res){
    res.send('Aca se encuentran todos los productos')
},

detalle: function(req, res){
    res.render("product_detalle")
}

}

module.exports = controller