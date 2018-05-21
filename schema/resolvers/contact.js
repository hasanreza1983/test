/*
 * This Resolver File belongs to the contact type
 * Arif Khan 2018-03-14;
 *
 */
const Sequelize = require('sequelize');

const model = require('../../models');
const constant = require('../../lib/constant');
const common = require('../../lib/commonResolver');
const contactValidation = require('../../validation/contactValidation');

const modelIncludes = [{
        model: model.Company
    },
    {
        model: model.Address,
        as: 'Addresses'
    }
];

module.exports = {
    Query: {
        getCrmContactById: async (obj, args, context, info) => {
            const response = await common.getCrmModelById(args.id, model.Contact, modelIncludes, 'Contact');
            response.Contact.Addresses = await common.addAddressName(response.Contact.Addresses);
            return response;
        },
        getCrmContactListByPage: async (obj, args, context, info) => {
            const response = await common.getCrmModelListByPage(args, model.Contact, [{
                model: model.Company
            }], 'Contacts');
            return response;
        },
        getCrmContactList: async (obj, args, context, info) => {
            let result = await model.Contact.findAll({
                where: {
                    is_deleted: 0
                },
                attributes: ['id', [Sequelize.fn('concat_ws', ' ', Sequelize.col('first_name'), Sequelize.col('last_name')), 'name']],
                order: Sequelize.literal('name')
            });
            result = JSON.parse(JSON.stringify(result));
            return {
                result,
                message: constant.SUCCESS
            }
        },

        getCrmContactCampaigns: async (obj, args, context, info) => {
            const response = await common.getCrmModelById(args.id, model.Contact, [{
                model: model.Campaign,
                include: [{
                    model: model.CampaignTypeMaster
                }]
            }], 'Contact');
            return response;

        }, // end of getCrmContactCampaigns resolver
    },
    Mutation: {
        createCrmContact: async (obj, args, context, info) => {
            const errors = contactValidation.validateInput(args.input);
            if (errors.error) {
                throw new Error(errors.error.details[0].message);
            }
            args.input.created_by = context.user.id;
            const contactObj = await model.Contact.create(args.input, {
                include: modelIncludes
            });
            return {
                Contact: contactObj,
                message: constant.SUCCESS
            }
        },
        updateCrmContact: async (obj, args, context, info) => {
            const errors = contactValidation.validateInput(args.input);
            if (errors.error) {
                throw new Error(errors.error.details[0].message);
            }
            const Addresses = args.input.Addresses;
            delete args.input.Addresses;
            const contactObj = await model.Contact.findOne({
                where: {
                    id: args.id,
                    is_deleted: 0
                }
            });
            if (contactObj) {
                args.input.updated_by = context.user.id;
                if (Addresses && Addresses.length) {
                    await common.updateModelAddress(Addresses, model, contactObj);
                }
                Object.keys(args.input).forEach((e) => {
                    contactObj[e] = args.input[e];
                });
                await contactObj.save();
            } else {
                throw new Error(constant.DOES_NOT_EXIST);
            }
            return {
                message: constant.SUCCESS
            };
        },
        deleteCrmContactById: async (obj, args, context, info) => {
            return await common.deleteModelById(args.id, model.Contact, context.user.id);
        }
    }
}