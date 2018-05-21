/*
 * This validation file is for type CrmLead resolver
 * Make Schema to validate CrmLead User Inputs
 * Hasan Reza 2018-03-13;
 *
 */
const Joi = require('joi');
const {
	schemaAddresses,
	schemaLeadContactParent
} = require('./commonSchema');

const schemaInput = Joi.object().keys({
	owner: Joi.number().integer().required(),
	company_name: Joi.string().min(1).max(255).required(),
	title: Joi.string().min(1).max(128).allow(null).optional(),
	first_name: Joi.string().min(1).max(100).required(),
	last_name: Joi.string().min(1).max(100).required(),
	mobile: Joi.string().min(10).max(20).allow(null).optional(),
	do_not_call: Joi.boolean().allow(null).optional(),
	phone: Joi.string().min(5).max(20).allow(null).optional(),
	fax: Joi.string().min(1).max(50).allow(null).optional(),
	fax_opt_out: Joi.boolean().allow(null).optional(),
	email: Joi.string().min(5).max(255).allow(null).optional(),
	email_opt_out: Joi.boolean().allow(null).optional(),
	website: Joi.string().min(4).max(255).allow(null).optional(),
	annual_revenue: Joi.number().precision(2).allow(null).optional(),
	no_of_employees: Joi.number().integer().allow(null).optional(),
	last_transfer_date: Joi.date().allow(null).optional(),
	description: Joi.string().allow(null).optional(),
	id_crm_lead_status_master: Joi.number().integer().allow(null).optional(),
	id_crm_rating_master: Joi.number().integer().allow(null).optional(),
	id_crm_industry_master: Joi.number().integer().allow(null).optional(),
	id_crm_lead_source_master: Joi.number().integer().required(),
	Addresses: schemaAddresses
});
// function to validate schemaInput
const validateInput = (inputArguments) => {
	return Joi.validate(inputArguments, schemaInput, {
		abortEarly: true
	});
}
module.exports = {
	validateInput
}