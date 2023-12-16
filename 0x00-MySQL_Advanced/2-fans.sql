-- script that ranks country origins of bands
-- ordered by nmumber of fans

SELECT origin, SUM(total_fans) as nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
