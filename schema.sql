/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
   id int PRIMARY KEY NOT NULL, name varchar(40)
NOT NULL, date_of_birth date,escape_attempts int, neutered boolean, weight_kg decimal;
);
ALTER TABLE ANIMALS ADD COLUMN species varchar(40) ;

CREATE TABLE owners (
   id serial PRIMARY KEY, full_name varchar(40),age int
);
create table species(
id serial primary key,name varchar(40)
);

ALTER TABLE animals
DROP COLUMN id;
select * from animals ;

ALTER TABLE animals
ADD COLUMN id SERIAL PRIMARY KEY ;
select * from animals ;

alter table animals
drop column species ;

alter table animals
add column species_id INT ;
alter table animals
add constraint species_id
FOREIGN KEY(species_id) REFERENCES species(id);

alter table animals
add column owner_id INT ;
alter table animals
add constraint owner_id
FOREIGN KEY(owner_id) REFERENCES owners(id);

create table vets(
   id serial primary key,
   name varchar(40),
   age int,
   date_of_graduation date
)

create table specializations(
   id serial primary key,
   species_id int references species(id),
   vets_id int references vets(id)
)

create table visits(
   id serial primary key,
   animals_id int references animals(id),
   vets_id int references vets(id),
   visit_date date
)

select * from animals;
select * from species;
select * from owners;
select * from vets;
select * from specializations;

--performance and audit

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visits_animal_id_idx ON visits (animals_id);
CREATE INDEX visits_vet_id_idx on visits (vets_id DESC);
explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;


