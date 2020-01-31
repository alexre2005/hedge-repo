conn  copper/cuacp@maitacp

REM  Master Script to grant/create COPPER objects to be ran after migraton of ORAUTIL schema

SET    HEADING      OFF
SET    LINESIZE     2000
SET    PAGESIZE     0
SET    TERMOUT      OFF
SET    FEEDBACK     ON
SET    ECHO         OFF


SPOOL master_copper.log

PROMPT
PROMPT Grant privilliges on COPPER objects to HEDGE_USER role
PROMPT

-- Grant on COPPER tables to HEDGE_USER
grant  select, insert, update, delete on COPPER.CONTRACTS_DF to HEDGE_USER;
grant  select, insert, update, delete on COPPER.CONTRACTS_DF_2 to HEDGE_USER;
grant  select, insert, update, delete on COPPER.CONT_FF_DF to HEDGE_USER;
grant  select, insert, update, delete on COPPER.ELE_FF_DF to HEDGE_USER;
grant  select, insert, update, delete on COPPER.CONT_ELE_DF to HEDGE_USER;
grant  select, insert, update, delete on COPPER.ELEMENT_CODES to HEDGE_USER;
grant  select, insert, update, delete on COPPER.ELL_RECOV_RATES to HEDGE_USER;
grant  select, insert, update, delete on COPPER.cont_ele_df_2 to HEDGE_USER;
grant  select, insert, update, delete on COPPER.HDG_CONVERSION_RATES to HEDGE_USER;
grant  select, insert, update, delete on COPPER.HDG_PRICE_CODE to HEDGE_USER;
grant  select, insert, update, delete on COPPER.HDG_RISK_TRANSFER_CODES to HEDGE_USER;
grant  select, insert, update, delete on COPPER.HDG_TITLE_TRANSFER_CODES to HEDGE_USER;
grant  select, insert, update, delete on COPPER.HDG_UNIT_CODES to HEDGE_USER;
grant  select, insert, update, delete on COPPER.LOT_DF to HEDGE_USER;
grant  select, insert, update, delete on COPPER.LOT_ELE_DF to HEDGE_USER;
grant  select, insert, update, delete on COPPER.LOT_SHIPMNT_DF to HEDGE_USER;
grant  select, insert, update, delete on COPPER.MATERIALS_D to HEDGE_USER;

SPOOL OFF

SET TERMOUT ON

Prompt 
Prompt  ---------------Check master_copper.log -----------------
Prompt 

PROMPT
PROMPT create database triggers for audit
PROMPT

SET TERMOUT OFF

@run_audit_scripts

SET    FEEDBACK     ON
SET    HEADING      ON 
SET    TERMOUT      ON
SET    ECHO         ON
SET    pagesize     24
SET    ECHO         ON

Prompt 
Prompt  ---------------Check run_audit_scrpts.log -----------------
Prompt 



