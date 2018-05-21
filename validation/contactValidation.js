const Joi = require('joi');
const {
	schemaAddresses,
	schemaLeadContactParent
} = require('./commonSchema');

/********************************************** Starts: Validation schema  ***************************************************/
// Schema to validate create & update contact
const schemaInput = Joi.object().keys({
	owner: Joi.number().integer().required(),
	title: Joi.string().min(1).max(128).allow(null).optional(),
	first_name: Joi.string().min(1).max(100).required(),
	last_name: Joi.string().min(1).max(100).required(),
	date_of_birth: Joi.date().allow(null).optional(),
	mobile: Joi.string().min(10).max(20).allow(null).optional(),
	phone: Joi.string().min(5).max(20).allow(null).optional(),
	email: Joi.string().min(5).max(255).allow(null).optional(),
	fax: Joi.string().min(5).max(50).allow(null).optional(),
	designation: Joi.string().min(1).max(100).allow(null).optional(),
	department: Joi.string().min(1).max(100).allow(null).optional(),
	description: Joi.string().allow(null).optional(),
	id_crm_company: Joi.number().integer().required(),
	id_crm_lead_source_master: Joi.number().integer().allow(null).optional(),
	Addresses: schemaAddresses
});
// function to validate schema schemaInput
const validateInput = (inputArguments) => {
	return Joi.validate(inputArguments, schemaInput, {
		abortEarly: true
	});
}
module.exports = {
	validateInput
}