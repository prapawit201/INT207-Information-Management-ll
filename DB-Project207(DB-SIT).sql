CREATE USER  project
IDENTIFIED BY lovesql ;

grant create session to project;
grant create table to project with admin option;

