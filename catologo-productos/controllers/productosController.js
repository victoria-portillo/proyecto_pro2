const db = require("../database/models");
const producto = db.Producto;

const productosController = {
index: function(req, res){
    res.send('Aca se encuentran todos los productos', {usuarioLogueado: false})
},

detalle: function(req, res){
    res.render('product_detalle', {usuarioLogueado: false})
},

add: function(req, res){
    res.render('product-add', {usuarioLogueado: false})



},
search: (req,res)=>{
    let busqueda = req.query.search;

    let filtro = {
        include: {
            all:true,
            nested: true
        },
        where: [
            {[op.or]: [
                {nombre: {[op.like]: '%' + busqueda + '%'}},
                {descripcion: {[op.like]: '%' + busqueda + '%'} }
            ]}
        ],
        order:[["createdAt", "DESC"]]
        }
        producto.findAll(filtro)
        .then((result)=>{
            return res.render("search-results", {
                busqueda: busqueda,
                productosResultados: result
            })

        })
        .catch((err)=>{
            console.log(err);
        })


},

create: function(req, res){
    if (req.session.user == undefined) {
        return res.redirect('/')
    } else {
        return res.render('product-add');
    };
},

}

module.exports = productosController