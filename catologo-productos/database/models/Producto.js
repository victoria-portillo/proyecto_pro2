
module.exports = function (sequelize, dataTypes) {
    
    let alias = "Producto";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            unsigned: true,
            allowNull: true,
            autoIncrement: true,
            primaryKey: true
        },
        id_usuario: {
            type: dataTypes.INTEGER,
            unsigned: true,
            allowNull: true
        },
        nombre_producto: {
            type: dataTypes.STRING,
            allowNull: true
        },
        descripcion_producto: {
            type: dataTypes.STRING,
            allowNull: true
        },
        createdAt: {
            type: dataTypes.DATE,
        },
        updatedAt: {
            type: dataTypes.DATE,
        },
        deletedAt: {
            type: dataTypes.DATE,
        }
    };
    let config = {
        tableName: "Productos",
        timestamps: true,
        underscored: true,
    };

    const Producto = sequelize.define(alias,cols,config);
    //relaciones

    Producto.associate = function(models) {
        // Un perfil --> muchos comentarios
        Producto.belongsTo(models.Usuarios , {
            as: "usuario",
            foreignKey: "id_usuario"
        })
    };

    return Producto;
};