
/*
 * This file is a part of the type CrmAddress
 * Hasan Reza 2018-03-14;
 *
 */

module.exports = `
type CrmAddress {
	id: Int
	address_type: String
	address_line1: String
	address_line2: String
	address_line3: String
	street: String
	city: Int
	state_province: Int
	zip_code: String
	country: Int
}

input CrmAddressInput {
	id: Int
	address_type: String
	address_line1: String
	address_line2: String
	address_line3: String
	street: String
	city: Int
	state_province: Int
	zip_code: String
	country: Int
}
`;