SPOOL create_new_hedge_user.log

ACCEPT DB char prompt "Enter database name : "

ACCEPT p_user char prompt "Enter username : "

PROMPT
PROMPT Creating MAIT Toronto user &p_user in &DB database....
PROMPT

connect orautil/orautil@&DB

DROP USER &p_user CASCADE ;

-- Create the user 
create user &p_user identified by Glencore1
  default tablespace COPDATA
 temporary tablespace TTGROUP
  profile DEFAULT;
-- Grant/Revoke role privileges 
grant connect to &p_user;
grant hedge_user to &p_user;
grant resource to &p_user;
-- Grant/Revoke system privileges 
grant unlimited tablespace to &p_user;


PROMPT
PROMPT Creating a new accounts in CCR-APPS for user 
PROMPT

Insert into user_id_table (USER_ID,USER_NAME,DEPT_CODE,SHORT_USER_ID,USER_TITLE_E,USER_TITLE_F,PASSWORD,MENU_NAME,LANG_FLAG,DEFAULT_PRINTER,DEFAULT_CRT,PWD_CHG_FLAG,PWD_CHG_DAYS,PWD_CHG_DATE,DEFAULT_BARCODE_PRINTER,SIGNATURE,EMAIL,PHONE_NO,FAX_NO,SITE_CODE,PRINT_FLAG,FAX_COVER_PAGE) 
values (UPPER('&p_user'),'Eva Shaw',null,null,'IT','Analyst','Glencore1',null,'E',null,null,'Y',180,SYSDATE-181,null,null,null,null,null,'XCUT','N',null);

PROMPT
PROMPT Providing the access to MAIT Audit menu
PROMPT

Prompt menu_access

Insert into menu_access(menu_name,user_id) values ('HG002',UPPER('&p_user'));

COMMIT;

BEGIN
  DBMS_SCHEDULER.RUN_JOB(
    JOB_NAME => 'refresh_menu_mviews',
    USE_CURRENT_SESSION => FALSE);
END;
/

SPOOL OFF