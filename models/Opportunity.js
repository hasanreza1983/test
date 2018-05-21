/*
 * This model is a part of the Opportunity
 * Hasan Reza 2018-04-05;
 *
 */
module.exports = function (sequelize, DataTypes) {
    const Opportunity = sequelize.define('Opportunity', {
        id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        owner: {
            type: DataTypes.INTEGER(11),
            allowNull: true
        },
        opportunity_name: {
            type: DataTypes.STRING(100),
            allowNull: false
        },
        opportunity_type: {
            type: DataTypes.ENUM('none', 'existing_business', 'new_business'),
            allowNull: true
        },
        opportunity_amount: {
            type: DataTypes.DECIMAL(18, 0),
            allowNull: true
        },
        opportunity_closing_date: {
            type: DataTypes.DATE,
            allowNull: false
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
        id_crm_pipeline_stage: {
            type: DataTypes.TINYINT(3),
            allowNull: false,
            references: {
                model: 'PipelineStage',
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
            allowNull: true,
            defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
        },
        updated_at: {
            type: DataTypes.DATE,
            allowNull: true,
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
        tableName: 'crm_opportunity'
    });
    Opportunity.associate = (models) => {
        Opportunity.hook('afterUpdate', (opportunity, options) => {
            if (opportunity.id_crm_pipeline_stage != opportunity.previous('id_crm_pipeline_stage')) {
                return models.OpportunityPipelineHistory.create({
                    id_crm_opportunity: opportunity.id,
                    id_crm_pipeline_stage: opportunity.id_crm_pipeline_stage,
                    amount: opportunity.opportunity_amount,
                    expected_revenue: opportunity.id,
                    closing_date: opportunity.opportunity_closing_date,
                    created_by: opportunity.owner
                });
            }
        });
        Opportunity.belongsTo(models.Company, {
            foreignKey: {
                name: 'id_crm_company',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
        Opportunity.belongsTo(models.LeadSourceMaster, {
            foreignKey: {
                name: 'id_crm_lead_source_master',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
        Opportunity.belongsTo(models.PipelineStage, {
            foreignKey: {
                name: 'id_crm_pipeline_stage',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
        Opportunity.hasMany(models.OpportunityPipelineHistory, {
            foreignKey: {
                name: 'id_crm_opportunity',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
        Opportunity.hasMany(models.ModelNote, {
            foreignKey: 'model_id',
            constraints: false,
            scope: {
                model_name: 'Opportunity'
            }
        });
        Opportunity.hasMany(models.ModelAttachment, {
            foreignKey: 'model_id',
            constraints: false,
            scope: {
                model_name: 'Opportunity'
            }
        });
    };
    return Opportunity;
};