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
========== Hello  ===========
======== Create database ======
*/
