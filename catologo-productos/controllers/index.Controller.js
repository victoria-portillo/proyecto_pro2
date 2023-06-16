const moduloDatos = require('../data/data')
const db = require('../database/models')
const productos = db.Producto;

const controller = {

index: function(req, res){
  
    let filtro ={
        order: [["createdAt"], 'DESC'],
        include: {all: true, nested: true}
    };

    productos.findAll(filtro)
    .then(function(result){
      // console.log(result)
     return res.render('índex', {productosFiltro: result})
    })
    .catch(function(err){
        console.log(err)
    })

}
} 

module.exports = controller