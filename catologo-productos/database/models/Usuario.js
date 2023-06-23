module.exports = function (sequelize, dataTypes) {

    let alias = "Usuarios";
    
    let cols = {
        id:{
            type: dataTypes.INTEGER,
            unsigned: true,
            primaryKey: true,
            allowNull: false,
            autoIncrement: true
        } ,
        nombre: {
            type: dataTypes.STRING,
            allowNull: false
        },
        email: {
            type: dataTypes.STRING,
            allowNull: false, 
            unique: true
        } ,
        contrasena: {
            type: dataTypes.STRING,
            allowNull: false
        }, 
        foto_de_perfil:{
            type: dataTypes.STRING
        } ,
        dni: {
            type: dataTypes.INTEGER,
            allowNull: false,
            unique: true
        } ,
        fecha_de_nacimiento: {
            type: dataTypes.DATE,
            allowNull: false
        } ,
        createdAt:{
            type: dataTypes.DATE,
        } ,
        updatedAt: {
            type: dataTypes.DATE,
        } ,
        deletedAt: {
            type: dataTypes.DATE,
        },
    };

    let config = {
        tableName: "Usuarios",
        timestamps: true,
        underscored: false
    };

    const Usuario = sequelize.define(alias, cols, config);

    Usuario.associate = function(models) {
        Usuario.hasMany(models.Producto , {
            as: "productos",
            foreignKey: "id_usuario"
        })
        Usuario.hasMany(models.Comentario , {
            as: "comentarios",
            foreignKey: "id_usuario"
        })
    }


    return Usuario;
}