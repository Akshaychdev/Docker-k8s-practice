create table car (
	car_uid UUID NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL
);


create table person (
	person_uid UUID NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	gender VARCHAR(7) NOT NULL,
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) NOT NULL,
	-- Forigne key is car_uid
	car_uid UUID REFERENCES car (car_uid),
	UNIQUE(car_uid),
	UNIQUE(email)
);

insert into person (person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth) values (uuid_generate_v4(), 'Brander', 'Normant', 'bnormant0@blog.com', 'Male', '2019-11-14', 'Argentina');
insert into person (person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth) values (uuid_generate_v4(), 'Worthington', 'Pentelow', 'wpentelow1@joomla.org', 'Male', '2019-10-10', 'Brazil');
insert into person (person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth) values (uuid_generate_v4(), 'Erasmus', 'Epperson', 'eepperson2@instagram.com', 'Male', '2019-11-09', 'Malaysia');
insert into person (person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth) values (uuid_generate_v4(), 'Lenette', 'Oliphant', 'loliphant3@wsj.com', 'Female', '2019-10-27', 'Philippines');
insert into person (person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth) values (uuid_generate_v4(), 'Robinette', 'Alejo', 'ralejo4@biblegateway.com', 'Female', '2019-09-13', 'Vietnam');

insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Pontiac', 'Bonneville', '43596.75');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Cadillac', 'DeVille', '16144.71');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Audi', '5000CS Quattro', '91501.68');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Mitsubishi', 'Galant', '83594.40');
