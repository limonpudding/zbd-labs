insert into zbd.City (id, name, country) values (0, 'Copenhagen', (select id from Country where Country.name = 'Denmark'));
insert into zbd.City (id, name, country) values (1, 'Moscow', (select id from Country where Country.name = 'Russia'));
insert into zbd.City (id, name, country) values (2, 'Stockholm', (select id from Country where Country.name = 'Sweden'));
insert into zbd.City (id, name, country) values (3, 'Cologne', (select id from Country where Country.name = 'Germany'));
insert into zbd.City (id, name, country) values (4, 'Kiev', (select id from Country where Country.name = 'Ukraine'));
insert into zbd.City (id, name, country) values (5, 'Warsaw', (select id from Country where Country.name = 'Poland'));
