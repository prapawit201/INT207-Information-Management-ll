grant insert on Car to project with grant option;

select * from user_sys_privs;

revoke create session from project;

drop table RSRENT;
drop table RScustomer;
drop table RSstaff;
drop table RScar;
drop table RSBRANCH;
drop table RSMaintenance;

create table ZRSPROJRENT;
create table ZRSPROJcustomer;
create table ZRSPROJstaff;
create table ZRSPROJcar;
create table ZRSPROJBRANCH;
create table ZRSPROJMaintenance;

drop table ZRSPROJRENT;
drop table ZRSPROJcustomer;
drop table ZRSPROJstaff;
drop table ZRSPROJcar;
drop table ZRSPROJBRANCH;
drop table ZRSPROJMaintenance;

create table RSBranch (
Branchno varchar2(13) not null,
branchName varchar2(20) not null,
province varchar2(40) not null,
address varchar2(40) not null,
constraint pk_Branch_branchNo primary key (branchNo)
);

create table RSCustomer (
customerNo varchar2(13) not null,
fname varchar2(40) not null,
lname varchar2(40) not null,
--dlicense varchar2(5) not null check (dlicense = 'True' or dlicense = 'False'),
dlicense varchar2(5) not null check (dlicense IN('yes','no')),
idcardpassportno varchar2(40) not null,
email varchar2(100) not null,
phone varchar2(20),
paymentMethod varchar2(10) check( paymentMethod IN('Debit','Credit','Cash')) ,
--not null check(paymentMethod='Cash' OR paymentMethod='Debit' OR paymentMethod='Credit' )
bdate varchar2(20),
password varchar2(40) not null,
constraint pk_Customer_customerNo primary key (customerNo)
);

create table RSMaintenance (
maintNo varchar2(13) not null,
maintDate date not null,
maintPrice number(5) not null,
maintType varchar2(40) check (maintType = 'Wheel' OR maintType = 'Engine' OR
        maintType = 'Break' OR maintType = 'Battery' OR maintType = 'Liquid' OR maintType = 'Others'),
maintDetail varchar2(100) not null,
constraint pk_Maintenance_maintNo primary key (maintNo)
);

create table RSStaff (
StaffNo varchar2(13) not null,
Fname varchar2(40) not null,
Lname varchar2(40) not null,
Position varchar2(20) not null,
Salary varchar2(10) not null,
Branchno varchar2(13) not null,
constraint pk_Staff_StaffNo primary key (StaffNo),
constraint fk_Branch_branchNo foreign key (branchNo) references RSBranch(branchNo)
);


create table RSCar (
CarNo varchar2(13) not null,
Brand varchar2(50) not null,
CarSize varchar2(3) not null check (CarSize = 'S' OR CarSize = 'M' OR CarSize = 'L' ),
Lugguage number(1) not null check (Lugguage = 1 OR Lugguage = 2 OR Lugguage = 3 OR Lugguage = 4 ),
Price decimal(10,2) not null,
Seat number(2)not null check (Seat = 2 OR Seat = 5 OR Seat = 7 ),
CarType varchar2(40)not null check (CarType = 'Saloon' OR CarType = 'Pickup'  OR CarType = 'SUV' ),
--Fuel varchar2(10)not null,
--Engine decimal(1,2)not null,
Engine varchar2(10)not null check (Engine = 'Diesel' OR Engine = 'Benzine'),
Transmission varchar2(10)not null check (Transmission = 'Manual' OR Transmission = 'Auto'),
branchNo varchar2(13) not null,
maintNo varchar2(13),
constraint pk_Car_CarNo primary key (CarNo),
constraint fk_Car_Branchno foreign key (branchNo) references RSBranch(Branchno),
constraint fk_Car_MaintNo foreign key (maintNo) references RSMaintenance(maintNo)
);

create table RSRent (
rentNo varchar2(13) not null,
pickDate date not null,
returnDate date not null,
pickBranch varchar2(40) not null,
returnBranch varchar2(40) not null,
price number(5) not null,
customerNo varchar2(13) not null,
CarNo varchar2(13) not null,
StaffNo varchar2(13) not null,
constraint pk_Rent_rentNo primary key (rentNo),
constraint fk_Rent_customerNo foreign key (customerNo) references RSCustomer(customerNo),
constraint fk_Rent_CarNo foreign key (CarNo) references RSCar(CarNo),
constraint fk_Rent_StaffNo foreign key (StaffNo) references RSStaff(StaffNo)
);
