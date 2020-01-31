SPOOL add_mait_menu_configuration.log
PROMPT
PROMPT Creating a new accounts in CCR-APPS for MAIT Toronto users to be ran after migraton of ORAUTIL schema
PROMPT Should be ran by ORAUTIL
PROMPT

Insert into user_id_table (USER_ID,USER_NAME,DEPT_CODE,SHORT_USER_ID,USER_TITLE_E,USER_TITLE_F,PASSWORD,MENU_NAME,LANG_FLAG,DEFAULT_PRINTER,DEFAULT_CRT,PWD_CHG_FLAG,PWD_CHG_DAYS,PWD_CHG_DATE,DEFAULT_BARCODE_PRINTER,SIGNATURE,EMAIL,PHONE_NO,FAX_NO,SITE_CODE,PRINT_FLAG,FAX_COVER_PAGE) 
values ('MZEEMAN','Margaretha Zeeman',null,null,'IT','Analyst','Glencore1',null,'E',null,null,'Y',180,SYSDATE-181,null,null,null,null,null,'XCUT','N',null);

Insert into user_id_table (USER_ID,USER_NAME,DEPT_CODE,SHORT_USER_ID,USER_TITLE_E,USER_TITLE_F,PASSWORD,MENU_NAME,LANG_FLAG,DEFAULT_PRINTER,DEFAULT_CRT,PWD_CHG_FLAG,PWD_CHG_DAYS,PWD_CHG_DATE,DEFAULT_BARCODE_PRINTER,SIGNATURE,EMAIL,PHONE_NO,FAX_NO,SITE_CODE,PRINT_FLAG,FAX_COVER_PAGE) 
values ('LWILKINSON','Lisa Wilkinson',null,null,'IT ','Analyst','Glencore1',null,'E',null,null,'Y',180,SYSDATE-181,null,null,null,null,null,'XCUT','N',null);

Insert into user_id_table (USER_ID,USER_NAME,DEPT_CODE,SHORT_USER_ID,USER_TITLE_E,USER_TITLE_F,PASSWORD,MENU_NAME,LANG_FLAG,DEFAULT_PRINTER,DEFAULT_CRT,PWD_CHG_FLAG,PWD_CHG_DAYS,PWD_CHG_DATE,DEFAULT_BARCODE_PRINTER,SIGNATURE,EMAIL,PHONE_NO,FAX_NO,SITE_CODE,PRINT_FLAG,FAX_COVER_PAGE) 
values ('NFUSTER','Nicolas Fuster',null,null,'IT','Analyst','Glencore1',null,'E',null,null,'Y',180,SYSDATE-181,null,null,null,null,null,'XCUT','N',null);

PROMPT Create CCR Menu menu_table
Insert into MENU_TABLE (MENU_NAME,MENU_DESC_E,MENU_DESC_F,MENU_TYPE,SYSTEM_CODE,MENU_NO) values ('HG002','MAIT Toronto Audit','MAIT Toronto Audit','M','MT',2);

PROMPT
PROMPT Providing the access to MAIT Audit menu
PROMPT

Prompt menu_access

Insert into menu_access(menu_name,user_id) values ('HG002','MZEEMAN');
Insert into menu_access(menu_name,user_id) values ('HG002','LWILKINSON');
Insert into menu_access(menu_name,user_id) values ('HG002','NFUSTER');

Prompt menu_item

insert into menu_item (MENU_NAME, ITEM_NO, ITEM_TYPE, ITEM_DESC_E, ITEM_DESC_F, ITEM_ACTION, GLOBAL_VAR1, GLOBAL_VAR2, GLOBAL_VAR3, GLOBAL_VAR4, GLOBAL_VAR5, REPORT_NO, PRINT_FLAG, MENU_TYPE, PARAM1)
values ('HG002', 1, '1', 'Contract Audit', 'Contract Audit', 'SYS1040', null, null, null, null, null, null, 'N', 'M', null);


Prompt creating MAIT Toronto audit application

Insert into applications (APPLICATION_CODE,APPLICATION_DESC_E,APPLICATION_DESC_F,RESOURCE_PERSON,IS_RESOURCE_PERSON,NODE_NAME,P_APPLICATION_CODE,PROGRAM_SEQNO,LOGO_E,LOGO_F) 
values ('MT','MAIT Toronto Audit','MAIT Toronto Audit',null,null,'CU',null,15,'xntranlogo.gif','xntranlogo.gif');


Prompt program_profile

insert into program_profile (PROGRAM_ID, PROGRAM_DESC_E, PROGRAM_DESC_F, PROGRAM_LOGICAL, PROGRAM_TYPE_CODE, OUTPUT_LOGICAL, PROGRAM_SEQNO, APPLICATION_CODE, PARAM_SCREEN, STATUS_FLAG, COMPLEX_FLAG, COMMENTS, PRINTER_TYPE_CODE, RESERVED_FLAG, RESERVED_BY, RESERVED_DATE)
values ('SYS1040', 'Contract Audit', 'Contract Audit', 'HG_FRM', '1', null, 2, 'MT', null, 'A', 'S', null, null, null, null, null);


Prompt creating new "OS_SYSTEM"

insert into system_logicals (OS_SYSTEM,USER_ID,LOGICAL_NAME,LOGICAL_PATH) values ('SRV4071WEB','PUBLIC','HG_FRM','/u04/cakapps/appsweb12/hg/frm/');

insert into system_logicals (OS_SYSTEM,USER_ID,LOGICAL_NAME,LOGICAL_PATH) values ('SRV4071WEB','PUBLIC','IMAGES','/u04/cakapps/appsweb12/images/');

Prompt Define system parameters

Insert into system_parameters (OS_SYSTEM,USER_ID,PARAMETER_ID,PARAMETER_VALUE) values ('SRV4071WEB','PUBLIC','EXCEL_FILE_LOCATION','c:\temp\');
Insert into system_parameters (OS_SYSTEM,USER_ID,PARAMETER_ID,PARAMETER_VALUE) values ('SRV4071WEB','PUBLIC','LOV_INDICATOR','*');
Insert into system_parameters (OS_SYSTEM,USER_ID,PARAMETER_ID,PARAMETER_VALUE) values ('SRV4071WEB','PUBLIC','EXCEL_SEPARATOR',';');
Insert into system_parameters (OS_SYSTEM,USER_ID,PARAMETER_ID,PARAMETER_VALUE) values ('SRV4071WEB','PUBLIC','HINT_ATTRIBUTE','THEME_HINT_DARK');


-- select * from menu_item where menu_name like 'HG%'

COMMIT;

BEGIN
  DBMS_SCHEDULER.RUN_JOB(
    JOB_NAME => 'refresh_menu_mviews',
    USE_CURRENT_SESSION => FALSE);
END;
/

SPOOL OFF;