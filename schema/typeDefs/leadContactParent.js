
/*
 * This file is a part of the type CrmLeadContactParent
 * Hasan Reza 2018-03-13;
 *
 */

module.exports = `
type CrmLeadContactParent {	
	first_name: String
	last_name: String
	title: String
	designation: String
	phone: String
	mobile: String
	email: String
	secondary_email: String
	description: String
	id_crm_lead_source_master: Int
	is_lead: Boolean
	LeadSourceMaster: CrmLeadSourceMaster
}
input CrmLeadContactParentInput {	
	first_name: String
	last_name: String
	title: String
	designation: String
	phone: String
	mobile: String
	email: String
	secondary_email: String
	description: String
	id_crm_lead_source_master: Int
	is_lead: Boolean	
}
`;