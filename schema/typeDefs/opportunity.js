/*
 * This file is a part of the type CrmOpportunity
 * Hasan Reza 2018-04-05;
 *
 */
module.exports=`
type CrmOpportunity {
	id: Int
	owner: Int
	opportunity_name: String
	opportunity_type: String
	opportunity_amount: Float
	opportunity_closing_date: String
	description: String
	id_crm_company: Int
	id_crm_lead_source_master: Int
	id_crm_pipeline_stage: Int
	Company: CrmCompany
	LeadSourceMaster: CrmLeadSourceMaster
	PipelineStage: CrmPipelineStage
}
input CrmOpportunityInput {
	owner: Int!
	opportunity_name: String!
	opportunity_type: String
	opportunity_amount: Float
	opportunity_closing_date: String!
	description: String
	id_crm_company: Int!
	id_crm_lead_source_master: Int
	id_crm_pipeline_stage: Int
}
type CrmOpportunityOutput {
   Opportunity: CrmOpportunity
   message: String
}
type CrmOpportunityListOutput {
  Opportunities: [CrmOpportunity]
  pageInfo : PageInfo
  message: String
}
type Query {
    getCrmOpportunityById(id: Int!): CrmOpportunityOutput
    getCrmOpportunityListByPage(input: PageInfoInput): CrmOpportunityListOutput
}
type Mutation {
    createCrmOpportunity(input: CrmOpportunityInput!): CrmOpportunityOutput
    updateCrmOpportunity(id: Int!, input: CrmOpportunityInput!): CrmDefaultOutput
    deleteCrmOpportunityById(id: [Int!]!): CrmDefaultOutput
}
`;