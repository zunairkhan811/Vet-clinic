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



