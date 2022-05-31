/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int,
    name  varchar(1000),
    date_of_birth  date,
    escape_attempts int, neutered bit, weight_kg decimal,
    PRIMARY KEY (id) 
);
