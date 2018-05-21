const Joi = require('joi');

const schemaAddresses = Joi.array().items(Joi.object().keys({
	address_type: Joi.string().valid('default', 'mailing', 'billing', 'shipping', 'others').allow(null).optional(),
	address_line1: Joi.string().allow(null).optional(),
	address_line2: Joi.string().allow(null).optional(),
	address_line3: Joi.string().allow(null).optional(),
	street: Joi.string().allow(null).optional(),
	city: Joi.number().integer().allow(null).optional(),
	state_province: Joi.number().integer().allow(null).optional(),
	zip_code: Joi.string().allow(null).optional(),
	country: Joi.number().integer().allow(null).optional()
}));
module.exports = {
	schemaAddresses
}