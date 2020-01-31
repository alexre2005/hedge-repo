CREATE OR REPLACE TRIGGER contracts_df_2_aud
  AFTER UPDATE OR DELETE OR INSERT
  ON contracts_df_2
  FOR EACH ROW
/* Auditing CONTRACTS_DF_2 table on the following columns
contract_id_2
*/
  
  
DECLARE
vtable_name     varchar2(30);
vkey_value1     varchar2(20);
vkey_value2     varchar2(20);
vkey_value3     varchar2(20);
vkey_value4     varchar2(20);
vkey_value5     varchar2(20);
vkey_value6     varchar2(20);
vcolumn_name    varchar2(30);
vo_column_value varchar2(60);
vn_column_value varchar2(60);
vaction         varchar2(1);
BEGIN
  vtable_name := 'CONTRACTS_DF_2';
  vkey_value1 := :OLD.contract_id;
  -- vkey_value2 := 'CTTS';
  -- vkey_value2 := :OLD.CUST_CD;  must be ELEMENT CODE does not exist in CONTRACT_DF
  vkey_value3 := :OLD.CONTRACT_ID_2;
  -- vkey_value3 := :OLD.SITE_CODE; must be SMELTER LOT does not exist in CONTRACT_DF
  vkey_value4 := NULL;
  -- vkey_value4 := :OLD.CONTRACT_TYPE; 

  -- vkey_value6 := null;
  sys7009(vkey_value5,vkey_value6) ; -- get OSUSER and Oracle SID
  vkey_value6 := UPPER(vkey_value6) ;
  
  
  -- Inserting
  
  IF INSERTING THEN
   vkey_value1 := :NEW.contract_id;
   vcolumn_name := 'CONTRACT_ID_2';
   vn_column_value := :NEW.contract_id_2;
   vaction :='I';
   -- vkey_value3 := :NEW.contract_id_2;
		sys1000(
			 vtable_name => vtable_name    
			,vkey_value1 => RTRIM(vkey_value1)    
			,vkey_value2 => RTRIM(vkey_value2)    
			,vkey_value3 => RTRIM(vkey_value3)    
			,vkey_value4 => RTRIM(vkey_value4)    
			,vkey_value5 => RTRIM(vkey_value5)    
			,vkey_value6 => RTRIM(vkey_value6)    
			,vcolumn_name => UPPER(vcolumn_name)  
			,vo_column_value  => RTRIM(vo_column_value)
			,vn_column_value  => RTRIM(vn_column_value)
			,vaction => vaction        
			,vproducer_code => NULL
		);  
 ELSE

  IF DELETING THEN
     vaction := 'D';
  -- else
  ELSIF UPDATING THEN
     vaction := 'U';
  end if;
  -- DBMS_OUTPUT.PUT_LINE('After vaction') ;
  
  -- DELETING OR UPDATING
  IF DELETING OR
     nvl(:NEW.contract_id_2,' ') != nvl(:OLD.contract_id_2,' ') then   -- contract_id_2
     vcolumn_name := 'CONTRACT_ID_2';
     vo_column_value := :OLD.contract_id_2;
     vn_column_value := :NEW.contract_id_2;
     -- DBMS_OUTPUT.PUT_LINE('Before sys1000 contract_id_2') ;
	 sys1000(
			 vtable_name => vtable_name    
			,vkey_value1 => RTRIM(vkey_value1)    
			,vkey_value2 => RTRIM(vkey_value2)    
			,vkey_value3 => RTRIM(vkey_value3)    
			,vkey_value4 => RTRIM(vkey_value4)    
			,vkey_value5 => RTRIM(vkey_value5)    
			,vkey_value6 => RTRIM(vkey_value6)    
			,vcolumn_name => UPPER(vcolumn_name)    
			,vo_column_value  => RTRIM(vo_column_value)
			,vn_column_value  => RTRIM(vn_column_value)
			,vaction => vaction        
			,vproducer_code => NULL
		);  
      
  END IF;
  
 
 END IF; -- Instering
end contracts_df_2_aud;
/
