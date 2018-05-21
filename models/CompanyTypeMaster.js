/*
 * This model is a part of the CompanyTypeMaster
 * Hasan Reza 2018-03-14;
 *
 */

module.exports = function (sequelize, DataTypes) {
    const CompanyTypeMaster = sequelize.define('CompanyTypeMaster', {
        id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        company_type: {
            type: DataTypes.STRING(50),
            allowNull: false
        },
        weight: {
            type: DataTypes.TINYINT(2),
            allowNull: false
        }
    }, {
        tableName: 'crm_company_type_master'
    });
    return CompanyTypeMaster;
};