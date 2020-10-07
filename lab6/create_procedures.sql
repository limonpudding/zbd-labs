CREATE OR REPLACE PROCEDURE GENERATE_TEAMS (i IN INTEGER) IS
    s int := 0; -- стартовый индекс
    d_mod int := 0; -- модуль (кол-во дисциплин)
    d_id int := 0; -- текущий id дисциплины
    last_id int := 0;
begin
    select count(*) into s from zbd.Team;
    select count(*) into d_mod from zbd.Discipline;
    last_id := i + s;
    d_id := 0;
    WHILE (s < last_id)
    LOOP
        insert into zbd.Team (id, name, discipline_id, blocked) values (s, 'Team_' || s, d_id, 0);
        s := s + 1;
        d_id := MOD(d_id + 1,  d_mod);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE GENERATE_PLAYERS AS
     teams_count int := 0; -- количество команд
     team_id int := 0; -- идентификатор текущей команды
     dis_id int := 0; -- идентификатор дисциплины
     dis_tms int := 0; -- количество игроков в команде в соответствии с дисциплиной
     i int := 0; -- счётчик по кол-ву игроков для одной команды
     nickname_i int := 0;
     ln_i int := 0;
     fn_i int := 0;
     country_mod int := 0;
     country_id int := 0;
     player_id int := 0;
BEGIN
    select count(*) into country_mod from zbd.Country;
    select count(*) into teams_count from zbd.Team;
    WHILE (team_id < teams_count) -- правильнее было бы использовать курсор, но я не помню как
    LOOP
        select tm.discipline_id into dis_id from zbd.Team tm where tm.id = team_id;
        select ds.teammates_count into dis_tms from zbd.Discipline ds where ds.id = dis_id;
        i := 0;
        WHILE (i < dis_tms)
        LOOP
            insert into zbd.Player (id, nickname, last_name, first_name, country_id, team_id, blocked) values
            (player_id, 'Nickname_' || nickname_i, 'LastName_' || ln_i,  'FirstName_' || fn_i, country_id, team_id, 0);
            i := i + 1;
            player_id := player_id + 1;
            nickname_i := nickname_i + 1;
            ln_i := ln_i + 1;
            fn_i := fn_i + 1;
        END LOOP;
        country_id := mod(country_id + 1,  country_mod);
        team_id := team_id + 1;
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE GENERATE_TOURNAMENTS (T_COUNT INTEGER) AS
    s int := 0; -- стартовый индекс
    city_mod int := 0;
    city_id int := 0;
    dis_mod int := 0;
    dis_id int := 0;
    tour_id int := 0;
    last_id int := 0;
BEGIN
    select count(*) into s from zbd.Tournament;
    select count(*) into city_mod from zbd.City;
    select count(*) into dis_mod from zbd.Discipline;
    tour_id := s;
    last_id := s + t_count;
    WHILE (tour_id < last_id)
    LOOP
        insert into zbd.Tournament (id, name, description, discipline_id, city_id, prize_fund) values
        (tour_id, 'Tournament_' || tour_id, 'Description_' || tour_id, dis_id, city_id, 1000000);
        city_id := mod(city_id + 1,  city_mod);
        dis_id := mod(dis_id + 1,  dis_mod);
        tour_id := tour_id + 1;
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE GENERATE_MATCHES AS -- генерирует по 15 матчей для каждого турнира
    tour_count int := 0;
tour_id int := 0;
i int := 0;
team_mod int := 0;
team1_id int := 0;
team2_id int := 0;
dis_mod int := 0;
dis_id int := 0;
map_mod int := 0;
map_id int := 0;
match_id int := 0;
BEGIN
select count(*) into tour_count from zbd.Tournament;
select count(*) into dis_mod from zbd.Discipline;
WHILE (tour_id < tour_count)
      LOOP
select count(*) into team_mod from zbd.Team tm where tm.discipline_id = dis_id;
select count(*) into map_mod from zbd.Map mp where mp.discipline_id = dis_id;
i := 0;
team1_id := 0;
team2_id := 1;
WHILE (i < 15)
      LOOP
insert into zbd.Match (id, tournament_id, math_datetime, map_id, team1_id, team2_id) values
(match_id, tour_id, to_timestamp('2020-01-01 20:00', 'YYYY-MM-DD HH24:MI'), map_id, team1_id, team2_id);
team1_id := mod(team1_id + 2,  team_mod);
team2_id := mod(team1_id + 1,  team_mod);
i := i + 1;
match_id := match_id + 1;
END LOOP;
dis_id := mod(dis_id + 1, dis_mod);
tour_id := tour_id + 1;
END LOOP;
END;
/