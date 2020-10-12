create user Zbd identified by ‘password’ default tablespace zbdtbs;
create user MatchManager identified by ‘password’ default tablespace zbdtbs;
create user PlayerManager identified by ‘password’ default tablespace zbdtbs;

grant create session to Zbd;
grant create table to Zbd;
grant create any procedure to Zbd;
grant create any trigger to Zbd;
grant create sequence to Zbd;
grant create view to Zbd;
grant create synonym Zbd;
grant unlimited tablespace to Zbd;

grant create session to MatchManager;
grant unlimited tablespace to MatchManager;
grant create session to PlayerManager;
grant unlimited tablespace to PlayerManager;

grant select, insert, update, delete on ZBD.Discipline to ZBD;
grant select, insert, update, delete on ZBD.Map to ZBD;
grant select, insert, update, delete on ZBD.Country to ZBD;
grant select, insert, update, delete on ZBD.City to ZBD;
grant select, insert, update, delete on ZBD.Team to ZBD;
grant select, insert, update, delete on ZBD.Player to ZBD;
grant select, insert, update, delete on ZBD.Tournament to ZBD;
grant select, insert, update, delete on ZBD.Match to ZBD;

grant select, insert, update, delete on ZBD.Tournament to MatchManager;
grant select, insert, update, delete on ZBD.Match to MatchManager;

grant select, insert, update, delete on ZBD.Team to PlayerManager;
grant select, insert, update, delete on ZBD.Player to PlayerManager;

select privilege from dba_sys_privs where grantee = 'ZBD';
select privilege from dba_sys_privs where grantee = 'MATCHMANAGER';
select privilege from dba_sys_privs where grantee = 'PLAYERMANAGER';

select table_name, privilege from dba_tab_privs where grantee = 'ZBD';
select table_name, privilege from dba_tab_privs where grantee = 'MATCHMANAGER';
select table_name, privilege from dba_tab_privs where grantee = 'PLAYERMANAGER';
