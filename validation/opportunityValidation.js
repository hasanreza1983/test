/*
 * This validation file is for type Opportunity resolver
 * Make Schema to validate Opportunity User Inputs
 * Hasan Reza 2018-04-05;
 *
 */
const Joi = require('joi');

const schemaInput = Joi.object().keys({
	owner: Joi.number().integer().required(),
	opportunity_name: Joi.string().min(1).max(100).required(),
	opportunity_type: Joi.string().valid('none', 'existing_business', 'new_business').allow(null).optional(),
	opportunity_amount: Joi.number().precision(2).allow(null).optional(),
	opportunity_closing_date: Joi.date().required(),
	description: Joi.string().allow(null).optional(),
	id_crm_company: Joi.number().integer().required(),
	id_crm_lead_source_master: Joi.number().integer().allow(null).optional(),
	id_crm_pipeline_stage: Joi.number().integer().required()
});
// function to validate schema
const validateInput = (inputArguments) => {
	return Joi.validate(inputArguments, schemaInput, {
		abortEarly: true
	});
}
module.exports = {
	validateInput
}