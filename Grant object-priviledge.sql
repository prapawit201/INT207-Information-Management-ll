revoke select on db6051.ZRSPROJRENT from rsowner ;
--position owner
grant select on db6051.RSRENT to RSowner;
grant select,insert,update,delete on db6051.RSbranch to RSowner;
grant select on db6051.RSMAINTENANCE to RSowner;
grant select,insert,update,delete on db6051.RSCAR to RSowner;
grant select,insert,update,delete on db6051.RSSTAFF to RSowner;
grant select on db6051.RSCUSTOMER to RSowner;
--position officer
grant select,update on db6051.RSRENT to RSofficer;
grant select,update on db6051.RSBRANCH to RSofficer;
grant select,insert,update,delete on db6051.RSMAINTENANCE to RSofficer;
grant select,insert,update on db6051.RSCAR to RSofficer;
grant select,insert,update on db6051.RSSTAFF to RSofficer;
grant select,insert,update,delete on db6051.RSCUSTOMER to RSofficer;
--position manager
grant select,insert,update,delete on db6051.RSRENT to RSmanager;
grant select,update on db6051.RSBRANCH to RSmanager;
grant select,update,insert,delete on db6051.RSMAINTENANCE to RSmanager;
grant select on db6051.RSCAR to RSmanager;
grant select on db6051.RSSTAFF to RSmanager;
grant select on db6051.RSCUSTOMER to RSmanager;
--position staff
grant select,insert,update on db6051.RSRENT to RSstaff;
grant select,insert,update on db6051.RSMAINTENANCE to RSstaff;
grant select on db6051.RSCUSTOMER to RSstaff;
--position customer
grant select on db6051.RSRENT to RScustomer;
grant select on db6051.RSBRANCH to RScustomer;
grant select on db6051.RSCAR to RScustomer;
grant select on db6051.RSCUSTOMER to RScustomer;
