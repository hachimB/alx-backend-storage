-- A SQL script that lists all bands with Glam rock as their main style, ranked by their longevity
-- 3-glam_rock
-- SELECT band_name, (IFNULL(split, 2022) - formed) as lifespan
-- FROM metal_bands
-- WHERE style LIKE '%Glam rock%'
-- ORDER BY lifespan DESC;
SELECT band_name, 
       CASE 
           WHEN split IS NOT NULL THEN split - formed 
           ELSE 2022 - formed 
       END as lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
