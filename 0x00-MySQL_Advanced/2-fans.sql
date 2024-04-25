-- A SQL script that ranks country origins of bands
-- fans.sql
SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;