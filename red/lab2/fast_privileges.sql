connect "/db/red/reddb_lab1.fdb";
SET TERM #;

CREATE PROCEDURE FAST_PRIVILEGES(priv_type VARCHAR(1), privs VARCHAR(6), target VARCHAR(64), username VARCHAR(64))
RETURNS (query VARCHAR(512)) AS
DECLARE added_priv INT DEFAULT 0;
BEGIN
    IF (UPPER(priv_type) = 'G') THEN
        BEGIN
            query = 'GRANT ';
        END
    IF (UPPER(priv_type) = 'R') THEN
        BEGIN
            query = 'REVOKE ';
        END
    IF (UPPER(privs) like '%A%') THEN
        BEGIN
            query = :query || 'ALL';
            added_priv = :added_priv + 1;
        END
    IF (UPPER(privs) like '%S%') THEN
        BEGIN
            IF (added_priv > 0) THEN
                BEGIN
                    query = :query || ', ';
                END
            query = :query || 'SELECT';
            added_priv = :added_priv + 1;
        END
    IF (UPPER(privs) like '%I%') THEN
        BEGIN
            IF (added_priv > 0) THEN
                BEGIN
                    query = :query || ', ';
                END
            query = :query || 'INSERT';
            added_priv = :added_priv + 1;
        END
    IF (UPPER(privs) like '%U%') THEN
        BEGIN
            IF (added_priv > 0) THEN
                BEGIN
                    query = :query || ', ';
                END
            query = :query || 'UPDATE';
            added_priv = :added_priv + 1;
        END
    IF (UPPER(privs) like '%D%') THEN
        BEGIN
            IF (added_priv > 0) THEN
                BEGIN
                    query = :query || ', ';
                END
            query = :query || 'DELETE';
            added_priv = :added_priv + 1;
        END
    IF (UPPER(privs) like '%R%') THEN
        BEGIN
            IF (added_priv > 0) THEN
                BEGIN
                    query = :query || ', ';
                END
            query = :query || 'REFERENCES';
            added_priv = :added_priv + 1;
        END
    query = :query || ' ON ' || target;
    IF (UPPER(priv_type) = 'G') THEN
        BEGIN
            query = :query || ' TO USER ';
        END
    IF (UPPER(priv_type) = 'R') THEN
        BEGIN
            query = :query || ' FROM USER ';
        END
    query = :query || username || ';';
    EXECUTE STATEMENT query;
    SUSPEND;
END;

#
SET TERM ;#