-- SELECT
--   *
-- FROM
--   stops
-- LEFT OUTER JOIN
--   routes ON stops.id = routes.stop_id

SELECT
 a.company, a.num, a.stop_id, b.stop_id
FROM
 routes a
JOIN
 routes b ON (a.company = b.company AND a.num = b.num)
WHERE
 a.stop_id = 53
