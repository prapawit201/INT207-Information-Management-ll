--position owner
grant select on db6051.ZRSPROJRENT to RSowner;
grant select,insert,update,delete on db6051.ZRSPROJbranch to RSowner;
grant select on db6051.ZRSPROJMAINTENANCE to RSowner;
grant select,insert,update,delete on db6051.ZRSPROJCAR to RSowner;
grant select,insert,update,delete on db6051.ZRSPROJSTAFF to RSowner;
grant select on db6051.ZRSPROJCUSTOMER to RSowner;
--position officer
grant select,update on db6051.ZRSPROJRENT to RSofficer;
grant select,update on db6051.ZRSPROJBRANCH to RSofficer;
grant select,insert,update,delete on db6051.ZRSPROJMAINTENANCE to RSofficer;
grant select,insert,update on db6051.ZRSPROJCAR to RSofficer;
grant select,insert,update on db6051.ZRSPROJSTAFF to RSofficer;
grant select,insert,update,delete on db6051.ZRSPROJCUSTOMER to RSofficer;
--position manager
grant select,insert,update,delete on db6051.ZRSPROJRENT to RSmanager;
grant select,update on db6051.ZRSPROJBRANCH to RSmanager;
grant select,update,insert,delete on db6051.ZRSPROJMAINTENANCE to RSmanager;
grant select on db6051.ZRSPROJCAR to RSmanager;
grant select on db6051.ZRSPROJSTAFF to RSmanager;
grant select on db6051.ZRSPROJCUSTOMER to RSmanager;
--position staff
grant select,insert,update on db6051.ZRSPROJRENT to RSstaff;
grant select,insert,update on db6051.ZRSPROJMAINTENANCE to RSstaff;
grant select on db6051.ZRSPROJCUSTOMER to RSstaff;
--position customer
grant select on db6051.ZRSPROJRENT to RScustomer;
grant select on db6051.ZRSPROJBRANCH to RScustomer;
grant select on db6051.ZRSPROJCAR to RScustomer;
grant select on db6051.ZRSPROJCUSTOMER to RScustomer;

