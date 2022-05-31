/* Database schema to keep the structure of entire database. */

/* Animals Table (M-to-O) */

CREATE TABLE animals (
  id INT GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT NOT NULL,
  neutered BOOLEAN NOT NULL,
  weight_kg DECIMAL NOT NULL
);

ALTER TABLE animals
ADD COLUMN species TEXT;

/* Owners and Species Tables (O-to-M) */

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  age INT NOT NULl
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

/* Animals Constraints(Keys) */

ALTER TABLE animals
ADD PRIMARY KEY (id);

ALTER TABLE animals
DROP COLUMN species;

/* Cleaner Key - Adds sequence column for the FK automatically */
ALTER TABLE animals
ADD species_id INT
REFERENCES species(id);

/* Step-by-step Key - Adds sequence column for the FK manually */
ALTER TABLE animals
ADD COLUMN owners_id INT;
ALTER TABLE animals
ADD CONSTRAINT owners_key
  FOREIGN KEY (owners_id)
    REFERENCES owners(id);
