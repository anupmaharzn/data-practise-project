--trigger

create table spending_change_log(
     id number generated always as identity (start with 1 increment by 1) primary key,
     table_name varchar2(200),
     action varchar2(100),
     change_timestamp timestamp,
     user_id number
);
/
alter table spending_change_log modify (user_id varchar2(20));
/

CREATE OR REPLACE TRIGGER log_spending_changes
BEFORE INSERT OR UPDATE OR DELETE ON medicare_part_d_spending
FOR EACH ROW
DECLARE
   action VARCHAR2(20);
BEGIN
   IF INSERTING THEN
      action := 'insert';
   ELSIF UPDATING THEN
      action := 'update';
   ELSIF DELETING THEN
      action := 'delete';
   END IF;
   
   INSERT INTO spending_change_log (table_name, action, change_timestamp, user_id)
   VALUES ('medicare_part_d_spending', action, systimestamp, USER);
END;


