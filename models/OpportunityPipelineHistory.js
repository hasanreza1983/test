/*
 * This model is a part of the OpportunityPipelineHistory
 * Hasan Reza 2018-04-30;
 *
 */

module.exports = function (sequelize, DataTypes) {
    const OpportunityPipelineHistory = sequelize.define('OpportunityPipelineHistory', {
        id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        id_crm_opportunity: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            references: {
                model: 'Opportunity',
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
        amount: {
            type: DataTypes.DECIMAL(20, 2),
            allowNull: true
        },
        expected_revenue: {
            type: DataTypes.DECIMAL(20, 2),
            allowNull: true
        },
        closing_date: {
            type: DataTypes.DATE,
            allowNull: true
        },
        stage_duration: {
            type: DataTypes.STRING(50),
            allowNull: true
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
        tableName: 'crm_opportunity_pipeline_history'
    });

    OpportunityPipelineHistory.associate = (models) => {
        OpportunityPipelineHistory.belongsTo(models.Opportunity, {
            foreignKey: {
                name: 'id_crm_opportunity',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
        OpportunityPipelineHistory.belongsTo(models.PipelineStage, {
            foreignKey: {
                name: 'id_crm_pipeline_stage',
                allowNull: true
            },
            onDelete: 'CASCADE'
        });
    }
    return OpportunityPipelineHistory;
};