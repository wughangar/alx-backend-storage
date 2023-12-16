-- script that ranks country origins of bands
-- ordered by nmumber of fans

SELECT origin, 
SUM(nb_fans) AS total_fans,
ROW_NUMBER() OVER (ORDER BY SUM(nb_fans) DESC) AS country_rank
FROM metal_bands
GROUP BY origin
ORDER BY total_fans DESC;
