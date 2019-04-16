--create+grant user owner
create user RSowner
IDENTIFIED by lovesql;
grant CREATE session to RSowner;
--create+grant user officer
create user RSofficer
IDENTIFIED by lovesql;
grant CREATE session to RSofficer;
--create+grant user manager
create user RSmanager
IDENTIFIED by lovesql;
grant CREATE session to RSmanager;
--create+grant user staff
create user RSstaff
IDENTIFIED by lovesql;
grant CREATE session to RSstaff;
--create+grant user customer
create user RScustomer
IDENTIFIED by lovesql;
grant CREATE session to RScustomer;

SELECT    *    FROM  user_sys_privs ;

REVOKE create session from customer;