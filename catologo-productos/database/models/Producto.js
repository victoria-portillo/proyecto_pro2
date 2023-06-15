module.exports = function (sequelize, dataTypes) {
    let alias = 'Productos';
    let cols = {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER,
        },
        id_usuario: {
            type: dataTypes.INTEGER,
        },
        nombre_producto: {
            type: dataTypes.STRING(500),
        },
        descripcion_producto: {
            type: dataTypes.STRING(500),
        },
        createdAt: {
            type: dataTypes.date,
        },
        updatedAt: {
            type: dataTypes.date,
        },
        deletedAt: {
            type: dataTypes.date,
        }
    };
    let config = {
        tableName: 'Productos',
        timestamps: true,
        underscored: true,
    };

    const Producto = sequelize.define(alias,cols,config);
    //relaciones

    Producto.associate = function(models) {
        // Un perfil --> muchos comentarios
        Comentario.belongsToMany(models.Usuarios , {
            as: "usuario",
            through: "Usuario_producto",
            foreignKey: "id_producto",
            otherKey: "id_usuario"
        })
    };

    return Producto;
};