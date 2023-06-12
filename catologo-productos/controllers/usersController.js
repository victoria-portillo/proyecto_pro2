const controller = {
  login: function(req, res){
    res.render('login', {usuarioLogueado: false})
},

Register:function(req, res){
  res.render('register', {usuarioLogueado: false})
  },

  profile: function(req, res){
    res.render('profile', {usuarioLogueado: false})
    },

   editProfile: function(req, res){
      res.render('edit-profile', {usuarioLogueado: true})
      }
    }

  
    

module.exports = controller
