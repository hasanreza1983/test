module.exports = `
type CrmCompany {
	id: Int
	owner: Int
	company_name: String
	registration_number: String
	no_of_employees: Int
	annual_revenue: Float
	phone: String
	company_email: String
	fax: String
	website: String
	description: String
    id_crm_industry_master: Int
	id_crm_company_ownership_master: Int
	id_crm_company_status_master: Int
	created_at: String
	updated_at: String
    created_by: Int
	updated_by: Int
	Addresses: [CrmAddress]
	CompanyOwnershipMaster: CrmCompanyOwnershipMaster
	CompanyStatusMaster: CrmCompanyStatusMaster
	IndustryMaster: CrmIndustryMaster
}

input CrmCompanyInput {
	owner: Int!
	company_name: String!
	registration_number: String
	no_of_employees: Int
	annual_revenue: Float
	phone: String
	company_email: String
	fax: String
	website: String
	description: String
    id_crm_industry_master: Int
	id_crm_company_ownership_master: Int
	id_crm_company_status_master: Int
	Addresses: [CrmAddressInput]
}
type CrmCompanyOutput {
    Company: CrmCompany
    message: String
}
type CrmCompanyListOutput {
    Companies: [CrmCompany]
    pageInfo : PageInfo
    message: String
}
type Query {
    getCrmCompanyById(id: Int!): CrmCompanyOutput
	getCrmCompanyListByPage(input: PageInfoInput): CrmCompanyListOutput
	getCrmCompanyList: CrmCommonListOutput
}
type Mutation {
	importCrmCompany(input: [CrmCompanyInput!]!): CrmDefaultOutput
    createCrmCompany(input: CrmCompanyInput!): CrmCompanyOutput
    updateCrmCompany(id: Int!, input: CrmCompanyInput!): CrmDefaultOutput
	deleteCrmCompanyById(id: [Int!]!): CrmDefaultOutput
}
`;