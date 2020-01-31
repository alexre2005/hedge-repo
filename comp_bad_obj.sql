REM 
REM  Recompile all procedures,packages, functions and triggers with invalid status
REM

SET    HEADING      OFF
SET    LINESIZE     80
SET    PAGESIZE     0
-- SET    PAUSE        OFF
SET    TERMOUT      OFF
SET    FEEDBACK     OFF
SET    SERVEROUTPUT ON SIZE 20000
SET    ECHO         OFF

spool temp.sql
select 'alter '||OBJECT_TYPE||' '||object_name||
       decode(object_type,
       		  'PACKAGE BODY',' compile body',
              'PACKAGE ',' compile package',
              ' compile'
              ) ||';'
from user_objects
where status='INVALID'
and object_type IN ('PACKAGE','TRIGGER','PROCEDURE','FUNCTION','VIEW')
/
SPOOL OFF
REM host notepad temp.sql
SET    FEEDBACK     ON
SET    HEADING      ON 
SET    TERMOUT      ON
SET    ECHO         ON
SET    pagesize     24
SET    ECHO         ON
@temp.SQL

