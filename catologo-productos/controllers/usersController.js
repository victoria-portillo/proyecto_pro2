const controller = {
  login: function(req, res){
    res.render('login')
},

Register:function(req, res){
  res.render('register')
  },

  profile: function(req, res){
    res.send("esto es profile")
    },

   editProfile: function(req, res){
      res.send("esto es edit profile")
      }
    }

module.exports = controller
