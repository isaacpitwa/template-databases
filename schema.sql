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
/*
Create a table named owners with the following columns:
    id: integer (set it as autoincremented PRIMARY KEY)
    full_name: string
    age: integer
*/

CREATE TABLE owners (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name  varchar(1000),
    age  int 
);

/*

Create a table named species with the following columns:
    id: integer (set it as autoincremented PRIMARY KEY)
    name: string
*/

CREATE TABLE species (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name  varchar(1000) 
)

