-- SCRIPT TO RANK COUNTRY ORIGNS BY NUMBER OF FANS
-- 2 COLUMN MUST BE RETURNED
SELECT origin, SUM(fans) AS nbr_fans FROM metal_bands GROUP BY origin ORDER BY nbr_fans DESC;
