/* Populate database with sample data. */

INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (1,'Agumon','2020-02-03',0,'1',10.23);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (2,'Gabumon','2018-11-15',2,'1',8);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (3,'Pikachu','2021-01-07',1,'0',15.02);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (4,'Devimon','2017-05-12',5,'1',11);

--  Task Two
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (5,'Charmander','2020-02-08',0,'0',11)
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (6,'Plantmon','2021-11-15',2,'1',5.7);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (7,'Squirtle','1993-04-02',3,'0',12.13);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (8,'Angemon','2005-06-12',1,'1',45);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (9,'Boarmon','2005-06-07',7,'1',20.4);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (10,'Blossom','1998-10-13',3,'1',17);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (11,'Ditto','2022-05-14',4,'1',22);

-- Task Three

/*
Insert the following data into the owners table:
    Sam Smith 34 years old.
    Jennifer Orwell 19 years old.
    Bob 45 years old.
    Melody Pond 77 years old.
    Dean Winchester 14 years old.
    Jodie Whittaker 38 years old.
*/

INSERT INTO owners(full_name,age) VALUES ('Sam Smith',34);
INSERT INTO owners(full_name,age) VALUES ('Jennifer Orwell',19);
INSERT INTO owners(full_name,age) VALUES ('Bob',45);
INSERT INTO owners(full_name,age) VALUES ('Melody Pond',77);
INSERT INTO owners(full_name,age) VALUES ('Dean Winchester',14);
INSERT INTO owners(full_name,age) VALUES ('Jodie Whittaker',38);

/*
Insert the following data into the species table:
    Pokemon
    Digimon
*/

INSERT INTO species(name) VALUES ('Pokemon');
INSERT INTO species(name) VALUES ('Digimon');


/*
Modify your inserted animals so it includes the species_id value:
    If the name ends in "mon" it will be Digimon
    All other animals are Pokemon
*/

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

/*
Modify your inserted animals to include owner information (owner_id):
    Sam Smith owns Agumon.
    Jennifer Orwell owns Gabumon and Pikachu.
    Bob owns Devimon and Plantmon.
    Melody Pond owns Charmander, Squirtle, and Blossom.
    Dean Winchester owns Angemon and Boarmon.
*/

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id=2 WHERE name = 'Gabumon' OR  name='Pikachu';
UPDATE animals SET owner_id=3 WHERE name = 'Devimon' OR  name='Plantmon';
UPDATE animals SET owner_id=4 WHERE name = 'Charmander' OR  name='Squirtle' OR name='Blossom';
UPDATE animals SET owner_id=5 WHERE name = 'Angemon' OR  name='Boarmon';

-------------
BEGIN;
INSERT INTO vets VALUES
(DEFAULT, 'William Tatcher', 45, '2000-04-23'),
(DEFAULT, 'Maisy Smith', 26, '2019-01-17'),
(DEFAULT, 'Stephanie Mendez', 64, '1980-05-04'),
(DEFAULT, 'Jack Harkness', 38, '2008-06-08');
COMMIT;

BEGIN;
INSERT INTO specializations VALUES
((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));
COMMIT;

BEGIN;
INSERT INTO visits VALUES
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24'),
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),
((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),
((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');
COMMIT;

-- Task Four

INSERT INTO visits (animal_id, vet_id, date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';