const moduloDatos = require('../data/data')
const db = require('../database/models')
const productos = db.Producto;

const controller = {

    index: function(req, res){
  
        let filtro ={
            order: [[ "createdAt" , "DESC" ]],
            include: [ {association: "usuario"}, {association: "comentarios", include: [{association: "usuario"}]} ]
        };
    
        productos.findAll(filtro)
        .then(function(result){
            // res.send(result)
            res.render('index', { productosFiltro : result })
        })
        .catch(function(err){
            console.log(err)
        })
    
    }
    } 
    
module.exports = controller