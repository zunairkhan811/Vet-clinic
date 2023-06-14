CREATE TABLE 
medical_histories(
    id int primary key,
    admitted_at timestamp,
    status varchar(100),
    FOREIGN KEY (patient_id) REFERENCES patients(id),
);

CREATE TABLE 
patients(
    id int primary key,
    name varchar(50),
    date_of_bith date,
);

CREATE TABLE 
invoices(
    id int primary key,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
);

CREATE TABLE 
invoice_items(
    id int primary key,
    unit_price decimal,
    quantity int,
    total_price decimal,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id),
);

CREATE TABLE 
treatments(
    id int primary key,
    type varchar(80),
    name varchar(100),
);

CREATE TABLE
    med_histories_treatments(
        FOREIGN KEY (med_history_id) REFERENCES medical_histories(id),
        FOREIGN KEY (treatment_id) REFERENCES treatment(id)
    );

    CREATE INDEX fk_medical_histories_patient_idx ON medical_histories(patient_id);
    CREATE INDEX fk_invoice_items_invoice_idx ON invoice_items(invoice_id);
    CREATE INDEX fk_invoice_items_treatment_idx ON invoice_items(treatment_id);
    CREATE INDEX fk_med_histories_treatments_med_history_idx ON med_histories_treatments(med_history_id);
    CREATE INDEX fk_med_histories_treatments_treatment_idx ON med_histories_treatments(treatment_id);
    CREATE INDEX fk_invoices_medical_histories_idx ON invoices(medical_history_id);