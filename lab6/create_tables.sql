
create table zbd.Discipline (
    id int not null,
    name varchar(32) not null,
    teammates_count int not null,
    constraint pk_discipline
        primary key (id)
);

create table zbd.Map (
    id int not null,
    name varchar(32) not null,
    discipline_id int not null,
    constraint pk_map
        primary key (id),
    constraint fk_map_discipline
        foreign key (discipline_id)
        references zbd.Discipline(id)
);

create table zbd.Country (
    id int not null,
    name varchar(32),
    constraint pk_country
        primary key (id)
);

create table zbd.City (
    id int not null,
    name varchar(32) not null,
    country int not null,
    constraint pk_city
        primary key (id),
    constraint fk_city_country
        foreign key (country)
        references zbd.Country(id)
);

create table zbd.Team (
    id int not null,
    name varchar(32) not null,
    discipline_id int not null,
    blocked char(1) not null,
    constraint pk_team
        primary key (id),
    constraint fk_team_discipline
        foreign key (discipline_id)
        references zbd.Discipline(id)
);

create table zbd.Player (
    id int not null,
    nickname varchar(32),
    last_name varchar(32) not null,
    first_name varchar(32) not null,
    country_id int not null,
    team_id int not null,
    blocked char(1) not null,
    constraint pk_player
        primary key (id),
    constraint fk_player_country
        foreign key (country_id)
        references zbd.Country(id),
    constraint fk_player_team
        foreign key (team_id)
        references zbd.Team(id)
);

create table zbd.Tournament (
    id int not null,
    name varchar(32) not null,
    description varchar(32),
    discipline_id int not null,
    city_id int not null,
    prize_fund int not null,
    constraint pk_tournament
        primary key (id),
    constraint fk_tournament_discipline
        foreign key (discipline_id)
        references zbd.Discipline(id),
    constraint fk_tournament_city
        foreign key (city_id)
        references zbd.City(id)
);

create table zbd.Match (
    id int not null,
    tournament_id int not null,
    math_datetime timestamp not null,
    map_id int not null,
    team1_id int not null,
    team2_id int not null,
    constraint pk_match
        primary key (id),
    constraint fk_match_tournament
        foreign key (tournament_id)
        references zbd.Tournament(id),
    constraint fk_match_map
        foreign key (map_id)
        references zbd.Map(id),
    constraint fk_match_team1
        foreign key (team1_id)
        references zbd.Team(id),
    constraint fk_match_team2
        foreign key (team2_id)
        references zbd.Team(id)
);