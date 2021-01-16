connect "/db/red/reddb_lab1.fdb";
insert into Map (id, name, discipline_id) values (0, 'Inferno', (select id from Discipline where Discipline.name = 'CS:GO'));
insert into Map (id, name, discipline_id) values (1, 'Dust 2', (select id from Discipline where Discipline.name = 'CS:GO'));
insert into Map (id, name, discipline_id) values (2, 'Mirage', (select id from Discipline where Discipline.name = 'CS:GO'));
insert into Map (id, name, discipline_id) values (3, 'Cache', (select id from Discipline where Discipline.name = 'CS:GO'));
insert into Map (id, name, discipline_id) values (4, 'Cobblestone', (select id from Discipline where Discipline.name = 'CS:GO'));
insert into Map (id, name, discipline_id) values (5, 'Overpass', (select id from Discipline where Discipline.name = 'CS:GO'));
insert into Map (id, name, discipline_id) values (6, 'Nuke', (select id from Discipline where Discipline.name = 'CS:GO'));
insert into Map (id, name, discipline_id) values (7, 'Dota 2', (select id from Discipline where Discipline.name = 'Dota 2'));
insert into Map (id, name, discipline_id) values (8, 'DORADO', (select id from Discipline where Discipline.name = 'Overwatch'));
insert into Map (id, name, discipline_id) values (9, 'HAVANA', (select id from Discipline where Discipline.name = 'Overwatch'));
insert into Map (id, name, discipline_id) values (10, 'JUNKERTOWN', (select id from Discipline where Discipline.name = 'Overwatch'));
insert into Map (id, name, discipline_id) values (11, 'RIALTO', (select id from Discipline where Discipline.name = 'Overwatch'));
insert into Map (id, name, discipline_id) values (12, 'Erangel', (select id from Discipline where Discipline.name = 'PUBG'));
insert into Map (id, name, discipline_id) values (13, 'Miramar', (select id from Discipline where Discipline.name = 'PUBG'));
insert into Map (id, name, discipline_id) values (14, 'Map1', (select id from Discipline where Discipline.name = 'Fortnite'));
insert into Map (id, name, discipline_id) values (15, 'Map2', (select id from Discipline where Discipline.name = 'Fortnite'));
insert into Map (id, name, discipline_id) values (16, 'Map3', (select id from Discipline where Discipline.name = 'Fortnite'));
insert into Map (id, name, discipline_id) values (17, 'Map4', (select id from Discipline where Discipline.name = 'Fortnite'));
insert into Map (id, name, discipline_id) values (18, 'Map5', (select id from Discipline where Discipline.name = 'Fortnite'));
insert into Map (id, name, discipline_id) values (19, 'Bind', (select id from Discipline where Discipline.name = 'Valorant'));
insert into Map (id, name, discipline_id) values (20, 'Haven', (select id from Discipline where Discipline.name = 'Valorant'));
insert into Map (id, name, discipline_id) values (21, 'Split', (select id from Discipline where Discipline.name = 'Valorant'));
