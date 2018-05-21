/*
 * This file is a part of the type CrmOpportunityPipelineHistory
 * Hasan Reza 2018-04-05;
 *
 */
module.exports = `
type CrmOpportunityPipelineHistory {
	id: Int
	id_crm_opportunity: Int
	id_crm_pipeline_stage: Boolean
	amount: Float
	expected_revenue: String
	closing_date: String
	stage_duration: String
	created_by: Int
	updated_by: Int
	deleted_by: Int
}
input CrmOpportunityPipelineHistoryInput {
	id: Int
	id_crm_opportunity: Int
	id_crm_pipeline_stage: Boolean
	amount: Float
	expected_revenue: String
	closing_date: String
	stage_duration: String
	created_by: Int
	updated_by: Int
	deleted_by: Int
}
type CrmOpportunityPipelineHistoryOutput {
   CrmOpportunityPipelineHistory: CrmOpportunityPipelineHistory
   message: String
}
type CrmOpportunityPipelineHistoryListOutput {
  CrmOpportunityPipelineHistorys: [CrmOpportunityPipelineHistory]
  pageInfo : PageInfo
  message: String
}
type Query {
    getCrmOpportunityPipelineHistoryById(id: Int!): CrmOpportunityPipelineHistoryOutput
    getCrmOpportunityPipelineHistoryListByPage(input: PageInfoInput): CrmOpportunityPipelineHistoryListOutput
    getAllCrmOpportunityPipelineHistory(whereConditions:  String = "" ): CrmOpportunityPipelineHistoryListOutput
}
type Mutation {
    createCrmOpportunityPipelineHistory(input: CrmOpportunityPipelineHistoryInput!): CrmOpportunityPipelineHistoryOutput
    updateCrmOpportunityPipelineHistory(input: CrmOpportunityPipelineHistoryInput!): CrmOpportunityPipelineHistoryOutput
    deleteCrmOpportunityPipelineHistoryById(id: Int!): CrmOpportunityPipelineHistoryOutput
}
`;