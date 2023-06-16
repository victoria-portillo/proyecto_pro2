const moduloDatos = require('../data/data')
const db = require('../database/models')
const controller = {

index: function(req, res){
    db.Producto.findAll({
        raw: true
    })
    .then(function(data){
        console.log(data)
    })
    .catch(function(err){console.log(err)})

   

res.render('index', {
productos: moduloDatos.productos,
usuarioLogueado: true
})
}
} 

module.exports = controller