-- script that lists all bands with glam rock
-- and rank them by theur longevity

SELECT band_name,
(CASE 
	WHEN formed = 0 OR formed IS NULL THEN NULL
	ELSE IF(split = 0 OR split IS NULL, 2022 - formed, split - formed)
END) AS lifespan
FROM metal_bands
WHERE main_style = 'Glam rock'
ORDER BY lifespan DESC;
