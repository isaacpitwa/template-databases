CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name varchar(25) NOT NULL,
  date_of_birth DATE
)

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP DEFAULT NOW(),
  patient_id int REFERENCES patients(id),
  status varchar(25) NOT NULL
)


CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type varchar(25) NOT NULL,
  name varchar(25) NOT NULL  
)

CREATE TABLE medical_treatments (
  id SERIAL PRIMARY KEY,
  medical_histories_id int REFERENCES medical_histories  (id),
  treatments_id int REFERENCES treatments(id)
)

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amout DECIMAL,
  generated_at TIMESTAMP DECIMAL NOW(),
  payed_at TIMESTAMP DECIMAL NOW(),
  medical_history_id int REFERENCES medical_histories(id)
)

CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity int NOT NULL,
  total_price DECIMAL,
  invoice_id int REFERENCES invoices(id),
  treatment_id int REFERENCES  treatments(id)
)

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON medical_treatments (medical_histories_id);
CREATE INDEX ON medical_treatments (treatments_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);