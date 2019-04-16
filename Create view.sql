drop view bkk_m;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-100' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-100' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-100' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-100' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-100' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-100' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-100' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-101' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-101' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-101' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-101' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-101' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-101' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-102' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-102' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-102' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-102' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-102' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-102' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-103' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-103' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-103' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-103' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-103' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-103' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-104' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-104' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-104' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-104' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-104' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-104' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-105' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-105' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-105' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-105' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-105' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-105' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-106' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-106' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-106' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-106' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-106' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-106' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-107' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-107' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-107' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-107' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-107' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-107' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-108' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-108' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-108' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-108' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-108' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-108' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-109' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-109' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-109' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-109' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-109' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-109' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-110' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-110' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-110' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-110' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-110' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-110' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-111' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-111' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-111' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-111' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-111' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-111' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-112' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-112' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-112' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-112' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-112' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-112' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-113' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-113' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-113' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-113' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-113' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-113' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-114' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-114' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-114' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-114' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-114' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-114' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-115' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-115' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-115' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-115' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-115' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-115' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-116' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-116' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-116' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-116' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-116' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-116' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-117' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-117' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-117' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-117' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-117' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-117' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-118' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-118' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-118' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-118' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-118' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-118' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-119' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-119' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-119' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-119' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-119' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-119' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-120' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-120' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-120' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-120' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-120' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-120' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-121' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-121' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-121' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-121' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-121' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-121' ;

CREATE or replace VIEW bkk_m   AS SELECT * FROM staff WHERE branchNo='RSB-122' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM branch WHERE branchNo='RSB-122' ;
CREATE or replace VIEW bkk_m   AS SELECT * FROM car WHERE branchNo='RSB-122' ;
CREATE or replace VIEW bkk   AS SELECT * FROM rent r join car c on r.carno=c.carno WHERE c.branchNo='RSB-122' ;
CREATE or replace VIEW bkk   AS SELECT * FROM maintanance m join car c on m.maintNo=c.maintNo WHERE c.branchNo='RSB-122' ;
CREATE or replace VIEW bkk   AS SELECT * FROM customer cu join rent r on cu.customerNo=cu.customerNo join branch b on r.pickbranch=b.branchName WHERE b.branchNo='RSB-122' ;