-- LIST ALL BANDS WITH glam rock as main style
-- CALCULATE THE YEAR THEY PLAYED TOGOTHER
SELECT band_name,
CASE
	WHEN split IS NULL THEN 2020 - formed
	ELSE split - formed
	END AS lifespan
FROM metal_bands WHERE style LIKE '%Glam rock%' ORDER BY lifespan DESC;
