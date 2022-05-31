/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';  /* Find all animals whose name ends in "mon".*/
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-10' AND '2019-01-01'; /* List the name of all animals born between 2016 and 2019.*/
SELECT name FROM animals WHERE neutered='1' AND escape_attempts < 3; /* List the name of all animals that are neutered and have less than 3 escape attempts.*/
SELECT date_of_birth from animals WHERE name='Agumon' OR name ='Pikachu'; /* List date of birth of all animals named either "Agumon" or "Pikachu".*/
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5; /* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT * FROM animals WHERE neutered ='1'; /* Find all animals that are neutered.*/
SELECT * FROM animals WHERE  NOT name='Gabumon'; /* Find all animals not named Gabumon.*/
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <=17.3; /* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)*/


-- Task Two
SELECT COUNT(*)  FROM animals; /* How many animals are there?*/
SELECT COUNT(*)  FROM animals WHERE escape_attempts > 0; /* How many animals have never tried to escape?*/
SELECT AVG(weight_kg) FROM animals; /* What is the average weight of animals?*/
SELECT MAX(escape_attempts) FROM animals WHERE (neutered='1') OR (neutered ='0'); /* Who escapes the most, neutered or not neutered animals?*/
SELECT species,MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species; /* What is the minimum and maximum weight of each type of animal?*/
 SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth > '1990-01-01' AND date_of_birth < '2000-01-01' GROUP BY species; /* What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/