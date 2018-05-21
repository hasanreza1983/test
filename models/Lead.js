/*
 * This model is a part of the Lead
 * Hasan Reza 2018-03-14;
 *
 */

module.exports = function (sequelize, DataTypes) {
    const Lead = sequelize.define('Lead', {
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
        mobile: {
            type: DataTypes.STRING(20),
            allowNull: true
        },
        do_not_call: {
            type: DataTypes.TINYINT(1),
            allowNull: true,
            defaultValue: '0'
        },
        phone: {
            type: DataTypes.STRING(20),
            allowNull: true
        },
        fax: {
            type: DataTypes.STRING(50),
            allowNull: true
        },
        fax_opt_out: {
            type: DataTypes.TINYINT(1),
            allowNull: true,
            defaultValue: '0'
        },
        email: {
            type: DataTypes.STRING(255),
            allowNull: true
        },
        email_opt_out: {
            type: DataTypes.TINYINT(1),
            allowNull: true,
            defaultValue: '0'
        },
        website: {
            type: DataTypes.STRING(100),
            allowNull: true
        },
        annual_revenue: {
            type: DataTypes.DECIMAL(18, 0),
            allowNull: true
        },
        no_of_employees: {
            type: DataTypes.INTEGER(8),
            allowNull: true
        },
        last_transfer_date: {
            type: DataTypes.DATE,
            allowNull: true
        },
        description: {
            type: DataTypes.TEXT,
            allowNull: true
        },
        id_crm_lead_status_master: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
            references: {
                model: 'LeadStatusMaster',
                key: 'id'
            }
        },
        id_crm_rating_master: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
            references: {
                model: 'RatingMaster',
                key: 'id'
            }
        },
        id_crm_industry_master: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
            references: {
                model: 'IndustryMaster',
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
        tableName: 'crm_lead'
    });

    Lead.associate = function (models) {
        Lead.belongsTo(models.IndustryMaster, {
            foreignKey: {
                name: 'id_crm_industry_master',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
        Lead.belongsTo(models.LeadStatusMaster, {
            foreignKey: {
                name: 'id_crm_lead_status_master',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
        Lead.belongsTo(models.RatingMaster, {
            foreignKey: {
                name: 'id_crm_rating_master',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
        Lead.belongsToMany(models.Address, {
            as: 'Addresses',
            through: models.LeadAddress,
            foreignKey: 'id_crm_lead',
            otherKey: 'id_crm_address'
        });
        Lead.belongsTo(models.LeadSourceMaster, {
            foreignKey: {
                name: 'id_crm_lead_source_master',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
        Lead.belongsToMany(models.Campaign, {
            through: {
                model: models.CampaignLink,
                unique: false,
                scope: {
                    model_name: 'Lead'
                }
            },
            foreignKey: 'model_id',
            otherKey: 'id_crm_campaign',
            constraints: false
        });
    }
    return Lead;
};