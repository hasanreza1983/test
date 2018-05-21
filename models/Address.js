/*
 * This model is a part of the Address
 * Hasan Reza 2018-04-30;
 *
 */

module.exports = function (sequelize, DataTypes) {
    const Address = sequelize.define('Address', {
        id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        address_type: {
            type: DataTypes.ENUM('default', 'mailing', 'billing', 'shipping', 'others'),
            allowNull: true
        },
        address_line1: {
            type: DataTypes.STRING(255),
            allowNull: true
        },
        address_line2: {
            type: DataTypes.STRING(255),
            allowNull: true
        },
        address_line3: {
            type: DataTypes.STRING(255),
            allowNull: true
        },
        street: {
            type: DataTypes.TEXT,
            allowNull: true
        },
        city: {
            type: DataTypes.INTEGER(11),
            allowNull: true
        },
        state_province: {
            type: DataTypes.INTEGER(11),
            allowNull: true
        },
        zip_code: {
            type: DataTypes.STRING(10),
            allowNull: true
        },
        country: {
            type: DataTypes.INTEGER(11),
            allowNull: true
        }
    }, {
        tableName: 'crm_address'
    });

    Address.associate = (models) => {

        Address.hasMany(models.LeadAddress, {
            foreignKey: {
                name: 'id_crm_address',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });

        Address.hasMany(models.ContactAddress, {
            foreignKey: {
                name: 'id_crm_address',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });

        Address.hasMany(models.CompanyAddress, {
            foreignKey: {
                name: 'id_crm_address',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });

    }
    return Address;
};