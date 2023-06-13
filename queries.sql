/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM ANIMALS WHERE NAME LIKE '%mon' ;
SELECT name FROM animals where date_of_birth>='2016-01-01' AND date_of
_birth<='2019-12-31' ;
SELECT name from animals where neutered='1' AND escape_attempts<3 ; 
SELECT date_of_birth from animals where name IN ('Agumon','Pikachu') ;
SELECT name,escape_attempts from animals where weight_kg>10.5 ;
SELECT * from animals where neutered=true ;
SELECT * from animals where name!='Gabumon' ;
SELECT * from animals where weight_kg>=10.4 AND weight_kg<=17.3 ;
begin transaction ;
UPDATE animals SET species = 'unspecified' ;
ROLLBACK ;
begin transaction ;
UPDATE animals SET species = 'digimon' where name LIKE '%mon' ;
UPDATE animals SET species = 'pokemon' where species = '' ;
COMMIT ;
SELECT * FROM animals ;
begin transaction ;
DELETE from animals;
ROLLBACK ;
SELECT * FROM animals ;
begin transaction ;
DELETE from animals where date_of_birth>'2022-01-01' ;
SAVEPOINT SP1 ;
UPDATE animals SET weight_kg = weight_kg * -1 ;
ROLLBACK to SP1 ;
UPDATE animals SET weight_kg = weight_kg * -1 where weight_kg < 0 ;
COMMIT ;

-- Queries to answer

select count(*) from animals ;
select count(*) from animals where escape_attempts=0 ;
select AVG(weight_kg) from animals ;
select MAX(escape_attempts) from animals GROUP BY neutered ;
select MIN(weight_kg),MAX(weight_kg) from animals GROUP BY species ;
select species, AVG(escape_attempts) from animals where date_of_birth>'1990-01-01' AND date_of_birth<'2000-01-01' GROUP BY species ;

-- More queries

select animals.name,owners.full_name
from animals join owners
on animals.owner_id = owners.id
where full_name = 'Melody Pond';

select animals.name,species.name
from animals join species
on animals.species_id = species.id
where species_id = 1;

SELECT animals.name,owners.full_name
from animals Right join owners 
on animals.owner_id = owners.id;

select count(*),species.name
from animals join species
on animals.species_id = species.id
group by species.id ;

select animals.name,species.name,
owners.full_name
from animals join species
on animals.species_id = species.id
join owners on animals.owner_id = owners.id
where species.name = 'Digimon' And 
owners.full_name = 'Jennifer Orwell';

select animals.name,animals.escape_attempts,
owners.full_name
from animals join owners 
on animals.owner_id = owners.id
where animals.escape_attempts = 0 And
owners.full_name = 'Dean Winchester';

select owners.full_name,
count(animals.name) as total				 
from animals join owners 
on animals.owner_id = owners.id
group by owners.full_name
order by total desc 
limit 1 ;

--add more queries

select animals.name as Animals_name,
vets.name as Vet_Name, visits.visit_date 
from animals, vets, visits
where vets.name = 'William Tatcher'
and vets.id = visits.vets_id
and animals.id = visits.animals_id
order by visit_date desc Limit 1

select vets.name as Vet_Name, count(animals.id) 
from animals, vets, visits
where vets.name = 'Stephanie Mendez'
and vets.id = visits.vets_id
and animals.id = visits.animals_id
group by vets.id 

select vets.name as Vet_Name,
species.name as Specialities
from vets
left join specializations
on vets.id = specializations.vets_id
left join species
on species.id = specializations.species_id

select animals.name as Animals_name,
vets.name as Vet_name, visits.visit_date
as Visit_date from animals,vets,visits
where vets.name= 'Stephanie Mendez' and
visits.visit_date>'2020-04-01' and
visits.visit_date<'2020-08-30'
and vets.id = visits.vets_id
and animals.id = visits.animals_id

select animals.name as Animals_Name, 
count(visits.visit_date) as counts
from animals, visits
where animals.id = visits.animals_id
group by Animals_name 
order by counts desc limit 1

select vets.name as Vet_Name, animals.name
as Animal_name, visits.visit_date
from animals, visits, vets
where vets.name = 'Maisy Smith'
and animals.id = visits.animals_id
and vets.id = visits.vets_id
order by visits.visit_date asc limit 1

select animals.name, animals.date_of_birth,animals.escape_attempts, animals.neutered,
animals.weight_kg, vets.name as Vet_Name, vets.age, vets.date_of_graduation,species.name as specie_type,
visits.visit_date from animals, species, vets, visits
where animals.id = visits.animals_id
and vets.id = visits.vets_id
and animals.species_id = species.id
order by visits.visit_date desc limit 1

select vets.name as Vet_Name, count(visits.visit_date)
from vets, visits
where vets.id = visits.vets_id
and vets.id not in(select vets_id from specializations)
group by Vet_Name

select vets.name as Vet_Name, species.name as speciality,
count(visits.visit_date) as visit_count
from vets, species,visits,animals
where vets.name = 'Maisy Smith' and
vets.id = visits.vets_id and
animals.id = visits.animals_id and 
animals.species_id = species.id
group by Vet_Name,species.name 
order by visit_count desc limit 1

--performance and audit

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
explain analyze SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';



