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

create table Branch (
branchNo varchar2(13) not null,
province varchar2(40) not null,
address varchar2(40) not null,
);

create table Customer (
customerNo varchar2(13) not null,
fname varchar2(40) not null,
lname varchar2(40) not null,
dlicense boolean not null,
idcard/passportno varchar2(40) not null,
email varchar2(40) not null,
phone number(10),
bdate date,
password varchar2(40)
);

create table Rent (
rentNo varchar2(13) not null,
pickDate date not null,
returnDate date not null,
pickBranch varchar2(40) not null,
returnBranch varchar2(40) not null,
price number(5) not null,
delayPenalty varchar2(40)
);

create table Maintenance (
maintNo varchar2(13) not null,
maintDate date not null,
maintPrice number(5) not null,
maintType varchar2(40) not null,
maintDetail varchar2(100) not null

);