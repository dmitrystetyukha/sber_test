WITH RECURSIVE
  dates AS (
    SELECT
      CURDATE () AS date
    UNION ALL
    SELECT
      DATE_ADD (date, INTERVAL FLOOR(RAND () * 6) + 2 DAY)
    FROM
      dates
    WHERE
      DATE_ADD (date, INTERVAL FLOOR(RAND () * 6) + 2 DAY) <= CURDATE () + INTERVAL 100 DAY
  )
SELECT
  date
FROM
  dates
LIMIT
  100;