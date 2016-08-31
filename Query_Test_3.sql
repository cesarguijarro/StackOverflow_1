select 
Contact.display_name as Contact_name,
Concat(' - ', IFNULL(
( 
select 
E.display_name
from 
civicrm_contact E,
civicrm_relationship D 
where E.id = D.contact_id_b and D.relationship_type_id = 5 and D.contact_id_a = Contact.id
)
,'No Employer') )
 as Employer,
(
SELECT COUNT(*)
FROM civicrm_case C, civicrm_relationship B
where c.status_id = 1 and b.case_id = c.id and B.contact_id_a = Contact.id 
) as TotalOnGoingCases
from 
civicrm_contact as Contact
where  Contact.contact_type = 'Individual'