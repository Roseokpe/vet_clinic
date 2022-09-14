
SELECT * FROM animals WHERE name LIKE '%mon%';

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT * FROM animals WHERE neutered AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg < 10.5;

SELECT * from animals WHERE neutered = true;

SELECT * from animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= '10.4' AND weight_kg <= '17.3';


-- project
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

--Update 
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
SELECT * FROM animals;
UPDATE animals SET species = 'pokemon' WHERE species IS null;
SELECT * FROM animals;
COMMIT;

-- Delete
BEGIN;
DELETE * FROM animals
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 1;
SELECT * FROM animals;
COMMIT;

-- Question Queries
SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(escape_attempts) AS escape_count FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) AS MIN_WEIGHT, MAX(weight_kg) AS MAX_WEIGHT FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
