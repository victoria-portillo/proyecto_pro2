const moduloDatos = require('../data/data')

const controller = {
index: function(req, res){
res.render('index', {
productos: moduloDatos.productos,
usuarioLogueado: true
})
}
} 

module.exports = controller