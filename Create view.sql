CREATE or replace VIEW bkk_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-100' ;
CREATE or replace VIEW bkk_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-100' ;
CREATE or replace VIEW bkk_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-100' ;
CREATE or replace VIEW bkk_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-100' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-100' ;
CREATE or replace VIEW bkk_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-100' ;

CREATE or replace VIEW pkt_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-101' ;
CREATE or replace VIEW pkt_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-101' ;
CREATE or replace VIEW pkt_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-101' ;
CREATE or replace VIEW pkt_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-101' ;
CREATE or replace VIEW pkt_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-101' ;
CREATE or replace VIEW pkt_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-101' ;

CREATE or replace VIEW cnx_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-102' ;
CREATE or replace VIEW cnx_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-102' ;
CREATE or replace VIEW cnx_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-102' ;
CREATE or replace VIEW cnx_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-102' ;
CREATE or replace VIEW cnx_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-102' ;
CREATE or replace VIEW cnx_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-102' ;

CREATE or replace VIEW kbi_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-103' ;
CREATE or replace VIEW kbi_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-103' ;
CREATE or replace VIEW kbi_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-103' ;
CREATE or replace VIEW kbi_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-103' ;
CREATE or replace VIEW kbi_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-103' ;
CREATE or replace VIEW kbi_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-103' ;

CREATE or replace VIEW ryg_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-104' ;
CREATE or replace VIEW ryg_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-104' ;
CREATE or replace VIEW ryg_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-104' ;
CREATE or replace VIEW ryg_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-104' ;
CREATE or replace VIEW ryg_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-104' ;
CREATE or replace VIEW ryg_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-104' ;

CREATE or replace VIEW ska_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-105' ;
CREATE or replace VIEW ska_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-105' ;
CREATE or replace VIEW ska_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-105' ;
CREATE or replace VIEW ska_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-105' ;
CREATE or replace VIEW ska_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-105' ;
CREATE or replace VIEW ska_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-105' ;

CREATE or replace VIEW cri_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-106' ;
CREATE or replace VIEW cri_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-106' ;
CREATE or replace VIEW cri_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-106' ;
CREATE or replace VIEW cri_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-106' ;
CREATE or replace VIEW cri_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-106' ;
CREATE or replace VIEW cri_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-106' ;

CREATE or replace VIEW plk_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-107' ;
CREATE or replace VIEW plk_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-107' ;
CREATE or replace VIEW plk_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-107' ;
CREATE or replace VIEW plk_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-107' ;
CREATE or replace VIEW plk_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-107' ;
CREATE or replace VIEW plk_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-107' ;

CREATE or replace VIEW udn_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-108' ;
CREATE or replace VIEW udn_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-108' ;
CREATE or replace VIEW udn_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-108' ;
CREATE or replace VIEW udn_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-108' ;
CREATE or replace VIEW udn_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-108' ;
CREATE or replace VIEW udn_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-108' ;

CREATE or replace VIEW kkn_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-109' ;
CREATE or replace VIEW kkn_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-109' ;
CREATE or replace VIEW kkn_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-109' ;
CREATE or replace VIEW kkn_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-109' ;
CREATE or replace VIEW kkn_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-109' ;
CREATE or replace VIEW kkn_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-109' ;

CREATE or replace VIEW npm_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-110' ;
CREATE or replace VIEW npm_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-110' ;
CREATE or replace VIEW npm_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-110' ;
CREATE or replace VIEW npm_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-110' ;
CREATE or replace VIEW npm_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-110' ;
CREATE or replace VIEW npm_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-110' ;

CREATE or replace VIEW snk_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-111' ;
CREATE or replace VIEW snk_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-111' ;
CREATE or replace VIEW snk_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-111' ;
CREATE or replace VIEW snk_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-111' ;
CREATE or replace VIEW snk_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-111' ;
CREATE or replace VIEW snk_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-111' ;

CREATE or replace VIEW ubn_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-112' ;
CREATE or replace VIEW ubn_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-112' ;
CREATE or replace VIEW ubn_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-112' ;
CREATE or replace VIEW ubn_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-112' ;
CREATE or replace VIEW ubn_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-112' ;
CREATE or replace VIEW ubn_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-112' ;

CREATE or replace VIEW sni_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-113' ;
CREATE or replace VIEW sni_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-113' ;
CREATE or replace VIEW sni_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-113' ;
CREATE or replace VIEW sni_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-113' ;
CREATE or replace VIEW sni_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-113' ;
CREATE or replace VIEW sni_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-113' ;

CREATE or replace VIEW nst_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-114' ;
CREATE or replace VIEW nst_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-114' ;
CREATE or replace VIEW nst_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-114' ;
CREATE or replace VIEW nst_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-114' ;
CREATE or replace VIEW nst_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-114' ;
CREATE or replace VIEW nst_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-114' ;

CREATE or replace VIEW trg_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-115' ;
CREATE or replace VIEW trg_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-115' ;
CREATE or replace VIEW trg_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-115' ;
CREATE or replace VIEW trg_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-115' ;
CREATE or replace VIEW trg_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-115' ;
CREATE or replace VIEW trg_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-115' ;

CREATE or replace VIEW nwt_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-116' ;
CREATE or replace VIEW nwt_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-116' ;
CREATE or replace VIEW nwt_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-116' ;
CREATE or replace VIEW nwt_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-116' ;
CREATE or replace VIEW nwt_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-116' ;
CREATE or replace VIEW nwt_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-116' ;

CREATE or replace VIEW nan_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-117' ;
CREATE or replace VIEW nan_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-117' ;
CREATE or replace VIEW nan_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-117' ;
CREATE or replace VIEW nan_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-117' ;
CREATE or replace VIEW nan_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-117' ;
CREATE or replace VIEW nan_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-117' ;

CREATE or replace VIEW ret_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-118' ;
CREATE or replace VIEW ret_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-118' ;
CREATE or replace VIEW ret_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-118' ;
CREATE or replace VIEW ret_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-118' ;
CREATE or replace VIEW ret_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-118' ;
CREATE or replace VIEW ret_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-118' ;

CREATE or replace VIEW lei_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-119' ;
CREATE or replace VIEW lei_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-119' ;
CREATE or replace VIEW lei_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-119' ;
CREATE or replace VIEW lei_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-119' ;
CREATE or replace VIEW lei_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-119' ;
CREATE or replace VIEW lei_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-119' ;

CREATE or replace VIEW brm_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-120' ;
CREATE or replace VIEW brm_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-120' ;
CREATE or replace VIEW brm_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-120' ;
CREATE or replace VIEW brm_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-120' ;
CREATE or replace VIEW brm_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-120' ;
CREATE or replace VIEW brm_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-120' ;

CREATE or replace VIEW rng_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-121' ;
CREATE or replace VIEW rng_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-121' ;
CREATE or replace VIEW rng_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-121' ;
CREATE or replace VIEW rng_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-121' ;
CREATE or replace VIEW rng_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-121' ;
CREATE or replace VIEW rng_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-121' ;

CREATE or replace VIEW yla_m_s   AS SELECT * FROM RSstaff WHERE branchNo='RSB-122' ;
CREATE or replace VIEW yla_m_b   AS SELECT * FROM RSbranch WHERE branchNo='RSB-122' ;
CREATE or replace VIEW yla_m_c   AS SELECT * FROM RScar WHERE branchNo='RSB-122' ;
CREATE or replace VIEW yla_r   AS SELECT * FROM RSrent r join RScar c on r.carno=c.carno WHERE c.branchNo='RSB-122' ;
CREATE or replace VIEW yla_m   AS SELECT * FROM RSmaintanance m join RScar c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-122' ;
CREATE or replace VIEW yla_cu   AS SELECT * FROM RScustomer cu join RSrent r on cu.customerNo=cu.customerNo join RSbranch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-122' ;
