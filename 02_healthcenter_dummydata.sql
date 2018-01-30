USE healthcenter;

INSERT INTO floor (name) VALUES ('EG');
INSERT INTO floor (name) VALUES ('C-1');

INSERT INTO specialty (name) VALUES ('orthopedics');
INSERT INTO specialty (name) VALUES ('neurosurgery');

INSERT INTO doctor VALUES ('08_hh', 'Herbert', 'Herbst', 1);
INSERT INTO doctor VALUES ('01_mm', 'Maria', 'Musterdoktor', 2);

INSERT INTO unit (name, fk_floor_id, fk_doctor_code) VALUES ('Unit A', 1, '08_hh');
INSERT INTO unit (name, fk_floor_id, fk_doctor_code) VALUES ('Unit B', 2, '01_mm');

INSERT INTO patient (social_security, firstname, flastname, birthdate) VALUES (1485190678, 'Holly', 'Hunter', '1978-06-19');
INSERT INTO patient (social_security, firstname, flastname, birthdate) VALUES (1843211270, 'Julia', 'Juhu', '1970-12-21');

INSERT INTO admission(admission_date, release_date, fk_unit_id, fk_social_sec) VALUES( '2017-12-31', NULL, 1, 1485190678);
INSERT INTO admission(admission_date, release_date, fk_unit_id, fk_social_sec) VALUES( '2018-01-11', NULL, 2, 1843211270);

INSERT INTO symptom (name) VALUES ('cough');
INSERT INTO symptom (name) VALUES ('fever');
INSERT INTO symptom (name) VALUES ('back pain');

INSERT INTO treatment (name) VALUES ('Painkiller');
INSERT INTO treatment (name) VALUES ('Cough Sirup');
INSERT INTO treatment (name) VALUES ('Massage');

INSERT INTO intervention(intervention_date, fk_admission_id, fk_symptom_id, fk_treatment_id) VALUES ('2017-12-31', 1, 1, 2);
INSERT INTO intervention(intervention_date, fk_admission_id, fk_symptom_id, fk_treatment_id) VALUES ('2018-01-12', 2, 3, 3);
INSERT INTO intervention(intervention_date, fk_admission_id, fk_symptom_id, fk_treatment_id) VALUES ('2018-01-12', 2, 3, 1);