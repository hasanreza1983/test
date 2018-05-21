/*
 * This Resolver File belongs to the CrmOpportunity type
 * Hasan Reza 2018-04-05;
 *
 */
const model = require('../../models');
const constant = require('../../lib/constant');
const common = require('../../lib/commonResolver');
const OpportunityValidation = require('../../validation/opportunityValidation');

module.exports = {
    Query: {
        getCrmOpportunityById: async (obj, args, context, info) => {
            const response = await common.getCrmModelById(args.id, model.Opportunity, [{
                    model: model.Company
                },
                {
                    model: model.LeadSourceMaster
                },
                {
                    model: model.PipelineStage
                }
            ], 'Opportunity');
            return response;

        }, // end of getCrmOpportunityById resolver

        getCrmOpportunityListByPage: async (obj, args, context, info) => {
            const response = await common.getCrmModelListByPage(args, model.Opportunity, [{
                    model: model.Company
                },
                {
                    model: model.PipelineStage
                }
            ], 'Opportunities');
            return response;
        } // end of getAllCrmOpportunityList resolver

    }, // end of query

    Mutation: {
        createCrmOpportunity: async (obj, args, context, info) => {
            const arrErrors = OpportunityValidation.validateInput(args.input); // validation for CrmOpportunity input data
            if (arrErrors.error) {
                throw new Error(arrErrors.error.details[0].message);
            }
            args.input.created_by = context.user.id;
            const objOpportunity = await model.Opportunity.create(args.input);
            objOpportunity.Opportunity = objOpportunity;
            objOpportunity.message = constant.SUCCESS;
            return objOpportunity;
        }, // end of createOpportunity resolver

        updateCrmOpportunity: async (obj, args, context, info) => {
            const arrErrors = OpportunityValidation.validateInput(args.input); // validation for Opportunity input data
            if (arrErrors.error) {
                throw new Error(arrErrors.error.details[0].message);
            }
            args.input.updated_by = context.user.id;
            await model.Opportunity.update(args.input, {
                where: {
                    id: args.id,
                    is_deleted: 0
                },
                 individualHooks: true
            });

            //create pipeline history for Opportunity
            // model.OpportunityPipelineHistory.create({
            //     id_crm_opportunity: args.id,
            //     id_crm_pipeline_stage: args.input.id_crm_pipeline_stage,
            //     amount: args.input.opportunity_amount,
            //     expected_revenue: args.input.id,
            //     closing_date: args.input.opportunity_closing_date,
            //     created_by: args.input.owner
            // })
            return {
                message: constant.SUCCESS
            };
        }, // end of  updateCrmOpportunity resolver

        deleteCrmOpportunityById: async (obj, args, context, info) => {
            return await common.deleteModelById(args.id, model.Opportunity, context.user.id);
        } // end of  deleteCrmOpportunityById resolver
    } // end of mutation
}