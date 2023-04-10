const controller = {
  login:function(req, res){
res.send("esto es login")
},

Register:function(req, res){
  res.send("esto es register")
  },

  profile: function(req, res){
    res.send("esto es profile")
    },

   editProfile:  function(req, res){
      res.send("esto es edit profile")
      }


    
    }

module.exports = controller
