module.export = function (sequelize, dataTypes) {

    let alias = "Usuarios";
    
    let cols = {
        id:{
            type: dataTypes.INTEGER,
            unsigned: true,
            primaryKey: true,
            notNull: true,
            autoIncrement: true
        } ,
        nombre: {
            type: dataTypes.STRING(20),
            notNull: true
        },
        email: {
            type: dataTypes.STRING(30),
            notNull: true, 
            unique: true
        } ,
        contrasena: {
            type: dataTypes.STRING(200),
            notNull: true
        }, 
        foto_de_perfil:{
            type: dataTypes.STRING(200)
        } ,
        dni: {
            type: dataTypes.INTEGER,
            notNull: true,
            unique: true
        } ,
        fecha_de_nacimiento: {
            type: dataTypes.DATE,
            notNull: true,
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