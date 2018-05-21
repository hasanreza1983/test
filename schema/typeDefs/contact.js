module.exports = `
type CrmContact {
	id: Int
	owner: Int
	title: String
	first_name: String
	last_name: String
	date_of_birth: String
	mobile: String
	phone: String
	email: String
	fax: String
	designation: String
	department: String
	description: String
	id_crm_company: Int
	id_crm_lead_source_master: Int
	created_at: String
	updated_at: String
    created_by: Int
	updated_by: Int
	Company: CrmCompany
	Addresses: [CrmAddress]
}

input CrmContactInput {
	owner: Int!
	title: String
	first_name: String!
	last_name: String!
	date_of_birth: String
	mobile: String
	phone: String
	email: String
	fax: String
	designation: String
	department: String
	description: String
	id_crm_company: Int!
	id_crm_lead_source_master: Int
	Addresses: [CrmAddressInput]
}
type CrmContactOutput {
    Contact: CrmContact
    message: String
}
type CrmContactListOutput {
    Contacts: [CrmContact]
    pageInfo : PageInfo
    message: String
}
type Query {
    getCrmContactById(id: Int!): CrmContactOutput
	getCrmContactListByPage(input: PageInfoInput): CrmContactListOutput
	getCrmContactList: CrmCommonListOutput
	getCrmContactCampaigns(id: Int!): CrmContactOutput 
}
type Mutation {
    createCrmContact(input: CrmContactInput!): CrmContactOutput
    updateCrmContact(id: Int!, input: CrmContactInput!): CrmDefaultOutput
	deleteCrmContactById(id: [Int!]!): CrmDefaultOutput
}
`;