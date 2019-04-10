grant insert on Car to project with grant option;

select * from user_sys_privs;

revoke create session from project;

drop table ZRSPROJRENT;
drop table ZRSPROJcustomer;
drop table ZRSPROJstaff;
drop table ZRSPROJcar;
drop table ZRSPROJBRANCH;
drop table ZRSPROJMaintenance; 

create table ZRSPROJBranch (
branchNo varchar2(13) not null,
branchName varchar2(20) not null,
province varchar2(40) not null,
address varchar2(40) not null,
constraint pk_Branch_branchNo primary key (branchNo)
);

create table ZRSPROJCustomer (
customerNo varchar2(13) not null,
fname varchar2(40) not null,
lname varchar2(40) not null,
dlicense varchar2(5) not null check (dlicense = 'True' or dlicense = 'False'),
idcardpassportno varchar2(40) not null,
email varchar2(40) not null,
phone number(10),
paymentMethod varchar2(10) not null check(paymentMethod='Cash' OR paymentMethod='Debit Card' OR paymentMethod='Credit Card' ),
bdate date,
password varchar2(40) not null,
constraint pk_Customer_customerNo primary key (customerNo)
);

create table ZRSPROJMaintenance (
maintNo varchar2(13) not null,
maintDate date not null,
maintPrice number(5) not null,
maintType varchar2(40) check (maintType = 'Wheel' OR maintType = 'Engine' OR 
        maintType = 'Break' OR maintType = 'Battery' OR maintType = 'Liquid' OR maintType = 'Others'),
maintDetail varchar2(100) not null,
constraint pk_Maintenance_maintNo primary key (maintNo)
);

create table ZRSPROJStaff (
StaffNo number(13) not null,
Fname varchar2(40) not null,
Lname varchar2(40) not null,
Position varchar2(20) not null,
Salary decimal(10,2) not null,
branchNo varchar2(13) not null,
constraint pk_Staff_StaffNo primary key (StaffNo),
constraint fk_Branch_branchNo foreign key (branchNo) references ZRSPROJBranch(branchNo)
);


create table ZRSPROJCar (
CarNo varchar2(13) not null,
Brand varchar2(10) not null,
CarSize varchar2(3) not null check (CarSize = 'S' OR CarSize = 'M' OR CarSize = 'L' ),
Lugguage number(1) not null check (Lugguage = 1 OR Lugguage = 2 OR Lugguage = 3 OR Lugguage = 4 ),
Price decimal(10,2) not null,
Seat number(2)not null check (Seat = 2 OR Seat = 5 OR Seat = 7 ),
CarType varchar2(40)not null check (CarType = 'Saloon' OR CarType = 'Pickup'  OR CarType = 'SUV' ),
--Fuel varchar2(10)not null,
--Engine decimal(1,2)not null,
Engine varchar2(5)not null check (Engine = 'Diesel' OR Engine = 'Benzine'),
Transmission varchar2(10)not null check (Transmission = 'Manual' OR Transmission = 'Auto'),
branchNo varchar2(13) not null,
maintNo varchar2(13),
constraint pk_Car_CarNo primary key (CarNo),
constraint fk_Car_Branchno foreign key (branchNo) references ZRSProJBranch(Branchno),
constraint fk_Car_MaintNo foreign key (maintNo) references ZRSProJMaintenance(maintNo)
);

create table ZRSPROJRent (
rentNo varchar2(13) not null,
pickDate date not null,
returnDate date not null,
pickBranch varchar2(40) not null,
returnBranch varchar2(40) not null,
price number(5) not null,
customerNo varchar2(13) not null,
CarNo varchar2(13) not null,
StaffNo number(13) not null,
constraint pk_Rent_rentNo primary key (rentNo),
constraint fk_Rent_customerNo foreign key (customerNo) references ZRSProJCustomer(customerNo),
constraint fk_Rent_CarNo foreign key (CarNo) references ZRSPROJCar(CarNo),
constraint fk_Rent_StaffNo foreign key (StaffNo) references ZRSPROJStaff(StaffNo)
);


