/* Populate database with sample data. */

INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);
INSERT INTO animals VALUES (5,'Charmander','2020-02-08',0,false,-11);
INSERT INTO animals VALUES (6,'Plantmon','2021-11-15',2,true,-5.7) ;
INSERT INTO animals VALUES (7,'Squirtle','1993-04-02',3,false,-12.13) ;
INSERT INTO ANIMALS VALUES (8,'Angemon','2005-06-12',1,true,-45) ;
INSERT INTO ANIMALS VALUES (9,'Boarmon','2005-06-07',7,true,20.4) ;
INSERT INTO ANIMALS VALUES (10,'Blossom','1998-10-13',3,true,17) ;
INSERT INTO ANIMALS VALUES (11,'Ditto','2022-05-14',4,true,22) ;
Insert into owners values (1,'Sam Smith',34);
Insert into owners values (2,'Jennifer Orwell',19);
Insert into owners values (3,'Bob',45);
Insert into owners values (4,'Melody Pond',77);
Insert into owners values (5,'Dean Winchester',14);
Insert into owners values (6,'Jodie Whittaker',38);
Insert into species values (1,'Pokemon');
Insert into species values (2,'Digimon');

update animals
set species_id = (select id from species 
where name='Digimon')
where name like ('%mon');

update animals
set species_id = (select id from species 
where name='Pokemon')
where species_id is null;

update animals
set owner_id = (select id from owners 
where full_name='Sam Smith')
where name = 'Agumon';

update animals
set owner_id = (select id from owners 
where full_name='Jennifer Orwell')
where name in ('Gabumon','Pikachu');

update animals
set owner_id = (select id from owners 
where full_name='Bob'
)
where name in ('Devimon','Plantmon');

update animals
set owner_id = (select id from owners 
where full_name='Melody Pond'
)
where name in ('Charmander','Squirtle','Blossom');

update animals
set owner_id = (select id from owners 
where full_name='Dean Winchester'
)
where name in ('Angemon','Boarmon');
select * from animals ;

insert into vets (name,age,date_of_graduation)
values ('William Tatcher', 45,'2000-04-23'),
('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness',38,'2008-06-08');
select * from vets;

insert into specializations(vets_id, species_id)
values ((select id from vets where name = 'William Tatcher'),(select id from species where name = 'Pokemon')),
((select id from vets where name = 'Stephanie Mendez'),(select id from species where name = 'Pokemon')),
((select id from vets where name = 'Stephanie Mendez'),(select id from species where name = 'Digimon')),
((select id from vets where name = 'Jack Harkness'),(select id from species where name = 'Digimon'));
select * from specializations;

insert into visits (vets_id, animals_id, visit_date)
values ((select id from vets where name = 'William Tatcher'),
(select id from animals where name = 'Agumon'),('2020-05-24')),

((select id from vets where name = 'Stephanie Mendez'),
(select id from animals where name = 'Agumon'),('2020-07-22')),

((select id from vets where name = 'Jack Harkness'),
(select id from animals where name = 'Gabumon'),('2021-02-02')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Pikachu'),('2020-01-05')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Pikachu'),('2020-03-08')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Pikachu'),('2020-05-14')),

((select id from vets where name = 'Stephanie Mendez'),
(select id from animals where name = 'Devimon'),('2021-05-04')),

((select id from vets where name = 'Jack Harkness'),
(select id from animals where name = 'Charmander'),('2021-02-24')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Plantmon'),('2019-12-21')),

((select id from vets where name = 'William Tatcher'),
(select id from animals where name = 'Plantmon'),('2020-08-10')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Plantmon'),('2021-04-07')),

((select id from vets where name = 'Stephanie Mendez'),
(select id from animals where name = 'Squirtle'),('2019-09-29')),

((select id from vets where name = 'Jack Harkness'),
(select id from animals where name = 'Angemon'),('2020-10-03')),

((select id from vets where name = 'Jack Harkness'),
(select id from animals where name = 'Angemon'),('2020-11-04')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Boarmon'),('2019-01-24')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Boarmon'),('2019-05-15')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Boarmon'),('2020-02-27')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Boarmon'),('2020-08-03')),

((select id from vets where name = 'Stephanie Mendez'),
(select id from animals where name = 'Blossom'),('2020-05-24')),

((select id from vets where name = 'William Tatcher'),
(select id from animals where name = 'Blossom'),('2021-01-11'));
select * from visits;

--performance and audit

INSERT INTO visits (animals_id, vets_id,visit_date) 
SELECT * FROM (SELECT id FROM animals) animal_ids,
(SELECT id FROM vets) vets_ids, 
generate_series('1980-01-01'::timestamp,
'3021-01-01', '4 hours') visit_timestamp; --Repeat the process until execution time
-- greater than 1000ms

insert into owners (full_name, email) 
select 'Owner ' || generate_series(1,2500000),
'owner_' || generate_series(1,2500000) || '@mail.com'; --Repeat the process until execution
-- time becomes greater than 1000ms


