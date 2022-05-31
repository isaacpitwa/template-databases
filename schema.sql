/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int NOT NULL IDENTITY(1,1),
    name  varchar(1000),
    date_of_birth  date,
    escape_attempts int, neutered bit, weight_kg decimal,
    PRIMARY KEY (id) 
);

-- ADD Column Species of type string
 ALter table animals ADD species varchar(1000);
