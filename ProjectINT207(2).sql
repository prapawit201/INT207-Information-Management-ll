select * from user_sys_privs;

drop table Staff;
drop table car;
drop table branch;
drop table customer;
drop table RENT;
drop table MAINTENANCE;

create table Branch (
branchNo varchar2(13) not null,
province varchar2(40) not null,
address varchar2(40) not null,
constraint pk_Branch_branchNo primary key (branchNo)
);

create table Customer (
customerNo varchar2(13) not null,
fname varchar2(40) not null,
lname varchar2(40) not null,
--dlicense boolean not null, check‡‡∑π
idcardpassportno varchar2(40) not null,
email varchar2(40) not null,
phone number(10),
bdate date,
password varchar2(40),
constraint pk_Customer_customerNo primary key (customerNo)
);

create table Maintenance (
maintNo varchar2(13) not null,
maintDate date not null,
maintPrice number(5) not null,
maintType varchar2(40) not null,
maintDetail varchar2(100) not null,
constraint pk_Maintenance_maintNo primary key (maintNo)
);

create table Staff (
StaffNo number(13) not null,
Fname varchar2(40) not null,
Lname varchar2(40) not null,
Position varchar2(20) not null,
Salary decimal(10,2) not null,
branchNo varchar2(13) not null,
constraint pk_Staff_StaffNo primary key (StaffNo),
constraint fk_Branch_branchNo foreign key (branchNo) references Branch(branchNo)
);


create table Car (
CarNo varchar2(13) not null,
Brand varchar2(10) not null,
CarSize varchar2(3) not null check (CarSize = 'S,M,L,XL'),
Lugguage number(10) not null,
Salary decimal(10,2) not null,
Seat number(2)not null,
CarType varchar2(40)not null,
Fuel varchar2(10)not null,
Engine decimal(1,2)not null,
Transmission varchar2(2)not null,
branchNo varchar2(13) not null,
maintNo varchar2(13) not null,
constraint pk_Car_CarNo primary key (CarNo),
constraint fk_Car_Branchno foreign key (branchNo) references Branch(Branchno),
constraint fk_Car_MaintNo foreign key (maintNo) references Maintenance(maintNo)
);

create table Rent (
rentNo varchar2(13) not null,
pickDate date not null,
returnDate date not null,
pickBranch varchar2(40) not null,
returnBranch varchar2(40) not null,
price number(5) not null,
delayPenalty varchar2(40),
constraint pk_Rent_rentNo primary key (rentNo),
constraint fk_Rent_customerNo foreign key (customerNo) references Customer(customerNo)
);


