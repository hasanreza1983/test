const Joi = require('joi');
const {
	schemaAddresses
} = require('./commonSchema');

/********************************************** Starts: Validation schema  ***************************************************/
// Schema to validate create & update company
const schemaInput = Joi.object().keys({

	owner: Joi.number().min(1).required(),
	company_name: Joi.string().min(1).max(255).required(),
	registration_number: Joi.string().min(1).max(50).allow(null).optional(),
	no_of_employees: Joi.number().integer().allow(null).optional(),
	annual_revenue: Joi.number().precision(2).allow(null).optional(),
	phone: Joi.string().min(5).max(20).allow(null).optional(),
	company_email: Joi.string().min(5).max(255).allow(null).optional(),
	fax: Joi.string().min(5).max(50).allow(null).optional(),
	website: Joi.string().min(4).max(255).allow(null).optional(),
	description: Joi.string().allow(null).optional(),
	id_crm_industry_master: Joi.number().integer().allow(null).optional(),
	id_crm_company_ownership_master: Joi.number().integer().allow(null).optional(),
	id_crm_company_status_master: Joi.number().integer().allow(null).optional(),
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