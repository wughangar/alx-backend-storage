-- script that lists all bands with glam rock
-- and rank them by theur longevity

SELECT band_name, (IFNULL(split, 2022) - formed) AS lifespan
FROM metal_bands
WHERE INSTR(style, 'Glam rock') > 0
ORDER BY lifespan DESC;
