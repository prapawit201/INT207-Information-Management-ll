/*
========== Clean All TABLE in Database ===========
*/
-- all Table
drop table RSRENT CASCADE CONSTRAINTS;
drop table RScustomer CASCADE CONSTRAINTS;
drop table RSstaff CASCADE CONSTRAINTS;
drop table RScar CASCADE CONSTRAINTS;
drop table RSBRANCH CASCADE CONSTRAINTS;
drop table RSMaintenance CASCADE CONSTRAINTS;
-- VIEW for Staff & Customer
DROP VIEW bkk_m_b;
DROP VIEW bkk_m_s;
DROP VIEW bkk_m_c;
DROP VIEW bkk_r;
DROP VIEW bkk_m;
DROP VIEW bkk_cu;

DROP VIEW pkt_m_s;
DROP VIEW pkt_m_b;
DROP VIEW pkt_m_c;
DROP VIEW pkt_r;
DROP VIEW pkt_m;
DROP VIEW pkt_cu;

DROP VIEW cnx_m_s;
DROP VIEW cnx_m_b;
DROP VIEW cnx_m_c;
DROP VIEW cnx_r;
DROP VIEW cnx_m ;
DROP VIEW cnx_cu;

DROP VIEW kbi_m_s;
DROP VIEW kbi_m_b ;
DROP VIEW kbi_m_c ;
DROP VIEW kbi_r ;
DROP VIEW kbi_m ;
DROP VIEW kbi_cu ;

DROP VIEW ryg_m_s ;
DROP VIEW ryg_m_b ;
DROP VIEW ryg_m_c ;
DROP VIEW ryg_r ;
DROP VIEW ryg_m ;
DROP VIEW ryg_cu ;

DROP VIEW ska_m_s ;
DROP VIEW ska_m_b ;
DROP VIEW ska_m_c ;
DROP VIEW ska_r ;
DROP VIEW ska_m ;
DROP VIEW ska_cu ;

DROP VIEW cri_m_s ;
DROP VIEW cri_m_b ;
DROP VIEW cri_m_c ;
DROP VIEW cri_r ;
DROP VIEW cri_m ;
DROP VIEW cri_cu ;

DROP VIEW plk_m_s ;
DROP VIEW plk_m_b ;
DROP VIEW plk_m_c ;
DROP VIEW plk_r ;
DROP VIEW plk_m ;
DROP VIEW plk_cu ;

DROP VIEW udn_m_s ;
DROP VIEW udn_m_b ;
DROP VIEW udn_m_c ;
DROP VIEW udn_r ;
DROP VIEW udn_m ;
DROP VIEW udn_cu ;

DROP VIEW kkn_m_s ;
DROP VIEW kkn_m_b ;
DROP VIEW kkn_m_c ;
DROP VIEW kkn_r ;
DROP VIEW kkn_m ;
DROP VIEW kkn_cu ;

DROP VIEW npm_m_s ;
DROP VIEW npm_m_b ;
DROP VIEW npm_m_c ;
DROP VIEW npm_r ;
DROP VIEW npm_m ;
DROP VIEW npm_cu ;

DROP VIEW snk_m_s ;
DROP VIEW snk_m_b ;
DROP VIEW snk_m_c ;
DROP VIEW snk_r ;
DROP VIEW snk_m ;
DROP VIEW snk_cu ;

DROP VIEW ubn_m_s ;
DROP VIEW ubn_m_b ;
DROP VIEW ubn_m_c ;
DROP VIEW ubn_r ;
DROP VIEW ubn_m ;
DROP VIEW ubn_cu ;

DROP VIEW sni_m_s ;
DROP VIEW sni_m_b ;
DROP VIEW sni_m_c ;
DROP VIEW sni_r ;
DROP VIEW sni_m ;
DROP VIEW sni_cu ;

DROP VIEW nst_m_s ;
DROP VIEW nst_m_b ;
DROP VIEW nst_m_c ;
DROP VIEW nst_r ;
DROP VIEW nst_m ;
DROP VIEW nst_cu ;

DROP VIEW trg_m_s ;
DROP VIEW trg_m_b ;
DROP VIEW trg_m_c ;
DROP VIEW trg_r ;
DROP VIEW trg_m ;
DROP VIEW trg_cu ;

DROP VIEW nwt_m_s ;
DROP VIEW nwt_m_b ;
DROP VIEW nwt_m_c ;
DROP VIEW nwt_r ;
DROP VIEW nwt_m ;
DROP VIEW nwt_cu ;

DROP VIEW nan_m_s ;
DROP VIEW nan_m_b ;
DROP VIEW nan_m_c ;
DROP VIEW nan_r ;
DROP VIEW nan_m ;
DROP VIEW nan_cu ;

DROP VIEW ret_m_s ;
DROP VIEW ret_m_b ;
DROP VIEW ret_m_c ;
DROP VIEW ret_r ;
DROP VIEW ret_m ;
DROP VIEW ret_cu ;

DROP VIEW lei_m_s ;
DROP VIEW lei_m_b ;
DROP VIEW lei_m_c ;
DROP VIEW lei_r ;
DROP VIEW lei_m ;
DROP VIEW lei_cu ;

DROP VIEW brm_m_s ;
DROP VIEW brm_m_b ;
DROP VIEW brm_m_c ;
DROP VIEW brm_r ;
DROP VIEW brm_m ;
DROP VIEW brm_cu ;

DROP VIEW rng_m_s ;
DROP VIEW rng_m_b ;
DROP VIEW rng_m_c ;
DROP VIEW rng_r ;
DROP VIEW rng_m ;
DROP VIEW rng_cu ;

DROP VIEW yla_m_s ;
DROP VIEW yla_m_b ;
DROP VIEW yla_m_c ;
DROP VIEW yla_r ;
DROP VIEW yla_m ;
DROP VIEW yla_cu ;
--index
drop index RSrent_BM_IDX;
drop index RScar_BM_IDX;
drop index RSbranch_BM_IDX;
drop index RSstaff_BT_IDX;

/*
=========== Hello  ===========
======== Create database ======
*/

CREATE TABLE rsbranch (
    branchno     VARCHAR2(13) NOT NULL,
    branchname   VARCHAR2(20) NOT NULL,
    province     VARCHAR2(40) NOT NULL,
    address      VARCHAR2(40) NOT NULL,
    CONSTRAINT pk_branch_branchno PRIMARY KEY ( branchno )
);

CREATE TABLE rscustomer (
    customerno         VARCHAR2(13) NOT NULL,
    fname              VARCHAR2(40) NOT NULL,
    lname              VARCHAR2(40) NOT NULL,
    dlicense           VARCHAR2(5) NOT NULL CHECK ( dlicense IN (
        'yes',
        'no'
    ) ),
    idcardpassportno   VARCHAR2(40) NOT NULL,
    email              VARCHAR2(100) NOT NULL,
    phone              VARCHAR2(20),
    paymentmethod      VARCHAR2(10) CHECK ( paymentmethod IN (
        'Debit',
        'Credit',
        'Cash'
    ) ),
    bdate              VARCHAR2(20),
    password           VARCHAR2(40) NOT NULL,
    CONSTRAINT pk_customer_customerno PRIMARY KEY ( customerno )
);

CREATE TABLE rsmaintenance (
    maintno       VARCHAR2(13) NOT NULL,
    maintdate     DATE NOT NULL,
    maintprice    NUMBER(5) NOT NULL,
    mainttype     VARCHAR2(40) CHECK ( mainttype = 'Wheel'
                                   OR mainttype = 'Engine'
                                   OR mainttype = 'Break'
                                   OR mainttype = 'Battery'
                                   OR mainttype = 'Liquid'
                                   OR mainttype = 'Others' ),
    maintdetail   VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_maintenance_maintno PRIMARY KEY ( maintno )
);

CREATE TABLE rsstaff (
    staffno    VARCHAR2(13) NOT NULL,
    fname      VARCHAR2(40) NOT NULL,
    lname      VARCHAR2(40) NOT NULL,
    position   VARCHAR2(20) NOT NULL,
    salary     VARCHAR2(10) NOT NULL,
    branchno   VARCHAR2(13) NOT NULL,
    CONSTRAINT pk_staff_staffno PRIMARY KEY ( staffno ),
    CONSTRAINT fk_branch_branchno FOREIGN KEY ( branchno )
        REFERENCES rsbranch ( branchno )
);

CREATE TABLE rscar (
    carno          VARCHAR2(13) NOT NULL,
    brand          VARCHAR2(50) NOT NULL,
    carsize        VARCHAR2(3) NOT NULL CHECK ( carsize = 'S'
                                         OR carsize = 'M'
                                         OR carsize = 'L' ),
    lugguage       NUMBER(1) NOT NULL CHECK ( lugguage = 1
                                        OR lugguage = 2
                                        OR lugguage = 3
                                        OR lugguage = 4 ),
    price          DECIMAL(10, 2) NOT NULL,
    seat           NUMBER(2) NOT NULL CHECK ( seat = 2
                                    OR seat = 5
                                    OR seat = 7 ),
    cartype        VARCHAR2(40) NOT NULL CHECK ( cartype = 'Saloon'
                                          OR cartype = 'Pickup'
                                          OR cartype = 'SUV' ),
    engine         VARCHAR2(10) NOT NULL CHECK ( engine = 'Diesel'
                                         OR engine = 'Benzine' ),
    transmission   VARCHAR2(10) NOT NULL CHECK ( transmission = 'Manual'
                                               OR transmission = 'Auto' ),
    branchno       VARCHAR2(13) NOT NULL,
    maintno        VARCHAR2(13),
    CONSTRAINT pk_car_carno PRIMARY KEY ( carno ),
    CONSTRAINT fk_car_branchno FOREIGN KEY ( branchno )
        REFERENCES rsbranch ( branchno ),
    CONSTRAINT fk_car_maintno FOREIGN KEY ( maintno )
        REFERENCES rsmaintenance ( maintno )
);

CREATE TABLE rsrent (
    rentno         VARCHAR2(13) NOT NULL,
    pickdate       DATE NOT NULL,
    returndate     DATE NOT NULL,
    pickbranch     VARCHAR2(40) NOT NULL,
    returnbranch   VARCHAR2(40) NOT NULL,
    price          NUMBER(5) NOT NULL,
    customerno     VARCHAR2(13) NOT NULL,
    carno          VARCHAR2(13) NOT NULL,
    staffno        VARCHAR2(13) NOT NULL,
    CONSTRAINT pk_rent_rentno PRIMARY KEY ( rentno ),
    CONSTRAINT fk_rent_customerno FOREIGN KEY ( customerno )
        REFERENCES rscustomer ( customerno ),
    CONSTRAINT fk_rent_carno FOREIGN KEY ( carno )
        REFERENCES rscar ( carno ),
    CONSTRAINT fk_rent_staffno FOREIGN KEY ( staffno )
        REFERENCES rsstaff ( staffno )
);

/*
===================================
======== CREATE INDEX ======
===================================
*/
CREATE BITMAP INDEX rsrent_bm_idx ON
    rsrent (
        pickbranch,
        carno,
        pickdate
    );

CREATE BITMAP INDEX rscar_bm_idx ON
    rscar (
        carno,
        brand,
        branchno
    );

CREATE BITMAP INDEX rsbranch_bm_idx ON
    rsbranch (
        branchno,
        branchname
    );

CREATE INDEX rsstaff_bt_idx ON
    rsstaff (
        salary,
        branchno
    );



/*
    ===================================
    ======== CREATE VIEW  ======
    ===================================
*/

CREATE OR REPLACE VIEW bkk_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-100';

CREATE OR REPLACE VIEW bkk_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-100';

CREATE OR REPLACE VIEW bkk_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-100';

CREATE OR REPLACE VIEW bkk_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-BKK';

CREATE OR REPLACE VIEW bkk_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-100';

CREATE OR REPLACE VIEW bkk_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-BKK';

CREATE OR REPLACE VIEW pkt_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-101';

CREATE OR REPLACE VIEW pkt_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-101';

CREATE OR REPLACE VIEW pkt_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-101';

CREATE OR REPLACE VIEW pkt_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-PKT';

CREATE OR REPLACE VIEW pkt_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-101';

CREATE OR REPLACE VIEW pkt_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-PKT';

CREATE OR REPLACE VIEW cnx_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-102';

CREATE OR REPLACE VIEW cnx_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-102';

CREATE OR REPLACE VIEW cnx_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-102';

CREATE OR REPLACE VIEW cnx_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-CNX';

CREATE OR REPLACE VIEW cnx_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-102';

CREATE OR REPLACE VIEW cnx_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-CNX';

CREATE OR REPLACE VIEW kbi_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-103';

CREATE OR REPLACE VIEW kbi_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-103';

CREATE OR REPLACE VIEW kbi_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-103';

CREATE OR REPLACE VIEW kbi_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-KBI';

CREATE OR REPLACE VIEW kbi_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-103';

CREATE OR REPLACE VIEW kbi_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-KBI';

CREATE OR REPLACE VIEW ryg_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-104';

CREATE OR REPLACE VIEW ryg_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-104';

CREATE OR REPLACE VIEW ryg_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-104';

CREATE OR REPLACE VIEW ryg_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-RYG';

CREATE OR REPLACE VIEW ryg_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-104';

CREATE OR REPLACE VIEW ryg_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-RYG';

CREATE OR REPLACE VIEW ska_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-105';

CREATE OR REPLACE VIEW ska_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-105';

CREATE OR REPLACE VIEW ska_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-105';

CREATE OR REPLACE VIEW ska_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-SKA';

CREATE OR REPLACE VIEW ska_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-105';

CREATE OR REPLACE VIEW ska_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-SKA';

CREATE OR REPLACE VIEW cri_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-106';

CREATE OR REPLACE VIEW cri_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-106';

CREATE OR REPLACE VIEW cri_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-106';

CREATE OR REPLACE VIEW cri_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-CRI';

CREATE OR REPLACE VIEW cri_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-106';

CREATE OR REPLACE VIEW cri_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-CRI';

CREATE OR REPLACE VIEW plk_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-107';

CREATE OR REPLACE VIEW plk_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-107';

CREATE OR REPLACE VIEW plk_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-107';

CREATE OR REPLACE VIEW plk_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-PLK';

CREATE OR REPLACE VIEW plk_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-107';

CREATE OR REPLACE VIEW plk_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-PLK';

CREATE OR REPLACE VIEW udn_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-108';

CREATE OR REPLACE VIEW udn_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-108';

CREATE OR REPLACE VIEW udn_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-108';

CREATE OR REPLACE VIEW udn_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-UDN';

CREATE OR REPLACE VIEW udn_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-108';

CREATE OR REPLACE VIEW udn_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-UDN';

CREATE OR REPLACE VIEW kkn_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-109';

CREATE OR REPLACE VIEW kkn_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-109';

CREATE OR REPLACE VIEW kkn_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-109';

CREATE OR REPLACE VIEW kkn_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-KKN';

CREATE OR REPLACE VIEW kkn_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-109';

CREATE OR REPLACE VIEW kkn_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-KKN';

CREATE OR REPLACE VIEW npm_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-110';

CREATE OR REPLACE VIEW npm_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-110';

CREATE OR REPLACE VIEW npm_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-110';

CREATE OR REPLACE VIEW npm_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-NPM';

CREATE OR REPLACE VIEW npm_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-110';

CREATE OR REPLACE VIEW npm_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-NPM';

CREATE OR REPLACE VIEW snk_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-111';

CREATE OR REPLACE VIEW snk_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-111';

CREATE OR REPLACE VIEW snk_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-111';

CREATE OR REPLACE VIEW snk_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-SNK';

CREATE OR REPLACE VIEW snk_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-111';

CREATE OR REPLACE VIEW snk_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-SNK';

CREATE OR REPLACE VIEW ubn_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-112';

CREATE OR REPLACE VIEW ubn_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-112';

CREATE OR REPLACE VIEW ubn_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-112';

CREATE OR REPLACE VIEW ubn_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-UBN';

CREATE OR REPLACE VIEW ubn_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-112';

CREATE OR REPLACE VIEW ubn_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-UBN';

CREATE OR REPLACE VIEW sni_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-113';

CREATE OR REPLACE VIEW sni_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-113';

CREATE OR REPLACE VIEW sni_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-113';

CREATE OR REPLACE VIEW sni_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-SNI';

CREATE OR REPLACE VIEW sni_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-113';

CREATE OR REPLACE VIEW sni_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-SNI';

CREATE OR REPLACE VIEW nst_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-114';

CREATE OR REPLACE VIEW nst_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-114';

CREATE OR REPLACE VIEW nst_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-114';

CREATE OR REPLACE VIEW nst_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-NST';

CREATE OR REPLACE VIEW nst_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-114';

CREATE OR REPLACE VIEW nst_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-NST';

CREATE OR REPLACE VIEW trg_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-115';

CREATE OR REPLACE VIEW trg_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-115';

CREATE OR REPLACE VIEW trg_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-115';

CREATE OR REPLACE VIEW trg_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-TRG';

CREATE OR REPLACE VIEW trg_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-115';

CREATE OR REPLACE VIEW trg_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-TRG';

CREATE OR REPLACE VIEW nwt_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-116';

CREATE OR REPLACE VIEW nwt_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-116';

CREATE OR REPLACE VIEW nwt_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-116';

CREATE OR REPLACE VIEW nwt_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-NWT';

CREATE OR REPLACE VIEW nwt_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-116';

CREATE OR REPLACE VIEW nwt_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-NWT';

CREATE OR REPLACE VIEW nan_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-117';

CREATE OR REPLACE VIEW nan_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-117';

CREATE OR REPLACE VIEW nan_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-117';

CREATE OR REPLACE VIEW nan_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-NAN';

CREATE OR REPLACE VIEW nan_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-117';

CREATE OR REPLACE VIEW nan_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-NAN';

CREATE OR REPLACE VIEW ret_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-118';

CREATE OR REPLACE VIEW ret_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-118';

CREATE OR REPLACE VIEW ret_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-118';

CREATE OR REPLACE VIEW ret_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-RET';

CREATE OR REPLACE VIEW ret_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-118';

CREATE OR REPLACE VIEW ret_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-RET';

CREATE OR REPLACE VIEW lei_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-119';

CREATE OR REPLACE VIEW lei_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-119';

CREATE OR REPLACE VIEW lei_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-119';

CREATE OR REPLACE VIEW lei_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-LEI';

CREATE OR REPLACE VIEW lei_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-119';

CREATE OR REPLACE VIEW lei_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-LEI';

CREATE OR REPLACE VIEW brm_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-120';

CREATE OR REPLACE VIEW brm_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-120';

CREATE OR REPLACE VIEW brm_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-120';

CREATE OR REPLACE VIEW brm_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-BRM';

CREATE OR REPLACE VIEW brm_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-120';

CREATE OR REPLACE VIEW brm_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-BRM';

CREATE OR REPLACE VIEW rng_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-121';

CREATE OR REPLACE VIEW rng_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-121';

CREATE OR REPLACE VIEW rng_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-121';

CREATE OR REPLACE VIEW rng_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-RNG';

CREATE OR REPLACE VIEW rng_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-121';

CREATE OR REPLACE VIEW rng_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-RNG';

CREATE OR REPLACE VIEW yla_m_s AS
    SELECT
        *
    FROM
        rsstaff
    WHERE
        branchno = 'RSB-122';

CREATE OR REPLACE VIEW yla_m_b AS
    SELECT
        *
    FROM
        rsbranch
    WHERE
        branchno = 'RSB-122';

CREATE OR REPLACE VIEW yla_m_c AS
    SELECT
        *
    FROM
        rscar
    WHERE
        branchno = 'RSB-122';

CREATE OR REPLACE VIEW yla_r AS
    SELECT
        *
    FROM
        rsrent
    WHERE
        pickbranch = 'RSPT-YLA';

CREATE OR REPLACE VIEW yla_m AS
    SELECT
        m.*
    FROM
        rsmaintenance m
        JOIN rscar c ON m.maintno = c.maintno
    WHERE
        c.branchno = 'RSB-122';

CREATE OR REPLACE VIEW yla_cu AS
    SELECT
        cu.customerno,
        cu.fname,
        cu.lname,
        cu.dlicense,
        cu.idcardpassportno,
        cu.email,
        cu.phone,
        cu.paymentmethod,
        cu.bdate
    FROM
        rscustomer cu
        JOIN rsrent r ON cu.customerno = r.customerno
    WHERE
        r.pickbranch = 'RSPT-YLA';
