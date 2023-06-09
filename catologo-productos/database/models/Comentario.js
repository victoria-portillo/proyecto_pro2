module.exports = function (sequelize, dataTypes) {
    let alias = "Comentario";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            unsigned: true,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
        },
        id_producto: {
            type: dataTypes.INTEGER,
            unsigned: true,
            allowNull: false,
        },
        id_usuario: {
            type: dataTypes.INTEGER,
            unsigned: true,
            allowNull: false,
        },
        comentario: {
            type: dataTypes.STRING,
            allowNull: false,
        },
        createdAt:{
            type: dataTypes.DATE,
        } ,
        updatedAt: {
            type: dataTypes.DATE,
        } ,
        deletedAt: {
            type: dataTypes.DATE,
        }
        
        
    };
    let config = {
        tableName: "Comentarios",
        timestamps: true,
        underscored: false,
    };

    const Comentario = sequelize.define(alias,cols,config);
    //relaciones

    Comentario.associate = function(models) {
        // Un perfil --> muchos comentarios
        Comentario.belongsTo(models.Usuarios , {
            as: "usuario",
            foreignKey: "id_usuario"
        }),
        // Un producto --> muchos comentarios
        Comentario.belongsTo(models.Producto , {
            as: "producto",
            foreignKey: "id_producto"
        })
    };

    return Comentario;
};