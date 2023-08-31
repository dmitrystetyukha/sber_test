WITH RECURSIVE dates AS (
    SELECT current_date::date AS date
    UNION ALL
    SELECT (
      date + (FLOOR(RANDOM() * 6) + 2) * INTERVAL '1 day')::date
    FROM dates
    WHERE (date + (FLOOR(RANDOM() * 6) + 2) * INTERVAL '1 day')::date <= current_date + INTERVAL '100 day'
)
SELECT date
FROM dates
LIMIT 100;