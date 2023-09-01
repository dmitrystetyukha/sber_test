SELECT
    subquery.acc,
    subquery.dt_from,
    subquery.dt_to,
    subquery.balance
FROM
    (
        SELECT
            t1.acc,
            t1.dt_from,
            COALESCE(MIN(t2.dt_from), '3000-01-01') AS dt_to,
            t1.balance
        FROM
            (
                SELECT
                    t1.acc,
                    t1.tdate AS dt_from,
                    SUM(t1.amount) AS balance
                FROM
                    (
                        SELECT
                            `from` AS acc,
                            tdate,
                            amount
                        FROM
                            transfers
                        UNION ALL
                        SELECT
                            `to` AS acc,
                            tdate,
                            - amount
                        FROM
                            transfers
                    ) AS t1
                    LEFT JOIN (
                        SELECT
                            `from` AS acc,
                            tdate AS dt_from
                        FROM
                            transfers
                        UNION ALL
                        SELECT
                            `to` AS acc,
                            tdate AS dt_from
                        FROM
                            transfers
                    ) AS t2 ON t1.acc = t2.acc
                    AND t1.tdate < t2.dt_from
                GROUP BY
                    t1.acc,
                    t1.tdate
            ) AS t1
            LEFT JOIN (
                SELECT
                    `from` AS acc,
                    tdate AS dt_from
                FROM
                    transfers
                UNION ALL
                SELECT
                    `to` AS acc,
                    tdate AS dt_from
                FROM
                    transfers
            ) AS t2 ON t1.acc = t2.acc
            AND t1.dt_from < t2.dt_from
        GROUP BY
            t1.acc,
            t1.dt_from
    ) AS subquery;