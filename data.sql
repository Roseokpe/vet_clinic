INSERT INTO animals (name,date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', '2020-02-03', 10.23, true, 0);
INSERT INTO animals (name,date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', '2018-02-03', 8, true, 2);

INSERT INTO animals (name,date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', '2021-01-07', 15.04, false, 1);

INSERT INTO animals (name,date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', '2017-05-12', 11, true, 5);

INSERT INTO animals (name,date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Charmander', '2020-02-08', -11, false, 0);

INSERT INTO animals (name,date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Plantmon', '2021-11-05', -5.7, true, 2);

INSERT INTO animals (name,date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Squirtle', '1993-04-2', -12.13, false, 3);

INSERT INTO animals (name,date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Angemon', '2005-06-12', -45, true, 1);

INSERT INTO animals (name,date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Blossom', '1998-10-13', 17, true, 3);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Ditto', '2022-05-14', 22, true, 4);

-- insert data in owners table

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

-- species
INSERT INTO species (name) VALUES ('pokemon'), ('Digimon');

-- project 4
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2020-04-23'), ('Maisy Smith', 26, '2019-01-17'), (' Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(vets_id, species_id) VALUES(1, 1), (3, 1), (3,2), (4,2);

INSERT INTO visits (animals_id, vets_id, date_of_visits) VALUES (1, 1, '2020-05-24'), (1, 3, '2020-07-22'), (2, 4, '2021-02-02'), (3, 2, '2020-01-05'), (3, 2, '2020-03-08'), (3, 2, '2020-05-14'), (4, 3, '2021-05-04'), (5, 4, '2021-02-24'), (6, 2, '2019-12-21'), (6, 1, '2020-08-10'), (6, 2, '2021-04-07'), (7, 3, '2019-09-29'), (8, 4, '2020-10-03'), (8, 4, '2020-11-04'), (9, 2, '2019-01-24'), (9, 2, '2019-05-15'), (9, 2, '2020-02-27'), (9, 2, '2020-08-03'), (10, 3, '2020-05-24'), (10, 1, '2021-01-11');


-- performance 

INSERT INTO visits (animals_id, vets_id, date_of_visits) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';