/*
 * This model is a part of the Contact
 * Hasan Reza 2018-03-14;
 *
 */


module.exports = function (sequelize, DataTypes) {
    const Contact = sequelize.define('Contact', {
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
        title: {
            type: DataTypes.STRING(128),
            allowNull: true
        },
        first_name: {
            type: DataTypes.STRING(100),
            allowNull: false
        },
        last_name: {
            type: DataTypes.STRING(100),
            allowNull: false
        },
        date_of_birth: {
            type: DataTypes.DATE,
            allowNull: true
        },
        mobile: {
            type: DataTypes.STRING(20),
            allowNull: true
        },
        phone: {
            type: DataTypes.STRING(20),
            allowNull: true
        },
        email: {
            type: DataTypes.STRING(255),
            allowNull: true
        },
        fax: {
            type: DataTypes.STRING(50),
            allowNull: true
        },
        designation: {
            type: DataTypes.STRING(100),
            allowNull: true
        },
        department: {
            type: DataTypes.STRING(100),
            allowNull: true
        },
        description: {
            type: DataTypes.TEXT,
            allowNull: true
        },
        id_crm_company: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            references: {
                model: 'Company',
                key: 'id'
            }
        },
        id_crm_lead_source_master: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
            references: {
                model: 'LeadSourceMaster',
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
        tableName: 'crm_contact'
    });

    Contact.associate = (models) => {
        Contact.belongsToMany(models.Address, {
            through: models.ContactAddress,
            foreignKey: 'id_crm_contact',
            otherKey: 'id_crm_address',
            as: 'Addresses'
        });
        Contact.belongsTo(models.Company, {
            foreignKey: {
                name: 'id_crm_company',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
        Contact.belongsTo(models.LeadSourceMaster, {
            foreignKey: {
                name: 'id_crm_lead_source_master',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
    }
    return Contact;
};