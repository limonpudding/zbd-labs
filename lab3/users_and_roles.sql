CREATE ROLE CommonUser;
GRANT SELECT ON Match TO ROLE CommonUser;
GRANT SELECT ON Tournament TO ROLE CommonUser;
GRANT SELECT ON Player TO ROLE CommonUser;
GRANT SELECT ON Team TO ROLE CommonUser;
GRANT SELECT ON City TO ROLE CommonUser;
GRANT SELECT ON Country TO ROLE CommonUser;
GRANT SELECT ON Map TO ROLE CommonUser;
GRANT SELECT ON Discipline TO ROLE CommonUser;

CREATE USER PlayerManager PASSWORD 'passwdpm';
GRANT CommonUser TO PlayerManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Team TO USER PlayerManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Player TO USER PlayerManager;

CREATE USER MatchManager PASSWORD 'passwdmm';
GRANT CommonUser TO MatchManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Tournament TO USER MatchManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Match TO USER MatchManager;

