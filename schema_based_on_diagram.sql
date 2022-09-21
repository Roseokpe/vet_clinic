
-- patients

CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE,
    PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(100),
    PRIMARY KEY(id)
);

