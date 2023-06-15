module.exports = function (sequelize, dataTypes) {
    let alias = "Productos";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            unsigned: true,
            notNull: true,
            autoIncrement: true,
            primaryKey: true
        },
        id_usuario: {
            type: dataTypes.INTEGER,
            unsigned: true,
            notNull: true
        },
        nombre_producto: {
            type: dataTypes.STRING(50),
            notNull: true
        },
        descripcion_producto: {
            type: dataTypes.STRING(500),
            notNull: true
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
        Comentario.belongsToMany(models.Usuarios , {
            as: "usuario",
            through: "Usuario_producto",
            foreignKey: "id_producto",
            otherKey: "id_usuario"
        })
    };

    return Producto;
};