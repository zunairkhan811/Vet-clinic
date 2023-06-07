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
UPDATE animals weight_kg = weight_kg * -1 where weight_kg < 0 ;
COMMIT ;

-- Queries to answer

select count(*) from animals ;
select count(*) from animals where escape_attempts=0 ;
select AVG(weight_kg) from animals ;
select MAX(escape_attempts) from animals GROUP BY neutered ;
select MIN(weight_kg),MAX(weight_kg) from animals GROUP BY species ;
select species, AVG(escape_attempts) from animals where date_of_birth>'1990-01-01' AND date_of_birth<'2000-01-01' GROUP BY species ;




