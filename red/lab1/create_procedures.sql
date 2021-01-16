connect "/db/red/reddb_lab1.fdb";
SET TERM #;

create PROCEDURE GENERATE_TEAMS (I INTEGER) AS
    DECLARE VARIABLE s int default 0; -- стартовый индекс
    DECLARE VARIABLE d_mod int default 0; -- модуль (кол-во дисциплин)
    DECLARE VARIABLE d_id int default 0; -- текущий id дисциплины
BEGIN
    select count(*) from Team into :s;
    select count(*) from Discipline into :d_mod;
    i = :i + :s;
    WHILE(:s < :i)DO
    BEGIN
        insert into Team (id, name, discipline_id, blocked) values (cast(:s as int), 'Team_' || cast(:s as varchar(10)), :d_id, FALSE);
        s = :s + 1;
        d_id = mod(:d_id + 1,  :d_mod);
    END
END;
#
CREATE PROCEDURE GENERATE_PLAYERS AS
    DECLARE VARIABLE teams_count int default 0; -- количество команд
    DECLARE VARIABLE team_id int default 0; -- идентификатор текущей команды
    DECLARE VARIABLE dis_id int default 0; -- идентификатор дисциплины
    DECLARE VARIABLE dis_tms int default 0; -- количество игроков в команде в соответствии с дисциплиной
    DECLARE VARIABLE i int default 0; -- счётчик по кол-ву игроков для одной команды
    DECLARE VARIABLE nickname_i int default 0;
    DECLARE VARIABLE ln_i int default 0;
    DECLARE VARIABLE fn_i int default 0;
    DECLARE VARIABLE country_mod int default 0;
    DECLARE VARIABLE country_id int default 0;
    DECLARE VARIABLE player_id int default 0;
BEGIN
    select count(*) from Country into :country_mod;
    select count(*) from Team into :teams_count;
    WHILE(:team_id < :teams_count)DO -- правильнее было бы использовать курсор, но я не помню как
    BEGIN
        select Team.discipline_id from Team where Team.id = :team_id into :dis_id;
        select Discipline.teammates_count from Discipline where Discipline.id = :dis_id into :dis_tms;
        i = 0;
        WHILE(:i < :dis_tms)DO
        BEGIN
            insert into Player (id, nickname, last_name, first_name, country_id, team_id, blocked) values
            (cast(:player_id as int), 'Nickname_' || cast(:nickname_i as varchar(10)), 'LastName_' || cast(:ln_i as varchar(10)),  'FirstName_' || cast(:fn_i as varchar(10)), :country_id, :team_id, FALSE);
            i = :i + 1;
            player_id = :player_id + 1;
            nickname_i = :nickname_i + 1;
            ln_i = :ln_i + 1;
            fn_i = :fn_i + 1;
        END
        country_id = mod(:country_id + 1,  :country_mod);
        team_id = :team_id + 1;
    END
END;
#
CREATE PROCEDURE GENERATE_TOURNAMENTS (T_COUNT INTEGER) AS
    DECLARE VARIABLE s int default 0; -- стартовый индекс
    DECLARE VARIABLE city_mod int default 0;
    DECLARE VARIABLE city_id int default 0;
    DECLARE VARIABLE dis_mod int default 0;
    DECLARE VARIABLE dis_id int default 0;
    DECLARE VARIABLE tour_id int default 0;
BEGIN
    select count(*) from Tournament into :s;
    select count(*) from City into :city_mod;
    select count(*) from Discipline into :dis_mod;
    tour_id = :s;
    t_count = :s + :t_count;
    WHILE(:tour_id < :t_count)DO
    BEGIN
        insert into Tournament (id, name, description, discipline_id, city_id, prize_fund) values
        (cast(:tour_id as int), 'Tournament_' || cast(:tour_id as varchar(10)), 'Description_' || cast(:tour_id as varchar(10)), :dis_id, :city_id, 1000000);
        city_id = mod(:city_id + 1,  :city_mod);
        dis_id = mod(:dis_id + 1,  :dis_mod);
        tour_id = :tour_id + 1;
    END
END;
#
CREATE PROCEDURE GENERATE_MATCHES AS -- генерирует по 15 матчей для каждого турнира
    DECLARE VARIABLE tour_count int default 0;
    DECLARE VARIABLE tour_id int default 0;
    DECLARE VARIABLE i int default 0;
    DECLARE VARIABLE team_mod int default 0;
    DECLARE VARIABLE team1_id int default 0;
    DECLARE VARIABLE team2_id int default 0;
    DECLARE VARIABLE dis_mod int default 0;
    DECLARE VARIABLE dis_id int default 0;
    DECLARE VARIABLE map_mod int default 0;
    DECLARE VARIABLE map_id int default 0;
    DECLARE VARIABLE match_id int default 0;
BEGIN
    select count(*) from Tournament into tour_count;
    select count(*) from Discipline into dis_mod;
    WHILE(:tour_id < :tour_count)DO
    BEGIN
        select count(*) from Team where Team.discipline_id = :dis_id into :team_mod;
        select count(*) from Map where Map.discipline_id = :dis_id into :map_mod;
        i = 0;
        team1_id = 0;
        team2_id = 1;
        WHILE(:i < 15)DO
        BEGIN
            insert into Match (id, tournament_id, math_datetime, map_id, team1_id, team2_id) values
            (cast(:match_id as int), :tour_id, timestamp '2020-01-01 20:00' , :map_id, :team1_id, :team2_id);
            team1_id = mod(:team1_id + 2,  :team_mod);
            team2_id = mod(:team1_id + 1,  :team_mod);
            i = :i + 1;
            match_id = :match_id + 1;
        END
        dis_id = mod(:dis_id + 1, :dis_mod);
        tour_id = :tour_id + 1;
    END
END;
#
SET TERM ;#
