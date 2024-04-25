-- A SQL script that lists all bands with Glam rock as their main style, ranked by their longevity
-- 3-glam_rock
SELECT band_name, (2022 - IFNULL(split, formed)) as lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
