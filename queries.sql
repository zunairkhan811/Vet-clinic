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


