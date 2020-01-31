/* As per new requirements 2019-12-18 removed audit for MOISTURE columns:
		MOISTURE_P_GRADE
		MOISTURE_P_G2
		MOISTURE_P_ABOVE
		MOISTURE_P_A2
		MOISTURE_P_TO
		MOISTURE_P_TO_2
	Added DELIVERY_TERMS
  */
CREATE OR REPLACE TRIGGER contracts_df_aud
  AFTER UPDATE OR DELETE OR INSERT
  ON contracts_df 
  FOR EACH ROW
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
session_id NUMBER;
BEGIN
  vtable_name := 'CONTRACTS_DF';
  vkey_value1 := :OLD.CONTRACT_ID;
  vkey_value2 := NULL;
  -- vkey_value2 := :OLD.CUST_CD;  must be ELEMENT CODE does not exist in CONTRACT_DF
  vkey_value3 := NULL;
  -- vkey_value3 := :OLD.SITE_CODE; must be SMELTER LOT does not exist in CONTRACT_DF
  vkey_value4 := NULL;
  -- vkey_value4 := :OLD.CONTRACT_TYPE;
  -- vkey_value5 add SID
  
  /*SELECT sys_context('USERENV','SID') 
  INTO session_id 
  FROM DUAL;
  
  vkey_value5 := TO_CHAR(session_id); 
  
  -- Insert OSUSER for PARAM6
  SELECT DISTINCT osuser
  INTO vkey_value6
  FROM v$session
  WHERE username = USER
  AND sid = session_id;
  */
  
  sys7009(vkey_value5,vkey_value6) ; -- get OSUSER and Oracle SID
  vkey_value6 := UPPER(vkey_value6) ;
  
  -- vkey_value6 := null;
  
  -- Inserting
  
  IF INSERTING THEN
   vcolumn_name := NULL;
   vaction :='I';
   vkey_value1 := :NEW.CONTRACT_ID;
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
  if deleting or
     nvl(:NEW.CUST_CD,' ') != nvl(:OLD.CUST_CD,' ') then   -- CUST_CD
     vcolumn_name := 'CUST_CD';
     vo_column_value := :OLD.CUST_CD;
     vn_column_value := :NEW.CUST_CD;
     /*SYS1000(vtable_name,
             vkey_value1,
             vkey_value2,
             vkey_value3,
             vkey_value4,
             vkey_value5,
             vkey_value6,
             vcolumn_name,
             vo_column_value,
             vn_column_value,
             vaction,
             null);
     */
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

  if deleting or
     nvl(:NEW.CUSTOMER_CD,' ') != nvl(:OLD.CUSTOMER_CD,' ') then -- CUSTOMER_CD
     vcolumn_name := 'CUSTOMER_CD';
     vo_column_value := :OLD.CUSTOMER_CD;
     vn_column_value := :NEW.CUSTOMER_CD;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.CONTRACT_NSC_DEP,' ') != nvl(:OLD.CONTRACT_NSC_DEP,' ') then -- CONTRACT_NSC_DEP
     vcolumn_name := 'CONTRACT_NSC_DEP';
     vo_column_value := :OLD.CONTRACT_NSC_DEP;
     vn_column_value := :NEW.CONTRACT_NSC_DEP;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.SITE_CODE,' ') != nvl(:OLD.SITE_CODE,' ') then			-- SITE_CODE
     vcolumn_name := 'SITE_CODE';
     vo_column_value := :OLD.SITE_CODE;
     vn_column_value := :NEW.SITE_CODE;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.CONTRACT_TYPE,' ') != nvl(:OLD.CONTRACT_TYPE,' ') then	-- CONTRACT_TYPE
     vcolumn_name := 'CONTRACT_TYPE';
     vo_column_value := :OLD.CONTRACT_TYPE;
     vn_column_value := :NEW.CONTRACT_TYPE;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.STATUS_CD,' ') != nvl(:OLD.STATUS_CD,' ') then			 -- STATUS_CD
     vcolumn_name := 'STATUS_CD';
     vo_column_value := :OLD.STATUS_CD;
     vn_column_value := :NEW.STATUS_CD;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.ISSUE_DATE,to_date('19000101','YYYYMMDD')) != 			   --ISSUE_DATE
     nvl(:OLD.ISSUE_DATE,to_date('19000101','YYYYMMDD')) then
     vcolumn_name := 'ISSUE_DATE';
     vo_column_value := to_char(:OLD.ISSUE_DATE,'YYYYMMDD');
     vn_column_value := to_char(:NEW.ISSUE_DATE,'YYYYMMDD');
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.START_DATE,to_date('19000101','YYYYMMDD')) != 				--START_DATE
     nvl(:OLD.START_DATE,to_date('19000101','YYYYMMDD')) then
     vcolumn_name := 'START_DATE';
     vo_column_value := to_char(:OLD.START_DATE,'YYYYMMDD');
     vn_column_value := to_char(:NEW.START_DATE,'YYYYMMDD');
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or															-- EXPIRY_DATE
     nvl(:NEW.EXPIRY_DATE,to_date('19000101','YYYYMMDD')) != 
     nvl(:OLD.EXPIRY_DATE,to_date('19000101','YYYYMMDD')) then
     vcolumn_name := 'EXPIRY_DATE';
     vo_column_value := to_char(:OLD.EXPIRY_DATE,'YYYYMMDD');
     vn_column_value := to_char(:NEW.EXPIRY_DATE,'YYYYMMDD');
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.MATERIAL_FULL_CD,' ') != nvl(:OLD.MATERIAL_FULL_CD,' ') then  -- MATERIAL_FULL_CD
     vcolumn_name := 'MATERIAL_FULL_CD';
     vo_column_value := :OLD.MATERIAL_FULL_CD;
     vn_column_value := :NEW.MATERIAL_FULL_CD;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.MATERIAL_G_CD,' ') != nvl(:OLD.MATERIAL_G_CD,' ') then		-- MATERIAL_G_CD
     vcolumn_name := 'MATERIAL_G_CD';
     vo_column_value := :OLD.MATERIAL_G_CD;
     vn_column_value := :NEW.MATERIAL_G_CD;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.MATERIAL_D_CD,' ') != nvl(:OLD.MATERIAL_D_CD,' ') then		-- MATERIAL_D_CD
     vcolumn_name := 'MATERIAL_D_CD';
     vo_column_value := :OLD.MATERIAL_D_CD;
     vn_column_value := :NEW.MATERIAL_D_CD;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
 
  
  /*
  
  if deleting or
     nvl(:NEW.MOISTURE_P_GRADE,0) != nvl(:OLD.MOISTURE_P_GRADE,0) then		--MOISTURE_P_GRADE 
     vcolumn_name := 'MOISTURE_P_GRADE';
     vo_column_value := :OLD.MOISTURE_P_GRADE;
     vn_column_value := :NEW.MOISTURE_P_GRADE;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.MOISTURE_P_G2,0) != nvl(:OLD.MOISTURE_P_G2,0) then			 -- MOISTURE_P_G2
     vcolumn_name := 'MOISTURE_P_G2';
     vo_column_value := :OLD.MOISTURE_P_G2;
     vn_column_value := :NEW.MOISTURE_P_G2;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.MOISTURE_P_ABOVE,0) != nvl(:OLD.MOISTURE_P_ABOVE,0) then        -- MOISTURE_P_ABOVE
     vcolumn_name := 'MOISTURE_P_ABOVE';
     vo_column_value := :OLD.MOISTURE_P_ABOVE;
     vn_column_value := :NEW.MOISTURE_P_ABOVE;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.MOISTURE_P_A2,0) != nvl(:OLD.MOISTURE_P_A2,0) then			   -- MOISTURE_P_A2
     vcolumn_name := 'MOISURE_P_A2';
     vo_column_value := :OLD.MOISTURE_P_A2;
     vn_column_value := :NEW.MOISTURE_P_A2;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.MOISTURE_P_TO,0) != nvl(:OLD.MOISTURE_P_TO,0) then				-- MOISTURE_P_TO
     vcolumn_name := 'MOISURE_P_TO';
     vo_column_value := :OLD.MOISTURE_P_TO;
     vn_column_value := :NEW.MOISTURE_P_TO;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.MOISTURE_P_TO_2,0) != nvl(:OLD.MOISTURE_P_TO_2,0) then			-- MOISTURE_P_TO_2
     vcolumn_name := 'MOISURE_P_TO_2';
     vo_column_value := :OLD.MOISTURE_P_TO_2;
     vn_column_value := :NEW.MOISTURE_P_TO_2;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  */
  
  if deleting or
     nvl(:NEW.MAIN_ELE_CD,' ') != nvl(:OLD.MAIN_ELE_CD,' ') then				  -- MAIN_ELE_CD
     vcolumn_name := 'MAIN_ELE_CD';
     vo_column_value := :OLD.MAIN_ELE_CD;
     vn_column_value := :NEW.MAIN_ELE_CD;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.CTRL_ELE_TYPE,' ') != nvl(:OLD.CTRL_ELE_TYPE,' ') then				-- CTRL_ELE_TYPE
     vcolumn_name := 'CTRL_ELE_TYPE';
     vo_column_value := :OLD.CTRL_ELE_TYPE;
     vn_column_value := :NEW.CTRL_ELE_TYPE;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.MAT_UNIT_CD,' ') != nvl(:OLD.MAT_UNIT_CD,' ') then					-- MAT_UNIT_CD
     vcolumn_name := 'MAT_UNIT_CD';
     vo_column_value := :OLD.MAT_UNIT_CD;
     vn_column_value := :NEW.MAT_UNIT_CD;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.MAT_TOTAL_QTY,0) != nvl(:OLD.MAT_TOTAL_QTY,0) then					-- MAT_TOTAL_QTY
     vcolumn_name := 'MAT_TOTAL_QTY';
     vo_column_value := :OLD.MAT_TOTAL_QTY;
     vn_column_value := :NEW.MAT_TOTAL_QTY;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.MAT_MAXIMUM_QTY,0) != nvl(:OLD.MAT_MAXIMUM_QTY,0) then				--MAT_MAXIMUM_QTY
     vcolumn_name := 'MAT_MAXIMUM_QTY';
     vo_column_value := :OLD.MAT_MAXIMUM_QTY;
     vn_column_value := :NEW.MAT_MAXIMUM_QTY;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.MOIST_TYPICAL,0) != nvl(:OLD.MOIST_TYPICAL,0) then					 -- MOIST_TYPICAL
     vcolumn_name := 'MOIST_TYPICAL';
     vo_column_value := :OLD.MOIST_TYPICAL;
     vn_column_value := :NEW.MOIST_TYPICAL;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.TITLE_TRANSF_CD,' ') != nvl(:OLD.TITLE_TRANSF_CD,' ') then			 --TITLE_TRANSF_CD
     vcolumn_name := 'TITLE_TRANSF_CD';
     vo_column_value := :OLD.TITLE_TRANSF_CD;
     vn_column_value := :NEW.TITLE_TRANSF_CD;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.RISK_TRANSF_CD,' ') != nvl(:OLD.RISK_TRANSF_CD,' ') then				 --RISK_TRANSF_CD
     vcolumn_name := 'RISK_TRANSF_CD';
     vo_column_value := :OLD.RISK_TRANSF_CD;
     vn_column_value := :NEW.RISK_TRANSF_CD;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  if deleting or
     nvl(:NEW.LOT_UNIT_CD,' ') != nvl(:OLD.LOT_UNIT_CD,' ') then                      -- LOT_UNIT_CD
     vcolumn_name := 'LOT_UNIT_CD';
     vo_column_value := :OLD.LOT_UNIT_CD;
     vn_column_value := :NEW.LOT_UNIT_CD;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
  
  --- 20191218 Added audit for delivery terms
  
  if deleting or
     nvl(:NEW.DELIVERY_TERMS,' ') != nvl(:OLD.DELIVERY_TERMS,' ') then                      -- DELIVERY_TERMS
     vcolumn_name := 'DELIVERY_TERMS';
     vo_column_value := :OLD.DELIVERY_TERMS;
     vn_column_value := :NEW.DELIVERY_TERMS;
     SYS1000(vtable_name,
             RTRIM(vkey_value1),
             RTRIM(vkey_value2),
             RTRIM(vkey_value3),
             RTRIM(vkey_value4),
             RTRIM(vkey_value5),
             RTRIM(vkey_value6),
             UPPER(vcolumn_name),
             RTRIM(vo_column_value),
             RTRIM(vn_column_value),
             vaction,
             null);
  end if;
 
 END IF; -- Instering
end CONTRACTS_DF_AUD;
/
