const controller = {
  login: function(req, res){
    res.render('login')
},

Register:function(req, res){
  res.render('register')
  },

  profile: function(req, res){
    res.render('profile')
    },

   editProfile: function(req, res){
      res.render('edit-profile')
      }
    }

module.exports = controller
