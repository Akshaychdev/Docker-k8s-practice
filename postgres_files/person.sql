create table person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	gender VARCHAR(7) NOT NULL,
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) NOT NULL,
	car_id BIGINT REFERENCES car (id),
	UNIQUE(car_id)
);


create table car (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL
);
insert into car (id, make, model, price) values (1, 'Pontiac', 'Bonneville', '43596.75');
insert into car (id, make, model, price) values (2, 'Cadillac', 'DeVille', '16144.71');
insert into car (id, make, model, price) values (3, 'Audi', '5000CS Quattro', '91501.68');
insert into car (id, make, model, price) values (4, 'Mitsubishi', 'Galant', '83594.40');
insert into car (id, make, model, price) values (5, 'Mercedes-Benz', 'S-Class', '10004.86');
insert into car (id, make, model, price) values (6, 'Cadillac', 'Escalade', '13885.13');
insert into car (id, make, model, price) values (7, 'Mitsubishi', 'Galant', '14486.93');
insert into car (id, make, model, price) values (8, 'Aston Martin', 'Vanquish S', '82033.19');
insert into car (id, make, model, price) values (9, 'BMW', '325', '31136.70');
insert into car (id, make, model, price) values (10, 'Mercedes-Benz', 'S-Class', '55176.75');
insert into car (id, make, model, price) values (11, 'Ford', 'Club Wagon', '19775.42');
insert into car (id, make, model, price) values (12, 'Pontiac', 'Vibe', '29165.43');
insert into car (id, make, model, price) values (13, 'Ford', 'Econoline E350', '89321.30');
insert into car (id, make, model, price) values (14, 'Honda', 'Pilot', '23389.11');
insert into car (id, make, model, price) values (15, 'Kia', 'Sedona', '78458.68');
insert into car (id, make, model, price) values (16, 'GMC', 'Canyon', '79686.33');
insert into car (id, make, model, price) values (17, 'Lexus', 'ES', '93544.77');
insert into car (id, make, model, price) values (18, 'Mercedes-Benz', 'M-Class', '13302.13');
insert into car (id, make, model, price) values (19, 'Ford', 'Econoline E350', '75359.64');
insert into car (id, make, model, price) values (20, 'Land Rover', 'Range Rover', '94457.67');
insert into car (id, make, model, price) values (21, 'Pontiac', 'Torrent', '73349.36');
insert into car (id, make, model, price) values (22, 'Bentley', 'Arnage', '34173.28');
insert into car (id, make, model, price) values (23, 'Suzuki', 'Grand Vitara', '36046.82');
insert into car (id, make, model, price) values (24, 'GMC', 'Sierra 3500', '82013.66');
insert into car (id, make, model, price) values (25, 'Toyota', 'Tacoma Xtra', '33987.66');
insert into car (id, make, model, price) values (26, 'Buick', 'Skylark', '91973.45');
insert into car (id, make, model, price) values (27, 'Cadillac', 'DeVille', '39652.28');
insert into car (id, make, model, price) values (28, 'Cadillac', 'DeVille', '86538.27');
insert into car (id, make, model, price) values (29, 'Dodge', 'Grand Caravan', '89177.44');
insert into car (id, make, model, price) values (30, 'Ford', 'Bronco', '11095.71');
insert into car (id, make, model, price) values (31, 'Mercedes-Benz', 'R-Class', '56456.41');
insert into car (id, make, model, price) values (32, 'Mitsubishi', 'Montero Sport', '15811.10');
insert into car (id, make, model, price) values (33, 'Volvo', 'XC60', '54011.48');
insert into car (id, make, model, price) values (34, 'Honda', 'Civic', '72942.92');
insert into car (id, make, model, price) values (35, 'Audi', 'S8', '53834.06');
insert into car (id, make, model, price) values (36, 'Dodge', 'D150', '82729.36');
insert into car (id, make, model, price) values (37, 'Toyota', 'Celica', '91184.14');
insert into car (id, make, model, price) values (38, 'Nissan', 'Maxima', '98379.69');
insert into car (id, make, model, price) values (39, 'Mitsubishi', 'Pajero', '17855.71');
insert into car (id, make, model, price) values (40, 'Chevrolet', 'Impala', '65711.67');
insert into car (id, make, model, price) values (41, 'MINI', 'Cooper Countryman', '17484.83');
insert into car (id, make, model, price) values (42, 'Nissan', 'Sentra', '31379.49');
insert into car (id, make, model, price) values (43, 'Hyundai', 'Elantra', '42259.98');
insert into car (id, make, model, price) values (44, 'Mitsubishi', 'L300', '53756.70');
insert into car (id, make, model, price) values (45, 'Pontiac', 'Grand Prix', '24014.16');
insert into car (id, make, model, price) values (46, 'Oldsmobile', 'LSS', '27823.80');
insert into car (id, make, model, price) values (47, 'Dodge', 'Nitro', '92481.16');
insert into car (id, make, model, price) values (48, 'BMW', 'X5', '37711.65');
insert into car (id, make, model, price) values (49, 'Acura', 'Integra', '91569.63');
insert into car (id, make, model, price) values (50, 'Jaguar', 'X-Type', '87047.41');
insert into car (id, make, model, price) values (51, 'Porsche', 'Boxster', '89544.03');
insert into car (id, make, model, price) values (52, 'Jeep', 'Wrangler', '84403.56');
insert into car (id, make, model, price) values (53, 'Audi', 'S8', '72282.69');
insert into car (id, make, model, price) values (54, 'Acura', 'Integra', '92831.28');
insert into car (id, make, model, price) values (55, 'Volkswagen', 'Jetta', '92840.08');
insert into car (id, make, model, price) values (56, 'Mitsubishi', 'Galant', '26376.36');
insert into car (id, make, model, price) values (57, 'Dodge', 'Caravan', '78386.45');
insert into car (id, make, model, price) values (58, 'Honda', 'S2000', '47689.54');
insert into car (id, make, model, price) values (59, 'Kia', 'Spectra', '34993.58');
insert into car (id, make, model, price) values (60, 'Ford', 'Tempo', '38125.20');
insert into car (id, make, model, price) values (61, 'Jeep', 'Grand Cherokee', '29808.21');
insert into car (id, make, model, price) values (62, 'Infiniti', 'M', '99024.10');
insert into car (id, make, model, price) values (63, 'Volkswagen', 'New Beetle', '28645.09');
insert into car (id, make, model, price) values (64, 'Audi', 'V8', '18343.38');
insert into car (id, make, model, price) values (65, 'Lincoln', 'Navigator', '51564.25');
insert into car (id, make, model, price) values (66, 'Cadillac', 'Escalade EXT', '97274.55');
insert into car (id, make, model, price) values (67, 'Suzuki', 'Swift', '32998.38');
insert into car (id, make, model, price) values (68, 'Pontiac', 'Sunbird', '90512.34');
insert into car (id, make, model, price) values (69, 'BMW', '530', '73597.61');
insert into car (id, make, model, price) values (70, 'Ford', 'Mustang', '45971.73');
insert into car (id, make, model, price) values (71, 'Ford', 'Econoline E350', '22369.71');
insert into car (id, make, model, price) values (72, 'MINI', 'Cooper', '33538.20');
insert into car (id, make, model, price) values (73, 'BMW', '3 Series', '92100.62');
insert into car (id, make, model, price) values (74, 'Lotus', 'Elan', '36907.35');
insert into car (id, make, model, price) values (75, 'Ford', 'E-Series', '36681.85');
insert into car (id, make, model, price) values (76, 'Hummer', 'H2 SUV', '58349.41');
insert into car (id, make, model, price) values (77, 'Buick', 'Roadmaster', '74238.39');
insert into car (id, make, model, price) values (78, 'Isuzu', 'Axiom', '17493.68');
insert into car (id, make, model, price) values (79, 'GMC', 'Sierra 3500', '31300.87');
insert into car (id, make, model, price) values (80, 'Suzuki', 'Esteem', '71528.51');
insert into car (id, make, model, price) values (81, 'Land Rover', 'Discovery', '10111.03');
insert into car (id, make, model, price) values (82, 'Mercury', 'Tracer', '96389.44');
insert into car (id, make, model, price) values (83, 'Honda', 'Civic', '25915.78');
insert into car (id, make, model, price) values (84, 'Isuzu', 'Rodeo Sport', '90436.04');
insert into car (id, make, model, price) values (85, 'Porsche', '911', '18316.02');
insert into car (id, make, model, price) values (86, 'Mercury', 'Mystique', '46965.50');
insert into car (id, make, model, price) values (87, 'Lincoln', 'Continental', '80662.88');
insert into car (id, make, model, price) values (88, 'Toyota', 'Tacoma', '73253.17');
insert into car (id, make, model, price) values (89, 'Land Rover', 'Range Rover', '27893.83');
insert into car (id, make, model, price) values (90, 'Jeep', 'Grand Cherokee', '70108.18');
insert into car (id, make, model, price) values (91, 'Chevrolet', 'Uplander', '81644.49');
insert into car (id, make, model, price) values (92, 'Lincoln', 'MKX', '32549.58');
insert into car (id, make, model, price) values (93, 'Mercedes-Benz', 'CLK-Class', '65236.90');
insert into car (id, make, model, price) values (94, 'Suzuki', 'Sidekick', '10229.24');




insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Brander', 'Normant', 'bnormant0@blog.com', 'Male', '2019-11-14', 'Argentina');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Worthington', 'Pentelow', 'wpentelow1@joomla.org', 'Male', '2019-10-10', 'Brazil');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Erasmus', 'Epperson', 'eepperson2@instagram.com', 'Male', '2019-11-09', 'Malaysia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Lenette', 'Oliphant', 'loliphant3@wsj.com', 'Female', '2019-10-27', 'Philippines');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Robinette', 'Alejo', 'ralejo4@biblegateway.com', 'Female', '2019-09-13', 'Vietnam');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Bendick', 'McKevitt', 'bmckevitt5@a8.net', 'Male', '2020-04-29', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Ranique', 'Sawford', 'rsawford6@behance.net', 'Female', '2020-03-12', 'Nigeria');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Hulda', 'Dodswell', 'hdodswell7@list-manage.com', 'Female', '2019-07-13', 'Pakistan');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Kin', 'Koba', 'kkoba8@nytimes.com', 'Male', '2020-04-11', 'Russia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Kristian', 'Loverock', 'kloverock9@oracle.com', 'Male', '2020-02-25', 'Portugal');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Ermin', 'Bazek', 'ebazeka@census.gov', 'Male', '2020-01-24', 'Peru');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Marley', 'Heersema', null, 'Female', '2019-09-28', 'Mexico');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Palm', 'Highton', null, 'Male', '2019-09-08', 'Indonesia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Kristian', 'Whalebelly', 'kwhalebellyd@narod.ru', 'Male', '2020-06-20', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Nikolas', 'Yanin', 'nyanine@prweb.com', 'Male', '2020-01-16', 'Nicaragua');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Austine', 'Feehely', 'afeehelyf@youtu.be', 'Female', '2020-01-21', 'North Korea');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Katharina', 'Levitt', null, 'Female', '2020-04-23', 'Canada');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Fee', 'Beckson', null, 'Male', '2020-05-26', 'Russia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Cristin', 'Blankley', null, 'Female', '2019-09-24', 'Poland');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Venita', 'McAuslene', 'vmcauslenej@about.com', 'Female', '2019-10-29', 'Portugal');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Ailis', 'Chrystal', 'achrystalk@dailymail.co.uk', 'Female', '2019-07-07', 'Brazil');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Ammamaria', 'Riby', 'aribyl@qq.com', 'Female', '2020-01-24', 'Norway');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Harlin', 'Philipson', 'hphilipsonm@fastcompany.com', 'Male', '2020-01-19', 'Poland');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Dukey', 'Mattheis', 'dmattheisn@typepad.com', 'Male', '2020-01-24', 'Nicaragua');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Agnes', 'Matterdace', 'amatterdaceo@ask.com', 'Female', '2019-08-01', 'Russia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Jacintha', 'Lambertz', 'jlambertzp@ucla.edu', 'Female', '2019-07-19', 'Russia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Myriam', 'Wimbury', 'mwimburyq@mail.ru', 'Female', '2019-07-29', 'Colombia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Ingelbert', 'Richings', null, 'Male', '2019-08-26', 'Argentina');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Esteban', 'McKay', null, 'Male', '2020-04-13', 'Russia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Augustine', 'Hassewell', 'ahassewellt@blog.com', 'Male', '2019-08-18', 'Palestinian Territory');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Lea', 'Guitte', null, 'Female', '2019-12-07', 'Czech Republic');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Marian', 'Blackaller', null, 'Female', '2020-05-29', 'Sudan');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Brok', 'Kinton', 'bkintonw@w3.org', 'Male', '2019-07-23', 'Greece');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Adair', 'Tomblin', null, 'Male', '2020-05-15', 'Equatorial Guinea');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Torrie', 'Rockwell', 'trockwelly@example.com', 'Female', '2020-04-25', 'Ukraine');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Liliane', 'Glitherow', 'lglitherowz@craigslist.org', 'Female', '2019-11-28', 'Colombia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Alphard', 'Mimmack', null, 'Male', '2020-06-09', 'Philippines');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Loretta', 'Izachik', 'lizachik11@amazonaws.com', 'Female', '2020-05-19', 'Indonesia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Abagael', 'Friese', null, 'Female', '2019-10-27', 'Nicaragua');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Liane', 'Becerro', null, 'Female', '2020-06-02', 'Yemen');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Devy', 'Thalmann', null, 'Male', '2020-01-20', 'Indonesia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Jacki', 'Nuzzetti', 'jnuzzetti15@google.com', 'Female', '2019-08-17', 'Philippines');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Frankie', 'Greim', null, 'Male', '2019-11-29', 'United States');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Blaire', 'Pawlyn', 'bpawlyn17@ning.com', 'Female', '2020-06-10', 'Bangladesh');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Rikki', 'Christophle', 'rchristophle18@webmd.com', 'Male', '2020-02-02', 'Philippines');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Finley', 'Geydon', 'fgeydon19@xinhuanet.com', 'Male', '2020-01-31', 'Israel');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Damon', 'Koppke', 'dkoppke1a@imgur.com', 'Male', '2020-04-28', 'New Zealand');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Katina', 'Bangs', 'kbangs1b@addtoany.com', 'Female', '2019-11-04', 'Thailand');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Rutter', 'Troake', 'rtroake1c@csmonitor.com', 'Male', '2019-12-16', 'Thailand');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Laurella', 'Payler', 'lpayler1d@booking.com', 'Female', '2019-12-23', 'Slovenia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Darbie', 'Dybell', null, 'Female', '2020-06-04', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Far', 'Killingbeck', null, 'Male', '2020-05-06', 'Argentina');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Clement', 'Hamblington', 'chamblington1g@slate.com', 'Male', '2020-06-01', 'Bangladesh');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Cordelie', 'Belleny', 'cbelleny1h@e-recht24.de', 'Female', '2019-07-11', 'Indonesia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Mariellen', 'Tabard', null, 'Female', '2019-09-15', 'Portugal');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Nial', 'Binny', 'nbinny1j@blinklist.com', 'Male', '2019-08-14', 'Brazil');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Dion', 'Lansdowne', null, 'Male', '2020-02-28', 'Poland');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Devlin', 'Attwool', 'dattwool1l@apache.org', 'Male', '2019-11-01', 'Portugal');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Goober', 'Dinwoodie', 'gdinwoodie1m@networkadvertising.org', 'Male', '2019-08-03', 'Sweden');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Constanta', 'Sampson', 'csampson1n@earthlink.net', 'Female', '2020-06-28', 'Indonesia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Ava', 'Bains', 'abains1o@hugedomains.com', 'Female', '2019-10-12', 'Albania');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Buffy', 'Pietrowicz', 'bpietrowicz1p@toplist.cz', 'Female', '2020-04-09', 'Brazil');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Nevins', 'Maletratt', 'nmaletratt1q@people.com.cn', 'Male', '2020-05-12', 'Poland');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Laurene', 'Trustie', null, 'Female', '2019-12-03', 'Honduras');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Ciel', 'McKevin', null, 'Female', '2020-01-17', 'Bosnia and Herzegovina');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Murial', 'Harman', 'mharman1t@netlog.com', 'Female', '2019-08-24', 'France');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Hans', 'Kinforth', null, 'Male', '2020-06-02', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Delmar', 'Agass', null, 'Male', '2019-09-15', 'Philippines');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Darlleen', 'Derwin', 'dderwin1w@stanford.edu', 'Female', '2020-06-23', 'Indonesia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Ronnica', 'Drinkale', 'rdrinkale1x@wikipedia.org', 'Female', '2019-09-04', 'Armenia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Florida', 'Tupman', null, 'Female', '2019-12-09', 'Indonesia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Siegfried', 'Morrieson', null, 'Male', '2019-07-02', 'Ukraine');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Lorianna', 'Galtone', 'lgaltone20@statcounter.com', 'Female', '2019-11-15', 'Indonesia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Marcus', 'Crippes', 'mcrippes21@typepad.com', 'Male', '2020-06-23', 'Japan');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Montgomery', 'Kidder', 'mkidder22@booking.com', 'Male', '2019-09-12', 'Indonesia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Sioux', 'Middle', 'smiddle23@vinaora.com', 'Female', '2019-10-07', 'Indonesia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Pru', 'McDermot', 'pmcdermot24@eepurl.com', 'Female', '2019-10-03', 'Poland');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Aeriell', 'Flooks', 'aflooks25@cyberchimps.com', 'Female', '2019-07-04', 'Czech Republic');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Alonso', 'Dumke', 'adumke26@virginia.edu', 'Male', '2019-07-16', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Jenny', 'Varley', 'jvarley27@woothemes.com', 'Female', '2020-04-01', 'Russia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Thornton', 'Bramsen', 'tbramsen28@squarespace.com', 'Male', '2019-07-20', 'Russia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Aloise', 'Tirrey', null, 'Female', '2019-08-02', 'France');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Sydney', 'Wallsworth', 'swallsworth2a@weibo.com', 'Male', '2019-07-25', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Page', 'Fortey', 'pfortey2b@cargocollective.com', 'Female', '2019-12-13', 'Ukraine');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Liesa', 'Carne', 'lcarne2c@tiny.cc', 'Female', '2020-01-03', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Anthe', 'Seargeant', 'aseargeant2d@reddit.com', 'Female', '2020-06-08', 'Argentina');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Thelma', 'Vallentine', null, 'Female', '2020-01-13', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Kenn', 'Carwithim', 'kcarwithim2f@tiny.cc', 'Male', '2019-07-30', 'Portugal');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Kinnie', 'Carling', 'kcarling2g@bbb.org', 'Male', '2019-07-07', 'Mexico');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Jess', 'Janway', null, 'Male', '2019-12-12', 'Philippines');
