-- practice from page 102
1. CREATE OR REPLACE FUNCTION ISNUMBER(EID IN VARCHAR2)
  RETURN VARCHAR2 IS
  Numbervalue NUMBER;
BEGIN
  Numbervalue := TO_NUMBER(EID);
  RETURN 'YES' ;
EXCEPTION
  WHEN OTHERS THEN
  RETURN 'NO' ;
END ;
/
-- practice from page 107
1. CREATE OR REPLACE TRIGGER HELLO_WORLD6
AFTER  DELETE
ON STUDENTS
FOR EACH ROW
DECLARE
BEGIN
DBMS_OUTPUT.PUT_LINE('Hello World6');
END ;
/
