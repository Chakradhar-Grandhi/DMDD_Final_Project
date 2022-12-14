-- 1. 

create or replace trigger CHANGE_STATE_NAME
BEFORE INSERT OR UPDATE OR DELETE ON STATE 
FOR EACH ROW 
WHEN (NEW.STATE_ID>0)
BEGIN 
DBMS_OUTPUT.PUT_LINE('OLD STATE NAME: ' || :OLD.STATE_NAME); 
DBMS_OUTPUT.PUT_LINE(' NEW STATE NAME: ' || :NEW.STATE_NAME); 
END ;

--2. 
create or replace trigger CHANGE_CONSTITUENCY_NAME
BEFORE INSERT OR UPDATE OR DELETE ON CONSTITUENCY 
FOR EACH ROW 
WHEN (NEW.CONSTITUENCY_ID>0)
BEGIN 
DBMS_OUTPUT.PUT_LINE('OLD CONSTITUENCY NAME: ' || :OLD.CONSTITUENCY_NAME); 
DBMS_OUTPUT.PUT_LINE('NEW CONSTITUENCY NAME: ' || :NEW.CONSTITUENCY_NAME); 
END ;


--3. 
create or replace trigger EDIT_PEOPLE_DETAILS
BEFORE INSERT OR UPDATE OR DELETE ON PEOPLE 
FOR EACH ROW 
WHEN (NEW.U_ID>0)
BEGIN 
DBMS_OUTPUT.PUT_LINE('OLD FIRST NAME: ' || :OLD.FIRST_NAME); 
DBMS_OUTPUT.PUT_LINE('NEW LAST NAME: ' || :NEW.FIRST_NAME); 
DBMS_OUTPUT.PUT_LINE('OLD AGE: ' || :OLD.AGE); 
DBMS_OUTPUT.PUT_LINE('NEW AGE: ' || :NEW.AGE);
DBMS_OUTPUT.PUT_LINE('OLD EMAIL ID: ' || :OLD.EMAIL); 
DBMS_OUTPUT.PUT_LINE('NEW EMAIL ID: ' || :NEW.EMAIL);
END ; 