
/*
 * This file is a part of the type CrmCampaign
 * Hasan Reza 2018-04-05;
 *
 */

module.exports=`
type CrmCampaign {
	id: Int
	owner: Int
	id_crm_campaign_type_master: Int
	campaign_name: String
	campaign_status: String
	start_date: String
	end_date: String
	expected_revenue: String
	budgeted_cost: String
	actual_cost: String
	expected_response: String
	description: String
	created_by: Int
	updated_by: Int
	deleted_by: Int	
	CampaignTypeMaster: CrmCampaignTypeMaster
	Leads: [CrmLead]
	Opportunities: [CrmOpportunity]
	Contacts: [CrmContact]
}
input CrmCampaignInput {
	owner: Int!
	id_crm_campaign_type_master: Int
	campaign_name: String!
	campaign_status: String
	start_date: String
	end_date: String
	expected_revenue: String
	budgeted_cost: String
	actual_cost: String
	description: String	
}

type CrmCampaignOutput {
   Campaign: CrmCampaign
   message: String
}

type CrmCampaignListOutput {
  Campaigns: [CrmCampaign]
  pageInfo : PageInfo
  message: String
}

type Query {
    getCrmCampaignById(id: Int!): CrmCampaignOutput
	getCrmCampaignListByPage(input: PageInfoInput): CrmCampaignListOutput	
	getCrmCampaignList: CrmCommonListOutput
}

type Mutation {
    createCrmCampaign(input: CrmCampaignInput!): CrmCampaignOutput
    updateCrmCampaign(id: Int!, input: CrmCampaignInput!): CrmDefaultOutput
    deleteCrmCampaignById(id: [Int!]!): CrmDefaultOutput
}

`;