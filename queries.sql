/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT * FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT COUNT(id) FROM animals;
SELECT COUNT(id) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT animals.species_id, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY animals.species_id;
SELECT animals.species_id, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY animals.species_id;

SELECT name FROM animals
JOIN owners
ON animals.owners_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name, species.name
FROM animals
INNER JOIN species
ON animals.species_id = species.id
WHERE animals.species_id = 1;

SELECT name, full_name
FROM animals
FULL JOIN owners
ON animals.owners_id = owners.id;

SELECT species.name, COUNT(species_id)
FROM animals
JOIN species
ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.name
FROM animals
JOIN owners ON animals.owners_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Digimon'
AND owners.full_name = 'Jennifer Orlando';

SELECT animals.name
FROM animals
JOIN owners
ON animals.owners_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(owners_id)
FROM animals
JOIN owners
ON animals.owners_id = owners.id
GROUP BY owners.id
ORDER BY COUNT desc
LIMIT 1;
