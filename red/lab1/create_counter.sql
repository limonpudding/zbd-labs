connect "/db/red/reddb_lab1.fdb";
SET TERM #;
CREATE PROCEDURE ALL_COUNT
RETURNS (s int,
    dis_count int,
    map_count int,
    country_count int,
    city_count int,
    team_count int,
    player_count int,
    tour_count int,
    match_count int) AS
BEGIN
    select count(*) from Discipline into :dis_count;
    s = :dis_count;
    select count(*) from Map into :map_count;
    s = :s + :map_count;
    select count(*) from Country into :country_count;
    s = :s + :country_count;
    select count(*) from City into :city_count;
    s = :s + :city_count;
    select count(*) from Team into :team_count;
    s = :s + :team_count;
    select count(*) from Player into :player_count;
    s = :s + :player_count;
    select count(*) from Tournament into :tour_count;
    s = :s + :tour_count;
    select count(*) from Match into :match_count;
    s = :s + :match_count;
    SUSPEND;
END;
#
SET TERM #;
