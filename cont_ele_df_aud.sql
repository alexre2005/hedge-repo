CREATE OR REPLACE TRIGGER cont_ele_df_aud
  AFTER UPDATE OR DELETE OR INSERT
  ON cont_ele_df
  FOR EACH ROW
/* Auditing cont_ele_df table on the following columns
ele_unit_cd
content_typical
disposition_cd
cont_price
provisional_perc
metal_ded_factor
metal_ded_type
metal_ded_unit
metal_ded_w_tp
dgrade_unit
price_code
price_forward
qp_extension
qpe_type
set_assay_ind
ele_type
parent_ele_cd
pybl_price_perc
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
vo_column_value varchar2(50);
vn_column_value varchar2(50);
vaction         varchar2(1);
BEGIN
  vtable_name := 'CONT_ELE_DF';
  vkey_value1 := :OLD.CONTRACT_ID;
  vkey_value2 := 'ELEMENT';
  -- vkey_value2 := :OLD.CUST_CD;  must be ELEMENT CODE does not exist in CONTRACT_DF
  vkey_value3 := :OLD.ELEMENT_CD;
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
   vcolumn_name := NULL;
   vaction :='I';
   vkey_value1 := :NEW.CONTRACT_ID;
   vkey_value3 := :NEW.ELEMENT_CD;
   
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
  DBMS_OUTPUT.PUT_LINE('After vaction') ;
  if deleting or
     nvl(:NEW.ele_unit_cd,' ') != nvl(:OLD.ele_unit_cd,' ') then   -- ele_unit_cd
     vcolumn_name := 'ele_unit_cd';
     vo_column_value := :OLD.ele_unit_cd;
     vn_column_value := :NEW.ele_unit_cd;
     DBMS_OUTPUT.PUT_LINE('Before sys1000 ele_unit_cd') ;
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
     nvl(:NEW.content_typical,0) != nvl(:OLD.content_typical,0) then -- content_typical
     vcolumn_name := 'content_typical';
     vo_column_value := :OLD.content_typical;
     vn_column_value := :NEW.content_typical;
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
     nvl(:NEW.disposition_cd,' ') != nvl(:OLD.disposition_cd,' ') then -- disposition_cd
     vcolumn_name := 'disposition_cd';
     vo_column_value := :OLD.disposition_cd;
     vn_column_value := :NEW.disposition_cd;
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
     nvl(:NEW.cont_price,0) != nvl(:OLD.cont_price,0) then			-- cont_price
     vcolumn_name := 'cont_price';
     vo_column_value := :OLD.cont_price;
     vn_column_value := :NEW.cont_price;
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
     nvl(:NEW.provisional_perc,0) != nvl(:OLD.provisional_perc,0) then	-- provisional_perc
     vcolumn_name := 'provisional_perc';
     vo_column_value := :OLD.provisional_perc;
     vn_column_value := :NEW.provisional_perc;
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
     nvl(:NEW.metal_ded_factor,0) != nvl(:OLD.metal_ded_factor,0) then			 -- metal_ded_factor
     vcolumn_name := 'metal_ded_factor';
     vo_column_value := :OLD.metal_ded_factor;
     vn_column_value := :NEW.metal_ded_factor;
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
     nvl(:NEW.metal_ded_type,' ') != nvl(:OLD.metal_ded_type,' ') then			 -- metal_ded_type
     vcolumn_name := 'metal_ded_type';
     vo_column_value := :OLD.metal_ded_type;
     vn_column_value := :NEW.metal_ded_type;
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
     nvl(:NEW.metal_ded_unit,' ') != nvl(:OLD.metal_ded_unit,' ') then  -- metal_ded_unit
     vcolumn_name := 'metal_ded_unit';
     vo_column_value := :OLD.metal_ded_unit;
     vn_column_value := :NEW.metal_ded_unit;
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
     nvl(:NEW.metal_ded_w_tp,' ') != nvl(:OLD.metal_ded_w_tp,' ') then		-- metal_ded_w_tp
     vcolumn_name := 'metal_ded_w_tp';
     vo_column_value := :OLD.metal_ded_w_tp;
     vn_column_value := :NEW.metal_ded_w_tp;
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
     nvl(:NEW.dgrade_unit,' ') != nvl(:OLD.dgrade_unit,' ') then		-- dgrade_unit
     vcolumn_name := 'dgrade_unit';
     vo_column_value := :OLD.dgrade_unit;
     vn_column_value := :NEW.dgrade_unit;
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
     nvl(:NEW.price_code,' ') != nvl(:OLD.price_code,' ') then		--price_code 
     vcolumn_name := 'price_code';
     vo_column_value := :OLD.price_code;
     vn_column_value := :NEW.price_code;
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
     nvl(:NEW.price_forward,' ') != nvl(:OLD.price_forward,' ') then			 -- price_forward
     vcolumn_name := 'price_forward';
     vo_column_value := :OLD.price_forward;
     vn_column_value := :NEW.price_forward;
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
     nvl(:NEW.qp_extension,0) != nvl(:OLD.qp_extension,0) then        -- qp_extension
     vcolumn_name := 'qp_extension';
     vo_column_value := :OLD.qp_extension;
     vn_column_value := :NEW.qp_extension;
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
     nvl(:NEW.qpe_type,' ') != nvl(:OLD.qpe_type,' ') then			   -- qpe_type
     vcolumn_name := 'qpe_type';
     vo_column_value := :OLD.qpe_type;
     vn_column_value := :NEW.qpe_type;
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
     nvl(:NEW.set_assay_ind,' ') != nvl(:OLD.set_assay_ind,' ') then				-- set_assay_ind
     vcolumn_name := 'set_assay_ind';
     vo_column_value := :OLD.set_assay_ind;
     vn_column_value := :NEW.set_assay_ind;
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
     nvl(:NEW.ele_type,' ') != nvl(:OLD.ele_type,' ') then			-- ele_type
     vcolumn_name := 'ele_type';
     vo_column_value := :OLD.ele_type;
     vn_column_value := :NEW.ele_type;
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
     nvl(:NEW.parent_ele_cd,' ') != nvl(:OLD.parent_ele_cd,' ') then				  -- parent_ele_cd
     vcolumn_name := 'parent_ele_cd';
     vo_column_value := :OLD.parent_ele_cd;
     vn_column_value := :NEW.parent_ele_cd;
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
  
  -- 20191218 Added audit for PYBL_PRICE_PERC
   
  if deleting or
     nvl(:NEW.pybl_price_perc,0) != nvl(:OLD.pybl_price_perc,0) then				  -- pybl_price_perc
     vcolumn_name := 'pybl_price_perc';
     vo_column_value := :OLD.pybl_price_perc;
     vn_column_value := :NEW.pybl_price_perc;
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
 
 END IF; -- Instering
end CONT_ELE_DF_AUD;
/
