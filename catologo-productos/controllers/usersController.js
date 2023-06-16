const db = require('../database/models')
const usuarios = db.Usuario
const bcrypt = require('bcryptjs');

const usersController = {
  login: function(req, res){
    if (req.session.user != undefined) {
      return res.redirect('/')
  } else {
      return res.render('login');
  }
},

loginPost: function(req,res){
  let errores = {}
 
  usuarios.findOne({
          where: [{
              email: req.body.email
          }]
      })

      .then(function (user) {
          if (user) {
              let compare = bcrypt.compareSync(req.body.contrasena, user.contrasena);
              if (compare) {
                  req.session.user = user.dataValues; 

                  if (req.body.recordarme) {
                      res.cookie('userId', user.dataValues.id, {
                          maxAge: 1000 * 60 * 100
                      })
                  }
                  return res.redirect('/');

              } else {
                  errores.message = "Contraseña incorrecta" 
                  res.locals.errores = errores 
                  return res.render('login');
              }

          } else {
              errores.message = "Ese mail no existe" 
              res.locals.errores = errores 
              return res.render('login');
          }
      })
      .catch(error => console.log(error))

},

  register:function(req, res){
    if (req.session.user != undefined) {
      return res.redirect('/')
  } else {
      return res.render('register')
  }
  },

  profile: function(req, res){
    res.render('profile', {usuarioLogueado: false})
    },

  editProfile: function(req, res){
    if (req.session.user == undefined) {
      return res.redirect('/')
  } else {
      return res.render('edit-profile')
  }
    },

  editProfilePost: function(req,res){

    let errores = {}
        if (req.body.nombreUsuario == '') {
            errores.message = "El nombre de usuario es obligatorio"
            res.locals.errores = errores
            return res.render('profile-edit');
        } else if (req.body.email == '') {
            errores.message = "El email es obligatorio" 
            res.locals.errores = errores 
            return res.render('profile-edit');
        } else if (req.body.contrasena == '') {
            errores.message = "La contraseña es obligatoria"
            res.locals.errores = errores
            return res.render('profile-edit');
        } else if (req.body.contrasena.length < 3) {
            errores.message = "La contraseña tiene que tener al menos 3 caracteres" 
            res.locals.errores = errores
            return res.render('profile-edit');
        } else if (req.body.contrasenaAnterior == '') {
            errores.message = "Escriba su contraseña anterior" 
            res.locals.errores = errores
            return res.render('profile-edit');
        } else {
            usuarios.findOne({
                    where: [{
                        email: req.body.email
                    }]
                })
                .then(function (user) {
                    if (user) {
                        //chequear que la contrasena anterior es correcta 
                        let compare = bcrypt.compareSync(req.body.contrasenaAnterior, user.contrasena)
                        if (compare) {
                            let user = {
                                email: req.body.email,
                                nombreUsuario: req.body.nombreUsuario,
                                contrasena: bcrypt.hashSync(req.body.contrasena, 10), //vamos a hashear la contrasena que viene del form
                                nacimiento: req.body.nacimiento,
                                documento: req.body.documento,
                                imagen: req.file.filename
                            }
                            usuarios.update(user, {
                                    where: [{
                                        id: req.body.id
                                    }]
                                })
                                .then(function (user) {

                                    return res.redirect('/')

                                })
                                .catch(error => console.log(error))
                        } else {
                            errores.message = "La contraseña anterior es incorrecta" 
                            res.locals.errores = errores 
                            return res.render('profile-edit');
                        }
                    } else {
                        errores.message = "El mail nunca fue registrado" 
                        res.locals.errores = errores 
                        return res.render('register');
                    }
                })
                .catch(error => console.log(error))
        }

  },

  store: function (req, res) {
        
      let errores = {}

      if (req.body.nombre == '') {
          errores.message = "Debe completar el nombre de usuario" 
          res.locals.errores = errores
          return res.render('register');
      } else if (req.body.email == '') {
          errores.message = "El email es obligatorio"
          res.locals.errores = errores 
          return res.render('register');
      } else if (req.body.contrasena == '') {
          errores.message = "Se necesita contraseña"
          res.locals.errores = errores
          return res.render('register');
      } else if (req.body.contrasena.length < 3) {
          errores.message = "La contraseña tiene que tener al menos 3 caracteres" 
          res.locals.errores = errores
          return res.render('register');
      } else {
          usuarios.findOne({
                  where: [{
                      email: req.body.email
                  }]
              })
              .then(function (user) {
                  if (user !== null) {
                      errores.message = "Correo existente, por favor ingresar otro" 
                      res.locals.errores = errores 
                      return res.render('register');
                  } else {
                      usuarios.findOne({
                              where: [{
                                  nombreUsuario: req.body.nombre
                              }]
                          })
                          .then(function (user) {
                              if (user !== null) {
                                  errores.message = "Usuario existente, elija otro" 
                                  res.locals.errores = errores 
                                  return res.render('register');
                              } else { 
                                  let user = {
                                      email: req.body.email,
                                      nombreUsuario: req.body.nombre,
                                      contrasena: bcrypt.hashSync(req.body.contrasena, 10),
                                      fecha_de_nacimiento: req.body.fecha_de_nacimiento,
                                      dni: req.body.dni,
                                      foto_de_perfil: req.body.foto_de_perfil
                                  }
                                  usuarios.create(user) 
                                      .then(function (respuesta) {
                                          return res.redirect('/')
                                      })
                                      .catch(error => console.log(error))
                              }
                          })
                          .catch(error => console.log(error))
                  }
              })
              .catch(error => console.log(error))
      }
  },

  logout:function(req,res){

    req.session.destroy();

        //Eliminar cookie si existe.
        if (req.cookies.id_usuario !== undefined) {
            res.clearCookie('id_usuario')
        }
        return res.redirect('/');
        
  }

  


}



  
    

module.exports = usersController
