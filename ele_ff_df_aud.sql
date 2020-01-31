CREATE OR REPLACE TRIGGER ele_ff_df_aud
  AFTER UPDATE OR DELETE OR INSERT
  ON ele_ff_df
  FOR EACH ROW
  
/* Auditing ele_ff_df table on the following columns
SEQ_NUMBER
FF_TYPE
ff_formula
FF_PURPOSE
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
  vtable_name := 'ELE_FF_DF';
  vkey_value1 := :OLD.CONTRACT_ID;
  vkey_value2 := 'FORMULA PURPOSE ELE';
  -- vkey_value2 := :OLD.CUST_CD;  must be ELEMENT CODE does not exist in CONTRACT_DF
  vkey_value3 := :OLD.ff_purpose||'-'||:OLD.ele_cd;
  -- vkey_value3 := :OLD.SITE_CODE; must be SMELTER LOT does not exist in CONTRACT_DF
  vkey_value4 := NULL;
  -- vkey_value4 := :OLD.CONTRACT_TYPE; 

  /*-- Insert OSUSER for PARAM6
  SELECT DISTINCT osuser
  INTO vkey_value6
  FROM v$session
  WHERE username = USER
  AND sid = (SELECT sys_context('USERENV','SID') FROM DUAL) ;
  */
  -- vkey_value6 := null;
  sys7009(vkey_value5,vkey_value6) ; -- get OSUSER and Oracle SID
  vkey_value6 := UPPER(vkey_value6) ;
  
  
  -- Inserting
  
  IF INSERTING THEN
  
  -- inserting records for SEQ_NUMBER, FF_TYPE, FF_FORMULA
   
   vcolumn_name := 'SEQ_NUMBER';
   vn_column_value := :NEW.seq_number;
   vaction :='I';
   vkey_value1 := :NEW.CONTRACT_ID;
   vkey_value3 := :NEW.ff_purpose||'-'||:NEW.ele_cd;
   
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
   		
   vcolumn_name := 'FF_TYPE';
   vn_column_value := :NEW.ff_type;
   vaction :='I';
   vkey_value1 := :NEW.CONTRACT_ID;
   vkey_value3 := :NEW.ff_purpose||'-'||:NEW.ele_cd;
   
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
		
   vcolumn_name := 'FF_FORMULA';
   vn_column_value := :NEW.ff_formula;
   vaction :='I';
   vkey_value1 := :NEW.CONTRACT_ID;
   vkey_value3 := :NEW.ff_purpose||'-'||:NEW.ele_cd;
   
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

  if deleting then
     vaction := 'D';
  -- else
  ELSIF UPDATING THEN
     vaction := 'U';
  end if;
  -- DBMS_OUTPUT.PUT_LINE('After vaction') ;
  
  -- DELETING OR UPDATING
  --SEQ_NUMBER
  if deleting or
     nvl(:NEW.seq_number,' ') != nvl(:OLD.seq_number,' ') then   -- seq_number
     vcolumn_name := 'seq_number';
     vo_column_value := :OLD.seq_number;
     vn_column_value := :NEW.seq_number;
     -- DBMS_OUTPUT.PUT_LINE('Before sys1000 seq_number') ;
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
      
  end if;
  
  DBMS_OUTPUT.PUT_LINE('FF_TYPE') ;
  -- FF_TYPE
  if deleting or
     nvl(:NEW.ff_type,' ') != nvl(:OLD.ff_type,' ') then -- ff_type
     vcolumn_name := 'ff_type';
     vo_column_value := :OLD.ff_type;
     vn_column_value := :NEW.ff_type;
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
  end if;
  
 DBMS_OUTPUT.PUT_LINE('FF_FORMULA') ;  
  --FF_FORMULA
  if deleting or
     nvl(:NEW.ff_formula,' ') != nvl(:OLD.ff_formula,' ') then -- ff_formula
     vcolumn_name := 'ff_formula';
     vo_column_value := :OLD.ff_formula;
     vn_column_value := :NEW.ff_formula;
     DBMS_OUTPUT.PUT_LINE('FF_FORMULA BEFORE sys1000') ;
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
      DBMS_OUTPUT.PUT_LINE('FF_FORMULA AFTER sys1000') ;
  end if;
  --FF_PURPOSE
  if deleting or
     nvl(:NEW.ff_purpose,' ') != nvl(:OLD.ff_purpose,' ') then -- ff_purpose
     vcolumn_name := 'ff_purpose';
     vo_column_value := :OLD.ff_purpose;
     vn_column_value := :NEW.ff_purpose;
     DBMS_OUTPUT.PUT_LINE('ff_purpose BEFORE sys1000') ;
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
      DBMS_OUTPUT.PUT_LINE('ff_purpose AFTER sys1000') ;
  end if;
  
 END IF; -- Instering
end CONTRACTS_DF_AUD;
/
