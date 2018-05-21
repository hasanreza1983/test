/*
 * This Resolver File belongs to the Lead type
 * Hasan Reza 2018-03-13;
 *
 */

const model = require('../../models');
const leadValidation = require('../../validation/leadValidation');

const constant = require('../../lib/constant');
const common = require('../../lib/commonResolver');
module.exports = {
    Query: {
        getCrmLeadById: async (obj, args, context, info) => {
            const response = await common.getCrmModelById(args.id, model.Lead, [{
                    model: model.Address,
                    as: 'Addresses'
                },
                {
                    model: model.IndustryMaster
                },
                {
                    model: model.LeadStatusMaster
                },
                {
                    model: model.LeadSourceMaster
                },
                {
                    model: model.RatingMaster
                }
            ], 'Lead');
            response.Lead.Addresses = await common.addAddressName(response.Lead.Addresses);
            return response;
        }, // end of getLeadById resolver

        getCrmLeadCampaigns: async (obj, args, context, info) => {
            const response = await common.getCrmModelById(args.id, model.Lead, [{
                model: model.Campaign,
                include: [{
                    model: model.CampaignTypeMaster
                }]
            }], 'Lead');
            return response;

        }, // end of getCrmLeadCampaigns resolver

        getCrmLeadListByPage: async (obj, args, context, info) => {
            let response = await common.getCrmModelListByPage(args, model.Lead, [{
                    model: model.Address,
                    as: 'Addresses'
                },
                {
                    model: model.IndustryMaster
                },
                {
                    model: model.LeadSourceMaster
                },
                {
                    model: model.LeadStatusMaster
                },
                {
                    model: model.RatingMaster
                }
            ], 'Leads');
            let Addresses = [];
            response.Leads.forEach(lead => {
                Addresses = Addresses.concat(lead.Addresses);
            })
            await common.addAddressName(Addresses);
            return response;

        } // end of getAllLeadList resolver

    }, // end of query

    Mutation: {
        createCrmLead: async (obj, args, context, info) => {
            const arrErrors = leadValidation.validateInput(args.input); // validation for Lead input data
            if (arrErrors.error) {
                throw new Error(arrErrors.error.details[0].message);
            }
            try {
                args.input.created_by = context.user.id;
                const objLead = await model.Lead.create(args.input, {
                    include: [{
                        model: model.Address,
                        as: 'Addresses',
                        required: false
                    }]
                });
                objLead.Lead = objLead;
                objLead.message = constant.SUCCESS;
                return objLead;
            } catch (error) {
                throw new Error(error);
            }
        }, // end of createLead resolver

        updateCrmLead: async (obj, args, context, info) => {
            // Prepare array to validate fields
            const arrErrors = leadValidation.validateInput(args.input); // validation for Lead input data
            if (arrErrors.error) {
                throw new Error(arrErrors.error.details[0].message);
            }
            const Addresses = args.input.Addresses;
            delete args.input.Addresses;
            let filter = {
                where: {
                    id: args.id,
                    is_deleted: 0
                }
            };
            const objLead = await model.Lead.findOne(filter);
            if (objLead) {
                args.input.updated_by = context.user.id;
                if (Addresses && Addresses.length) {
                    await common.updateModelAddress(Addresses, model, objLead);
                }
                Object.keys(args.input).forEach((e) => {
                    objLead[e] = args.input[e];
                });
                await objLead.save();
            } else {
                throw new Error(constant.DOES_NOT_EXIST);
            }
            return {
                message: constant.SUCCESS
            };
        }, // end of  updateLead resolver

        deleteCrmLeadById: async (obj, args, context, info) => {
            return await common.deleteModelById(args.id, model.Lead, context.user.id);
        }, // end of  deleteLeadById resolver

        convertCrmLeadById: async (obj, args, context, info) => {
            try {
                let objLead = await common.getCrmModelById(args.id, model.Lead, [{
                    model: model.Address,
                    as: 'Addresses',
                    attributes: ['id']
                }], 'Lead');
                objLead = objLead.Lead
                if (objLead) {
                    const objContactInput = {
                        owner: objLead.owner,
                        title: objLead.title,
                        first_name: objLead.first_name,
                        last_name: objLead.last_name,
                        mobile: objLead.mobile,
                        phone: objLead.phone,
                        fax: objLead.fax,
                        email: objLead.email,
                        description: objLead.description,
                        id_crm_lead_source_master: objLead.id_crm_lead_source_master,
                        created_by: context.user.id
                    }
                    const objCompanyInput = {
                        owner: objLead.owner,
                        company_name: objLead.company_name,
                        no_of_employees: objLead.no_of_employees,
                        annual_revenue: objLead.annual_revenue,
                        phone: objLead.phone,
                        company_email: objLead.email,
                        fax: objLead.fax,
                        website: objLead.website,
                        description: objLead.description,
                        id_crm_industry_master: objLead.id_crm_industry_master,
                        id_crm_lead_status_master: objLead.id_crm_lead_status_master,
                        created_by: context.user.id,
                        Contacts: [objContactInput]
                    }
                    const objCompany = await model.Company.create(objCompanyInput, {
                        include: model.Contact
                    });
                    const addressObjList = [];
                    objLead.Addresses.forEach(address => {
                        addressObjList.push(model.CompanyAddress.create({
                            id_crm_address: address.id,
                            id_crm_company: objCompany.dataValues.id
                        }));
                        addressObjList.push(model.ContactAddress.create({
                            id_crm_address: address.id,
                            id_crm_contact: objCompany.dataValues.Contacts[0].dataValues.id
                        }));
                    });

                    await Promise.all(addressObjList);
                    const objArgsOpportunityInput = args.input.Opportunity;

                    if (objArgsOpportunityInput) {
                        const objOpportunityInput = {
                            owner: objLead.owner,
                            opportunity_name: objArgsOpportunityInput.opportunity_name,
                            opportunity_type: objArgsOpportunityInput.opportunity_type,
                            opportunity_amount: objArgsOpportunityInput.opportunity_amount,
                            opportunity_closing_date: objArgsOpportunityInput.opportunity_closing_date,
                            description: objArgsOpportunityInput.description,
                            id_crm_company: objCompany.dataValues.id,
                            id_crm_lead_source_master: objLead.id_crm_lead_source_master,
                            id_crm_pipeline_stage: objArgsOpportunityInput.id_crm_pipeline_stage,
                            created_by: context.user.id
                        }
                        const objOpportunity = await model.Opportunity.create(objOpportunityInput);
                    }
                    return {
                        message: constant.SUCCESS
                    };
                }
            } catch (error) {
                throw new Error(error);
            }
        }, // end of convertCrmLeadById resolver
        importCrmLead: async (obj, args, context, info) => {
            const batchSize = 10000;
            args.input.forEach(obj => (obj.created_by = context.user.id));
            const totalIteration = Math.ceil(args.input.length / batchSize);
            const transaction = await model.dbConnection.transaction();
            const bulkCreateData = [];
            for (let i = 0; i < totalIteration; i++) {
                bulkCreateData.push(model.Lead.bulkCreate(args.input.slice(0, batchSize), {
                    transaction: transaction
                }));
            }
            try {
                await Promise.all(bulkCreateData);
                await transaction.commit();
                return {
                    message: constant.SUCCESS
                }
            } catch (err) {
                await transaction.rollback();
                throw new Error(err);
            }
        },
    } // end of mutation
}