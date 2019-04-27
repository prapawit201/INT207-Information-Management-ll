--SQL statements ในการสร้างผู้ใช้งาน ตาราง วิว (ถ้ามี) อินเด็กซ์
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

SELECT * FROM  user_sys_privs ;


-- clean data
drop table RSRENT CASCADE CONSTRAINTS;
drop table RScustomer CASCADE CONSTRAINTS;
drop table RSstaff CASCADE CONSTRAINTS;
drop table RScar CASCADE CONSTRAINTS;
drop table RSBRANCH CASCADE CONSTRAINTS;
drop table RSMaintenance CASCADE CONSTRAINTS;

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
maintNo varchar2(13)not null,
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

-- VIEW for Staff & Customer
DROP VIEW bkk_m_b   ;
DROP VIEW bkk_m_s   ;
DROP VIEW bkk_m_c   ;
DROP VIEW bkk_r   ;
DROP VIEW bkk_m   ;
DROP VIEW bkk_cu   ;

DROP VIEW pkt_m_s   ;
DROP VIEW pkt_m_b   ;
DROP VIEW pkt_m_c   ;
DROP VIEW pkt_r   ;
DROP VIEW pkt_m   ;
DROP VIEW pkt_cu   ;

DROP VIEW cnx_m_s   ;
DROP VIEW cnx_m_b   ;
DROP VIEW cnx_m_c   ;
DROP VIEW cnx_r   ;
DROP VIEW cnx_m   ;
DROP VIEW cnx_cu   ;

DROP VIEW kbi_m_s   ;
DROP VIEW kbi_m_b   ;
DROP VIEW kbi_m_c   ;
DROP VIEW kbi_r   ;
DROP VIEW kbi_m   ;
DROP VIEW kbi_cu   ;

DROP VIEW ryg_m_s   ;
DROP VIEW ryg_m_b   ;
DROP VIEW ryg_m_c   ;
DROP VIEW ryg_r   ;
DROP VIEW ryg_m   ;
DROP VIEW ryg_cu   ;

DROP VIEW ska_m_s   ;
DROP VIEW ska_m_b   ;
DROP VIEW ska_m_c   ;
DROP VIEW ska_r   ;
DROP VIEW ska_m   ;
DROP VIEW ska_cu   ;

DROP VIEW cri_m_s   ;
DROP VIEW cri_m_b   ;
DROP VIEW cri_m_c   ;
DROP VIEW cri_r   ;
DROP VIEW cri_m   ;
DROP VIEW cri_cu   ;

DROP VIEW plk_m_s   ;
DROP VIEW plk_m_b   ;
DROP VIEW plk_m_c   ;
DROP VIEW plk_r   ;
DROP VIEW plk_m   ;
DROP VIEW plk_cu   ;

DROP VIEW udn_m_s   ;
DROP VIEW udn_m_b   ;
DROP VIEW udn_m_c   ;
DROP VIEW udn_r   ;
DROP VIEW udn_m   ;
DROP VIEW udn_cu   ;

DROP VIEW kkn_m_s   ;
DROP VIEW kkn_m_b   ;
DROP VIEW kkn_m_c   ;
DROP VIEW kkn_r   ;
DROP VIEW kkn_m   ;
DROP VIEW kkn_cu   ;

DROP VIEW npm_m_s   ;
DROP VIEW npm_m_b   ;
DROP VIEW npm_m_c   ;
DROP VIEW npm_r   ;
DROP VIEW npm_m   ;
DROP VIEW npm_cu   ;

DROP VIEW snk_m_s   ;
DROP VIEW snk_m_b   ;
DROP VIEW snk_m_c   ;
DROP VIEW snk_r   ;
DROP VIEW snk_m   ;
DROP VIEW snk_cu   ;

DROP VIEW ubn_m_s   ;
DROP VIEW ubn_m_b   ;
DROP VIEW ubn_m_c   ;
DROP VIEW ubn_r   ;
DROP VIEW ubn_m   ;
DROP VIEW ubn_cu   ;

DROP VIEW sni_m_s   ;
DROP VIEW sni_m_b   ;
DROP VIEW sni_m_c   ;
DROP VIEW sni_r   ;
DROP VIEW sni_m   ;
DROP VIEW sni_cu   ;

DROP VIEW nst_m_s   ;
DROP VIEW nst_m_b   ;
DROP VIEW nst_m_c   ;
DROP VIEW nst_r   ;
DROP VIEW nst_m   ;
DROP VIEW nst_cu   ;

DROP VIEW trg_m_s   ;
DROP VIEW trg_m_b   ;
DROP VIEW trg_m_c   ;
DROP VIEW trg_r   ;
DROP VIEW trg_m   ;
DROP VIEW trg_cu   ;

DROP VIEW nwt_m_s   ;
DROP VIEW nwt_m_b   ;
DROP VIEW nwt_m_c   ;
DROP VIEW nwt_r   ;
DROP VIEW nwt_m   ;
DROP VIEW nwt_cu   ;

DROP VIEW nan_m_s   ;
DROP VIEW nan_m_b   ;
DROP VIEW nan_m_c   ;
DROP VIEW nan_r   ;
DROP VIEW nan_m   ;
DROP VIEW nan_cu   ;

DROP VIEW ret_m_s   ;
DROP VIEW ret_m_b   ;
DROP VIEW ret_m_c   ;
DROP VIEW ret_r   ;
DROP VIEW ret_m   ;
DROP VIEW ret_cu   ;

DROP VIEW lei_m_s   ;
DROP VIEW lei_m_b   ;
DROP VIEW lei_m_c   ;
DROP VIEW lei_r   ;
DROP VIEW lei_m   ;
DROP VIEW lei_cu   ;

DROP VIEW brm_m_s   ;
DROP VIEW brm_m_b   ;
DROP VIEW brm_m_c   ;
DROP VIEW brm_r   ;
DROP VIEW brm_m   ;
DROP VIEW brm_cu   ;

DROP VIEW rng_m_s   ;
DROP VIEW rng_m_b   ;
DROP VIEW rng_m_c   ;
DROP VIEW rng_r   ;
DROP VIEW rng_m   ;
DROP VIEW rng_cu   ;

DROP VIEW yla_m_s   ;
DROP VIEW yla_m_b   ;
DROP VIEW yla_m_c   ;
DROP VIEW yla_r   ;
DROP VIEW yla_m   ;
DROP VIEW yla_cu   ;

CREATE or replace VIEW bkk_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-100' ;
CREATE or replace VIEW bkk_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-100' ;
CREATE or replace VIEW bkk_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-100' ;
CREATE or replace VIEW bkk_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-BKK' ;
CREATE or replace VIEW bkk_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-100' ;
CREATE or replace VIEW bkk_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-BKK' ;

CREATE or replace VIEW pkt_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-101' ;
CREATE or replace VIEW pkt_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-101' ;
CREATE or replace VIEW pkt_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-101' ;
CREATE or replace VIEW pkt_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-PKT' ;
CREATE or replace VIEW pkt_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-101' ;
CREATE or replace VIEW pkt_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-PKT' ;

CREATE or replace VIEW cnx_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-102' ;
CREATE or replace VIEW cnx_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-102' ;
CREATE or replace VIEW cnx_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-102' ;
CREATE or replace VIEW cnx_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-CNX' ;
CREATE or replace VIEW cnx_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-102' ;
CREATE or replace VIEW cnx_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-CNX' ;

CREATE or replace VIEW kbi_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-103' ;
CREATE or replace VIEW kbi_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-103' ;
CREATE or replace VIEW kbi_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-103' ;
CREATE or replace VIEW kbi_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-KBI' ;
CREATE or replace VIEW kbi_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-103' ;
CREATE or replace VIEW kbi_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-KBI' ;

CREATE or replace VIEW ryg_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-104' ;
CREATE or replace VIEW ryg_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-104' ;
CREATE or replace VIEW ryg_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-104' ;
CREATE or replace VIEW ryg_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-RYG' ;
CREATE or replace VIEW ryg_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-104' ;
CREATE or replace VIEW ryg_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-RYG' ;

CREATE or replace VIEW ska_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-105' ;
CREATE or replace VIEW ska_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-105' ;
CREATE or replace VIEW ska_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-105' ;
CREATE or replace VIEW ska_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-SKA' ;
CREATE or replace VIEW ska_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-105' ;
CREATE or replace VIEW ska_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-SKA' ;

CREATE or replace VIEW cri_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-106' ;
CREATE or replace VIEW cri_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-106' ;
CREATE or replace VIEW cri_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-106' ;
CREATE or replace VIEW cri_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-CRI' ;
CREATE or replace VIEW cri_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-106' ;
CREATE or replace VIEW cri_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-CRI' ;

CREATE or replace VIEW plk_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-107' ;
CREATE or replace VIEW plk_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-107' ;
CREATE or replace VIEW plk_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-107' ;
CREATE or replace VIEW plk_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-PLK' ;
CREATE or replace VIEW plk_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-107' ;
CREATE or replace VIEW plk_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-PLK' ;

CREATE or replace VIEW udn_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-108' ;
CREATE or replace VIEW udn_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-108' ;
CREATE or replace VIEW udn_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-108' ;
CREATE or replace VIEW udn_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-UDN' ;
CREATE or replace VIEW udn_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-108' ;
CREATE or replace VIEW udn_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-UDN' ;

CREATE or replace VIEW kkn_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-109' ;
CREATE or replace VIEW kkn_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-109' ;
CREATE or replace VIEW kkn_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-109' ;
CREATE or replace VIEW kkn_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-KKN' ;
CREATE or replace VIEW kkn_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-109' ;
CREATE or replace VIEW kkn_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-KKN' ;

CREATE or replace VIEW npm_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-110' ;
CREATE or replace VIEW npm_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-110' ;
CREATE or replace VIEW npm_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-110' ;
CREATE or replace VIEW npm_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-NPM' ;
CREATE or replace VIEW npm_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-110' ;
CREATE or replace VIEW npm_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-NPM' ;

CREATE or replace VIEW snk_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-111' ;
CREATE or replace VIEW snk_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-111' ;
CREATE or replace VIEW snk_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-111' ;
CREATE or replace VIEW snk_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-SNK' ;
CREATE or replace VIEW snk_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-111' ;
CREATE or replace VIEW snk_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-SNK' ;

CREATE or replace VIEW ubn_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-112' ;
CREATE or replace VIEW ubn_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-112' ;
CREATE or replace VIEW ubn_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-112' ;
CREATE or replace VIEW ubn_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-UBN' ;
CREATE or replace VIEW ubn_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-112' ;
CREATE or replace VIEW ubn_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-UBN' ;

CREATE or replace VIEW sni_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-113' ;
CREATE or replace VIEW sni_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-113' ;
CREATE or replace VIEW sni_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-113' ;
CREATE or replace VIEW sni_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-SNI' ;
CREATE or replace VIEW sni_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-113' ;
CREATE or replace VIEW sni_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-SNI' ;

CREATE or replace VIEW nst_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-114' ;
CREATE or replace VIEW nst_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-114' ;
CREATE or replace VIEW nst_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-114' ;
CREATE or replace VIEW nst_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-NST' ;
CREATE or replace VIEW nst_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-114' ;
CREATE or replace VIEW nst_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-NST' ;

CREATE or replace VIEW trg_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-115' ;
CREATE or replace VIEW trg_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-115' ;
CREATE or replace VIEW trg_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-115' ;
CREATE or replace VIEW trg_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-TRG' ;
CREATE or replace VIEW trg_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-115' ;
CREATE or replace VIEW trg_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-TRG' ;

CREATE or replace VIEW nwt_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-116' ;
CREATE or replace VIEW nwt_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-116' ;
CREATE or replace VIEW nwt_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-116' ;
CREATE or replace VIEW nwt_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-NWT' ;
CREATE or replace VIEW nwt_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-116' ;
CREATE or replace VIEW nwt_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-NWT' ;

CREATE or replace VIEW nan_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-117' ;
CREATE or replace VIEW nan_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-117' ;
CREATE or replace VIEW nan_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-117' ;
CREATE or replace VIEW nan_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-NAN' ;
CREATE or replace VIEW nan_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-117' ;
CREATE or replace VIEW nan_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-NAN' ;

CREATE or replace VIEW ret_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-118' ;
CREATE or replace VIEW ret_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-118' ;
CREATE or replace VIEW ret_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-118' ;
CREATE or replace VIEW ret_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-RET' ;
CREATE or replace VIEW ret_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-118' ;
CREATE or replace VIEW ret_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-RET' ;

CREATE or replace VIEW lei_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-119' ;
CREATE or replace VIEW lei_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-119' ;
CREATE or replace VIEW lei_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-119' ;
CREATE or replace VIEW lei_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-LEI' ;
CREATE or replace VIEW lei_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-119' ;
CREATE or replace VIEW lei_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-LEI' ;

CREATE or replace VIEW brm_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-120' ;
CREATE or replace VIEW brm_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-120' ;
CREATE or replace VIEW brm_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-120' ;
CREATE or replace VIEW brm_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-BRM' ;
CREATE or replace VIEW brm_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-120' ;
CREATE or replace VIEW brm_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-BRM' ;

CREATE or replace VIEW rng_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-121' ;
CREATE or replace VIEW rng_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-121' ;
CREATE or replace VIEW rng_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-121' ;
CREATE or replace VIEW rng_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-RNG' ;
CREATE or replace VIEW rng_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-121' ;
CREATE or replace VIEW rng_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-RNG' ;

CREATE or replace VIEW yla_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-122' ;
CREATE or replace VIEW yla_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-122' ;
CREATE or replace VIEW yla_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-122' ;
CREATE or replace VIEW yla_r   AS SELECT * FROM RSrent WHERE pickBranch = 'RSPT-YLA' ;
CREATE or replace VIEW yla_m   AS SELECT m.* FROM RSmaintenance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-122' ;
CREATE or replace VIEW yla_cu   AS SELECT cu.customerNo,cu.Fname,cu.Lname,cu.dlicense,cu.idcardpassportno,cu.email,cu.phone,cu.paymentMethod,cu.bdate FROM RScustomer cu join RSrent r on cu.customerNo=r.customerNo WHERE r.pickBranch='RSPT-YLA' ;

--index
drop index RSrent_BM_IDX;
drop index RScar_BM_IDX;
drop index RSbranch_BM_IDX;
drop index RSstaff_BT_IDX;

create bitmap index  RSrent_BM_IDX on rsrent(PICKBRANCH,CARNO,PICKDATE);
create bitmap index RScar_BM_IDX on rscar(CARNO,BRAND,BRANCHNO);
create bitmap index RSbranch_BM_IDX on rsbranch(BRANCHNO,BRANCHNAME);
create index  RSstaff_BT_IDX on rsstaff(salary,branchno);


  --insert in branch table
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-100','RSPT-BKK','Bangkok','9802 Placerat. Avenue');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-101','RSPT-PKT','Phuket','1855 Duis Avenue');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-102','RSPT-CNX','Chiang Mai','4662 Euismod Av.');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-103','RSPT-KBI','Krabi','581-9681 A, Avenue');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-104','RSPT-RYG','Rayong','Ap #636-4094 Aenean Rd.');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-105','RSPT-SKA','Song Kla','P.O. Box 632, 9851 Pede St.');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-106','RSPT-CRI','Chiang Rai','5564 A Street');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-107','RSPT-PLK','Phitsanulok','P.O. Box 592, 7228 Vitae, Street');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-108','RSPT-UDN','Udonthani','P.O. Box 420, 2036 Aliquet Road');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-109','RSPT-KKN','Khon Kaen','Ap #248-2048 Praesent Rd.');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-110','RSPT-NPM','Nakhon Phanom','3336 Scelerisque Avenue');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-111','RSPT-SNK','Sakon Nakhon','1306 Est, Av.');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-112','RSPT-UBN','Ubon Ratchathani','P.O. Box 931, 6972 Lorem Avenue');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-113','RSPT-SNI','Surat Thani','P.O. Box 989, 2678 Vehicula Avenue');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-114','RSPT-NST','Nakhon Si Thammarat','P.O. Box 179, 6495 Facilisis St.');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-115','RSPT-TRG','Trung','5886 Etiam Ave');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-116','RSPT-NWT','Narathiwat','395-5573 Vivamus Rd.');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-117','RSPT-NAN','Nan','2585 Tellus St.');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-118','RSPT-RET','Roi Et','Ap #135-2031 Blandit Road');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-119','RSPT-LEI','Loei','6074 Purus, St.');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-120','RSPT-BRM','Burirum','P.O. Box 246, 2292 Auctor, Road');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-121','RSPT-RNG','Ranong','Ap #172-9883 Consectetuer Rd.');
  INSERT INTO RSBranch(branchNo,branchName,province,address) VALUES ('RSB-122','RSPT-YLA','Yala','Ap #735-6716 Aliquet. Rd.');
  --Rent
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0001','4-Jan-2016','7-Jan-2016','RSPT-CNX','RSPT-BKK',5400,'RSC-1537','RC-1010','RS-231');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0002','4-Jan-2016','9-Jan-2016','RSPT-UDN','RSPT-BKK',11000,'RSC-1446','RC-1005','RS-172');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0003','4-Jan-2016','10-Jan-2016','RSPT-BKK','RSPT-LEI',12000,'RSC-1390','RC-1020','RS-160');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0004','4-Jan-2016','11-Jan-2016','RSPT-BKK','RSPT-PKT',15400,'RSC-1119','RC-1015','RS-137');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0005','5-Jan-2016','7-Jan-2016','RSPT-BKK','RSPT-CNX',3600,'RSC-1346','RC-1028','RS-160');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0006','5-Jan-2016','9-Jan-2016','RSPT-NPM','RSPT-UBN',4800,'RSC-1497','RC-1031','RS-170');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0007','7-Jan-2016','16-Jan-2016','RSPT-BKK','RSPT-TRG',18000,'RSC-1568','RC-1046','RS-229');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0008','23-Jan-2016','28-Jan-2016','RSPT-YLA','RSPT-CRI',6000,'RSC-1215','RC-1042','RS-182');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0009','26-Jan-2016','31-Jan-2016','RSPT-KKN','RSPT-RYG',8000,'RSC-1399','RC-1017','RS-215');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0010','5-Feb-2016','15-Feb-2016','RSPT-NST','RSPT-NAN',16000,'RSC-1026','RC-1024','RS-243');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0011','8-Feb-2016','13-Feb-2016','RSPT-BKK','RSPT-NST',8000,'RSC-1101','RC-1034','RS-160');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0012','12-Feb-2016','14-Feb-2016','RSPT-KKN','RSPT-UDN',3600,'RSC-1468','RC-1044','RS-146');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0013','22-Feb-2016','27-Feb-2016','RSPT-BKK','RSPT-RYG',9000,'RSC-1285','RC-1054','RS-207');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0014','2-Mar-2016','6-Mar-2016','RSPT-PLK','RSPT-CNX',4800,'RSC-1029','RC-1071','RS-213');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0015','4-Mar-2016','8-Mar-2016','RSPT-BRM','RSPT-LEI',8800,'RSC-1183','RC-1065','RS-203');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0016','9-Mar-2016','14-Mar-2016','RSPT-TRG','RSPT-CRI',11000,'RSC-1269','RC-1075','RS-198');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0017','19-Mar-2016','26-Mar-2016','RSPT-SNK','RSPT-UDN',14000,'RSC-1240','RC-1110','RS-217');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0018','28-Mar-2016','30-Mar-2016','RSPT-YLA','RSPT-KBI',3600,'RSC-1563','RC-1113','RS-205');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0019','2-Apr-2016','7-Apr-2016','RSPT-PKT','RSPT-KBI',9000,'RSC-1014','RC-1128','RS-184');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0020','11-Apr-2016','12-Apr-2016','RSPT-RYG','RSPT-BKK',1200,'RSC-1372','RC-1121','RS-164');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0021','17-Apr-2016','20-Apr-2016','RSPT-CRI','RSPT-CNX',6000,'RSC-1319','RC-1116','RS-143');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0022','26-Apr-2016','30-Apr-2016','RSPT-NPM','RSPT-RYG',8800,'RSC-1376','RC-1105','RS-193');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0023','4-May-2016','9-May-2016','RSPT-NPM','RSPT-PLK',9000,'RSC-1036','RC-1099','RS-170');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0024','10-May-2016','15-May-2016','RSPT-PLK','RSPT-BKK',9000,'RSC-1297','RC-1083','RS-236');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0025','16-May-2016','20-May-2016','RSPT-BKK','RSPT-LEI',7200,'RSC-1084','RC-1078','RS-137');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0026','17-Jun-2016','19-Jun-2016','RSPT-NAN','RSPT-CRI',4000,'RSC-1590','RC-1080','RS-200');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0027','20-Jun-2016','29-Jun-2016','RSPT-CRI','RSPT-NWT',16200,'RSC-1250','RC-1088','RS-166');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0028','22-Jun-2016','26-Jun-2016','RSPT-NWT','RSPT-BKK',7200,'RSC-1044','RC-1093','RS-199');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0029','7-Jul-2016','11-Jul-2016','RSPT-BKK','RSPT-NPM',6400,'RSC-1099','RC-1107','RS-229');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0030','15-Jul-2016','30-Jul-2016','RSPT-NPM','RSPT-UBN',24000,'RSC-1054','RC-1137','RS-147');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0031','21-Jul-2016','31-Jul-2016','RSPT-UBN','RSPT-NST',12000,'RSC-1306','RC-1132','RS-172');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0032','1-Aug-2016','3-Aug-2016','RSPT-NST','RSPT-RNG',4000,'RSC-1386','RC-1140','RS-197');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0033','9-Aug-2016','12-Aug-2016','RSPT-RNG','RSPT-YLA',5400,'RSC-1361','RC-1143','RS-158');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0034','23-Aug-2016','29-Aug-2016','RSPT-YLA','RSPT-RET',10800,'RSC-1567','RC-1153','RS-182');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0035','1-Sep-2016','8-Sep-2016','RSPT-RET','RSPT-UBN',14000,'RSC-1540','RC-1146','RS-178');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0036','17-Sep-2016','25-Sep-2016','RSPT-UBN','RSPT-LEI',16000,'RSC-1021','RC-1150','RS-195');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0037','22-Sep-2016','29-Sep-2016','RSPT-LEI','RSPT-RYG',14000,'RSC-1459','RC-1160','RS-202');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0038','3-Oct-2016','5-Oct-2016','RSPT-RYG','RSPT-BKK',2400,'RSC-1281','RC-1211','RS-164');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0039','19-Oct-2016','21-Oct-2016','RSPT-BKK','RSPT-NPM',2400,'RSC-1592','RC-1222','RS-137');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0040','20-Oct-2016','30-Oct-2016','RSPT-NPM','RSPT-PKT',20000,'RSC-1513','RC-1216','RS-216');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0041','9-Nov-2016','17-Nov-2016','RSPT-PKT','RSPT-BKK',12800,'RSC-1597','RC-1227','RS-207');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0042','13-Nov-2016','15-Nov-2016','RSPT-BKK','RSPT-RYG',3600,'RSC-1049','RC-1219','RS-183');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0043','19-Nov-2016','20-Nov-2016','RSPT-RYG','RSPT-BKK',2200,'RSC-1105','RC-1205','RS-210');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0044','5-Dec-2016','11-Dec-2016','RSPT-BKK','RSPT-UBN',10800,'RSC-1170','RC-1199','RS-160');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0045','7-Dec-2016','19-Dec-2016','RSPT-UBN','RSPT-CNX',21600,'RSC-1034','RC-1179','RS-241');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0046','17-Dec-2016','24-Dec-2016','RSPT-CNX','RSPT-KBI',12600,'RSC-1332','RC-1183','RS-231');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0047','1-Jan-2017','8-Jan-2017','RSPT-KBI','RSPT-BKK',8400,'RSC-1402','RC-1192','RS-160');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0048','13-Jan-2017','16-Jan-2017','RSPT-NST','RSPT-NWT',5400,'RSC-1282','RC-1229','RS-222');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0049','20-Jan-2017','24-Jan-2017','RSPT-NWT','RSPT-NST',4800,'RSC-1210','RC-1171','RS-220');
  INSERT INTO RSRent(rentNo,pickDate,returnDate,pickBranch,returnBranch,price,customerNo,CarNo,StaffNo) VALUES ('RSR-0050','23-Jan-2017','28-Jan-2017','RSPT-BKK','RSPT-UDN',9000,'RSC-1366','RC-1058','RS-206');

  --insert in staff table
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-100','Boonlert','Kerdmaruay','owner',55000,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-101','Boonsri','Deekernroi','assistance',32000,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-102','Thanongsak','Rakpahmai','assistance',30500,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-103','Sureeporn','Nhornsabuy','assistance',31000,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-104','Mira','Mckenzie','manager',28105,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-105','Brock','Gonzales','manager',27390,'RSB-101');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-106','Keith','Small','manager',29045,'RSB-102');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-107','Byron','Mcdaniel','manager',28535,'RSB-103');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-108','Leslie','Castaneda','manager',29652,'RSB-104');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-109','Lynn','George','manager',29297,'RSB-105');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-110','Dale','Harvey','manager',29802,'RSB-106');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-111','Amos','Kirkland','manager',28790,'RSB-107');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-112','Henry','Allison','manager',28589,'RSB-108');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-113','Idona','Spears','manager',28430,'RSB-109');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-114','Robin','Hayes','manager',29345,'RSB-110');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-115','Lysandra','Hernandez','manager',29743,'RSB-111');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-116','Martena','Patel','manager',27998,'RSB-112');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-117','Aline','Le','manager',27581,'RSB-113');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-118','Garrison','Finley','manager',27105,'RSB-114');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-119','Rae','Bonner','manager',27663,'RSB-115');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-120','Myles','Mueller','manager',29579,'RSB-116');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-121','Kuame','Alexander','manager',29753,'RSB-117');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-122','Sydnee','Palmer','manager',27706,'RSB-118');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-123','Theodore','Wooten','manager',28618,'RSB-119');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-124','Reuben','Bernard','manager',27117,'RSB-120');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-125','Harding','Crosby','manager',27472,'RSB-121');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-126','Kitra','Skinner','manager',27762,'RSB-122');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-127','Cody','Holloway','officer',23781,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-128','Igor','Brown','officer',23854,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-129','Yardley','Sweet','officer',20778,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-130','Eaton','Sparks','officer',22847,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-131','Oscar','Marks','officer',23756,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-132','Jonas','Young','officer',21200,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-133','Aidan','Holden','officer',20320,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-134','Tara','Spears','officer',22228,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-135','Mallory','Valencia','officer',21633,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-136','Octavius','Woods','officer',23955,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-137','Lara','Rich','staff',20363,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-138','Maia','Holmes','staff',21824,'RSB-101');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-139','Neville','Miles','staff',22985,'RSB-102');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-140','Desirae','Goodwin','staff',20869,'RSB-103');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-141','Travis','Chan','staff',22325,'RSB-104');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-142','Irene','Cole','staff',21884,'RSB-105');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-143','Reuben','Olson','staff',22987,'RSB-106');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-144','Zoe','Russo','staff',20979,'RSB-107');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-145','Gemma','Solis','staff',21632,'RSB-108');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-146','Zelda','Chavez','staff',23567,'RSB-109');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-147','Gloria','Love','staff',22507,'RSB-110');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-148','Hedley','Roman','staff',22085,'RSB-111');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-149','Fuller','Dickerson','staff',21377,'RSB-112');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-150','Nero','Watkins','staff',23312,'RSB-113');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-151','Phyllis','Gibbs','staff',20526,'RSB-114');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-152','Madaline','Patel','staff',20782,'RSB-115');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-153','Imelda','Wheeler','staff',23269,'RSB-116');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-154','Wesley','Moss','staff',23496,'RSB-117');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-155','Elvis','Avila','staff',20953,'RSB-118');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-156','Ray','Houston','staff',23714,'RSB-119');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-157','Acton','Castillo','staff',22358,'RSB-120');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-158','Henry','Quinn','staff',22193,'RSB-121');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-159','Lydia','Cummings','staff',23298,'RSB-122');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-160','Laith','Grimes','staff',23784,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-161','Sacha','Collier','staff',21032,'RSB-101');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-162','Christopher','Clay','staff',21008,'RSB-102');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-163','Yasir','Crosby','staff',22212,'RSB-103');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-164','Lunea','Eaton','staff',22298,'RSB-104');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-165','Garrison','Dennis','staff',20840,'RSB-105');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-166','Leroy','Farmer','staff',21181,'RSB-106');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-167','Diana','Sanchez','staff',20568,'RSB-107');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-168','Damian','Olsen','staff',20254,'RSB-108');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-169','Bevis','Mosley','staff',23927,'RSB-109');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-170','Keely','Wooten','staff',20553,'RSB-110');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-171','Pascale','Castaneda','staff',20523,'RSB-111');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-172','Coby','Carr','staff',21520,'RSB-112');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-173','Joel','Shepherd','staff',23251,'RSB-113');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-174','Moses','Dillon','staff',21480,'RSB-114');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-175','Alexandra','Beard','staff',20926,'RSB-115');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-176','Jonah','Malone','staff',23120,'RSB-116');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-177','Shellie','Blair','staff',22161,'RSB-117');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-178','Brock','Goff','staff',20424,'RSB-118');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-179','Suki','Villarreal','staff',21475,'RSB-119');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-180','Madeson','Estrada','staff',21628,'RSB-120');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-181','Alana','Gutierrez','staff',23575,'RSB-121');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-182','Gabriel','Walters','staff',21687,'RSB-122');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-183','Kimberley','Cummings','staff',22166,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-184','Wynter','Vaughan','staff',23415,'RSB-101');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-185','Ronan','English','staff',22671,'RSB-102');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-186','Bradley','Fulton','staff',20642,'RSB-103');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-187','Ursa','Barton','staff',22895,'RSB-104');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-188','Christen','Dalton','staff',22462,'RSB-105');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-189','Cooper','Klein','staff',20883,'RSB-106');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-190','Wallace','Kramer','staff',23820,'RSB-107');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-191','Stephen','Franco','staff',20447,'RSB-108');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-192','Nerea','Vasquez','staff',22542,'RSB-109');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-193','Jenette','Gould','staff',20962,'RSB-110');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-194','Judith','Mclean','staff',22334,'RSB-111');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-195','Plato','Cruz','staff',20670,'RSB-112');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-196','Melyssa','Randolph','staff',22719,'RSB-113');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-197','Medge','Davis','staff',22931,'RSB-114');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-198','Jaquelyn','Beck','staff',23389,'RSB-115');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-199','Rebekah','Rasmussen','staff',20273,'RSB-116');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-200','Justina','Tillman','staff',20462,'RSB-117');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-201','Kylee','Blankenship','staff',23038,'RSB-118');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-202','Selma','Cleveland','staff',23982,'RSB-119');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-203','Marshall','Chavez','staff',21496,'RSB-120');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-204','Sonya','French','staff',23111,'RSB-121');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-205','Charity','Chandler','staff',22107,'RSB-122');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-206','Kenyon','Horn','staff',21428,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-207','Harrison','Shelton','staff',23773,'RSB-101');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-208','Otto','Pugh','staff',23969,'RSB-102');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-209','Sonya','Best','staff',20186,'RSB-103');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-210','Dominic','Workman','staff',20951,'RSB-104');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-211','Judah','Mayo','staff',21582,'RSB-105');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-212','Brock','Delacruz','staff',22037,'RSB-106');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-213','Isabelle','Hinton','staff',22998,'RSB-107');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-214','Elizabeth','Fischer','staff',21360,'RSB-108');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-215','Nigel','Alexander','staff',22821,'RSB-109');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-216','Stella','Castaneda','staff',20172,'RSB-110');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-217','Erasmus','Burt','staff',20382,'RSB-111');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-218','Tanner','Bailey','staff',23673,'RSB-112');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-219','Noah','Hubbard','staff',23317,'RSB-113');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-220','Lev','Clayton','staff',21423,'RSB-114');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-221','Aubrey','Townsend','staff',21823,'RSB-115');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-222','Mari','Andrews','staff',22599,'RSB-116');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-223','Joshua','Daniels','staff',22517,'RSB-117');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-224','Jolie','Humphrey','staff',21356,'RSB-118');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-225','Ila','Beard','staff',21072,'RSB-119');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-226','Merrill','Herman','staff',22878,'RSB-120');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-227','Junrayu','Aunchai','staff',22926,'RSB-121');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-228','Alric','Mousley','staff',21369,'RSB-122');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-229','Durant','Charity','staff',23014,'RSB-100');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-230','Shaughn','Fernandes','staff',23762,'RSB-101');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-231','Jackie','Pattie','staff',21516,'RSB-102');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-232','Wright','Leap','staff',20323,'RSB-103');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-233','Brad','Hugonet','staff',21120,'RSB-104');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-234','Drud','Idill','staff',23275,'RSB-105');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-235','Jud','Vasyunichev','staff',23123,'RSB-106');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-236','Currey','Insko','staff',23237,'RSB-107');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-237','Trstram','Saice','staff',23207,'RSB-108');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-238','Filbert','Tennick','staff',21410,'RSB-109');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-239','Budd','Kedie','staff',23754,'RSB-110');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-240','Willey','Le Grice','staff',20387,'RSB-111');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-241','Eartha','Taks','staff',22659,'RSB-112');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-242','Kenneth','Leggen','staff',20058,'RSB-113');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-243','Mirabel','Tommasuzzi','staff',21770,'RSB-114');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-244','Fanchette','Kaygill','staff',21827,'RSB-115');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-245','Willi','Mordey','staff',21903,'RSB-116');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-246','Ladonna','Bresman','staff',23177,'RSB-117');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-247','Gradeigh','Greenshiels','staff',21054,'RSB-118');
  INSERT INTO RSStaff(StaffNo,Fname,Lname,Position,Salary,Branchno) VALUES ('RS-248','Roxi','Wrassell','staff',21149,'RSB-119');
  commit;
  select * from RSStaff;
  select * from RSBranch;

  --insert customer
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1000','Xyla','Moody','yes','1234','vitae@velmauris.com','088-551-3934','Credit','17/1/1976','F_cr5Jv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1001','Kathleen','Roberson','yes',1.06444E+12,'et.netus@Quisque.com','080-497-5729','Credit','18/2/1969','#+9bMb8g');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1002','Merritt','Johnston','yes',1.1719E+12,'magna.Suspendisse@euismod.ca','083-197-4631','Cash','27/4/1964','L%qV@xR');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1003','Jordan','Warren','yes',1.52594E+12,'scelerisque.lorem@Fusce.edu','089-219-5356','Credit','22/3/1977','5fGL!W^9');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1004','Eagan','Bradford','yes',1.4966E+12,'nibh.lacinia.orci@utodiovel.com','089-343-2483','Credit','1/9/1970','3@uJjeK');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1005','Jameson','Pope','yes',1.3178E+12,'eu.neque.pellentesque@Quisqueporttitor.com','083-183-2550','Debit','21/2/1961','EBMQFfx9');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1006','Cassady','Foley','yes',1.09969E+12,'Donec.egestas.Duis@nasceturridiculusmus.org','084-445-4432','Cash','21/8/1985','rHLRr4EV');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1007','Amery','Vance','yes',1.47151E+12,'Cras@ipsumprimisin.org','085-373-4141','Credit','31/5/1968','EwvR9kTh');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1008','Curran','Long','yes',1.26209E+12,'amet.metus.Aliquam@lobortisrisusIn.ca','086-534-9955','Debit','28/12/1979','m6J4QbRe');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1009','Debra','Alvarado','yes',1.46385E+12,'posuere.cubilia@magna.org','080-825-3725','Credit','29/5/1965','UgdR2LLw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1010','Quynn','Wilkerson','yes',1.06502E+12,'ac.tellus@pellentesque.org','081-699-3353','Credit','2/4/1989','5yzDdm2y');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1011','Nolan','James','yes',1.15458E+12,'dapibus.ligula.Aliquam@dictumultriciesligula.edu','083-670-9359','Debit','5/7/1975','wPfcL3jy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1012','Craig','Beard','yes',1.19967E+12,'mi.pede@elitpellentesquea.edu','081-863-5889','Cash','1/3/1978','QTXaQQpw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1013','Burke','Stanley','yes',1.5784E+12,'eu@idrisusquis.com','087-336-6874','Debit','3/10/1966','RTVjLUhG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1014','Byron','Glenn','yes',1.11742E+12,'et.netus.et@interdumlibero.org','080-926-1788','Credit','12/7/1980','Z7GH3kSb');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1015','Keegan','Carroll','yes',1.61469E+12,'Duis.volutpat.nunc@enim.co.uk','080-308-3175','Debit','8/7/1997','jeGgSqRJ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1016','Keaton','Mullen','yes',1.17214E+12,'semper@egestasFusce.ca','086-965-4245','Credit','3/10/1965','eT9N5HTm');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1017','Laith','Molina','yes',1.64497E+12,'mattis.semper@neceuismodin.net','086-238-4078','Credit','25/8/1985','QFZcmYEV');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1018','Kelly','Riley','yes',1.62146E+12,'Aliquam.erat.volutpat@urnasuscipitnonummy.com','082-350-0858','Credit','23/5/1962','WTcYL8t9');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1019','Oliver','Wolfe','yes',1.02396E+12,'mauris.sagittis.placerat@luctus.edu','080-951-2944','Cash','2/1/1999','PjKfh4Zw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1020','Shelley','Russo','yes',1.43229E+12,'Mauris.nulla@conubianostra.co.uk','087-985-8733','Debit','17/7/1981','YZgNXcGq');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1021','Noelle','Tucker','yes',1.28912E+12,'blandit@eu.org','089-946-4168','Cash','18/3/1976','G7EaDx7N');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1022','Abel','Stewart','yes',1.00113E+12,'elit@Vivamussit.ca','082-189-7987','Debit','2/10/1994','PLRMaPKv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1023','Maris','Bernard','yes',1.37668E+12,'vel.vulputate.eu@acturpis.org','084-237-6149','Cash','5/6/1963','BB8csUj7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1024','Robert','Webb','yes',1.66594E+12,'magna.Praesent@Aeneansedpede.ca','081-954-8917','Cash','27/4/1985','uRxFAAMB');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1025','Lucy','Young','yes',1.63699E+12,'luctus.vulputate.nisi@odioNam.ca','083-066-8277','Debit','4/5/1974','VWBLv5CR');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1026','Rigel','Stark','yes',1.63706E+12,'dignissim.magna@mi.edu','086-263-1102','Debit','18/4/1974','nqXq8mxJ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1027','Noble','Koch','yes',1.04485E+12,'sapien.Cras@blandit.net','084-945-4390','Cash','5/10/1987','xjH9rMy6');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1028','Basia','Chan','yes',1.23318E+12,'non.ante.bibendum@atfringilla.edu','084-771-6058','Credit','1/8/1973','BWer2S2D');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1029','Nomlanga','Garner','yes',1.4027E+12,'vehicula@volutpat.com','081-205-3229','Cash','3/9/1962','M8yY9wEh');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1030','Hannah','Burns','yes',1.11733E+12,'tincidunt.nibh@porta.com','085-334-4385','Debit','5/5/1979','n7NuwQc7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1031','Jackson','Giles','yes',1.5664E+12,'nostra.per@acfermentum.net','086-246-0687','Debit','28/9/1975','T9t8rhVX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1032','Armando','Salas','yes',1.32059E+12,'hendrerit.Donec.porttitor@egetlaoreetposuere.net','085-396-1898','Credit','8/12/1972','3dVsnp8U');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1033','Nichole','Hamilton','yes',1.59204E+12,'ut.ipsum.ac@lectusasollicitudin.com','083-489-0592','Cash','10/12/1993','AFmtmaN6');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1034','Kirestin','Robles','yes',1.319E+12,'Sed.dictum.Proin@eumetusIn.com','087-699-4142','Debit','11/11/1993','xTzWagur');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1035','Naomi','Mooney','yes',1.67048E+12,'ut.cursus@eratvelpede.org','081-655-2150','Debit','7/1/1985','Sncc2dF8');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1036','Keely','Moss','yes',1.43541E+12,'natoque@enimEtiam.ca','089-492-7310','Cash','5/2/1995','EAXKEMEP');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1037','Alfonso','Crosby','yes',1.17739E+12,'mauris.erat@quamquis.net','088-168-8800','Cash','17/9/1972','WqZY8Br5');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1038','Dora','Bernard','yes',1.0326E+12,'sagittis.semper.Nam@dis.org','086-942-7077','Cash','27/10/1992','crMdW59h');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1039','Michelle','Prince','yes',1.11656E+12,'Aliquam@sem.org','089-540-9768','Debit','30/12/1990','qKjhsJH8');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1040','Cherokee','Mclaughlin','yes',1.10041E+12,'malesuada@vitaealiquam.co.uk','086-018-8471','Credit','3/9/1993','WBQuCthT');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1041','Veda','Donaldson','yes',1.55095E+12,'nisl@nonenimcommodo.ca','086-273-7742','Cash','10/12/1977','Ccvwf2Yy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1042','Danielle','Conner','yes',1.037E+12,'ad.litora@malesuada.edu','089-932-9190','Credit','14/6/1995','rCvUDMNh');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1043','Alfonso','Decker','yes',1.03052E+12,'arcu@DonecegestasAliquam.edu','088-720-3247','Debit','25/5/1990','JU5zgMX5');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1044','Brendan','Moran','yes',1.14495E+12,'lacus.Mauris@fringillaest.com','088-593-2688','Cash','10/10/1990','zuhNkdmu');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1045','Robert','Williams','yes',1.19913E+12,'aliquam.eu.accumsan@Cras.co.uk','089-131-6196','Cash','14/3/1975','NkvSxfSr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1046','Mia','Atkins','yes',1.4859E+12,'mauris@eros.com','088-943-3626','Debit','13/6/1973','FYh9kGWg');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1047','Jayme','Oneill','yes',1.16173E+12,'vehicula@convallis.org','088-171-5057','Debit','12/3/1992','ZdMt9NBV');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1048','Ivana','Hahn','yes',1.53446E+12,'est@eterosProin.net','084-607-0201','Cash','11/3/1996','aFh7VYFy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1049','Ann','Welch','yes',1.56197E+12,'Morbi.sit.amet@auguescelerisquemollis.com','084-318-5836','Cash','27/12/1975','48vagLgL');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1050','Bryar','Keith','yes',1.28108E+12,'vitae.orci.Phasellus@nonjustoProin.org','087-007-0405','Debit','2/1/1980','PDyez6vU');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1051','Imani','Mcmahon','yes',1.16065E+12,'tincidunt@magna.net','089-508-9609','Cash','9/8/1996','8brseEZW');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1052','Dale','Burch','yes',1.63607E+12,'egestas@pede.org','086-479-0343','Credit','8/5/1960','f8xwzXtv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1053','Harriet','Kramer','yes',1.5463E+12,'Integer@leoelementumsem.net','086-373-1528','Cash','14/1/1968','K5fnQXj2');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1054','Ella','Booker','yes',1.58037E+12,'sapien@erateget.co.uk','083-777-4617','Credit','15/2/2000','NBfP732y');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1055','Cade','Nguyen','yes',1.38595E+12,'nulla@nibhenim.org','080-513-5047','Debit','7/6/1993','J7bcsuYC');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1056','Amal','Donaldson','yes',1.08329E+12,'vulputate@justoeu.co.uk','082-204-4525','Cash','11/9/1978','KgfUg4Y8');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1057','Kareem','Dillon','yes',1.05046E+12,'id.mollis@liberoMorbi.net','081-040-2136','Credit','19/8/1974','8pGn4tqk');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1058','Odessa','Chavez','yes',1.52053E+12,'mi.ac@duiCumsociis.edu','087-583-8617','Credit','27/8/1979','zjKgg6sR');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1059','Carl','Rowland','yes',1.09425E+12,'nec.enim@quamvel.co.uk','089-018-9346','Cash','23/3/1969','dMZaQgUW');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1060','Aladdin','Rowland','yes',1.57731E+12,'ipsum@Proin.com','088-215-1846','Debit','6/2/1969','dexuxfmc');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1061','Imogene','Dickerson','yes',1.43266E+12,'Sed.pharetra@quamvel.ca','081-233-7617','Credit','26/2/1990','xnZ9gjEB');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1062','Kiayada','Larsen','yes',1.22708E+12,'nec.tellus.Nunc@luctus.com','080-691-4128','Debit','8/3/1964','TapexKVy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1063','Ivor','Marks','yes',1.14405E+12,'interdum.enim@tristique.net','085-949-8961','Cash','3/4/1972','b92ZyLFZ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1064','Kasper','Adams','yes',1.04619E+12,'risus.Duis@pedeblanditcongue.ca','082-993-4986','Debit','10/3/1984','3GRJX8mJ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1065','Melodie','Deleon','yes',1.41262E+12,'dignissim@In.ca','089-901-2173','Debit','8/5/1966','HEVe3j5z');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1066','Suki','Phillips','yes',1.43419E+12,'interdum.ligula.eu@blanditenimconsequat.co.uk','080-907-0897','Credit','7/9/1982','UVEW2Nmx');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1067','Quinn','Landry','yes',1.65813E+12,'faucibus@odioauctorvitae.org','083-030-8582','Credit','18/1/1985','brvLrLaf');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1068','Chastity','Lott','yes',1.27659E+12,'ac@cursusdiamat.co.uk','083-048-7333','Credit','10/7/1965','4xATyxUz');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1069','Jakeem','Hall','yes',1.23892E+12,'montes@Quisqueporttitoreros.org','080-677-5577','Credit','24/9/1961','8sVsgwqY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1070','Kennan','Mcneil','yes',1.54803E+12,'pharetra.ut@ipsum.net','086-390-5134','Cash','8/11/1989','ncfmexZ6');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1071','Justina','Becker','yes',1.23597E+12,'Integer.vulputate.risus@euerat.com','080-687-5304','Cash','5/11/1971','64G865jS');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1072','Simon','Santana','yes',1.53521E+12,'aliquam@nibhdolornonummy.com','087-884-0872','Cash','28/3/1970','4yLddmpZ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1073','Darius','Trevino','yes',1.28135E+12,'Proin.non.massa@elitpellentesquea.com','087-970-8058','Debit','27/10/1985','N2Fd3Pht');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1074','Wyoming','Steele','yes',1.15695E+12,'vitae@ultriciesornare.net','080-220-1090','Debit','6/2/1970','ESrepMfX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1075','Finn','Cline','yes',1.4891E+12,'a.arcu.Sed@mus.ca','087-886-4892','Credit','26/4/1980','H7D5MsYX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1076','Zephania','Gaines','yes',1.6093E+12,'tellus@insodales.edu','089-584-5889','Credit','21/12/1974','swmxHr9t');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1077','Quon','Daugherty','yes',1.01856E+12,'ullamcorper@imperdietnonvestibulum.net','083-188-7046','Cash','8/11/1988','LkdURMAL');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1078','Raphael','Edwards','yes',1.02107E+12,'dapibus.rutrum.justo@Inmipede.co.uk','085-344-3336','Debit','22/8/1962','HdYkmqUA');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1079','Isaac','Alexander','yes',1.6885E+12,'lobortis@velquamdignissim.org','086-385-5034','Cash','1/1/1962','6Ua4VAqE');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1080','Amity','Ford','yes',1.21685E+12,'Nullam@libero.co.uk','083-783-9101','Debit','29/4/1990','8MTQkTkt');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1081','Cailin','Cochran','yes',1.3872E+12,'accumsan.interdum@loremacrisus.co.uk','086-204-8710','Credit','1/3/1987','Jx2Bp6Sk');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1082','India','Stephenson','yes',1.56228E+12,'vel.venenatis.vel@tempordiam.co.uk','084-072-6508','Cash','8/11/1981','WEqRcfB6');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1083','Aline','Carr','yes',1.06313E+12,'lacus.Nulla.tincidunt@etmagnaPraesent.com','089-374-6413','Cash','3/11/1984','gHFEW2mG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1084','Ryder','Larsen','yes',1.66782E+12,'non.sollicitudin@tortor.com','082-084-1107','Credit','20/10/1970','mNthwnBE');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1085','Amery','Fulton','yes',1.63848E+12,'elementum.lorem@vulputateduinec.com','080-122-8323','Credit','12/2/1970','yu94d8dH');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1086','Marsden','Meyer','yes',1.42385E+12,'lectus.Cum.sociis@Donecnibh.org','081-555-5868','Cash','14/5/1967','nrq5xPZY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1087','Xenos','Velez','yes',1.57361E+12,'urna.Vivamus@urnaVivamus.com','086-695-6121','Debit','13/12/1994','5FpM7kp7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1088','Nissim','Moss','yes',1.09795E+12,'sit@consectetuerrhoncus.org','080-306-4645','Credit','18/1/1996','zFGgbAnn');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1089','Caleb','Young','yes',1.11256E+12,'sit.amet@parturientmontesnascetur.edu','081-558-2226','Debit','25/1/1974','2McX27nj');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1090','Sandra','Bird','yes',1.57582E+12,'Suspendisse@adipiscing.edu','080-761-2092','Debit','12/10/1999','wkBHuxsr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1091','Sebastian','Hansen','yes',1.60395E+12,'amet@ut.co.uk','089-976-9708','Debit','22/5/1994','LvT2ueC7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1092','Burke','Mercer','yes',1.44637E+12,'fermentum@neque.org','086-803-1083','Debit','7/11/1971','uDtFgKPM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1093','Teegan','Jacobs','yes',1.58993E+12,'justo.eu.arcu@iaculis.edu','084-642-2283','Debit','26/2/1965','jt5sPzYr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1094','Reed','Hutchinson','yes',1.40949E+12,'erat.nonummy.ultricies@vehicula.net','081-133-2731','Debit','13/6/1970','h3SFFs8T');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1095','Tobias','Porter','yes',1.46773E+12,'ac@acmattissemper.net','084-375-5273','Cash','20/2/1993','kRtRj564');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1096','Nasim','Boyd','yes',1.60662E+12,'leo.Vivamus.nibh@CraspellentesqueSed.net','080-351-0381','Debit','9/9/1967','7K3Zf8ft');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1097','Rylee','Boyle','yes',1.21196E+12,'auctor.velit@aliquet.co.uk','084-269-6226','Cash','22/10/1984','pgs6C2Cs');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1098','Hasad','Jones','yes',1.58992E+12,'nulla.ante@mattis.ca','085-156-2803','Cash','7/9/1963','v7xmuyU9');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1099','Nathaniel','Adams','yes',1.31286E+12,'Donec@pede.edu','080-043-2737','Cash','3/1/1986','9FpM72eY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1100','Octavia','Gates','yes',1.34969E+12,'erat.vitae@semelit.ca','087-922-5587','Cash','17/12/1995','Ls3jwTef');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1101','Elmo','Cook','yes',1.58033E+12,'diam.Sed@dignissimpharetraNam.ca','088-241-9217','Credit','13/4/1964','HRuPwx9z');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1102','Randall','Freeman','yes',1.22123E+12,'accumsan.neque@acmetus.net','089-347-1800','Debit','6/9/1965','Ga7KTt6c');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1103','Ursula','Ewing','yes',1.63129E+12,'risus.Nulla.eget@Aeneanmassa.co.uk','084-419-6334','Credit','14/2/1963','rWLXjxRE');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1104','Melyssa','Giles','yes',1.29458E+12,'ante@nislarcuiaculis.com','085-130-3793','Credit','28/1/1971','2mE5xU3m');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1105','Donna','Tanner','yes',1.44683E+12,'mauris@scelerisqueneque.ca','081-321-2723','Debit','16/10/1986','Kyd88AKD');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1106','Armand','Ball','yes',1.22402E+12,'sollicitudin.commodo.ipsum@eu.co.uk','084-869-7402','Cash','12/9/1988','S7KFMafY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1107','Kirk','Pitts','yes',1.33651E+12,'et.magnis@a.co.uk','087-736-4367','Credit','10/8/1994','MsnF7MYp');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1108','Charlotte','Sexton','yes',1.68936E+12,'ipsum.primis@SuspendisseduiFusce.co.uk','082-603-5196','Cash','14/11/1978','VeDpj5Ba');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1109','Simone','Trujillo','yes',1.19153E+12,'vulputate.ullamcorper.magna@fringillapurus.net','088-710-4831','Debit','22/9/1971','rXJ2PJ3P');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1110','Wang','Stone','yes',1.62856E+12,'ligula.Aenean@metusVivamuseuismod.ca','081-950-5636','Debit','13/12/1976','BHHUpzaw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1111','Colton','Spears','yes',1.0627E+12,'sollicitudin.adipiscing.ligula@litoratorquent.com','083-195-1943','Cash','11/6/1995','9ww3LrzJ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1112','Nissim','Gamble','yes',1.46205E+12,'ut.pellentesque@Donec.edu','084-308-7114','Debit','10/4/1998','qYBqfpb9');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1113','Stella','Baker','yes',1.6574E+12,'In.mi.pede@Donecat.ca','080-144-2226','Debit','3/5/1967','2nAYaGJs');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1114','Paki','Kent','yes',1.5509E+12,'Morbi@tristique.ca','087-391-7390','Credit','29/6/1978','Fhr2jFtD');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1115','Shellie','Beach','yes',1.1645E+12,'dui@lectusconvallis.ca','087-773-7263','Credit','17/7/1996','efD5MN2x');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1116','Dieter','Conrad','yes',1.30621E+12,'diam.eu@duilectusrutrum.ca','080-056-7397','Cash','17/8/1972','dzdMUmLM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1117','Quinlan','Cain','yes',1.46504E+12,'enim.sit.amet@augue.org','089-202-2862','Credit','9/1/1982','PLZuqLNT');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1118','Tiger','Hess','yes',1.34219E+12,'egestas.lacinia@etnetus.edu','089-446-8482','Cash','20/11/1969','NdGuQ8Mk');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1119','Scarlet','Cox','yes',1.35628E+12,'ut.mi@infaucibus.com','088-431-5446','Debit','30/7/1982','hdqwY6Uw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1120','Geraldine','Velasquez','yes',1.58132E+12,'Vivamus@fermentum.com','088-050-9892','Debit','3/7/1995','rSfZnQjM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1121','Ezekiel','Raymond','yes',1.67007E+12,'elit@odio.org','081-153-0541','Debit','25/5/1973','ZQV7nP4G');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1122','Samantha','Hensley','yes',1.0835E+12,'pede@loremvitaeodio.org','084-568-1901','Cash','29/12/1992','DeVzEjPJ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1123','Vincent','Heath','yes',1.12362E+12,'sit.amet@velitin.com','082-032-8699','Cash','22/5/1976','W9R7fP9n');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1124','Craig','Pennington','yes',1.63283E+12,'sapien.Aenean.massa@PhasellusnullaInteger.com','086-319-0870','Credit','5/9/1961','2TrjV3Lk');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1125','Alea','Brooks','yes',1.54974E+12,'Nulla.interdum.Curabitur@nibh.com','087-499-7686','Cash','30/7/1997','9xP2ZhVP');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1126','Yvonne','Hays','yes',1.54039E+12,'semper@nisiCum.com','082-781-4555','Debit','9/1/1980','BMrN2jmQ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1127','Kareem','Bullock','yes',1.26824E+12,'volutpat@Nullatempor.co.uk','083-221-2411','Cash','27/2/1981','UgsFyUUm');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1128','Kathleen','Nguyen','yes',1.37015E+12,'purus.gravida.sagittis@quamquisdiam.net','080-662-3039','Debit','18/6/1966','ZE9Vw9fA');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1129','Elaine','Fox','yes',1.21321E+12,'Cum@augueacipsum.net','086-774-3258','Credit','21/9/1972','NZHhs2Uv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1130','Ciaran','Spears','yes',1.59251E+12,'cursus.luctus@fringillami.org','089-735-4905','Cash','2/9/1964','LwYHFUp5');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1131','Sopoline','Alston','yes',1.11043E+12,'consectetuer.adipiscing.elit@euismod.org','083-065-2479','Debit','12/3/1969','4hTSYURj');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1132','Elton','Wood','yes',1.68454E+12,'tellus.eu@etliberoProin.edu','087-323-7150','Credit','18/2/1987','uUm3NxtZ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1133','Leandra','Velasquez','yes',1.52271E+12,'convallis@maurisa.co.uk','087-645-2620','Cash','26/2/1973','wQC5EvCD');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1134','Nerea','Blackburn','yes',1.11391E+12,'Praesent.eu.nulla@malesuadafringillaest.org','084-397-2398','Credit','3/5/1978','D9EMNMX3');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1135','Cole','Haley','yes',1.67008E+12,'lacus@QuisquevariusNam.net','087-171-1065','Cash','22/1/1978','JDwY6V6M');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1136','Gage','Solis','yes',1.0413E+12,'Sed.molestie.Sed@Donecfelis.edu','083-117-5453','Cash','18/8/1964','gW23UU5R');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1137','Avram','Vincent','yes',1.18934E+12,'eget.metus@FuscefeugiatLorem.net','083-652-6092','Debit','4/4/1991','JyzXRvpV');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1138','Hadassah','Velez','yes',1.49946E+12,'orci.tincidunt@idenim.co.uk','081-430-5635','Cash','2/1/1974','7AnqTp82');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1139','Yoshio','Quinn','yes',1.67907E+12,'pede@at.org','084-994-5024','Debit','14/9/1960','kt2B7QWz');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1140','Kylie','Vinson','yes',1.14265E+12,'sodales@orcitinciduntadipiscing.com','080-507-0849','Debit','21/12/1968','TaKDyKAp');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1141','Tyler','Ballard','yes',1.26865E+12,'pretium@Proin.net','086-136-4098','Debit','16/4/1997','drHzc5XG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1142','Adele','Baker','yes',1.41226E+12,'ipsum@purus.co.uk','081-899-8826','Debit','18/4/1998','VuHmmVKB');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1143','Wang','Cooper','yes',1.54371E+12,'risus@Nullasempertellus.org','082-142-8146','Credit','23/6/1981','DSxHMpvQ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1144','Merrill','Emerson','yes',1.22921E+12,'aliquet.Proin.velit@eratEtiamvestibulum.com','086-625-2361','Debit','27/6/1979','8Zax8Huw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1145','Brandon','Holloway','yes',1.52689E+12,'ultricies.adipiscing@atrisusNunc.co.uk','086-910-7960','Credit','30/9/1967','k6jJWWbV');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1146','Cooper','English','yes',1.66525E+12,'quis.tristique.ac@sagittisNullamvitae.co.uk','085-110-1038','Debit','2/4/1981','pYuxLpyM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1147','Dillon','Merrill','yes',1.17604E+12,'cubilia.Curae.Phasellus@sit.ca','085-196-1477','Credit','31/5/1964','u8HW3n8v');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1148','Tamekah','Albert','yes',1.56862E+12,'Nullam@iaculisenim.co.uk','081-284-8797','Credit','30/4/1981','3TGt7FCG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1149','Nell','Ramirez','yes',1.57843E+12,'netus.et@metusAliquamerat.edu','087-654-9908','Cash','25/1/1988','xQvnfCxg');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1150','Brett','May','yes',1.64829E+12,'vel.nisl.Quisque@dui.com','087-808-0682','Credit','25/7/1989','gbWJnBmg');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1151','Rogan','Saunders','yes',1.54765E+12,'posuere@venenatisvel.com','085-825-2949','Debit','13/11/1982','HyZSGSCc');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1152','Nola','Fitzpatrick','yes',1.47006E+12,'sem@porttitoreros.org','080-384-6930','Cash','21/9/1975','CfDg6sVm');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1153','Beatrice','Hull','yes',1.50954E+12,'Donec.tempor.est@Utsagittis.edu','084-663-5508','Debit','22/7/1989','j4HPqT2B');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1154','Brenden','Roth','yes',1.66917E+12,'nunc@lacusAliquamrutrum.com','086-087-0004','Cash','15/12/1978','Ty2jQcXU');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1155','Myles','Brennan','yes',1.68877E+12,'dictum.sapien@nequenon.co.uk','082-720-1329','Cash','9/2/1965','8EUwDgTq');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1156','Owen','Weaver','yes',1.56288E+12,'nec@fringillaDonecfeugiat.net','083-053-5189','Debit','17/12/1975','XPUh2xua');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1157','Daria','Larsen','yes',1.20239E+12,'tincidunt.neque.vitae@velquam.com','089-575-0287','Debit','15/4/1967','sYMAgtTP');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1158','Maggie','Foster','yes',1.294E+12,'libero.Proin.mi@eumetus.net','084-482-8471','Cash','15/6/1976','gt6FZuVE');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1159','Ulla','Cash','yes',1.05843E+12,'ac.fermentum.vel@ametdiam.net','086-405-1780','Debit','11/2/1974','3CGcqR9m');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1160','Leroy','Carson','yes',1.18648E+12,'quam@natoque.ca','085-731-9586','Debit','21/7/1986','quE4kenp');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1161','Perry','Dean','yes',1.65604E+12,'nibh@iaculisodio.net','087-754-8421','Debit','15/11/1972','Wrcq6crG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1162','Linus','Holcomb','yes',1.24814E+12,'lacus.Cras@utipsum.ca','088-125-8474','Credit','1/1/1995','4y5YUYPR');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1163','Brett','Little','yes',1.04982E+12,'Phasellus@loremluctus.com','082-218-4284','Cash','30/4/1968','7fP3mjwf');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1164','Kameko','Hobbs','yes',1.45686E+12,'molestie@nunc.co.uk','085-622-4583','Cash','9/12/1965','e6BAUD2W');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1165','Abigail','Sims','yes',1.26889E+12,'ac@nequeMorbiquis.net','088-927-0083','Cash','25/3/1979','m7dsYZ33');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1166','Helen','Robinson','yes',1.47458E+12,'nisl.sem@Crasinterdum.edu','085-783-6152','Cash','10/8/1988','V8RxbdHM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1167','Griffin','Kirby','yes',1.36669E+12,'sem.consequat@elitdictumeu.edu','087-106-6309','Debit','8/3/1974','9EtnbnUv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1168','Dane','Good','yes',1.00284E+12,'libero@turpis.edu','087-868-9099','Credit','29/4/1999','fPjuvfLB');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1169','Brock','Gross','yes',1.49883E+12,'a.felis@risusDonec.co.uk','081-280-7016','Debit','16/10/1988','2JueK5fg');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1170','Merrill','Larson','yes',1.44128E+12,'amet.consectetuer.adipiscing@id.net','089-853-5951','Cash','8/5/1998','7JgMqdWS');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1171','Jelani','Francis','yes',1.51338E+12,'auctor.non.feugiat@quispede.net','089-625-5964','Cash','13/5/1999','ujQwmhpj');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1172','Ray','Mcintosh','yes',1.10197E+12,'quam.quis@diamat.org','088-150-1345','Credit','27/5/1970','nH4AWDBT');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1173','Byron','Wall','yes',1.35359E+12,'feugiat.non@eteuismod.edu','086-850-9301','Debit','22/1/1982','3eyjK8r2');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1174','Skyler','Cote','yes',1.04338E+12,'libero@ametante.org','085-958-9206','Debit','13/4/1963','mN8AXby7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1175','Latifah','Branch','yes',1.28212E+12,'nec.urna.suscipit@Aliquam.edu','082-388-3980','Cash','24/4/1982','ZxVEzAK8');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1176','Joshua','Evans','yes',1.6926E+12,'ipsum@sapienimperdiet.ca','088-332-0633','Debit','19/5/1987','x83rrZdN');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1177','Benedict','Stevens','yes',1.08427E+12,'egestas.a@metusurnaconvallis.edu','083-493-5497','Cash','4/10/1995','eRggesCe');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1178','Leilani','Mays','yes',1.55958E+12,'metus.vitae@NullafacilisisSuspendisse.edu','080-979-5878','Debit','15/5/1997','QTm4yyXD');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1179','Cameron','Rivas','yes',1.49602E+12,'consectetuer.rhoncus.Nullam@loremauctorquis.org','086-995-1120','Debit','18/7/1982','8QuAZgMM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1180','Ahmed','Adams','yes',1.09426E+12,'eget.odio.Aliquam@tortoratrisus.net','089-747-2063','Debit','18/7/1974','49FDYTGX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1181','Bernard','Lucas','yes',1.06022E+12,'laoreet.ipsum.Curabitur@portaelita.org','087-440-0956','Cash','29/11/1963','Td4Tapuw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1182','Orson','Jones','yes',1.39507E+12,'accumsan.laoreet@adipiscingnonluctus.edu','089-352-1315','Debit','13/11/1961','PtS6XGCZ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1183','Kyra','Patel','yes',1.67667E+12,'interdum.feugiat@consectetuer.net','087-112-2177','Debit','13/3/1983','xRX2aeq2');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1184','Berk','Barlow','yes',1.03366E+12,'magnis.dis@orci.edu','084-865-5242','Credit','13/8/1999','GmUNU4Vw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1185','Craig','Baldwin','yes',1.59263E+12,'lorem@adipiscingnon.com','081-766-9878','Cash','5/1/1986','DmJeRuRG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1186','Jemima','Kemp','yes',1.57568E+12,'malesuada.vel@auctorvelit.com','081-191-3078','Cash','3/4/1968','HrNkWwNp');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1187','Colleen','Terry','yes',1.34837E+12,'arcu.Vestibulum.ut@id.org','081-093-9708','Debit','23/4/1991','6w5yK2TM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1188','Ivory','Cherry','yes',1.14825E+12,'Aliquam.fringilla.cursus@tellus.net','089-291-6182','Cash','7/9/1969','KaGkKrEe');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1189','Chester','Mckinney','yes',1.54804E+12,'varius.Nam.porttitor@anunc.co.uk','088-495-2323','Cash','1/7/1978','MM3KFtjE');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1190','Cole','Fuller','yes',1.34953E+12,'risus.Donec.egestas@tortor.com','082-728-0886','Cash','15/8/1963','aGpKFAmy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1191','Graham','Hunter','yes',1.37022E+12,'mollis@lacusEtiambibendum.co.uk','083-841-0675','Credit','5/3/1965','P9R42bTn');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1192','Celeste','Suarez','yes',1.6229E+12,'odio.auctor.vitae@nostra.com','082-783-7005','Credit','9/2/1962','4xPKFL7j');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1193','Katell','Ramsey','yes',1.35088E+12,'vitae@nectempusmauris.net','083-777-6458','Debit','11/8/1975','zY9Tx9Q7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1194','Walker','Buckner','yes',1.50371E+12,'elit.pede@felisDonectempor.co.uk','088-513-2235','Credit','20/2/1964','egaWu5Mc');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1195','Ingrid','Riggs','yes',1.0996E+12,'at.egestas.a@sociisnatoque.net','084-938-9952','Cash','22/1/1974','wNaQdUCu');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1196','Kaden','Barrett','yes',1.40883E+12,'Fusce.mi@pellentesqueafacilisis.org','089-037-0438','Debit','31/7/1982','mHh2UEGv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1197','Bradley','Greene','yes',1.61695E+12,'parturient.montes@elitpellentesquea.co.uk','087-812-3033','Credit','8/12/1970','ctc7cFWM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1198','Louis','Weeks','yes',1.41379E+12,'pharetra.sed.hendrerit@dictumProin.com','087-289-1125','Debit','21/11/1976','checN8sb');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1199','Damian','Harrison','yes',1.23799E+12,'dolor@vitaepurusgravida.com','085-810-7069','Debit','3/7/1996','ss7Mu2PU');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1200','Illana','Long','yes',1.57628E+12,'ornare.tortor.at@Utsemperpretium.org','080-454-1928','Debit','16/1/1977','5QKxBjth');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1201','Brendan','Robles','yes',1.18632E+12,'dui@feugiat.org','084-640-0344','Debit','29/2/1964','uet927Js');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1202','Paul','Jenkins','yes',1.41394E+12,'Ut.tincidunt.vehicula@sedconsequat.co.uk','088-517-9153','Credit','2/12/1986','XSW3hbDv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1203','Tana','Clemons','yes',1.19145E+12,'et.ultrices.posuere@maurissit.edu','089-412-7173','Cash','13/10/1985','67tHdZf4');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1204','Reece','Holt','yes',1.46471E+12,'ac.mattis@velit.net','083-264-8509','Cash','14/7/1975','A4gwW9VX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1205','Christian','Carrillo','yes',1.33546E+12,'eu@semper.edu','080-151-0629','Credit','28/11/1977','ZD34AQys');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1206','Tanek','Guy','yes',1.20449E+12,'ornare.sagittis@Nullatempor.net','087-732-7421','Debit','30/5/1982','JdzhQwsG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1207','Whilemina','Ramsey','yes',1.39418E+12,'fermentum.convallis@Proinvelit.org','086-569-6040','Debit','15/9/1969','6v8PZBjc');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1208','Emma','Carroll','yes',1.11539E+12,'ultrices.iaculis@risusIn.edu','080-283-6645','Debit','27/12/1965','sV5Hj4C7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1209','Ocean','Langley','yes',1.0441E+12,'torquent.per@atortorNunc.ca','083-634-5634','Debit','8/4/1986','5and8rZ2');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1210','Kane','Collins','yes',1.00242E+12,'erat.nonummy.ultricies@magnis.edu','083-740-1145','Debit','24/2/1990','2z83tkuU');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1211','Mira','Glenn','yes',1.29366E+12,'tincidunt.adipiscing.Mauris@Nunc.net','085-926-0148','Cash','16/3/1963','dArKuXvj');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1212','Diana','Erickson','yes',1.10223E+12,'eu.neque.pellentesque@Nullamsuscipit.edu','084-961-1815','Cash','16/10/1999','TmqfGC2P');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1213','Rama','Hood','yes',1.17219E+12,'Cras.eu@luctusvulputate.org','081-332-1415','Cash','28/4/1963','C4JfHAyy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1214','Jeremy','Estes','yes',1.28829E+12,'blandit.congue.In@ligula.org','084-504-9371','Cash','2/9/1980','SHxWYUpp');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1215','Maryam','Kelley','yes',1.68085E+12,'neque@acmieleifend.co.uk','085-032-4863','Debit','7/8/1991','h7cTXJWD');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1216','Palmer','Roth','yes',1.51684E+12,'Aenean.sed@nisimagna.edu','087-079-7772','Debit','17/9/1983','r4Vuph9r');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1217','Charissa','Whitley','yes',1.46665E+12,'natoque.penatibus.et@dictum.net','086-365-7133','Debit','3/11/1980','gkA5ybYL');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1218','Joy','Sampson','yes',1.31026E+12,'non@lacus.co.uk','089-350-0959','Cash','7/3/1985','nYFpSKk2');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1219','Carl','Cardenas','yes',1.5675E+12,'libero.mauris@Proindolor.ca','085-433-1057','Credit','20/1/1993','qY4Y6Y6p');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1220','Meredith','Hendricks','yes',1.41309E+12,'arcu@lacusAliquamrutrum.org','087-909-9496','Credit','21/2/1984','gJayvUH7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1221','Cade','Holman','yes',1.56654E+12,'pede@sit.edu','085-541-4245','Cash','6/9/1960','pZmDD9jK');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1222','Lee','Kirk','yes',1.27268E+12,'a.feugiat@volutpatNulladignissim.ca','083-958-7451','Cash','20/2/1967','Ya8KwbUX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1223','Marshall','Peters','yes',1.1666E+12,'lacinia.orci@In.org','089-460-5959','Credit','18/8/1992','RwSmbvUv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1224','Evan','Cleveland','yes',1.0756E+12,'porttitor@atortor.edu','083-718-9928','Cash','28/4/1985','LdyYQZSn');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1225','Gary','Holmes','yes',1.30811E+12,'tellus.faucibus.leo@congueInscelerisque.com','082-891-3062','Debit','13/9/1996','ZKQXF3nW');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1226','Claudia','Bowman','yes',1.56277E+12,'In.at.pede@Integereulacus.net','084-759-5494','Credit','9/1/1985','DtVgWnf6');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1227','Baker','Hendrix','yes',1.11932E+12,'eu.ultrices@Vivamus.edu','083-827-8346','Cash','15/6/1971','ezSvsRHC');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1228','Laith','Ayala','yes',1.54477E+12,'Nullam.feugiat.placerat@Nullasempertellus.net','085-001-3786','Credit','22/4/1973','npUDe3nS');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1229','Talon','Bass','yes',1.04889E+12,'pellentesque@Ut.co.uk','085-470-4343','Cash','27/3/1998','SrVKfA5B');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1230','Colin','Morin','yes',1.55445E+12,'et.rutrum.eu@tortor.ca','082-955-6301','Credit','15/9/1998','nCt9PyVw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1231','Jeremy','Yang','yes',1.63418E+12,'non@tristique.edu','080-464-5076','Cash','11/7/1974','LXrrU3Zv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1232','Clinton','Dejesus','yes',1.30837E+12,'Proin@fames.com','084-336-1486','Debit','30/12/1990','Vte6cQ2B');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1233','Oprah','Beach','yes',1.43177E+12,'justo.eu@cursusluctusipsum.org','083-409-9522','Cash','13/10/1964','D92uGC7k');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1234','Faith','Macdonald','yes',1.073E+12,'a.enim.Suspendisse@Duis.net','081-989-8420','Cash','12/10/1975','hrPX6BSh');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1235','Zeph','Juarez','yes',1.16083E+12,'lorem@dapibus.ca','082-779-1632','Debit','12/9/1964','eG922jGB');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1236','Ingrid','Hill','yes',1.25724E+12,'eleifend.nec@scelerisquenequesed.edu','089-687-8145','Cash','21/10/1981','ju28cA83');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1237','Beverly','Boone','yes',1.69606E+12,'ultricies.ornare.elit@ornareegestas.net','080-442-4656','Credit','2/10/1987','VE8dfGwN');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1238','Signe','Mann','yes',1.60855E+12,'Donec@ullamcorper.co.uk','088-575-4539','Credit','8/1/1971','8mgxAeja');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1239','Scarlet','Potter','yes',1.31137E+12,'mauris@vulputateduinec.net','089-796-8910','Debit','29/11/1978','Q9gFWTTb');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1240','Laurel','Delacruz','yes',1.0983E+12,'tincidunt.pede@sociisnatoquepenatibus.net','083-611-6227','Debit','1/6/1964','bYE7x6EJ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1241','Ignatius','Forbes','yes',1.21362E+12,'nisi.dictum.augue@nec.com','082-368-6486','Credit','13/5/1977','tBpRrnF5');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1242','Finn','Moses','yes',1.63007E+12,'commodo.auctor@loremauctorquis.ca','085-776-8993','Cash','1/2/1982','UnGnxYy7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1243','Dorian','Weeks','yes',1.66795E+12,'fringilla@eu.co.uk','082-011-3759','Credit','27/10/1980','CmyMk9uf');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1244','Jeanette','Neal','yes',1.42467E+12,'lobortis@in.edu','085-524-3387','Cash','25/7/1978','pStAqceT');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1245','Dean','Landry','yes',1.48241E+12,'ad.litora.torquent@vitaealiquameros.edu','080-847-1047','Cash','3/11/1982','y5aqBFrT');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1246','Irma','Schroeder','yes',1.17435E+12,'eget.metus@aliquetlibero.org','084-849-8226','Debit','11/11/1997','kKmBnUQq');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1247','Olga','Reynolds','yes',1.67448E+12,'amet.orci.Ut@sedorcilobortis.org','081-169-0380','Credit','18/3/1986','jBzrLXxY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1248','Carly','Hyde','yes',1.45709E+12,'eu@egetmetuseu.net','082-207-2548','Cash','5/6/1982','2NAZGpat');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1249','Quail','Acevedo','yes',1.44996E+12,'ac.urna.Ut@urna.org','087-611-2006','Cash','19/4/1984','bF8JRnt3');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1250','Moana','Finch','yes',1.06672E+12,'orci.Ut@nisiAenean.co.uk','081-079-7967','Cash','9/8/1978','x7e5WWt2');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1251','Rigel','Frye','yes',1.50496E+12,'Ut@gravida.net','083-853-4702','Debit','29/1/1991','jbyaR3AN');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1252','Elaine','Beck','yes',1.09581E+12,'pede.et@ornare.ca','086-281-6097','Cash','23/3/1967','N45YsL8G');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1253','Lillith','Sharp','yes',1.56226E+12,'Donec@Phasellusinfelis.ca','083-415-6027','Cash','12/1/1972','3PT6Hrmj');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1254','Driscoll','Daniels','yes',1.07218E+12,'Mauris@quis.co.uk','081-302-4026','Credit','11/1/1966','rbnZpDMx');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1255','Xantha','Gilmore','yes',1.32867E+12,'dictum@sodalesatvelit.ca','086-740-1310','Cash','8/9/1986','yhCC4pnN');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1256','Tiger','Sargent','yes',1.05582E+12,'luctus.vulputate@eu.org','088-403-0110','Cash','27/3/1963','srZ4kaZh');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1257','Vernon','Rodriguez','yes',1.54224E+12,'ac.mattis@urnasuscipit.org','082-262-9442','Credit','19/3/1975','nxtTJFzr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1258','Macey','Sullivan','yes',1.07645E+12,'primis.in@eratin.org','089-757-5318','Debit','12/2/1980','5juKJmXb');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1259','Josiah','Little','yes',1.65589E+12,'Suspendisse.commodo.tincidunt@molestietortor.org','087-229-5241','Debit','3/4/1989','s8vDwPd2');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1260','Alika','Franks','yes',1.10166E+12,'lorem.vehicula@dictumProin.org','084-873-2991','Debit','15/12/1960','are8NUBX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1261','Magee','Gomez','yes',1.39413E+12,'vulputate.risus.a@nunc.co.uk','089-121-8829','Cash','23/7/1972','5GV45zCm');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1262','Kim','Mayer','yes',1.25714E+12,'Donec.dignissim.magna@semegestas.org','081-421-8612','Credit','4/3/1997','jfszZrKe');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1263','Reese','Meyers','yes',1.54451E+12,'dignissim.pharetra@sapiencursus.com','080-732-7383','Cash','13/12/1967','88kJGbXB');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1264','Herman','Weeks','yes',1.35046E+12,'imperdiet.dictum.magna@odiosempercursus.edu','083-044-6012','Credit','31/12/1961','gQzPMTXw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1265','Julie','Ortega','yes',1.40705E+12,'velit@nislMaecenasmalesuada.edu','086-374-8129','Credit','10/11/1966','4eGVypuZ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1266','Ina','Nguyen','yes',1.4248E+12,'orci.lacus.vestibulum@nunc.ca','083-662-1089','Credit','6/12/1962','ChqezamA');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1267','Quin','Wolf','yes',1.57974E+12,'nisi.dictum.augue@nisiCum.co.uk','083-399-3021','Cash','12/1/1993','YD2AJ4Dp');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1268','Rosalyn','Gross','yes',1.27422E+12,'eu.sem.Pellentesque@sapienmolestieorci.co.uk','086-903-0845','Debit','10/2/1995','HGnzu35L');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1269','Lynn','Parks','yes',1.69229E+12,'et.euismod.et@ipsumSuspendisse.com','089-392-2969','Cash','16/8/1960','KBAxM2vc');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1270','Forrest','Marsh','yes',1.59297E+12,'arcu.ac.orci@estarcu.net','084-946-9996','Cash','12/3/1975','2aaakKPz');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1271','Anjolie','Melendez','yes',1.30491E+12,'fermentum.metus.Aenean@anteipsum.org','085-938-9574','Cash','9/4/1971','AYzE4GaA');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1272','Hiram','Parker','yes',1.1034E+12,'arcu.eu@etmagnisdis.net','081-966-0274','Cash','20/2/1981','JcTUwKaY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1273','Shana','Williamson','yes',1.23443E+12,'Donec@Etiamvestibulum.org','082-525-5269','Cash','9/3/1964','UaejjBg4');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1274','Rosalyn','Hicks','yes',1.17498E+12,'condimentum@CurabiturdictumPhasellus.ca','083-619-9341','Debit','15/12/1960','wuhceDSg');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1275','Lael','Slater','yes',1.28156E+12,'Donec@arcuAliquam.co.uk','089-642-8669','Debit','4/5/1969','uf9bhkJm');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1276','Magee','Lambert','yes',1.61484E+12,'vitae.dolor@nunc.edu','081-039-3841','Debit','1/5/1978','wQnbHXBc');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1277','Alice','Norton','yes',1.06631E+12,'eget@orciUtsagittis.com','081-306-0108','Debit','23/12/1997','6kTepUzY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1278','Nissim','Fields','yes',1.20306E+12,'id@non.edu','087-381-3309','Debit','30/7/1999','jfPESepb');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1279','Aiko','Reeves','yes',1.19195E+12,'posuere@Morbivehicula.com','082-999-6129','Debit','9/10/1977','fPL4XpNP');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1280','Kenyon','Santana','yes',1.57711E+12,'lectus.Cum@euismod.ca','081-889-7254','Credit','26/4/1965','4KrpGJHv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1281','Plato','Crane','yes',1.49244E+12,'fringilla.est@fringilla.org','081-926-3414','Debit','22/2/1986','uqkPDSWY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1282','Carl','Johnson','yes',1.12259E+12,'eu@malesuadavel.edu','084-459-2087','Credit','5/3/1979','DhNA7c74');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1283','Ginger','Daniels','yes',1.56595E+12,'erat@non.com','083-728-2689','Cash','1/10/1980','H2Uk5GSy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1284','Morgan','Adams','yes',1.12595E+12,'ligula.Aliquam.erat@sapiengravidanon.co.uk','085-194-1966','Credit','6/5/1972','5MBVxsdy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1285','Logan','Boyle','yes',1.08393E+12,'erat.in@dictumultriciesligula.net','088-157-3714','Debit','1/9/1964','uSN5gmHX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1286','Kylynn','Burt','yes',1.53137E+12,'Quisque.ornare.tortor@magnaDuisdignissim.co.uk','081-004-2930','Credit','12/6/1971','3yFuFhDQ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1287','Zia','Yang','yes',1.31763E+12,'nec.ante.Maecenas@Vivamus.org','084-622-9759','Cash','27/1/1972','x6hut7Rv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1288','Sonya','Jensen','yes',1.15113E+12,'vel@a.com','089-717-0037','Cash','24/6/1976','hewbzYWC');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1289','Kameko','Warner','yes',1.55115E+12,'tempus@nonummy.co.uk','086-474-0275','Debit','16/1/1962','Z2qNpqqp');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1290','Grant','Eaton','yes',1.10938E+12,'Aliquam@acturpis.ca','081-682-9830','Cash','26/10/1982','C9e8gDzb');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1291','Orlando','Hurley','yes',1.41499E+12,'in.dolor.Fusce@enimnisl.com','086-534-9703','Debit','28/8/1991','hTtvRdMw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1292','Barry','Montoya','yes',1.49482E+12,'et.commodo@enimnectempus.edu','084-633-9308','Cash','20/6/1976','zPwayLUw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1293','Bert','Bradshaw','yes',1.0681E+12,'in.dolor.Fusce@Fuscedolorquam.com','083-181-2224','Debit','6/9/1997','uZxr5jmk');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1294','Upton','Stephenson','yes',1.62037E+12,'odio.sagittis.semper@vestibulum.co.uk','089-933-9366','Cash','11/4/1967','YJ3njpHU');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1295','Inga','Justice','yes',1.07804E+12,'a.aliquet.vel@nonummyipsum.ca','082-671-0818','Cash','2/5/1960','WchDnKbf');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1296','Rigel','Hebert','yes',1.68849E+12,'iaculis.odio.Nam@pretium.org','087-701-0043','Debit','14/1/1978','mCXkU3JV');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1297','Hop','Frost','yes',1.0739E+12,'Nam.tempor.diam@Nulla.net','080-579-8179','Cash','5/3/1988','KNwBwxdC');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1298','Cody','Roach','yes',1.46111E+12,'est.Nunc.ullamcorper@anteipsumprimis.org','086-387-1874','Debit','13/1/2000','ewE5geRP');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1299','Priscilla','Ware','yes',1.40725E+12,'Aenean.sed@nascetur.net','089-091-2113','Debit','7/1/1969','UBCGYDs7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1300','Kasper','Bass','yes',1.29304E+12,'ut.eros.non@Namtempor.com','082-638-3143','Debit','29/5/1980','K8CRCrtr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1301','Kimberly','Hurst','yes',1.2134E+12,'dictum.mi@risusaultricies.co.uk','082-279-9468','Cash','18/5/1996','ATnPRRS9');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1302','Tyler','Jimenez','yes',1.58864E+12,'blandit.enim.consequat@at.ca','087-455-2732','Debit','12/2/1993','bMPDQZFk');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1303','Farrah','Burns','yes',1.68523E+12,'quis.massa@Nuncac.co.uk','089-562-8288','Debit','20/2/1990','mXzR4AKY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1304','Kennedy','Klein','yes',1.55283E+12,'et.pede@enimCurabiturmassa.net','084-400-1134','Credit','5/9/1960','gPcbMXGD');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1305','Lacota','Joyner','yes',1.4992E+12,'tempus@commodo.co.uk','081-056-5588','Debit','1/3/1972','eWJ52Lmt');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1306','Eleanor','Underwood','yes',1.16919E+12,'aliquet@gravidaPraesenteu.co.uk','087-051-9858','Cash','17/9/1998','zF8QPdLD');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1307','Amethyst','Watts','yes',1.26976E+12,'arcu.ac@justonecante.com','087-643-5467','Cash','4/9/1972','vbZ53gy7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1308','Keegan','Hill','yes',1.53024E+12,'dui.nec.urna@odio.org','082-358-9347','Cash','8/7/1983','ErC65Lsy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1309','Madeson','Moran','yes',1.28272E+12,'arcu.Vestibulum.ut@turpis.co.uk','080-647-9187','Debit','10/1/1992','qfy3kL3W');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1310','Cairo','Foley','yes',1.06545E+12,'Aenean.eget.metus@nasceturridiculusmus.org','089-173-5888','Debit','21/11/1992','4kaaHZMQ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1311','Quinlan','Richardson','yes',1.40598E+12,'nisl@senectusetnetus.co.uk','080-933-4854','Credit','6/10/1993','PfQTmgMh');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1312','Denton','Roth','yes',1.45234E+12,'tristique.pellentesque@IncondimentumDonec.ca','087-075-1221','Cash','8/10/1963','tHZ8Nuge');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1313','Erich','Ashley','yes',1.61094E+12,'bibendum.sed.est@mifelisadipiscing.ca','087-128-8705','Debit','8/3/1967','zCKVfJqc');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1314','Hammett','Perez','yes',1.0113E+12,'urna.Nullam@diamnunc.ca','083-308-3471','Cash','8/4/1972','xvaS98gS');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1315','Arden','Park','yes',1.52966E+12,'nec.diam@atvelitCras.net','083-523-9705','Debit','2/6/1961','8rcLtsr5');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1316','Demetrius','Castro','yes',1.57602E+12,'dolor@Integer.org','089-680-5282','Credit','13/4/1960','KfxDLzyA');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1317','Kylynn','Santana','yes',1.21942E+12,'ante@utipsumac.com','085-858-3803','Credit','4/4/2000','CgA9tSxv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1318','Judith','Patrick','yes',1.21471E+12,'cursus.diam.at@feugiatnonlobortis.co.uk','085-509-0423','Cash','26/10/1970','7MCCUYY7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1319','Garrison','Delgado','yes',1.61177E+12,'Proin.sed@nonantebibendum.com','088-466-1468','Credit','27/11/1984','k7mxGhej');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1320','Noble','Schneider','yes',1.16165E+12,'felis.purus.ac@disparturient.ca','082-186-2296','Cash','1/7/1966','8KZaJ2F5');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1321','Stephen','Haney','yes',1.67024E+12,'lacus.Ut@consequat.net','081-960-3785','Cash','14/5/1996','KpdCrQc8');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1322','Tyrone','Leach','yes',1.0806E+12,'nibh.Phasellus.nulla@Cumsociisnatoque.ca','080-583-2426','Debit','15/12/1982','3sWmhywc');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1323','Garth','Cole','yes',1.20742E+12,'faucibus.leo.in@dolor.com','082-917-4858','Credit','10/10/1986','mF6psN9C');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1324','Chiquita','Castillo','yes',1.03847E+12,'Curae.Donec.tincidunt@sollicitudinamalesuada.co.uk','083-909-8130','Credit','17/9/1996','Mm2Fu5gp');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1325','Marcia','Hutchinson','yes',1.08583E+12,'Quisque.imperdiet@Etiam.org','088-937-5635','Credit','17/9/1976','K9ScVBvT');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1326','Kiona','Mclaughlin','yes',1.65587E+12,'at.libero@Aeneanegestashendrerit.edu','083-495-6927','Credit','27/7/1963','rjbxujdf');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1327','Julie','Harris','yes',1.31944E+12,'Nulla@ornare.co.uk','080-810-4057','Credit','23/8/1971','vpJNpgWn');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1328','Lucian','Mcmahon','yes',1.04797E+12,'imperdiet.nec.leo@sollicitudinadipiscingligula.co.uk','081-975-5964','Debit','26/3/1985','zrK94Nhv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1329','Joy','Wright','yes',1.35689E+12,'velit.eu@dolornonummyac.net','085-602-9884','Cash','7/5/1970','UeMDyu2h');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1330','Riley','Bartlett','yes',1.26881E+12,'interdum@nisiAeneaneget.net','080-166-4870','Cash','3/3/1990','af6n5yMm');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1331','Declan','Clemons','yes',1.16836E+12,'amet@placeratvelit.ca','080-071-0694','Cash','14/4/1980','pzLd9MsG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1332','Xavier','Mullen','yes',1.66306E+12,'eu.nulla.at@leoMorbi.co.uk','089-810-4817','Cash','6/3/1987','uLfPEZUe');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1333','Isadora','Barrera','yes',1.41336E+12,'Vestibulum.accumsan@indolorFusce.net','082-149-4554','Cash','5/1/1998','mu2D96fa');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1334','Solomon','Richardson','yes',1.264E+12,'lorem.ut@Nunc.ca','087-652-9538','Cash','4/9/1978','gmADXxuy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1335','Hunter','Norman','yes',1.47652E+12,'metus.In.nec@elementumduiquis.edu','081-041-5431','Credit','6/10/1997','BYZLv32f');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1336','Ila','Mejia','yes',1.5025E+12,'et@ami.co.uk','084-633-2315','Credit','9/3/1999','sY7HrfzL');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1337','Cherokee','Bradford','yes',1.44339E+12,'odio.semper@nasceturridiculusmus.com','089-325-9721','Credit','27/8/1963','4gDdPwzK');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1338','Kerry','Bennett','yes',1.52272E+12,'nec@pedePraesenteu.co.uk','080-962-4445','Credit','7/5/1990','EXFgRyFj');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1339','Vance','Harrison','yes',1.22426E+12,'augue.eu@velarcueu.edu','088-116-9723','Debit','16/10/1994','JVVAxJu2');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1340','Michael','Cotton','yes',1.3907E+12,'eu@eratneque.net','085-549-7574','Cash','17/4/1979','RB9hfwQF');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1341','Fiona','Stanton','yes',1.02501E+12,'natoque.penatibus@ornareFusce.co.uk','085-839-1899','Credit','28/1/1977','nuxF2eJt');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1342','Abraham','Ruiz','yes',1.50656E+12,'fringilla.purus.mauris@ipsumPhasellus.ca','080-133-7323','Debit','15/7/1990','TtCeb8bn');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1343','Liberty','Battle','yes',1.22085E+12,'massa.Mauris@eteros.net','089-043-9925','Debit','26/7/1983','CbYF6LUg');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1344','Aquila','Randolph','yes',1.25336E+12,'ridiculus.mus@dui.ca','083-023-2325','Debit','15/2/1969','qvUtS7Fv');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1345','Constance','Sheppard','yes',1.09969E+12,'Nulla.interdum.Curabitur@sitamet.ca','087-234-1033','Debit','13/9/1999','y36uXczF');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1346','Zia','Osborne','yes',1.66935E+12,'Aliquam.nisl@erosNam.net','080-519-0948','Cash','24/12/1998','AfCrA7MF');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1347','Matthew','Berger','yes',1.65195E+12,'vehicula.Pellentesque.tincidunt@elit.org','084-323-7741','Cash','29/5/1973','NR9gesS5');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1348','Scarlet','Dawson','yes',1.58839E+12,'elit@bibendumfermentummetus.co.uk','082-002-2833','Cash','16/4/1976','s8DMUPJ8');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1349','Salvador','Johns','yes',1.46562E+12,'Suspendisse@adipiscing.org','089-853-5609','Credit','31/12/1988','6Us7uvAw');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1350','Kathleen','Rivas','yes',1.34935E+12,'pharetra@Aliquam.ca','086-500-3945','Debit','10/3/1970','DaMRJ34r');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1351','Lenore','Brooks','yes',1.41855E+12,'Nulla.tincidunt@parturientmontes.net','086-980-6408','Cash','5/8/1991','7Q2xgTqT');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1352','Quentin','Beard','yes',1.31126E+12,'congue.In.scelerisque@scelerisque.com','080-176-1864','Cash','25/6/1991','hMnet8yk');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1353','Leila','Horton','yes',1.10166E+12,'ornare.libero.at@anteMaecenas.org','089-135-7606','Debit','22/1/1972','w6DN3PF6');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1354','Bert','Campos','yes',1.47947E+12,'nibh.sit@Suspendissesed.ca','080-501-1768','Cash','22/3/1963','k8GaNmbs');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1355','Micah','Zamora','yes',1.07053E+12,'congue@orciPhasellus.org','082-297-9513','Credit','20/11/1992','t9SG6Jkg');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1356','Keelie','Clemons','yes',1.04132E+12,'Proin.nisl@Maecenas.org','083-691-9684','Debit','1/5/1964','tCczbUUG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1357','Maile','Pate','yes',1.45052E+12,'tincidunt.Donec.vitae@mauris.edu','088-442-9982','Credit','18/10/1966','f9VNRaUM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1358','Alexa','Marshall','yes',1.63894E+12,'In.condimentum.Donec@idanteNunc.edu','087-121-5838','Debit','13/5/1996','SeH2DYWf');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1359','Jordan','Bass','yes',1.55972E+12,'Sed@vitaedolor.ca','089-587-6983','Debit','9/10/1972','f4PjGeFS');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1360','Lionel','Huber','yes',1.17397E+12,'at@rutrumFusce.edu','086-962-0992','Cash','11/10/1975','qJjjjRts');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1361','Aspen','Rodriquez','yes',1.69132E+12,'lobortis.quam@Curabiturut.co.uk','084-550-1075','Debit','17/10/1971','3Mb3TEbV');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1362','Fuller','Barnett','yes',1.11456E+12,'Curabitur.vel.lectus@rhoncus.co.uk','089-766-3530','Cash','19/4/1984','FHtpn2wM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1363','Hiram','Glover','yes',1.69416E+12,'eu.euismod@Nam.ca','086-617-0482','Debit','2/8/1961','uJgpkhVS');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1364','Phyllis','Rutledge','yes',1.57008E+12,'nascetur.ridiculus@Morbiquis.net','084-178-2590','Cash','13/5/1966','eDVAsGPA');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1365','Mechelle','Olsen','yes',1.31816E+12,'pellentesque@acmattisornare.org','082-420-2945','Debit','14/3/1969','9B8d7z87');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1366','Kevyn','Mack','yes',1.34402E+12,'pellentesque@sapienmolestieorci.com','088-732-0276','Cash','21/8/1979','Z2eujZHW');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1367','Clark','Gill','yes',1.46621E+12,'ornare.elit.elit@convallis.net','081-909-1993','Debit','5/3/1993','2xAgdhVn');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1368','Adrian','Calderon','yes',1.39083E+12,'at.fringilla.purus@cursusin.co.uk','085-781-6195','Debit','16/2/1994','KcXJABK8');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1369','Marsden','Riddle','yes',1.5119E+12,'libero.est@Pellentesqueultriciesdignissim.co.uk','082-399-2823','Credit','7/6/1967','Dv9rtdHZ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1370','Felicia','Townsend','yes',1.577E+12,'at.auctor@Quisqueaclibero.ca','086-738-2929','Credit','13/6/1977','VCJjMWYF');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1371','Blaine','Moran','yes',1.65212E+12,'dui@pedeSuspendisse.net','085-608-9342','Debit','19/1/1988','EG3VaVxG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1372','Alvin','Hendrix','yes',1.31152E+12,'id.risus@Integerin.net','085-678-3170','Debit','1/4/1996','BJYncpXr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1373','Callum','Wilson','yes',1.24712E+12,'tempor.erat.neque@Pellentesquetincidunttempus.com','089-649-6553','Cash','4/2/1998','tS3vVCzH');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1374','Keegan','Conway','yes',1.11322E+12,'tellus@Sedcongue.com','082-111-9766','Cash','28/3/1970','gt6KkX3D');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1375','Idola','Moss','yes',1.24074E+12,'dui.nec.urna@mollisnec.co.uk','086-524-2056','Credit','14/8/1995','ECCTHggH');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1376','Dante','Erickson','yes',1.56346E+12,'mattis@nectellusNunc.org','083-341-0308','Debit','14/9/1996','F2fqsMM5');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1377','Ray','Lopez','yes',1.41583E+12,'nec.euismod@netuset.org','083-702-6506','Cash','1/2/1987','LGmAdDsL');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1378','Jessica','Cantu','yes',1.45848E+12,'eleifend.Cras.sed@Donecporttitor.co.uk','087-301-0367','Debit','26/4/1963','G7CKxd8t');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1379','Yoko','Booth','yes',1.14295E+12,'mauris.elit.dictum@quam.ca','087-152-6787','Cash','15/10/1975','pVuDAk3X');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1380','Camilla','Holman','yes',1.57709E+12,'Praesent@arcuVestibulum.org','083-491-6966','Debit','29/11/1991','fqLzTAP2');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1381','Wanda','Price','yes',1.67321E+12,'eu@taciti.co.uk','081-016-5592','Debit','13/1/1963','YatfTtJP');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1382','Ferdinand','Morrow','yes',1.08165E+12,'hendrerit.a@tellusloremeu.ca','085-722-6164','Cash','8/7/1998','BybyKMZB');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1383','Emery','Mcintosh','yes',1.46153E+12,'facilisis.eget@fermentumarcu.ca','086-808-9969','Credit','28/2/1965','FKXUKu2Y');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1384','Clementine','Boone','yes',1.23387E+12,'fringilla.purus.mauris@auctor.ca','088-477-5699','Credit','29/11/1986','Q5dC5HbK');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1385','Uriah','Chen','yes',1.01852E+12,'a.ultricies.adipiscing@orcilacusvestibulum.com','088-069-6128','Cash','9/1/1989','M7PFzJZX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1386','Larissa','Lambert','yes',1.15661E+12,'fringilla.Donec@mollisPhaselluslibero.org','089-691-3078','Debit','19/12/1990','TzdDGHmL');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1387','Dillon','Mcconnell','yes',1.06457E+12,'faucibus.ut.nulla@Aliquam.com','082-851-3863','Credit','15/3/1988','eV3CHbvJ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1388','Kevyn','Monroe','yes',1.57725E+12,'sed.dolor@sitametfaucibus.com','087-613-7551','Credit','5/12/1969','dMcwg9pP');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1389','Jasmine','Johns','yes',1.21712E+12,'In.lorem.Donec@laoreet.net','088-596-6715','Credit','21/6/1993','WwukBFcU');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1390','Emerald','Petty','yes',1.03366E+12,'libero@Sedpharetrafelis.edu','081-085-1172','Debit','10/12/1999','VCUTBzvr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1391','April','Moss','yes',1.60199E+12,'et@augue.org','088-216-7450','Debit','18/9/1987','DMcpWUHF');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1392','Uta','Hood','yes',1.48609E+12,'nunc.est.mollis@arcuiaculis.ca','080-017-9777','Cash','13/3/1996','eVyV69JS');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1393','Ashton','Mcdonald','yes',1.24621E+12,'vehicula.risus.Nulla@tacitisociosqu.co.uk','086-822-6629','Debit','29/6/1996','WXQDaGPQ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1394','Ryan','Fulton','yes',1.40448E+12,'amet@tristiquesenectus.co.uk','087-679-6284','Debit','22/5/1974','9DsBHw7Q');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1395','Zia','Walton','yes',1.637E+12,'velit.Aliquam@quisurnaNunc.com','080-849-1678','Cash','31/1/1963','wDHMabvj');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1396','Rachel','Avery','yes',1.67561E+12,'lorem.tristique@estconguea.org','086-976-4184','Cash','19/1/1994','Us524FLx');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1397','Ezekiel','Allison','yes',1.60814E+12,'vel@interdum.ca','083-996-3306','Cash','10/4/1982','7tDxwGNb');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1398','Alfonso','Whitaker','yes',1.40432E+12,'enim.nisl@veliteu.org','085-865-6354','Cash','26/11/1997','S8X9QtJA');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1399','Oprah','Berger','yes',1.12953E+12,'per@pedemalesuadavel.org','089-521-2458','Cash','15/9/1974','JVVh9udr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1400','Solomon','Cox','yes',1.0625E+12,'Pellentesque.habitant@sapienmolestieorci.com','085-168-3347','Cash','22/4/1990','GBr3zR4q');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1401','Maia','Rosa','yes',1.10081E+12,'nonummy@turpis.ca','082-807-1526','Credit','14/12/1998','qnyD67Sr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1402','Vanna','Moss','yes',1.3333E+12,'metus.sit@Nullam.org','081-674-1677','Cash','6/5/1977','Jpye6gZF');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1403','Morgan','Curry','yes',1.00962E+12,'Etiam@Vivamus.co.uk','080-765-3060','Credit','8/2/1996','HFJsbQ4H');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1404','Tanner','Higgins','yes',1.01151E+12,'urna.Nullam.lobortis@scelerisquesed.co.uk','082-169-3275','Credit','7/3/1982','gfcqGQaH');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1405','Sawyer','Bender','yes',1.26462E+12,'ac.libero@rhoncus.com','086-458-8853','Cash','22/6/1979','sj5jnSDY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1406','Amal','Ferguson','yes',1.67688E+12,'Aliquam.ultrices.iaculis@fringillapurusmauris.edu','088-433-5556','Cash','26/1/2000','hMjLRxju');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1407','Candace','Robbins','yes',1.61291E+12,'cursus.purus.Nullam@egestasurnajusto.com','086-420-9207','Cash','5/4/1997','y34Wff6C');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1408','Allen','Rivers','yes',1.27106E+12,'nec@luctus.org','085-358-4209','Credit','12/8/1984','ttvVdJuY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1409','Martena','Lawson','yes',1.53977E+12,'at@acmattisornare.ca','082-967-3837','Credit','1/6/1996','DAKQ95bs');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1410','Jameson','Hutchinson','yes',1.46284E+12,'sit.amet.consectetuer@anteVivamusnon.com','084-539-2487','Cash','24/6/1977','JqGQyjU5');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1411','Tanya','Booth','yes',1.01972E+12,'nec.malesuada@luctusutpellentesque.com','088-260-0545','Cash','27/6/1981','EAwgw9eu');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1412','Destiny','Neal','yes',1.40471E+12,'at.egestas@Integeridmagna.edu','080-788-1649','Cash','24/5/1965','PUqUaDeX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1413','Jasmine','Underwood','yes',1.36652E+12,'Proin.non.massa@tinciduntnuncac.org','081-688-5767','Cash','12/10/1999','tC9CxETB');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1414','Desirae','Walsh','yes',1.30871E+12,'libero.nec@nonjustoProin.org','088-416-7778','Cash','9/4/1961','2XL3Cuu4');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1415','Yvette','Holloway','yes',1.34245E+12,'erat.in@dapibusrutrum.org','086-406-4202','Debit','16/4/1985','bzXQgKRE');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1416','Naida','Saunders','yes',1.23462E+12,'interdum.Nunc@dolor.net','081-967-7783','Cash','16/10/1979','2csUuQRL');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1417','Odessa','Castro','yes',1.54404E+12,'blandit.mattis.Cras@Vivamus.co.uk','084-349-4434','Credit','25/8/1983','X5XZ2nw3');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1418','Zeph','Mccray','yes',1.08979E+12,'eu.elit@Suspendissealiquet.com','084-758-9610','Credit','13/12/1972','F3xTDhH9');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1419','Owen','Stephens','yes',1.54409E+12,'pede.blandit.congue@eratvel.edu','082-590-3275','Cash','25/6/1995','GAyscq3p');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1420','Kevin','Tillman','yes',1.63084E+12,'auctor@Cras.net','081-278-9415','Cash','22/10/1997','7Kxdpcpy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1421','Quinlan','Hester','yes',1.53087E+12,'ultrices.a@suscipit.com','082-327-3792','Credit','3/10/1996','CmwD6Rsb');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1422','Amos','Madden','yes',1.49326E+12,'porttitor@Quisquefringillaeuismod.com','085-592-9841','Credit','29/1/1983','8zz4JUL9');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1423','Giacomo','Montgomery','yes',1.44227E+12,'faucibus.orci@duiSuspendisseac.net','088-823-3077','Debit','24/12/1987','s49r6Lrd');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1424','Brody','Miranda','yes',1.60846E+12,'elit.dictum.eu@esttempor.org','085-799-9004','Debit','10/9/1986','wuxe56QU');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1425','Jamal','Beach','yes',1.02226E+12,'lectus.pede@dignissimpharetra.co.uk','082-846-8638','Credit','17/11/1962','RRaStfRR');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1426','Thane','Gregory','yes',1.41879E+12,'ac.ipsum@adipiscingelit.ca','081-734-9105','Cash','7/5/1994','MajuzSwY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1427','Clio','Garza','yes',1.46056E+12,'natoque@hendreritconsectetuer.edu','088-397-5919','Cash','4/6/1973','khQchKHt');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1428','Stewart','Long','yes',1.33128E+12,'hymenaeos@molestiearcu.co.uk','082-342-6503','Cash','13/3/2000','Y5mxp3D8');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1429','Inga','Harrell','yes',1.57533E+12,'Proin.non@nulla.com','089-512-0007','Cash','12/5/1995','tkb2uHMy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1430','Salvador','Kline','yes',1.34018E+12,'mattis.velit@sit.co.uk','086-566-7809','Cash','2/6/1970','sSwgmJQq');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1431','Willa','Salazar','yes',1.32896E+12,'non.justo.Proin@egetlaoreet.co.uk','089-232-4449','Debit','30/4/1981','VytmnnpM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1432','Kato','Nichols','yes',1.46717E+12,'Proin.vel@lectus.org','088-433-4548','Credit','16/9/1986','xqCM2jrp');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1433','Savannah','Hess','yes',1.57407E+12,'ligula.tortor.dictum@euodio.org','083-813-5475','Cash','26/2/1983','G7NewGjW');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1434','Cassandra','Mejia','yes',1.45614E+12,'Quisque.ornare.tortor@molestiearcu.co.uk','081-300-3105','Credit','17/8/1976','CLFzPdBM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1435','Kelsie','Caldwell','yes',1.31119E+12,'Nunc@interdum.co.uk','089-151-7446','Cash','15/2/1962','RhbTP8Bk');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1436','Moses','Woodward','yes',1.09617E+12,'nascetur@dolorDonec.net','085-614-3269','Cash','1/10/1978','3Ntrfx62');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1437','Quamar','Washington','yes',1.53083E+12,'libero.Proin.sed@nisinibhlacinia.ca','087-851-6887','Cash','12/6/1980','YVP8ekmR');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1438','Octavius','Villarreal','yes',1.13135E+12,'rhoncus.Proin@odio.ca','089-332-0255','Credit','16/9/1988','Untd5DHz');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1439','Cade','Brock','yes',1.44602E+12,'cursus@utpharetrased.ca','087-367-8280','Cash','2/5/1998','TjYepEXX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1440','Adele','Joyce','yes',1.23721E+12,'nec.mollis@necimperdiet.ca','082-542-6577','Credit','16/6/1975','WU5BrAzx');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1441','Reed','Waller','yes',1.21069E+12,'amet.faucibus@necluctusfelis.ca','080-191-0985','Debit','15/12/1969','T9Qpwfar');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1442','Stephanie','Mendoza','yes',1.16114E+12,'enim.Nunc@penatibusetmagnis.com','081-583-2239','Cash','10/7/1998','meBmav7s');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1443','Maya','Gardner','yes',1.53387E+12,'dictum@a.com','084-963-3685','Cash','12/12/1992','DWqeLfxh');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1444','Perry','Bradley','yes',1.53424E+12,'euismod@pellentesquetellussem.co.uk','081-584-4315','Cash','26/8/1980','FkayWyZk');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1445','Heidi','Lowe','yes',1.33836E+12,'nec@aliquam.org','081-371-8253','Cash','14/6/1981','96qG8sCN');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1446','Kelsie','Macdonald','yes',1.68498E+12,'eget.ipsum@loremsemper.edu','080-040-7576','Cash','3/10/1963','PXh8Y28G');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1447','Ruby','Cote','yes',1.27819E+12,'ligula.Aenean@eunequepellentesque.com','083-393-6050','Credit','24/10/1971','QHbUtq3R');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1448','Aurora','Benton','yes',1.62611E+12,'dis.parturient.montes@Integer.ca','084-273-6929','Debit','17/6/1978','Xu9rcU4Z');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1449','Tanek','Wiley','yes',1.0058E+12,'iaculis.enim.sit@purusinmolestie.org','083-667-3275','Cash','29/5/1961','zxWuxbPM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1450','Heather','Padilla','yes',1.32487E+12,'nec.mollis@mattisIntegereu.net','082-140-8230','Debit','22/9/1960','4hacMY7j');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1451','Marsden','Kent','yes',1.50432E+12,'magna.tellus@Aliquamultrices.com','085-127-5928','Cash','25/5/1977','qkpAhrX6');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1452','Sage','Patrick','yes',1.518E+12,'Aenean.euismod@natoquepenatibus.org','086-339-9627','Credit','26/11/1990','zWMwz5em');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1453','Daniel','Randall','yes',1.14091E+12,'libero.Proin@aliquetlobortis.edu','087-486-9419','Cash','26/2/1992','8a8Bm2a8');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1454','Chaim','Avery','yes',1.63535E+12,'vel@fringillami.ca','083-233-6882','Cash','12/2/1978','cFasGUrc');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1455','Nehru','Mcintyre','yes',1.12516E+12,'Maecenas.malesuada@arcu.com','081-455-9223','Cash','1/6/1984','qLqfPxbR');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1456','Plato','Hewitt','yes',1.27468E+12,'amet.nulla@Proindolor.co.uk','085-755-0336','Credit','29/7/1974','TthsdftV');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1457','Zia','Bernard','yes',1.22476E+12,'turpis.nec.mauris@purus.co.uk','080-139-8770','Cash','22/11/1962','hvR68SDn');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1458','Fay','Harmon','yes',1.02147E+12,'magna@sagittis.edu','084-059-7030','Credit','9/8/1994','wUc7ZssQ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1459','Aphrodite','Beard','yes',1.30505E+12,'cursus.a@tristiquealiquetPhasellus.com','086-802-0508','Credit','12/10/1966','qLpaD75W');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1460','Serena','Potter','yes',1.56814E+12,'enim@disparturient.edu','087-196-8126','Debit','27/3/1994','F6EHz3L7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1461','Elijah','Mcmahon','yes',1.15576E+12,'nisi.nibh@vitaesodalesnisi.com','086-475-8707','Debit','3/6/1984','eXWF5XgV');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1462','Tate','Mcdonald','yes',1.61054E+12,'sagittis.lobortis.mauris@et.net','080-116-3085','Debit','12/10/1968','JgmdgrXW');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1463','Elizabeth','Hale','yes',1.58879E+12,'a.malesuada.id@euplacerateget.org','083-412-6107','Cash','1/2/1988','2n7BFvvx');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1464','Channing','Gentry','yes',1.63322E+12,'ullamcorper.viverra@aliquetmolestie.ca','089-242-6498','Credit','1/6/1989','gSqyzmzq');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1465','Sawyer','Sanchez','yes',1.05518E+12,'cursus@egestas.org','080-123-7326','Debit','27/5/1997','LDDAuNeH');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1466','Paki','Faulkner','yes',1.3517E+12,'magnis@tellus.ca','084-275-0848','Credit','27/12/1962','84MSbqRG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1467','Channing','Mcguire','yes',1.31323E+12,'Integer@Aeneaneuismodmauris.net','080-909-7540','Cash','27/7/1998','dyfptHdm');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1468','Kristen','Wilcox','yes',1.01575E+12,'semper@dis.com','086-679-6881','Credit','28/2/1979','TFXDhmAV');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1469','Halla','Romero','yes',1.68787E+12,'tellus.eu.augue@odiovel.edu','087-728-8779','Cash','24/2/1993','kV3WgzKK');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1470','Justine','Rutledge','yes',1.36562E+12,'neque@arcu.ca','088-880-4980','Cash','22/11/1969','fKAf47BE');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1471','Ila','Silva','yes',1.20336E+12,'eu@seddictum.co.uk','089-772-6646','Credit','28/6/1986','chn3uu2E');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1472','Patience','Snyder','yes',1.13809E+12,'magna.et@ligulaAliquam.edu','087-144-8905','Credit','8/4/1991','MPBnhk5Y');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1473','Linus','Cherry','yes',1.53699E+12,'ac@interdumligulaeu.net','085-686-2198','Credit','12/12/1968','QPMe2bTz');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1474','Lucius','Warren','yes',1.27383E+12,'semper.et@auctorullamcorpernisl.net','082-967-8817','Cash','28/7/1999','Ctf52Kxa');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1475','Unity','Myers','yes',1.17422E+12,'hendrerit.neque@torquent.com','088-447-6076','Credit','16/5/1992','ndeLDPNF');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1476','Zenaida','Newman','yes',1.55593E+12,'eleifend.non.dapibus@acturpisegestas.edu','088-471-4058','Debit','7/2/1978','fpjhXdA7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1477','Quon','Robles','yes',1.2198E+12,'congue@molestie.org','084-186-6573','Debit','7/12/1987','wkWx99Zt');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1478','Riley','Beck','yes',1.30371E+12,'risus.a@euerosNam.co.uk','088-083-3291','Cash','23/10/1981','prycDSxR');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1479','Evangeline','Palmer','yes',1.21282E+12,'ornare.sagittis@Sed.ca','080-870-3106','Credit','29/8/1996','DuXLpNbq');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1480','Penelope','Brooks','yes',1.53966E+12,'ornare.placerat.orci@Nam.net','084-940-6566','Cash','4/10/1984','9FQ4CFss');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1481','Thomas','Valdez','yes',1.66492E+12,'Etiam@acarcuNunc.edu','084-464-3664','Debit','22/11/1976','btWTCTjn');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1482','Curran','Cash','yes',1.59172E+12,'enim.Curabitur@orci.com','088-293-4518','Credit','30/3/1995','7ph6C6zt');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1483','Kibo','Mccullough','yes',1.30259E+12,'In@Maurisblandit.ca','089-621-9767','Debit','12/4/1981','cKDSwZza');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1484','Michael','Brock','yes',1.28159E+12,'Quisque.ac@lectusconvallisest.co.uk','083-005-0149','Debit','14/2/1993','sypHpehm');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1485','Brian','Newman','yes',1.18886E+12,'Ut.sagittis.lobortis@ultrices.edu','083-648-0465','Cash','16/7/1998','FZbWDjhQ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1486','Sarah','Mccarthy','yes',1.09226E+12,'Etiam.imperdiet@ipsumdolorsit.ca','082-744-3804','Cash','22/10/1965','XzpA9y2Z');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1487','Boris','Reeves','yes',1.47469E+12,'mauris.blandit@convallisincursus.net','086-778-9010','Credit','6/4/1962','gDzsbGb7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1488','Kendall','Cochran','yes',1.10784E+12,'Proin.dolor.Nulla@et.org','085-404-6463','Credit','15/6/1969','8PgD7Kkq');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1489','Chancellor','Bowen','yes',1.61155E+12,'lacus.vestibulum@auctor.ca','087-326-8582','Debit','5/10/1994','MrWdQxwq');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1490','Charles','Dejesus','yes',1.14499E+12,'elit.erat.vitae@metusurnaconvallis.edu','089-441-1720','Credit','12/6/1984','ZSPW4gHa');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1491','Geoffrey','Nunez','yes',1.12729E+12,'facilisis.eget@aliquet.net','086-832-6143','Credit','20/9/1970','cReMNzNu');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1492','Wade','Murphy','yes',1.26109E+12,'Etiam@velconvallis.edu','085-459-4987','Cash','20/3/1986','F94uwQEB');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1493','Claire','Leonard','yes',1.03677E+12,'Integer@nequeInornare.ca','084-094-2645','Debit','6/10/1993','P7KUxDRX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1494','Iona','Dunlap','yes',1.55713E+12,'Donec.tincidunt@urna.org','082-930-7388','Cash','24/4/1975','FANG3E6w');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1495','Basil','Perkins','yes',1.04462E+12,'lacinia.at@Donecnonjusto.co.uk','082-757-4196','Credit','14/1/1993','vAU3VLA7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1496','Kirestin','Frazier','yes',1.41643E+12,'nec@Seddictum.org','088-769-2940','Cash','6/1/1995','fVBqzBbc');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1497','Daniel','Simpson','yes',1.29392E+12,'consequat.nec.mollis@Phasellusdapibusquam.org','085-879-3811','Credit','6/3/1967','vXLABm58');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1498','Francis','Riddle','yes',1.62124E+12,'Duis.at.lacus@adipiscingligula.com','086-310-1457','Cash','26/1/1980','BCYCdpdz');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1499','Alana','Pope','yes',1.07305E+12,'quis.pede@variusorciin.net','086-314-1453','Cash','28/9/1994','2sJxqBRa');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1500','Ila','Rodgers','yes',1.39836E+12,'augue.eu.tempor@leoelementum.net','081-711-9981','Cash','14/8/1992','MESd83sQ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1501','Marny','Curtis','yes',1.59272E+12,'tortor.Nunc@maurisSuspendisse.org','086-058-4465','Credit','18/7/1991','jSqN4hZB');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1502','Daquan','Ratliff','yes',1.51169E+12,'Phasellus.nulla@dapibusligulaAliquam.ca','087-821-0976','Credit','26/12/1997','3qUfcn5t');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1503','Sybil','Woodard','yes',1.07112E+12,'lectus@Namconsequat.com','088-118-7959','Credit','27/4/1999','2rww99qe');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1504','Yardley','Rivera','yes',1.38245E+12,'Class@euismod.net','081-482-1096','Cash','1/7/1968','zt887KpZ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1505','Jason','Alexander','yes',1.58172E+12,'tellus@miloremvehicula.edu','082-389-3142','Debit','14/12/1999','DrSFuREx');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1506','Hanna','Sampson','yes',1.18527E+12,'Integer@erosNamconsequat.edu','089-156-2377','Debit','20/4/1985','XtLs6qS4');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1507','Odessa','Levine','yes',1.44442E+12,'sodales.purus.in@risusNunc.edu','089-000-2695','Debit','27/8/1982','wxhevXuj');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1508','Mason','Vasquez','yes',1.68912E+12,'luctus.Curabitur@mi.ca','085-527-3401','Credit','26/9/1971','6mJqWZzY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1509','Jermaine','Mcguire','yes',1.42505E+12,'sapien.cursus.in@egetnisidictum.net','081-043-8490','Cash','25/11/1991','eXDZzbYX');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1510','Ashton','Head','yes',1.65357E+12,'a.facilisis.non@perconubia.edu','081-351-8497','Debit','15/10/1968','sufAFcfG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1511','Edward','Greene','yes',1.50458E+12,'convallis@sedturpisnec.ca','081-257-4301','Debit','26/4/1997','4WeWAqh6');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1512','Fritz','Wise','yes',1.41149E+12,'ut@estNuncullamcorper.co.uk','086-495-8888','Credit','18/4/1993','ubHyLC9p');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1513','Valentine','Ramos','yes',1.62026E+12,'Donec.nibh@rutrumjustoPraesent.net','083-706-1423','Debit','4/8/1999','m8Lx29xs');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1514','Eve','Carter','yes',1.39511E+12,'varius.et@aliquetmagnaa.com','081-264-4976','Debit','27/1/1965','7BXUAugd');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1515','Kadeem','Morrow','yes',1.35466E+12,'mollis.lectus@loremacrisus.edu','082-921-0843','Debit','20/2/1991','SWt6enHT');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1516','Francis','Richards','yes',1.36201E+12,'eros@vitaenibh.edu','089-185-1028','Credit','3/11/1963','najLFxLW');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1517','Alyssa','Carter','yes',1.07235E+12,'libero.dui@facilisisnonbibendum.org','088-202-1663','Cash','13/8/1968','cqXLh9Hf');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1518','Odessa','Marshall','yes',1.23632E+12,'laoreet.posuere.enim@necenimNunc.org','085-264-4306','Credit','1/7/1980','Dz6dQF3W');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1519','Denise','Michael','yes',1.50004E+12,'in.lobortis.tellus@Proin.net','083-348-2281','Credit','11/1/1972','eBfuzW4f');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1520','Moses','Battle','yes',1.47548E+12,'lorem@euismodindolor.ca','083-724-0452','Credit','3/12/1960','aLb5XK4A');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1521','Heidi','Gordon','yes',1.31602E+12,'natoque.penatibus.et@ascelerisque.net','084-170-7396','Credit','10/9/1993','jUfFrUN7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1522','Chancellor','Barr','yes',1.64991E+12,'fames.ac.turpis@estmauris.edu','087-525-8040','Cash','21/7/1966','t5mCWpEf');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1523','Clark','Wells','yes',1.01591E+12,'a.feugiat.tellus@adipiscing.co.uk','081-825-8332','Credit','17/8/1994','UjZFb9VM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1524','Hall','Weiss','yes',1.16818E+12,'tincidunt.congue.turpis@ipsum.co.uk','081-042-0796','Cash','30/9/1974','sYfQLkAS');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1525','Malik','Sloan','yes',1.53937E+12,'Praesent.eu.dui@turpisnon.net','087-534-5260','Cash','25/4/1964','MWSM2cLy');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1526','Alyssa','Barlow','yes',1.39843E+12,'dignissim.lacus@ornaretortorat.co.uk','083-064-4836','Credit','14/3/1997','rbcpkdV3');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1527','Quon','Daniels','yes',1.66785E+12,'Aliquam.rutrum@velarcuCurabitur.com','080-152-7495','Debit','19/5/1998','Yph9K5dU');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1528','Regina','Guzman','yes',1.62379E+12,'faucibus.orci.luctus@semPellentesqueut.co.uk','082-883-0793','Cash','22/3/1993','6WnT5yGg');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1529','Zelda','Gilbert','yes',1.40802E+12,'magna.nec@cursusin.net','081-107-2328','Cash','22/9/1973','xgBA69hk');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1530','Norman','Kirkland','yes',1.08955E+12,'id.libero.Donec@Suspendissesed.org','088-356-9547','Cash','27/10/1988','RgQY6TYQ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1531','Kane','Roach','yes',1.08274E+12,'purus.accumsan@pharetra.co.uk','088-416-5731','Cash','11/9/1997','Bszedmwh');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1532','Carol','Petty','yes',1.6581E+12,'mus@gravida.edu','082-800-2022','Debit','19/1/1975','7tu2UL8t');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1533','Sara','Rocha','yes',1.11833E+12,'metus@Curabiturmassa.ca','081-377-4051','Debit','28/8/1970','6SgfMmfK');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1534','Beatrice','Lang','yes',1.20727E+12,'aliquet@diamat.ca','088-748-9555','Credit','11/5/1974','SDMxta4K');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1535','Petra','Hunt','yes',1.60166E+12,'ac.mattis@diamPellentesquehabitant.co.uk','083-928-8309','Cash','14/12/1962','gzeZ8UJ7');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1536','Ahmed','Howe','yes',1.00411E+12,'convallis.ligula@ametrisusDonec.org','087-494-9807','Debit','21/12/1965','FP4pekjx');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1537','Allen','Bell','yes',1.42304E+12,'at.pretium.aliquet@facilisisegetipsum.co.uk','089-743-4600','Debit','8/8/1994','FMugwm9H');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1538','Holmes','Booker','yes',1.44091E+12,'non.sollicitudin.a@dolor.co.uk','081-635-1035','Debit','16/9/1979','aYEQhLy3');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1539','Harriet','Trevino','yes',1.31558E+12,'nec.malesuada@porta.org','086-001-5625','Cash','11/2/1982','56cdK2E6');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1540','Myra','Barry','yes',1.65915E+12,'habitant@maurissagittis.com','089-103-5281','Debit','8/12/1976','88zz3z6b');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1541','Blake','Watts','yes',1.07123E+12,'felis.Nulla@urna.net','089-501-7360','Credit','10/4/1993','xBcrME2N');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1542','Lareina','Hendrix','yes',1.35015E+12,'dignissim@euismod.com','082-026-8132','Credit','18/8/1962','2UGhnDEt');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1543','Driscoll','Arnold','yes',1.68793E+12,'ullamcorper@Suspendisse.org','089-730-5084','Cash','19/11/1963','AUyMS6vp');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1544','Carson','Clements','yes',1.44401E+12,'a.ultricies.adipiscing@rutrumloremac.co.uk','082-244-9805','Debit','16/2/1961','heEuMfc4');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1545','Keith','Watts','yes',1.58761E+12,'ac.turpis.egestas@felis.net','085-870-9976','Debit','26/6/1990','cw4jHb6b');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1546','Brent','Herman','yes',1.68066E+12,'elit.Aliquam.auctor@eumetusIn.net','081-462-6794','Credit','23/2/1968','y5Cjbpp9');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1547','Jamalia','Cameron','yes',1.00615E+12,'et.nunc.Quisque@euenim.com','080-816-3698','Debit','27/5/1963','D3CVLdSz');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1548','Owen','Lindsey','yes',1.34281E+12,'in@pedesagittis.co.uk','081-132-1231','Credit','9/7/1980','4hPe9SEE');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1549','Simon','Meyers','yes',1.48365E+12,'risus.at@mollisDuis.ca','085-267-0817','Cash','30/6/1965','KfYrhZ5G');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1550','Abra','Madden','yes',1.18012E+12,'habitant@Nuncsollicitudin.ca','082-862-0074','Debit','7/7/1991','kqXjCnfr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1551','Abra','Ortega','yes',1.57632E+12,'sapien.gravida.non@Donecdignissimmagna.ca','086-829-1255','Debit','21/1/1969','Nx4Dppak');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1552','Lilah','Hardy','yes',1.51959E+12,'amet@ettristiquepellentesque.co.uk','081-606-9042','Debit','6/10/1975','HZA28Lp9');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1553','Rachel','Rocha','yes',1.64496E+12,'turpis@liberoDonec.edu','084-201-0577','Debit','14/7/1969','r2n8Pphr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1554','Sasha','Case','yes',1.45957E+12,'Proin.nisl.sem@Curabiturvel.net','080-957-3549','Debit','16/8/1981','VenukXDt');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1555','Fallon','Johnston','yes',1.68143E+12,'quis.tristique.ac@Phasellus.edu','082-004-8292','Debit','2/1/1962','8dqjspRa');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1556','Dennis','Rogers','yes',1.14496E+12,'a.auctor@apurus.net','083-430-6382','Debit','1/10/1988','4AAUFpHp');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1557','Casey','Foreman','yes',1.67552E+12,'ut.pellentesque@congue.org','087-891-5486','Debit','10/11/1966','VcDXFtUJ');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1558','Ina','Underwood','yes',1.59878E+12,'Ut@eleifendegestas.edu','080-815-8268','Cash','18/7/1977','XXcBGDQR');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1559','Alan','Booker','yes',1.16522E+12,'non.lacinia@non.edu','086-108-9758','Cash','8/9/1988','jszcf8He');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1560','Ori','Howard','yes',1.51218E+12,'erat.in.consectetuer@ullamcorpervelitin.com','082-745-1845','Debit','29/1/1979','xNQ8mHGz');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1561','Sloane','Velasquez','yes',1.59989E+12,'enim@tristique.org','083-666-4211','Debit','27/1/1996','qzqNgsKD');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1562','Imani','Hernandez','yes',1.00831E+12,'laoreet@inmolestie.ca','081-856-5599','Cash','3/10/1964','qcBh6KmY');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1563','Echo','Roberson','yes',1.57805E+12,'Curabitur.consequat.lectus@suscipitestac.ca','086-336-4534','Debit','26/4/1976','z3xykuAC');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1564','Gray','Finch','yes',1.27812E+12,'Pellentesque.habitant.morbi@Sed.edu','086-043-2037','Cash','21/7/1965','KV7GX3zm');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1565','Lev','Odom','yes',1.52966E+12,'convallis.erat.eget@idante.ca','085-766-0249','Credit','6/4/1978','eumeswa6');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1566','Harding','Nichols','yes',1.23368E+12,'mi.eleifend.egestas@mollisnoncursus.net','089-313-8363','Cash','31/8/1971','PCmYjTkC');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1567','Candice','Woods','yes',1.03176E+12,'commodo.tincidunt@et.edu','085-968-5590','Cash','8/7/1972','qNpPdsXd');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1568','Ifeoma','Chan','yes',1.32946E+12,'tellus@Duisa.net','089-449-2421','Cash','18/2/1982','PH9h6G8R');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1569','Jakeem','Klein','yes',1.18966E+12,'lectus.pede.ultrices@acarcuNunc.com','083-763-8778','Credit','3/5/1991','83QHG83N');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1570','Michael','Lee','yes',1.51943E+12,'nascetur.ridiculus@ligula.ca','087-691-3349','Debit','6/8/1998','58vCrkAx');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1571','Tad','Levy','yes',1.65392E+12,'ultrices.iaculis@Quisqueimperdiet.net','089-468-2339','Credit','17/8/1981','raAtuuAG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1572','Hamish','Sykes','yes',1.14916E+12,'lorem.ipsum.sodales@purus.net','085-690-4731','Credit','24/6/1993','dXkrMXn9');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1573','Macaulay','Black','yes',1.67325E+12,'odio.Nam.interdum@euplacerat.ca','086-478-2373','Cash','6/8/1984','7N3GxzAF');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1574','Reed','Macias','yes',1.54253E+12,'Cras@metusInnec.org','086-120-7616','Debit','7/2/1990','HWX72Bzd');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1575','Zia','Colon','yes',1.51051E+12,'Sed.eu.nibh@arcuVivamus.org','084-589-2856','Debit','7/6/1969','fkTr6UHh');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1576','Asher','House','yes',1.64201E+12,'venenatis@vitae.ca','089-159-2028','Credit','6/3/1965','dccZv7Bh');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1577','Brandon','Burke','yes',1.3539E+12,'lorem@nec.net','087-181-8770','Credit','3/9/1985','PDpCvLUc');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1578','Serena','Berg','yes',1.07574E+12,'nisi@egestaslaciniaSed.edu','087-321-1983','Credit','22/10/1965','zYdbtwBG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1579','Quon','Hawkins','yes',1.07893E+12,'viverra.Donec@nonenim.ca','083-698-8483','Debit','14/6/1980','fPa8Gtvc');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1580','Kevin','Bridges','yes',1.6713E+12,'et.pede.Nunc@semut.com','083-540-9221','Cash','5/10/1978','DVrcaKHr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1581','Todd','Curry','yes',1.32318E+12,'netus.et.malesuada@tellus.ca','088-974-5750','Cash','17/3/1983','EjwVAGBG');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1582','Davis','Stevens','yes',1.65186E+12,'arcu.vel.quam@vitaediam.co.uk','080-354-1632','Debit','5/3/1979','JHNhCTPD');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1583','Adrian','Witt','yes',1.20029E+12,'lacus.Quisque.imperdiet@malesuadaInteger.net','082-722-5585','Debit','16/11/1966','w9tzCyP5');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1584','Gavin','Kim','yes',1.16156E+12,'scelerisque.sed.sapien@dolor.com','086-150-0470','Debit','1/9/1976','RznGs3X8');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1585','Tobias','Cleveland','yes',1.35161E+12,'Nunc@eleifendnuncrisus.com','081-989-8821','Credit','20/10/1969','N8CcjbUB');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1586','Hall','Barron','yes',1.6698E+12,'nibh.dolor.nonummy@lorem.net','089-370-9042','Debit','18/2/1995','A9wzkhSS');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1587','Sylvia','Perez','yes',1.62143E+12,'felis.Donec.tempor@at.ca','081-865-1312','Debit','13/2/1970','cNE755ZC');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1588','McKenzie','Soto','yes',1.03388E+12,'sed@ullamcorpereueuismod.org','087-357-7041','Debit','24/4/1973','2XPFbSCn');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1589','Marsden','Whitehead','yes',1.18051E+12,'vitae.dolor@Sedeueros.com','085-900-0411','Cash','25/11/1975','jYeGdgrM');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1590','Kristen','Flowers','yes',1.01238E+12,'quam@in.com','082-637-5580','Cash','15/1/1997','2zZund6r');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1591','Aquila','Fields','yes',1.45331E+12,'ullamcorper@Seddictum.com','082-463-7036','Cash','2/8/1988','7BXfe97t');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1592','Thaddeus','Oconnor','yes',1.3621E+12,'interdum.enim@Morbiquisurna.co.uk','087-742-5553','Cash','6/10/1973','kNsHWzQT');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1593','Thaddeus','Carver','yes',1.44829E+12,'magna.Sed@hendreritid.ca','082-087-5313','Cash','30/5/1995','MPLkrFAC');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1594','Brittany','Joyce','yes',1.03455E+12,'Proin@feugiat.edu','080-670-5994','Debit','3/1/1968','SMUDgAMr');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1595','Dean','Skinner','yes',1.32228E+12,'turpis.Aliquam.adipiscing@neque.net','085-903-4070','Cash','19/1/1995','hraBeQgm');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1596','Brent','Holmes','yes',1.26877E+12,'lobortis@non.com','082-536-2242','Cash','31/1/1975','Se9dRSfT');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1597','Orli','Lester','yes',1.43477E+12,'Nam@fermentumvelmauris.net','085-787-3972','Cash','3/10/1973','XZhVRt2g');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1598','Nissim','Levy','yes',1.52856E+12,'Sed@rhoncus.ca','080-463-8951','Debit','21/8/1974','VpqEfC5N');
  INSERT INTO RSCustomer(customerNo,fname,lname,dlicense,idcardpassportno,email,phone,paymentMethod,bdate,password) VALUES ('RSC-1599','Channing','Good','yes',1.17589E+12,'eleifend.Cras@ametluctus.edu','084-225-3839','Credit','3/12/1973','Zfckr2bP');

  --- ��ҧ����ҹ���� -----

  -- maintenace
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-001','1-Jan-2016',6300,'Wheel','FR + FL Tyre');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-002','1-Jan-2016',4627,'Engine','4 Ignition Coil');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-003','2-Jan-2016',2043,'Break','FL Brake caliper');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-004','2-Jan-2016',2400,'Battery','55D26L');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-005','3-Jan-2016',2558,'Liquid','engine oil');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-006','3-Jan-2016',2659,'Others','wash + coating');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-007','7-Jan-2016',2940,'Battery','80D26L');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-008','10-Jan-2016',2605,'Wheel','FR Tyre');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-009','10-Jan-2016',4636,'Engine','radiator + belt');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-010','13-Jan-2016',2512,'Break','Front brake pads');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-011','19-Jan-2016',3539,'Break','Rear brake pads');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-012','21-Jan-2016',2431,'Liquid','Engine oil');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-013','21-Jan-2016',2891,'Wheel','RR Tyre');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-014','22-Jan-2016',3304,'Liquid','engine + transmission oil');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-015','26-Jan-2016',2020,'Others','wash + coating');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-016','29-Jan-2016',4983,'Engine','waterpump + belt tensioner');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-017','5-Feb-2016',2852,'Battery','70D24L');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-018','8-Feb-2016',2949,'Wheel','RL Tyre');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-019','11-Feb-2016',2006,'Engine','engine oil');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-020','11-Feb-2016',2879,'Battery','80D26L');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-021','12-Feb-2016',7500,'Wheel','FL + FR + RL Tyre');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-022','15-Feb-2016',1999,'Engine','Spark plug + Air filter');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-023','19-Feb-2016',1781,'Break','Front brake pads');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-024','23-Feb-2016',2422,'Wheel','FL Tyre');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-025','28-Feb-2016',2211,'Others','wash + coating');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-026','4-Mar-2016',10500,'Wheel','FR + FL Tyre');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-027','7-Mar-2016',7590,'Engine','4 Ignition Coil');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-028','9-Mar-2016',1200,'Break','FL Brake caliper');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-029','12-Mar-2016',3900,'Battery','55D26L');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-030','17-Mar-2016',6700,'Liquid','engine oil');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-031','24-Mar-2016',2349,'Others','wash + coating');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-032','31-Mar-2016',3345,'Battery','80D26L');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-033','28-Apr-2016',6424,'Wheel','RL + FL Tyre');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-034','10-May-2016',5735,'Engine','radiator + belt');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-035','1-Jun-2016',3927,'Break','brake calipers');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-036','29-Jul-2016',2918,'Break','Rear brake pads');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-037','12-Aug-2016',2816,'Liquid','Engine oil + Coolant');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-038','1-Sep-2016',4416,'Wheel','RR + RL Tyre');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-039','17-Oct-2016',3412,'Liquid','engine + transmission oil');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-040','10-Nov-2016',2612,'Others','wash + coating');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-041','18-Dec-2016',5525,'Engine','waterpump + belt tensioner');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-042','31-Mar-2017',2360,'Battery','90D26L');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-043','16-Jan-2017',4640,'Wheel','FR + FL Tyre');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-044','9-Feb-2017',2670,'Engine','engine oil + Brake Fluids');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-045','16-Mar-2017',1600,'Battery','50D26L');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-046','5-Apr-2017',20000,'Wheel','FL + FR + RL+ RR Tyre');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-047','23-May-2017',1990,'Engine','Spark plug + Air filter');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-048','3-Jun-2017',5900,'Break','Ventilated Disc Break');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-049','12-Jul-2017',8800,'Wheel','FL + RL Tyre');
  INSERT INTO RSMaintenance(maintNo,maintDate,maintPrice,maintType,maintDetail) VALUES ('RSM-050','28-Aug-2017',3200,'Others','wash + coating');



  -- CAR
  INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1005','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-100','RSM-002');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1071','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-101','RSM-014');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1075','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-102','RSM-016');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1110','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-103','RSM-017');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1107','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-104','RSM-029');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1143','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-105','RSM-033');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1211','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-106','RSM-038');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1179','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-107','RSM-045');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1001','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-108',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1002','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-109',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1003','NISSAN','M',2,1600,5,'Saloon','Benzine','Auto','RSB-110',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1004','TOYOTA','M',2,1600,5,'Saloon','Benzine','Auto','RSB-111',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1036','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-112',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1037','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-113',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1038','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-114',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1039','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-115',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1040','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-116',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1072','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-117',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1073','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-118',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1074','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-119',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1106','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-120',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1108','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-121',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1109','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-122',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1141','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-100',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1142','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-101',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1144','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-102',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1145','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-103',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1176','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-104',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1177','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-105',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1178','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-106',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1180','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-107',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1212','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-108',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1213','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-109',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1214','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-110',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1215','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-111',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1010','TOYOTA','M',2,1800,7,'SUV','Diesel','Auto','RSB-112','RSM-001');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1042','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-113','RSM-008');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1044','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-114','RSM-012');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1113','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-115','RSM-018');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1078','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-116','RSM-025');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1080','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-117','RSM-026');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1146','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-118','RSM-035');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1150','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-119','RSM-036');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1216','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-120','RSM-040');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1219','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-121','RSM-042');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1183','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-122','RSM-046');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1006','HONDA','M',2,1600,5,'SUV','Benzine','Auto','RSB-100',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1007','ISUZU','M',4,1800,2,'Pickup','Diesel','Manual','RSB-101',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1008','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-102',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1009','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-103',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1041','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-104',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1043','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-105',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1045','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-106',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1076','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-107',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1077','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-108',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1079','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-109',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1111','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-110',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1112','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-111',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1114','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-112',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1115','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-113',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1147','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-114',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1148','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-115',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1149','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-116',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1181','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-117',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1182','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-118',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1184','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-119',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1185','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-120',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1217','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-121',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1218','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-122',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1220','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-100',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1015','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-101','RSM-004');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1046','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-102','RSM-007');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1116','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-103','RSM-021');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1083','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-104','RSM-024');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1153','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-105','RSM-034');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1222','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-106','RSM-039');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1011','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-107',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1012','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-108',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1013','NISSAN','M',2,1600,5,'Saloon','Benzine','Auto','RSB-109',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1014','TOYOTA','M',2,1600,5,'Saloon','Benzine','Auto','RSB-110',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1047','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-111',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1048','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-112',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1049','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-113',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1050','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-114',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1081','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-115',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1082','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-116',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1084','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-117',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1085','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-118',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1117','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-119',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1118','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-120',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1119','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-121',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1120','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-122',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1151','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-100',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1152','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-101',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1154','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-102',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1155','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-103',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1186','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-104',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1187','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-105',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1188','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-106',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1189','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-107',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1190','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-108',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1221','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-109',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1223','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-110',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1224','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-111',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1225','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-112',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1020','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-113','RSM-003');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1017','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-114','RSM-009');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1054','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-115','RSM-013');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1121','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-116','RSM-020');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1088','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-117','RSM-027');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1160','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-118','RSM-037');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1227','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-119','RSM-041');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1192','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-120','RSM-047');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1229','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-121','RSM-048');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1016','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-122',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1018','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-100',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1019','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-101',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1051','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-102',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1052','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-103',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1053','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-104',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1055','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-105',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1086','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-106',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1087','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-107',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1089','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-108',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1090','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-109',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1122','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-110',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1123','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-111',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1124','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-112',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1125','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-113',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1156','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-114',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1157','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-115',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1158','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-116',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1159','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-117',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1191','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-118',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1193','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-119',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1194','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-120',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1195','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-121',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1226','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-122',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1228','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-100',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1230','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-101',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1024','TOYOTA','M',2,1600,5,'Saloon','Benzine','Auto','RSB-102','RSM-010');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1128','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-103','RSM-019');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1093','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-104','RSM-028');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1199','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-105','RSM-044');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1058','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-106','RSM-050');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1021','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-107',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1022','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-108',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1023','NISSAN','M',2,1600,5,'Saloon','Benzine','Auto','RSB-109',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1025','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-110',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1056','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-111',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1057','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-112',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1059','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-113',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1060','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-114',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1091','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-115',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1092','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-116',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1094','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-117',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1095','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-118',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1126','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-119',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1127','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-120',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1129','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-121',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1130','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-122',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1161','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-100',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1162','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-101',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1163','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-102',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1164','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-103',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1165','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-104',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1196','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-105',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1197','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-106',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1198','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-107',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1200','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-108',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1028','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-109','RSM-005');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1065','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-110','RSM-015');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1099','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-111','RSM-023');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1132','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-112','RSM-031');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1205','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-113','RSM-043');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1026','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-114',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1027','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-115',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1029','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-116',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1030','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-117',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1061','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-118',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1062','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-119',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1063','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-120',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1064','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-121',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1096','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-122',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1097','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-100',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1098','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-101',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1100','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-102',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1131','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-103',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1133','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-104',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1134','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-105',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1135','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-106',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1166','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-107',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1167','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-108',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1168','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-109',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1169','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-110',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1170','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-111',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1201','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-112',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1202','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-113',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1203','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-114',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1204','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-115',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1031','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-116','RSM-006');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1034','TOYOTA','M',2,1600,5,'Saloon','Benzine','Auto','RSB-117','RSM-011');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1105','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-118','RSM-022');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1137','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-119','RSM-030');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1140','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-120','RSM-032');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1171','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-121','RSM-049');
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1032','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-122',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1033','NISSAN','M',2,1600,5,'Saloon','Benzine','Auto','RSB-100',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1035','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-101',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1066','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-102',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1067','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-103',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1068','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-104',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1069','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-105',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1070','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-106',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1101','HONDA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-107',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1102','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-108',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1103','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-109',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1104','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-110',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1136','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-111',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1138','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-112',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1139','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-113',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1172','TOYOTA','S',1,1200,5,'Saloon','Benzine','Auto','RSB-114',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1173','NISSAN','M',2,1800,5,'Saloon','Benzine','Auto','RSB-115',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1174','TOYOTA','M',2,1800,5,'Saloon','Benzine','Auto','RSB-116',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1175','TOYOTA','L',3,2200,5,'Saloon','Benzine','Auto','RSB-117',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1206','HONDA','M',2,2000,5,'SUV','Benzine','Auto','RSB-118',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1207','ISUZU','M',4,1600,2,'Pickup','Diesel','Manual','RSB-119',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1208','TOYOTA','M',4,1800,5,'Pickup','Diesel','Auto','RSB-120',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1209','MITSUBITSHI','M',4,1800,5,'Pickup','Diesel','Auto','RSB-121',NULL);
INSERT INTO RScar(CarNo,Brand,CarSize,LUGGUAGE,Price,Seat,CarType,Engine,Transmission,branchNo,maintNo) VALUES ('RC-1210','TOYOTA','M',2,2000,7,'SUV','Diesel','Auto','RSB-122',NULL);


--SQL statements ในการก าหนดสิทธิ์ต่าง ๆ ในการเข้าถึงข้อมูลของแต่ละผู้ใช้
--position owner
grant select on  RSRENT to RSowner;
grant select,insert,update,delete on  RSbranch to RSowner;
grant select on  RSMAINTENANCE to RSowner;
grant select,insert,update,delete on  RSCAR to RSowner;
grant select,insert,update,delete on  RSSTAFF to RSowner;
grant select on  RSCUSTOMER to RSowner;
--position officer
grant select,update on  RSRENT to RSofficer;
grant select,update on  RSBRANCH to RSofficer;
grant select,insert,update,delete on  RSMAINTENANCE to RSofficer;
grant select,insert,update on  RSCAR to RSofficer;
grant select,insert,update on  RSSTAFF to RSofficer;
grant select,insert,update,delete on  RSCUSTOMER to RSofficer;
--position manager
grant select,insert,update,delete on  RSRENT to RSmanager;
grant select,update on  RSBRANCH to RSmanager;
grant select,update,insert,delete on  RSMAINTENANCE to RSmanager;
grant select on  RSCAR to RSmanager;
grant select on  RSSTAFF to RSmanager;
grant select on  RSCUSTOMER to RSmanager;
--position staff
grant select,insert,update on  RSRENT to RSstaff;
grant select,insert,update on  RSMAINTENANCE to RSstaff;
grant select on  RSCUSTOMER to RSstaff;
--position customer
grant select on  RSRENT to RScustomer;
grant select on  RSBRANCH to RScustomer;
grant select on  RSCAR to RScustomer;
grant select on  RSCUSTOMER to RScustomer;
--SQL statements ที่ใช้ออกรายงานส าหรับระบบงานนั้น ๆ หรือ ค าสั่งที่มีการใช้งานบ่อย ๆ ในระบบอย่างน้อย 5 ค าสั่ง
Select c.brand ,count(r.rentNo) as numcouting
from rsrent r join rscar c
On r.carno=c.carno
group by c.brand;

Select count(maintNo)
from rscar
Where branchno = 'RSB-101';

Select r.pickbranch,count(r.pickbranch) as pickdate
From rsrent r join  rscar c On r.carno=c.carno
Group by r.pickbranch;



Select *
From cnx_r
where pickdate = '07-JAN-16';

Select *
From cnx_r;

Select c.brand,c.carsize,c.cartype,c.engine,c.lugguage, count(c.brand) as RentingDate
From rscar c join rsrent r
On c.carno=r.carno
Where r.pickdate = '07-JAN-2016'
Group by c.brand, c.carsize, c.cartype, c.engine, c.lugguage;


select c.* from rscar c join rsbranch b on b.branchno = c.branchno where branchname = 'RSPT-BKK';
