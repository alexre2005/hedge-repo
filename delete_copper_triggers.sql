-- connect copper/cuacp@maitacp

Spool delete_copper_triggers.log

drop trigger contracts_df_2_aud
drop trigger contracts_df_aud
drop trigger cont_ele_df_aud
drop trigger cont_ff_df_aud
drop trigger ele_ff_df_aud 
drop trigger cont_ele_df_2_aud

spool off