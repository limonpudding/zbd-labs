CREATE TABLE Journal
(
    id           int primary key,
    action_time  timestamp,
    user_name    varchar(32),
    operation    varchar(6),
    action_table varchar(32)
);

CREATE TRIGGER TR_JR_MATCH FOR Match
    BEFORE INSERT or UPDATE or DELETE
    AS
DECLARE operation VARCHAR(6);
BEGIN
if (inserting)
   then operation = 'INSERT';
if (updating)
   then operation = 'UPDATE';
if (deleting)
   then operation = 'DELETE';
insert into Journal (id, action_time, user_name, operation, action_table)
values ((select count(*) from Journal), CURRENT_TIMESTAMP, CURRENT_USER, :operation, 'Match');
END;

CREATE TRIGGER TR_JR_TOURNAMENT FOR Tournament
    BEFORE INSERT or UPDATE or DELETE
    AS
DECLARE operation VARCHAR(6);
BEGIN
if (inserting)
   then operation = 'INSERT';
if (updating)
   then operation = 'UPDATE';
if (deleting)
   then operation = 'DELETE';
insert into Journal (id, action_time, user_name, operation, action_table)
values ((select count(*) from Journal), CURRENT_TIMESTAMP, CURRENT_USER, :operation, 'Tournament');
END;

CREATE TRIGGER TR_JR_PLAYER FOR Player
    BEFORE INSERT or UPDATE or DELETE
    AS
DECLARE operation VARCHAR(6);
BEGIN
if (inserting)
   then operation = 'INSERT';
if (updating)
   then operation = 'UPDATE';
if (deleting)
   then operation = 'DELETE';
insert into Journal (id, action_time, user_name, operation, action_table)
values ((select count(*) from Journal), CURRENT_TIMESTAMP, CURRENT_USER, :operation, 'Player');
END;

CREATE TRIGGER TR_JR_TEAM FOR Team
    BEFORE INSERT or UPDATE or DELETE
    AS
DECLARE operation VARCHAR(6);
BEGIN
if (inserting)
   then operation = 'INSERT';
if (updating)
   then operation = 'UPDATE';
if (deleting)
   then operation = 'DELETE';
insert into Journal (id, action_time, user_name, operation, action_table)
values ((select count(*) from Journal), CURRENT_TIMESTAMP, CURRENT_USER, :operation, 'Team');
END;

CREATE TRIGGER TR_JR_CITY FOR City
    BEFORE INSERT or UPDATE or DELETE
    AS
DECLARE operation VARCHAR(6);
BEGIN
if (inserting)
   then operation = 'INSERT';
if (updating)
   then operation = 'UPDATE';
if (deleting)
   then operation = 'DELETE';
insert into Journal (id, action_time, user_name, operation, action_table)
values ((select count(*) from Journal), CURRENT_TIMESTAMP, CURRENT_USER, :operation, 'City');
END;

CREATE TRIGGER TR_JR_COUNTRY FOR Country
    BEFORE INSERT or UPDATE or DELETE
    AS
DECLARE operation VARCHAR(6);
BEGIN
if (inserting)
   then operation = 'INSERT';
if (updating)
   then operation = 'UPDATE';
if (deleting)
   then operation = 'DELETE';
insert into Journal (id, action_time, user_name, operation, action_table)
values ((select count(*) from Journal), CURRENT_TIMESTAMP, CURRENT_USER, :operation, 'Country');
END;

CREATE TRIGGER TR_JR_MAP FOR Map
    BEFORE INSERT or UPDATE or DELETE
    AS
DECLARE operation VARCHAR(6);
BEGIN
if (inserting)
   then operation = 'INSERT';
if (updating)
   then operation = 'UPDATE';
if (deleting)
   then operation = 'DELETE';
insert into Journal (id, action_time, user_name, operation, action_table)
values ((select count(*) from Journal), CURRENT_TIMESTAMP, CURRENT_USER, :operation, 'Map');
END;

CREATE TRIGGER TR_JR_DISCIPLINE FOR Discipline
    BEFORE INSERT or UPDATE or DELETE
    AS
DECLARE operation VARCHAR(6);
BEGIN
if (inserting)
   then operation = 'INSERT';
if (updating)
   then operation = 'UPDATE';
if (deleting)
   then operation = 'DELETE';
insert into Journal (id, action_time, user_name, operation, action_table)
values ((select count(*) from Journal), CURRENT_TIMESTAMP, CURRENT_USER, :operation, 'Discipline');
END;
