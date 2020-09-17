create table Discipline (
                            id int primary key,
                            name varchar(32) not null,
                            teammates_count int not null
);

create table Map (
                     id int primary key,
                     name varchar(32) not null,
                     discipline_id int references Discipline
);

create table Country (
                         id int primary key,
                         name varchar(32)
);

create table City (
                      id int primary key,
                      name varchar(32) not null,
                      country int references Country
);

create table Team (
                      id int primary key,
                      name varchar(32) not null,
                      discipline_id int references Discipline,
                      blocked boolean not null
);

create table Player (
                        id int primary key,
                        nickname varchar(32),
                        last_name varchar(32) not null,
                        first_name varchar(32) not null,
                        country_id int references Country,
                        team_id int references Team,
                        blocked boolean not null
);

create table Tournament (
                            id int primary key,
                            name varchar(32) not null,
                            description varchar(32),
                            discipline_id int references Discipline,
                            city_id int references City,
                            prize_fund int not null
);

create table Match (
                       id int primary key,
                       tournament_id int references Tournament,
                       math_datetime timestamp not null,
                       map_id int references Map,
                       team1_id int references Team,
                       team2_id int references Team
);