module.export = function (sequelize, dataTypes) {

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
            type: dataTypes.STRING(20),
            allowNull: false
        },
        email: {
            type: dataTypes.STRING(30),
            allowNull: false, 
            unique: true
        } ,
        contrasena: {
            type: dataTypes.STRING(200),
            allowNull: false
        }, 
        foto_de_perfil:{
            type: dataTypes.STRING(200)
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
        underscored: true
    };

    const Usuario = sequelize.define(alias, cols, config);


    return Usuario;
}