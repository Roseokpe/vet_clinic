CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);

-- project two 
ALTER TABLE animals
ADD species varchar(255);


--create new table
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    PRIMARY KEY(id)
);

-- DELETE species column 
ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INT REFERENCES species (ID);
ALTER TABLE animals ADD owners_id INT REFERENCES owners (ID);

-- project 4
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    species_id INT REFERENCES species(id),
    vets_id INT REFERENCES vets(id)
);

CREATE TABLE visits (
    animals_id INT REFERENCES animals(id),
    vets_id INT REFERENCES vets(id),
    date_of_visits DATE
);


-- performance 

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animals_index ON visits(animals_id);
CREATE INDEX vets_index ON visits(vets_id);
CREATE INDEX email_index ON owners(email);

