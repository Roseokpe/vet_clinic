
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

CREATE TABLE treatments (
    id INT GENERATED ALWAYS as IDENTITY,
    type VARCHAR(100),
    name VARCHAR(100)
    PRIMARY KEY(id)
);


CREATE TABLE invoices (
    id INT GENERATED ALWAYS as IDENTITY,
    total_amount DECIMAL,
    Generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT REFERENCES medical_histories(id),
    PRIMARY KEY(id)
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS as IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL;
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY(id)
);

--indexes

CREATE INDEX patients_index ON medical_histories(patient_id);
CREATE INDEX medical_histories_index ON invoices(medical_history_id);
CREATE INDEX treatments_index on invoice_items(treatment_id);
CREATE INDEX invoices_index on invoice_items(invoice_id);
CREATE INDEX ON medical_histories_has_treatments (medical_history_id);
CREATE INDEX ON medical_histories_has_treatments (treatment_id);

