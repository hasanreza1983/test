/*
 * This model is a part of the Company
 * Hasan Reza 2018-03-14;
 *
 */

module.exports = function (sequelize, DataTypes) {
    const Company = sequelize.define('Company', {
        id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        owner: {
            type: DataTypes.INTEGER(11),
            allowNull: false
        },
        company_name: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        registration_number: {
            type: DataTypes.STRING(50),
            allowNull: true
        },
        no_of_employees: {
            type: DataTypes.INTEGER(8),
            allowNull: true
        },
        annual_revenue: {
            type: DataTypes.DECIMAL(18, 0),
            allowNull: true
        },
        phone: {
            type: DataTypes.STRING(20),
            allowNull: true
        },
        company_email: {
            type: DataTypes.STRING(255),
            allowNull: true
        },
        fax: {
            type: DataTypes.STRING(50),
            allowNull: true
        },
        website: {
            type: DataTypes.STRING(255),
            allowNull: true
        },
        description: {
            type: DataTypes.TEXT,
            allowNull: true
        },
        id_crm_industry_master: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
            references: {
                model: 'IndustryMaster',
                key: 'id'
            }
        },
        id_crm_company_ownership_master: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
            references: {
                model: 'CompanyOwnershipMaster',
                key: 'id'
            }
        },
        id_crm_company_status_master: {
            type: DataTypes.TINYINT(3),
            allowNull: true,
            references: {
                model: 'CompanyStatusMaster',
                key: 'id'
            }
        },
        is_deleted: {
            type: DataTypes.TINYINT(1),
            allowNull: false,
            defaultValue: '0'
        },
        created_at: {
            type: DataTypes.DATE,
            allowNull: false,
            defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
        },
        updated_at: {
            type: DataTypes.DATE,
            allowNull: false,
            defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
        },
        deleted_at: {
            type: DataTypes.DATE,
            allowNull: true
        },
        created_by: {
            type: DataTypes.INTEGER(11),
            allowNull: false
        },
        updated_by: {
            type: DataTypes.INTEGER(11),
            allowNull: true
        },
        deleted_by: {
            type: DataTypes.INTEGER(11),
            allowNull: true
        }
    }, {
        tableName: 'crm_company'
    });


    Company.associate = (models) => {
        Company.belongsToMany(models.Address, {
            through: models.CompanyAddress,
            foreignKey: 'id_crm_company',
            otherKey: 'id_crm_address',
            as: 'Addresses'
        });
        Company.hasMany(models.Contact, {
            foreignKey: {
                name: 'id_crm_company',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
        Company.belongsTo(models.CompanyOwnershipMaster, {
            foreignKey: 'id_crm_company_ownership_master'
        });
        Company.belongsTo(models.CompanyStatusMaster, {
            foreignKey: 'id_crm_company_status_master'
        });
        Company.belongsTo(models.IndustryMaster, {
            foreignKey: 'id_crm_industry_master'
        });
    }
    return Company;
};