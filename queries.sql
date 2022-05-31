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

SELECT animals.name, vets.name, visits.date_of_visit
FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit desc
LIMIT 1;

SELECT vets.name, COUNT(visits.vets_id)
FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
GROUP BY vets.name
ORDER BY COUNT(visits.vets_id) desc;

SELECT vets.name, species.name
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vets_id
LEFT JOIN species ON specializations.species_id = species.id;

SELECT vets.name, COUNT(visits.vets_id)
FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'
GROUP BY vets.name
ORDER BY COUNT(visits.vets_id) desc;

SELECT animals.name, COUNT(visits.animals_id)
FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY COUNT(visits.animals_id) desc
LIMIT 1;

SELECT vets.name, animals.name, visits.date_of_visit
FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.id = (SELECT id FROM vets WHERE name = 'Maisy Smith')
ORDER BY visits.date_of_visit asc
LIMIT 1;

SELECT animals.name, vets.name, visits.date_of_visit
FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
ORDER BY visits.date_of_visit asc;

/* How many visits were with a vet that did not specialize in that animal's species? */

SELECT COUNT(visits.date_of_visit)
FROM visits
JOIN specializations ON specializations.vets_id = visits.vets_id
JOIN animals ON animals.species_id = visits.animals_id
WHERE specializations.species_id != visits.vets_id;

SELECT species.name, COUNT(visits.date_of_visit)
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.id
ORDER BY COUNT(visits.date_of_visit) desc
LIMIT 2;
