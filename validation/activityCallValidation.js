const Joi = require('joi');

/********************************************** Starts: Validation schema  ***************************************************/
// Schema to validate create & update activity call
const schemaInput = Joi.object().keys({
    owner: Joi.number().min(1).required(),
    subject: Joi.string().min(1).max(255).required(),
    call_type: Joi.string().valid('inbound', 'outbound').allow(null).optional(),
    call_details: Joi.string().valid('current', 'completed', 'schedule').required(),
    call_start_time: Joi.date().allow(null).optional(),
    call_duration: Joi.number().allow(null).optional(),
    result: Joi.string().allow(null).optional(),
    description: Joi.string().allow(null).optional(),
    ActivityCallLinks: Joi.array().items(Joi.object({
        model_name: Joi.string().valid('Campaign', 'Lead', 'Contact', 'Company', 'Opportunity').required(),
        model_id: Joi.number().min(1).required()
    }))
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