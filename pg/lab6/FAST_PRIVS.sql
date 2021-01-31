CREATE OR REPLACE FUNCTION FAST_PRIVILEGES(priv_type VARCHAR(1), privs VARCHAR(6), target VARCHAR(64), username VARCHAR(64))
RETURNS VARCHAR(512)
AS $body$
DECLARE added_priv INT = 0;
        query varchar(512) = '';
BEGIN
    IF (UPPER(priv_type) = 'G') THEN
        query = 'GRANT ';
    END IF;
    IF (UPPER(priv_type) = 'R') THEN
        query = 'REVOKE ';
    END IF;
    IF (UPPER(privs) like '%A%') THEN
        query = query || 'ALL';
        added_priv = added_priv + 1;
    END IF;
    IF (UPPER(privs) like '%S%') THEN
        IF (added_priv > 0) THEN
            query = query || ', ';
        END IF;
        query = query || 'SELECT';
        added_priv = added_priv + 1;
    END IF;
    IF (UPPER(privs) like '%I%') THEN
        IF (added_priv > 0) THEN
            query = query || ', ';
        END IF;
        query = query || 'INSERT';
        added_priv = added_priv + 1;
    END IF;
    IF (UPPER(privs) like '%U%') THEN
        IF (added_priv > 0) THEN
            query = query || ', ';
            END IF;
            query = query || 'UPDATE';
            added_priv = added_priv + 1;
    END IF;
    IF (UPPER(privs) like '%D%') THEN
        IF (added_priv > 0) THEN
            query = query || ', ';
        END IF;
        query = query || 'DELETE';
        added_priv = added_priv + 1;
    END If;
    IF (UPPER(privs) like '%R%') THEN
        IF (added_priv > 0) THEN
            query = query || ', ';
        END IF;
        query = query || 'REFERENCES';
        added_priv = added_priv + 1;
    END IF;
    query = query || ' ON ' || target;
    IF (UPPER(priv_type) = 'G') THEN
        query = query || ' TO ';
    END IF;
    IF (UPPER(priv_type) = 'R') THEN
        query = query || ' FROM ';
    END IF;
    query = query || username || ';';
    EXECUTE query;
    RETURN 'SUCCESS';
END;
$body$ LANGUAGE 'plpgsql';