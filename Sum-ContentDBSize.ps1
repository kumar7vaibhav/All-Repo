SELECT
    DB_NAME(database_id) AS DatabaseName,
    SUM(size) * 8 / 1024 AS Size_MB
FROM
    sys.master_files
WHERE
    DB_NAME(database_id) LIKE 'WSS_Content%'
GROUP BY
    database_id;


SELECT
    SUM(Size_MB) AS TotalSize_MB
FROM
    (SELECT
        DB_NAME(database_id) AS DatabaseName,
        SUM(size) * 8 / 1024 AS Size_MB
    FROM
        sys.master_files
    WHERE
        DB_NAME(database_id) LIKE 'WSS_Content%'
    GROUP BY
        database_id) AS ContentSizes;
