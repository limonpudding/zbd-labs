connect "/db/red/reddb_lab1.fdb";
execute procedure GENERATE_TEAMS(1000);
execute procedure GENERATE_PLAYERS;
execute procedure GENERATE_TOURNAMENTS(30000);
execute procedure GENERATE_MATCHES;
