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

-- Task 3

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

ALTER TABLE REMOVE species;
ALTER TABLE animals ADD  owner_id int REFERENCES owners(id);
ALTER TABLE animals ADD  species_id int REFERENCES species(id);

-------

CREATE TABLE vets (
  id			INT GENERATED ALWAYS AS IDENTITY,
  name			VARCHAR(100),
  age			INT,
  date_of_graduation	DATE,
  PRIMARY KEY(id)
);

CREATE TABLE specializations (
  vets_id	INT,
  species_id	INT,
  PRIMARY KEY (vets_id, species_id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id)
);

CREATE TABLE visits (
  animals_id	INT,
  vets_id	INT,
  date		DATE,
  PRIMARY KEY (animals_id, vets_id),
  CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);

