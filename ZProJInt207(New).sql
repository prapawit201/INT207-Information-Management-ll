grant insert on Car to project with grant option;

select * from user_sys_privs;

revoke create session from project;

drop table Staff;
drop table car;
drop table branch;
drop table customer;
drop table RENT;
drop table ZPROJMaintenance; 

create table ZProJBranch (
branchNo varchar2(13) not null,
province varchar2(40) not null,
address varchar2(40) not null,
constraint pk_Branch_branchNo primary key (branchNo)
);

create table ZProJCustomer (
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

create table ZProJMaintenance (
maintNo varchar2(13) not null,
maintDate date not null,
maintPrice number(5) not null,
maintType varchar2(40) check (maintType = 'Wheel' OR maintType = 'Engine' OR 
        maintType = 'Break' OR maintType = 'Battery' OR maintType = 'Liquid' OR maintType = 'Others'),
maintDetail varchar2(100) not null,
constraint pk_Maintenance_maintNo primary key (maintNo)
);

create table ZProJStaff (
StaffNo number(13) not null,
Fname varchar2(40) not null,
Lname varchar2(40) not null,
Position varchar2(20) not null,
Salary decimal(10,2) not null,
branchNo varchar2(13) not null,
constraint pk_Staff_StaffNo primary key (StaffNo),
constraint fk_Branch_branchNo foreign key (branchNo) references ZProJBranch(branchNo)
);


create table ZPROJCar (
CarNo varchar2(13) not null,
Brand varchar2(10) not null,
CarSize varchar2(3) not null check (CarSize = 'S' OR CarSize = 'M' OR CarSize = 'L' OR CarSize = 'XL' ),
Lugguage number(1) not null check (Lugguage = 1 OR Lugguage = 2 OR Lugguage = 3 OR Lugguage = 4 ),
Salary decimal(10,2) not null,
Seat number(2)not null check (Seat = 2 OR Seat = 5 OR Seat = 7 OR Seat = 15 ),
CarType varchar2(40)not null check (CarType = 'Saloon' OR CarType = 'Pickup' OR CarType = 'Van' OR CarType = 'SUV' ),
Fuel varchar2(10)not null,
--Engine decimal(1,2)not null,
Engine varchar2(5)not null check (Engine = 'Diesel' OR Engine = 'Benzine'),
Transmission varchar2(10)not null check (Transmission = 'Manual' OR Transmission = 'Auto'),
branchNo varchar2(13) not null,
maintNo varchar2(13) not null,
constraint pk_Car_CarNo primary key (CarNo),
constraint fk_Car_Branchno foreign key (branchNo) references ZProJBranch(Branchno),
constraint fk_Car_MaintNo foreign key (maintNo) references ZProJMaintenance(maintNo)
);

create table ZProJRent (
rentNo varchar2(13) not null,
pickDate date not null,
returnDate date not null,
pickBranch varchar2(40) not null,
returnBranch varchar2(40) not null,
price number(5) not null,
delayPenalty varchar2(40),
customerNo varchar2(13) not null,
constraint pk_Rent_rentNo primary key (rentNo),
constraint fk_Rent_customerNo foreign key (customerNo) references ZProJCustomer(customerNo)
);

