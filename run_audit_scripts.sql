SPOOL run_audit_scrpts.log

SET HEADING OFF
SET NEWPAGE 1
SET ECHO OFF

Prompt
Prompt   The script will create audit triggers in the COPPER schema
Prompt


SET FEEDBACK ON

Prompt
Prompt creating trigger contracts_df_2_aud
Prompt

@contracts_df_2_aud.sql

Prompt
Prompt creating trigger contracts_df_aud
Prompt

@contracts_df_aud.sql

Prompt
Prompt creating trigger cont_ele_df_aud
Prompt

@cont_ele_df_aud.sql

Prompt
Prompt creating trigger cont_ff_df_aud
Prompt

@cont_ff_df_aud.sql

Prompt
Prompt creating trigger ele_ff_df_aud
Prompt

@ele_ff_df_aud .sql

Prompt
Prompt creating trigger cont_ele_df_2_aud
Prompt

@cont_ele_df_2_aud.sql


SPOOL OFF

