DROP DATABASE IF EXISTS healthcenter;

CREATE DATABASE IF NOT EXISTS healthcenter DEFAULT CHARACTER SET utf8;

USE healthcenter;

-- create tables

CREATE TABLE IF NOT EXISTS floor (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    name NVARCHAR(6),
    CONSTRAINT pk_floor PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS unit (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    name NVARCHAR(20) NOT NULL,
    fk_floor_id INT unsigned NOT NULL,
    fk_doctor_code NVARCHAR(8) NOT NULL,
    CONSTRAINT pk_unit PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS specialty (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    name NVARCHAR(55),
    CONSTRAINT pk_specialty PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS doctor (
	id_code NVARCHAR(8) NOT NULL,
    firstname NVARCHAR(55) NOT NULL,
    flastname NVARCHAR(55) NOT NULL,
    fk_specialty_id INT unsigned NOT NULL,
    CONSTRAINT pk_doctor PRIMARY KEY(id_code)
);

CREATE TABLE IF NOT EXISTS patient (
	social_security INT unsigned NOT NULL,
    firstname NVARCHAR(55) NOT NULL,
    flastname NVARCHAR(55) NOT NULL,
    birthdate DATE NOT NULL,
    CONSTRAINT pk_patient PRIMARY KEY(social_security)
);

CREATE TABLE IF NOT EXISTS admission (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    admission_date DATE NOT NULL,
    release_date DATE,
    fk_unit_id INT unsigned NOT NULL,
    fk_social_sec INT unsigned NOT NULL,
    CONSTRAINT pk_admission PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS intervention (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	intervention_date DATE NOT NULL,
    fk_admission_id INT unsigned NOT NULL,
    fk_symptom_id INT unsigned NOT NULL,
    fk_treatment_id INT unsigned NOT NULL,
    CONSTRAINT pk_intervention PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS symptom (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    name NVARCHAR(140),
    CONSTRAINT pk_symptom PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS treatment (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    name NVARCHAR(140),
    CONSTRAINT pk_treatment PRIMARY KEY(id)
);

-- create foreign keys
ALTER TABLE unit 
ADD CONSTRAINT fk_unit_floor
FOREIGN KEY (fk_floor_id) REFERENCES floor (id);

ALTER TABLE unit 
ADD CONSTRAINT fk_unit_doctor
FOREIGN KEY (fk_doctor_code) REFERENCES doctor(id_code);

ALTER TABLE doctor 
ADD CONSTRAINT fk_doctor_specialty
FOREIGN KEY (fk_specialty_id) REFERENCES specialty (id);

ALTER TABLE admission 
ADD CONSTRAINT fk_admission_unit
FOREIGN KEY (fk_unit_id) REFERENCES unit (id);

ALTER TABLE admission 
ADD CONSTRAINT fk_admission_patient
FOREIGN KEY (fk_social_sec) REFERENCES patient (social_security);

ALTER TABLE intervention 
ADD CONSTRAINT fk_intervention_admission
FOREIGN KEY (fk_admission_id) REFERENCES admission (id);

ALTER TABLE intervention 
ADD CONSTRAINT fk_intervention_symptom
FOREIGN KEY (fk_symptom_id) REFERENCES symptom (id);

ALTER TABLE intervention 
ADD CONSTRAINT fk_intervention_treatment
FOREIGN KEY (fk_treatment_id) REFERENCES treatment (id);


