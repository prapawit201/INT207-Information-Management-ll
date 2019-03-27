select * from user_sys_privs;

create table Staff (
StaffNo number(13) not null,
Fname varchar2(40) not null,
Lname varchar2(40) not null,
Position varchar2(20) not null,
Salary decimal(10,2) not null,
constraint pk_users_StaffNo primary key (StaffNo)
);

create table Car (
CarNo varchar2(13) not null,
Brand varchar2(10) not null,
CarSize varchar2(3) not null check (Size = 'S' OR Size = 'M' OR Size = 'L' OR Size = 'XL'),
Lugguage number(10) not null,
Salary decimal(10,2) not null,
Seat number(2)not null,
CarType varchar2(40)not null,
Fuel varchar2(10)not null,
Engine decimal(1,2)not null,
Transmission varchar2(2)not null,
constraint pk_Car_CarNo primary key (CarNo)
);