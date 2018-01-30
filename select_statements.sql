USE healthcenter;

-- eliminate all the duplicate records with DISTINCT
SELECT DISTINCT fk_symptom_id
FROM intervention;

SELECT  fk_symptom_id
FROM intervention;

-- WHERE
SELECT * FROM patient
WHERE firstname='Holly';

-- LIKE
SELECT * FROM patient
WHERE flastname LIKE '%h%';

-- NOT LIKE
SELECT * FROM patient
WHERE flastname NOT LIKE '%h%';

-- AND/OR
SELECT * FROM doctor
WHERE flastname NOT LIKE '%h%' AND flastname LIKE '%m%';

-- BETWEEN
SELECT name FROM symptom
WHERE id BETWEEN 1 AND 2;

-- UPDATE
UPDATE symptom
SET name = 'Cough'
WHERE id = 1;

-- ORDER BY ASC/DESC
SELECT * FROM treatment 
ORDER BY name DESC;

-- DELETE FROM treatment WHERE id = 1;