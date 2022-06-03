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

/*
Modify animals table:
    Make sure that id is set as autoincremented PRIMARY KEY
    Remove column species
    Add column species_id which is a foreign key referencing species table
    Add column owner_id which is a foreign key referencing the owners table
*/

 ALTER TABLE animals DROP COLUMN species;
 ALTER TABLE animals ADD COlUMN species_id INT
 ALTER TABLE animals ADD CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species(id);
 ALTER TABLE animals ADD CONSTRAINT fk_animals_owners FOREIGN KEY (owner_id) REFERENCES owners(id);