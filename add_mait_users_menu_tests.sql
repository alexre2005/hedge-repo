
Prompt check if users have been added to user_id table
select * from  user_id_table where UPPER(user_id)='MZEEMAN' OR UPPER(user_id)='LWILKINSON' OR UPPER(user_id)='NFUSTER';

Prompt menu_table
select * from menu_table where menu_name = 'HG002' ;

Prompt menu_access
select * from menu_access where menu_name='HG002';
select * FROM menu_access WHERE user_id='LWILKINSON' OR user_id='NFUSTER' or user_id='MZEEMAN';


Prompt menu_item
select * from menu_item where menu_name = 'HG002';

Prompt program_profile
select * from program_profile where program_id='SYS1040';

Prompt applications
select * from applications where application_code='MT';

Prompt system_logicals
select * from system_logicals where os_system='SRV4071WEB';

Prompt system_parameters
select * from system_parameters where os_system='SRV4071WEB'; 
