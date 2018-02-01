USE healthcenter;

-- INNER JOIN -> list doctors with their specialties
SELECT doctor.id_code, specialty.name
FROM doctor
INNER JOIN specialty on doctor.fk_specialty_id = specialty.id;

-- LEFT JOIN -> list all units with admitted patients 
SELECT unit.name, admission.fk_social_sec, CONCAT(patient.firstname, '  ', patient.flastname)
FROM unit
LEFT JOIN admission on unit.id = admission.fk_unit_id
LEFT JOIN patient on admission.fk_social_sec = patient.social_security;

-- RIGHT JOIN
SELECT unit.name, admission.fk_social_sec
FROM unit
RIGHT JOIN admission on unit.id = admission.fk_unit_id;

-- COUNT() and GROUP BY -> list all units with patient count
SELECT unit.name, COUNT(admission.fk_social_sec)
FROM unit
LEFT JOIN admission on unit.id = admission.fk_unit_id
GROUP BY unit.id;

-- SUBQUERY -> list all doctors with specialty neurosurgery
SELECT firstname, flastname
FROM doctor
WHERE fk_specialty_id IN ( SELECT id
                                            FROM specialty
                                            WHERE name = 'neurosurgery');

-- same result with JOIN
SELECT firstname, flastname
FROM doctor
JOIN specialty on doctor.fk_specialty_id = specialty.id
WHERE specialty.name = 'neurosurgery';

-- OUTER JOIN is not implemented in MySQL -> workaround UNION
SELECT *
FROM doctor
LEFT JOIN specialty on doctor.fk_specialty_id = specialty.id

UNION

SELECT *
FROM doctor
RIGHT JOIN specialty on doctor.fk_specialty_id = specialty.id;

