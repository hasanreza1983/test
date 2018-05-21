
/*
 * This file is a part of the type CrmLead
 * Hasan Reza 2018-03-13;
 *
 */

module.exports = `

type CrmLead {
	id: Int
	owner: Int
	company_name: String
	title: String
	first_name: String
	last_name: String
	mobile: String
	do_not_call: Boolean
	phone: String
	fax: String
	fax_opt_out: Boolean
	email: String
	email_opt_out: Boolean
	website: String
	annual_revenue: Int
	no_of_employees: Int
	last_transfer_date: String
	description: String
	id_crm_lead_source_master: Int	
	id_crm_industry_master: Int
	id_crm_lead_status_master: Int
	id_crm_rating_master: Int
	created_at: String
	updated_at: String
    created_by: Int
    updated_by: Int
	IndustryMaster: CrmIndustryMaster
	LeadStatusMaster: CrmLeadStatusMaster
	LeadSourceMaster: CrmLeadSourceMaster
	RatingMaster: CrmRatingMaster
	Addresses: [CrmAddress]
	Campaigns: [CrmCampaign]

}
input CrmLeadInput {
	owner: Int!
	company_name: String!
	title: String
	first_name: String!
	last_name: String!
	mobile: String
	do_not_call: Boolean
	phone: String
	fax: String
	fax_opt_out: Boolean
	email: String
	email_opt_out: Boolean
	website: String
	annual_revenue: Int
	no_of_employees: Int
	last_transfer_date: String
	description: String
	id_crm_lead_source_master: Int!	
	id_crm_industry_master: Int
	id_crm_lead_status_master: Int
	id_crm_rating_master: Int
	Addresses: [CrmAddressInput]	
}

type CrmLeadOutput {
   Lead: CrmLead
   message: String
}

type CrmLeadListOutput {
  Leads: [CrmLead]
  pageInfo : PageInfo
  message: String
}

input CrmOpportunityConversionInput {
	Opportunity:CrmOpportunityInput
}

type Query {
    getCrmLeadById(id: Int!): CrmLeadOutput
	getCrmLeadListByPage(input: PageInfoInput): CrmLeadListOutput   
	getCrmLeadCampaigns(id: Int!): CrmLeadOutput 
}

type Mutation {
    createCrmLead(input: CrmLeadInput!): CrmLeadOutput
    updateCrmLead(id: Int!, input: CrmLeadInput!): CrmDefaultOutput
	deleteCrmLeadById(id: [Int!]!): CrmDefaultOutput	
	convertCrmLeadById(id: Int!, input: CrmOpportunityConversionInput): CrmDefaultOutput
	importCrmLead(input: [CrmLeadInput!]!): CrmDefaultOutput
}
`;