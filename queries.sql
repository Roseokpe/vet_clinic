
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

-- Project 3
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';
-- Sam smith
UPDATE animals set owners_id = 1 WHERE name = 'Agumon';
--Jennifer
UPDATE animals set owners_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
--Bob
UPDATE animals set owners_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
--Melody 
UPDATE animals set owners_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
--Dean 
UPDATE animals set owners_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

--Answers to the questions.
SELECT animals.name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'pokemon';

SELECT animals.name, owners.full_name FROM animals RIGHT JOIN owners ON animals.owners_id = owners.id;

SELECT species.name, COUNT(animals.species_id) FROM animals JOIN species ON species.id = animals.species_id GROUP BY species.name;

SELECT animals.name from animals JOIN owners ON owners.id = animals.owners_id JOIN species on species.id = animals.species_id WHERE animals.species_id = '2' AND animals.owners_id = '2';

SELECT animals.name from animals JOIN owners ON owners.id = animals.owners_id WHERE animals.escape_attempts = '0' AND animals.owners_id = '5';

SELECT full_name, COUNT(owners_id) FROM owners JOIN animals on owners.id = animals.owners_id GROUP BY full_name ORDER BY COUNT (owners_id) desc limit 1;

-- project 4

SELECT A.name, V.date_of_visits from visits V JOIN animals A ON A.id=V.animals_id WHERE vets_id = (SELECT id from vets where name ='William Tatcher') group by A.name, V.date_of_visits order by date_of_visits desc limit 1;

SELECT * FROM visits WHERE vets_id = (SELECT id from vets where name ='Stephanie Mendez');


select V.name, a.species_id, S.name FROM vets V Left JOIN specializations a ON    V.id = vets_id left JOIN species S ON species_id = S.Id;


select S.name, visits.date_of_visits FROM visits JOIN vets V ON vets_id = (V.id ) JOIN animals S ON animals_id = S.Id where vets_id =(SELECT id from vets where name ='Stephanie Mendez') and date_of_visits BETWEEN '2020-04-01' and '2020-08-30';

-- What animal has the most visits to vets?
select count(animals_id), animals_id from visits group by animals_id limit 1;

-- Who was Maisy Smith's first visit?
select a.name, vt.name, v.date_of_visits from animals a join visits v on a.id = v.animals_id join vets vt on vt.id =v.vets_id where vt.name = 'Maisy Smith' order by v.date_of_visits asc limit 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
select a.name as animal_name, a.weight_kg, vt.name as vet_doctor,vt.age, v.date_of_visits from animals a join visits v on a.id = v.animals_id join vets vt on vt.id =v.vets_id order by v.date_of_visits desc;


--How many visits were with a vet that did not specialize in that animal's species?

SELECT COUNT(visits.animals_id) FROM visits JOIN vets ON vets.id = visits.vets_id WHERE vets_id = '2';

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT species.name, COUNT(*) FROM species INNER JOIN animals ON animals.species_id = species.id INNER JOIN visits ON visits.animals_id = animals.id INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(species.id) DESC LIMIT 1;

