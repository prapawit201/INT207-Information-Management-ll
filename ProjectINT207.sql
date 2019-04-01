select * from user_sys_privs;

create table Staff (
StaffNo number(13) not null,
Fname varchar2(40) not null,
Lname varchar2(40) not null,
Position varchar2(20) not null,
Salary decimal(10,2) not null,
constraint pk_users_StaffNo primary key (StaffNo)
);
