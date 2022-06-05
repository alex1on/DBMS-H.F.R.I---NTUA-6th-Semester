USE project;

-- Delete Data
DELETE FROM deliverable;
DELETE FROM describes;
DELETE FROM works_on;
DELETE FROM project;
DELETE FROM executive;
DELETE FROM researcher;
DELETE FROM fields;
DELETE FROM budget_funds;
DELETE FROM phones;
DELETE FROM organization;
DELETE FROM program;
ALTER TABLE `program` AUTO_INCREMENT = 1;
ALTER TABLE `organization` AUTO_INCREMENT = 1;
ALTER TABLE `project` AUTO_INCREMENT = 1;
ALTER TABLE `researcher` AUTO_INCREMENT = 1;
ALTER TABLE `executive` AUTO_INCREMENT = 1;
ALTER TABLE `deliverable` AUTO_INCREMENT = 1;

-- Insert program data
INSERT INTO program (hfri_address, program_name) VALUES
	('Finance department', 'Stock Trade'), ('Finance Department', 'Model Currency Forms'),
    ('Finance Department', 'Marketing'), ('Finance Department', 'Sales'),
    ('Finance Department', 'Digital Marketing'),('Finance Department','Marketing Media'),
    ('Human Resourses', 'Customer support'), ('Human Resourses','New Customers'),
    ('Human Resourses','Psychology Programs'),('Human Resourses','Social Resources'), -- 10
    ('Technical Department', 'Computer Programming'),('Technical Department','Computer Engineering'), 
    ('Technical Department','City Managment'),('Technical Department','Space Programms'),
    ('Technical Department','Robotics'),('Technical Department', 'Large Industry Operations'),
    ('Technical Department','Deep Sea Operations'),('Technical Department','Outer Space Operations'),
    ('Technical Department','Theorerical Science Projects'),('Technical Department','Prototype Creation'), -- 20
    ('Scientific Department','Mathematics'),('Scientific Department','Physics'),
    ('Scientific Department','Geology'),('Scientific Department','Astrology'),
    ('Scientific Department','Philosophy'),('Scientific Department','Social Sciences'), 
    ('Scientific Department','Humanitarian Field'),('Scientific Department','Biology'),
    ('Scientific Department','Artificial Intelligence'),('Scientific Department','Machine Learning'), 
    ('Scientific Department','History and Archaeology'),('Scientific Department','Fracking'); -- 32
    
    
-- Insert organization data
INSERT INTO organization (abbreviation, Organization_Name, street_name, street_number, zip_code, city, Organization_Type) VALUES
	('aapl', 'Apple', 'Kalisthenous', 32, 11732, 'Athens', 'Private Corporation'),
    ('ntua', 'National Technical University of Athens', 'Katexaki', 53, 13255, 'Athens', 'University'),
    ('eaa', 'Ethniko Asteroskopio Athinon', 'Apostolou Pavlou', 19, 11851, 'Athens', 'Research Center'),
    ('auth', 'Aristoteleio University of Thessaloniki', 'Agion Panton', 77, 25885, 'Thessaloniki', 'University'),
    ('PaPei', 'University of Piraeus', 'Aitolou', 25, 19080, 'Piraeus', 'University'),
	('micro', 'Microsoft', 'Benizelou', 236, 39886, 'Athens', 'Private Corporation'),
    ('meta', 'facebook,instagramm', 'Makedonias', 69, 29903, 'Athens', 'Private Corporation'),
    ('PaKa', 'Panepistimio Kastorias', 'Troulou', 120, 88402, 'Kastoria', 'University'),
    ('Umbrella', 'Unique Creations research center', 'Zoundri', 999, 12420, 'Athens', 'Research Center'),
    ('Mavis', 'Maria Vistouri Corp', 'Kentriki', 74, 75290, 'Athens', 'Private Corporation'), -- 10
    ('Aulis', 'National Univesity of the Aurora', 'Teddy Roosvelt', 865, 44192, 'Ioannina', 'University'), -- 11
    ('MPO','League for the Advancement of Sciences','Menidis', 12, 12120, 'Tripoli', 'Research Center'), -- 12 
    ('Lintel', 'Biology Academy', 'Othonos', 69, 42176, 'Kastoria', 'University'),
    ('Celltek','Cellular Technologies', 'Kritis', 42, 12855, 'Athens', 'Private Corporation'), -- 14
    ('Recycon', 'Recycling Technologies Research Center', 'Oikonomou', 30, 99880, 'Thessaloniki','Research center'),
    (NULL,'Social Studies University','Elpidas',88,12345,'Athens','University'), -- 16
    ('Pandora','Engineers Associaton','Sternomairis',180,55892,'Athens','Private Corporation'),
    ('CaFou','Cancer Treatment and Health Foundation','Pigasou',290, 19181, 'Athens','Research Center'), -- 18
    ('Soulgames','Soulstrike Game Company','Blaxaki',999,19200,'Athens','Private Corporation'),
    (NULL,'University of Ioannina','Papigou',29,77882,'Ioannina','University'), -- 20
    ('Cilch','University Cjaxna','Euboias',140, 28394,'Cjaxna','University'),
    ('TecIn','Technology Institute','Staxtoferti',92,93148,'Athens','Research Center'), -- 22
    ('DepSat','Department of Satyrical Realism','Elladas','162',85521,'Chalcis','Private Corporation'),
    ('Tesla','Telecinetic slap Champions','Edisons',200,19023,'Athens','University'), -- 24
    ('Tanouki','Endagered Animals Research Center','Stenouli',201,19911,'Athens','Research Center'),
    (NULL,'History and Archaeology University','Mpoumpoulinas',16,29341,'Thessaloniki','University'), -- 26
    (NULL,'Panagiotopoulos Health Clinic','Matoukloktonou',19,14000,'Athens','Private Corporation'),
    (NULL,'National Papaspurou Foundation','Themistokli',28,10230,'Athens','Research Center'), -- 28
    ('ekpa','Kapodistrian University of Athens','Pelloponisou',190,19213,'Thessaloniki','University'),
    ('APTh','Aristotle University of Thessaloniki','Patras',200,54124,'Athens','University'), -- 30
    ('SoScI','Socrates Scientific Institution','Othonos',40,12031,'Athens','Research Center'),
    ('AristOs','Aristotle Organizational System','Eleutheriou Benizelou',12,19230,'Tripolis','Private Corporation');

-- Insert phone_number data
INSERT INTO phones (phone_number , organization_id) VALUES
	(2103421547, 1), (2108929677, 3), (2108697244, 2), (2119967888, 4), (2310996736, 2),
    (+306918529641 ,  1), (+306907607220 , 3), (2149469317, 7), (2063165690, 9), (+302712958841, 11), 
	(+306936952531, 10), (6991698545, 4), (2776870560, 8), (2657029121, 2), (+306979532069, 1),
    (+306957339025, 1), (2195641288, 2), (+306905256385, 7), (+306967418790, 8), (6989453434, 10),
    (+306970231553, 11), (2184511479, 1), (+306901659310, 9), (+306985469333, 6), (+306937899133, 5),
    (+306989257758, 12), (+302517817545, 12), (+306972322316, 12), (+302007377423, 12),(6904369866, 13),
	(6942286766, 13),(+306931394629,13), (+302209303063,13), (6913005937, 14), (2528615238, 14),(6941354127,14),
	(+306974136948, 14),(+306955269554,14),(+306945058509, 15),(6981228003, 15),(+306970506313, 15),
	(6938057304,15),(6938792926,16),(+306914767558,16),(+306979901321,17),(+306916216488,17),(+306930651892, 17),
	(+302326652303,17),(6977807824,17),(+306976026603,18),(+306958328466,18),(+306950859667,18),(692928363,18),
	(6988772299,18),(+306939825276,18),(6977633221,18),(6983902584,18),(+306930272613,18),(+302986933802,18),
    (+302570234402,19),(+306969399850,19),(+306977719414,19),(2717628589,19),(6961764037,19),(+302343992898,19),
    (6975324196,19),(+306905664564,19),(+306965758722,20),(+306948322399,20),(+302210352639,20),(+306959578144,20),
    (+302723277441,20),(6948796931,20),(+306954201398,20),(6996075670,20),(+306949954036,20),(6978842878,21),
	(6934383865,21),(2993930562,21),(2673334632,21),(+306943863159,21),(+306977974718,22),(2363885846,22),
	(+306909946584,22),(+302282094252,22),(+306927383151,23),(222897543701,23),(+306925213564,23),
	(2610129979,23),(+302539249193,23),(+306937120259,23),(+306912869491,23),(6974073132,24),
	(2471606673,24),(+302523618040,24),(+302921256818,24),(+306918346347,24),(6901245595,24),(+306916739575,24),
    (2264007569,25),(2575422995,25),(+306988019253,26),(+306990261567,26),(6986802099,26),(6985047360,26),
	(+306907703437,26),(6923017688,27),(+306930687012,27),(6957838450,27),(6957924001,27),(6969045604,27),
	(6930977910,27),(+30694966594,28),(6995004897,28),(+306960524524,28),(+306909975938,28),(+306958436070,29),
	(2238714165,29),(+306921739210,30),(+306982802505,30),(+306950036096,30),(6998743903,31),(6904596844,31),
	(2628285345,31),(2608314695,31),(6951997947,31),(+306970076845,32),(6921297016,32),(6948882400,32),
    (6957875658,32),(6941304198,32),(+302181023575,32);

-- Insert budget_funds data
INSERT INTO budget_funds (budget_type, organization_id) VALUES
	('equity', 1), ('ministry of education', 2), ('ministry of education', 3), ('private action', 3), ('ministry of education', 4),
    ('ministry of education', 7), ('ministry of education', 11),('ministry of education', 9), ('private action', 9),
    ('special funds', 6), ('private investing', 10), ('ministry of currency', 8), ('ministry of education', 12), ('private action',12),
    ('investments', 12),('ministry of education',13),('private action', 13),('private action',14),('investments',14),
    ('Ministry of Education',15),('Oil Lobbyists',15),('Ministry of Education',16),('Private Action',17),('Ministry of Education',17),
    ('Charity',18),('Ministry of Health',18),('Private Action',18),('Ministry of Currency',19),('Private action', 19),('Investments',19),
    ('Game Sales',19),('Ministry of Education',20),('Special Funds',20),('Ministry of Education',21),('Private Action',21),
    ('Private Action',22),('Ministry of Education',22),('Special Funds',23),('Private Action',23),('Ministry of Education',24),
    ('Investments',25),('Ministry of Natural Preservation',25),('Ministry of Education',26),('Ministry of Health',27),
    ('Ministry of Education',28),('Ministry of Education',29),('Ministry of Education',30),('Ministry of Education',31),
    ('Private Action', 31),('Private Action',32); 

-- Insert field data
INSERT INTO fields (field_type) VALUES
	('Mathematics'), ('Computer Engineering'), ('Biology'), ('Literature'), ('Chemistry'), ('Astronomy'),
    ('Astrology'), ('Astrophysics'), ('Philosophy'), ('History'), ('Music'), ('Language'), ('Humanities'),
	('Geology'),('Evolutionary Biology'),('Classical Studies'),('Spectrology'), ('Programming'),('Databases'),
    ('Physics'),('Digital World'),('Human Anatomy'), ('Biochemistry'),('Sociology'),('Theology'),('Operating Systems'),
    ('Hardware'),('Software'),('Chemical Engineering'),('Topography'),('Architecture'),('Material Designing'),('Marketing Systems'),
    ('Artificial Intelligence'),('Nuclear Fusion'),('Marine Biology'),('Bioengineering'),('Game Design');
    
-- Insert researcher data
INSERT INTO researcher (first_name, last_name, sex, date_of_birth, date_of_entry, R_Organization_ID) VALUES
	('Xristos', 'Papavasileiou', 'male', '1970-05-06', '1998-09-25', 2),
    ('Pinelopi', 'Karagianni', 'female', '1991-04-12', '2014-10-22', 1),
    ('Andreas', 'Fafalios', 'male', '1950-06-26', '1970-09-04', 3),
    ('Giannis', 'Eleutheriou', 'male', '1956-08-30', '1976-07-23', 4),
    ('Vasiliki', 'Eustathiou', 'female', '1944-08-04', '1962-08-30', 1),
    ('Dafni', 'Kalogeratou', 'female', '1948-11-19', '1966-12-27', 3),
    ('Kostas', 'Romanos', 'male', '1960-09-07', '1980-09-07', 2),
    ('Dionisios',  'Petroulakis', 'male', '2000-01-01', '2020-10-28', 11),
    ('Manos', 'Panagiotopoulos ', 'male','1944-12-29','1966-12-29', 10),
    ('Sun', 'Mamalakis','male', '1955-06-07', '1984-07-24', 9),
    ('Giorgos', 'Papabasileiou', 'male','1948-02-02','1970-02-10',7), -- 11
    ('Sotiris', 'Sotiropoulos', 'male', '1990-10-12', '2009-07-09', 6),
    ('Basileios', 'Panagiotopoulos', 'male', '1999-12-29', '2019-09-11', 4), -- 13
    ('Giorgos', 'Sotiriou', 'male', '1988-02-13', '2009-10-19', 11),
    ('Manos', 'Papastamatis', 'male', '1970-02-25', '1999-03-10', 10),
    ('Maria', 'Peponi', 'female', '1999-12-12', '2019-05-26', 7),
    ('Moulis', 'Matoukloktonos', 'male', '1945-12-15', '1969-12-09', 12), -- 17
    ('Nick','Fuentes', 'male','1990-10-10','2010-07-29',12), -- 18
    ('Prixi','Lemoni', 'female','1944-10-20','1980-12-09',12), -- 19
    ('Toulipa','Sountri', 'female','1980-07-25','2001-07-03',12),
    ('Alitheia','Biki', 'female', '1999-12-19','2021-04-02',12), -- 21
    ('Dionisios','Paparis', 'male','1945-06-23','1986-08-11',12),
    ('Maria','Db','female','1996-12-12','2018-11-26',12), -- 23
    ('Giannis', 'Stamatelos', 'male', '1980-11-13', '2000-12-23', 12),
    ('Stamatia', 'Papadiamantopoulou', 'female', '1990-12-17', '2018-11-28', 12), -- 25
    ('Eleutheria','Stamatelou', 'female', '1970-11-14','2004-9-11',12),
    ('Spyros', 'Papabasileiou', 'male', '1950-10-23','1972-07-12',13), -- 27
    ('Basileia', 'Papastamateia', 'female', '1994-07-09','2017-09-09',13),
    ('Marios','Louis','male','1985-09-19','2007-01-01',13),-- 29
    ('Alexandros','Kapandritis','male','1998-01-18','2017-10-07',13),
    ('Stathis','Stathoulis','male','1950-10-12','1970-12-13',13),-- 31
    ('Manos','Blaxakis','male','1955-12-30','1980-04-04',14),
    ('Petros','Litsos','male','1985-08-21','2004-12-06',14), -- 33
    ('Marilia','Blaxaki', 'female','2000-01-01','2018-03-02',14),
    ('Leonidas','Papagos','male','1998-06-19','2020-02-19',14), -- 35
    ('Kostoula','Petropoulou','female','1980-07-13','2000-01-29',14),
    ('Panagiotis','Panagiotidis','male','1960-10-07','2001-11-28', 15),-- 36
    ('Nikitas','Gerogiannopoulos','male','1987-09-30','2008-07-12',15),
    ('Takis','Papaspurou','male','1990-12-20','2010-12-30',15),
    ('Magda','Nikiforou','female','1960-10-09','1980-10-25',15),
    ('Panagiota','Kontogianni','female','2002-09-09','2020-12-30',15),
    ('Makis','Lakistakis','male','1995-7-12','2014-9-3',15), 
    ('Grigoris','Kougias','male','1946-6-6','1990-9-9',15), -- 42
    ('George','Panousis','male','1999-1-10','2017-9-6',15),
    ('Helen','Mauromati','female','1970-10-5','1995-10-3',15),
    ('Data','Dataperson','male','1960-5-15','2001-7-28',15), -- 45
    ('Elpida', 'Fragoulaki','female','2002-10-10','2022-6-3',16), -- 46
    ('Marina','Geroulaki','female','2002-2-18','2022-6-3',16),
    ('Stefanos', 'Ionitsa','male','2002-1-29','2022-6-3',16 ),
    ('Sakis','Papabasileiou','male','1980-10-1','2010-7-10',16), -- 49
    ('Mike','Parlopoulos','male','2000-12-9','2021-10-28',17), -- 50
    ('Arguris','Karafoulidis','male','1950-9-9','1970-12-7',17),
    ('Nikos','Papastamatis','male','1980-4-2','2005-7-23',17),
    ('Petroula','Limani','female','2000-01-01','2018-2-1', 17),
    ('Basia','Onasi','female','1993-7-21','2015-7-10',17),
    ('Julia','Panagiotopoulou','female','1945-11-24','1967-11-19',17), -- 55
    ('Nick','Kalabros','male','1996-11-17','2019-10-24',18), -- 56
	('Markos','Fuller','male','1970-10-10','2000-11-15',18),
    ('Nikitas','Trelopoulos','male','1999-11-10','2019-11-20',18),
    ('Maria','Germani','female','1947-10-11','1987-5-14',18),
    ('Petra','Malipoulidi','female','1980-3-24','2008-10-10',18),
	('Sotiris','Panopoulos','male','1999-12-1','2020-01-9',18), -- 61
	('Panos','Alexopoulos','male','1950-10-10','1976-12-10',19), -- 62
    ('Pinelopi','Papabasileiou','female','1988-10-10','2009-12-1',19),
    ('Marios','Blaxakis','male','1995-10-12','2016-7-30',20), -- 64
    ('Kostas','Kostogiannis','male','1950-12-17','1980-9-9',20),
    ('Helen','Joestar','female','2003-9-30','2022-1-1',20), -- 66
    ('Joe','King','male','1990-7-8','2011-2-1',20),
    ('Dionusos','Papaspurou','male','1999-1-9','2017-9-29',21),-- 68
    ('Stephanie','Holmes','female','1945-5-23','1969-7-18',21),
    ('Sherlock','Doe','male','2000-11-9','2021-12-9',21),
    ('Charlotte','Matterson','female','1970-6-7','2000-11-9',21), -- 71
    ('Foibos','Foveras','male','1999-12-1','2018-6-30',22), -- 72
    ('Claire','Jouliani','female','1990-5-14','2009-9-11',22),
    ('Sandi','Kladostefani','female','1954-8-24','2000-7-19',22),
    ('Joseph','Joestar','male','1989-12-5','2010-6-23',22), -- 75
    ('Stellios','Kapandritis','male','2001-11-7','2021-11-13',23), -- 76
    ('Sotiria','Papadimitropoulou','female','1958-6-3','1991-12-20',23),
    ('Manos', 'Ferrari','male','1993-7-25','2015-8-12',23),
    ('Panagiotis','Karagiannis','male','1987-1-24','2009-2-18',23),
    ('Sotirakis','Kordas','male','1972-7-11','1999-11-12',23),
    ('Katina','Elpidaki','female','1999-12-4','2020-1-29',23), -- 81
    ('Stavros','Trelokostas','male','1952-11-3','1970-12-29',24), -- 82
    ('Danai','Linguini','female','1984-8-23','2003-9-12',24),
    ('Euridiki','Klina','female','1993-1-23','2018-9-1',24),
    ('Nikos','Fisher','male','2000-1-15','2019-7-12',25), -- 85
    ('Nikodimos','Mauromanikis','male','1949-11-27','1970-10-27',26), -- 86
    ('Despoina','Foureira','female','1990-10-23','2012-10-13',26),
    ('Sokratis','Papastefanis','male','2001-11-17','2021-8-7',27),-- 88
    ('Fenia','Vlaxaki','female','1993-1-12','2015-10-29',27),
    ('Marios','Papathanasis','male','1955-10-26','1980-3-12',27),
    ('Elpida','Kounisti','female','1990-11-23','2012-7-23',27),
    ('Annabele','Silvershield','female','1984-1-6','2005-2-23',27), -- 92
    ('Mamalakis','Fotakis','male','1970-10-1','2000-4-12',28),
    ('Stefanos','Xios','male','2000-4-12','2019-8-10',28),
    ('Sokratis','Sountris','male','1950-9-18','1983-4-27',28), -- 95
    ('Maria', 'Koutroubeli','female','1990-10-19','2012-5-13',29),
    ('Minas','Papoutsis','male','1948-9-17','1980-11-10',29),
    ('Giorgia','Papamaria','female','1972-10-30','1999-9-14',30),
    ('Maria','Skouda','female','2000-1-19','2020-10-11',30),
    ('Madaras','Papadiamadis','male','1999-1-19','2019-6-16',30), -- 100
    ('Petros', 'Katsikomatis','male','1995-10-2','2017-10-9',31), -- 102
    ('Theofanis','Noikokuris','male','1970-1-29','1990-10-7',31), 
    ('Leonidas','Rostomis','male','1989-12-1','2015-4-27',31), 
    ('Konstantinos','Mauromalis','male','1999-10-1','2019-11-11',31), 
    ('Maria','Stathou','female','1960-10-9','1988-1-12',31),
    ('Elpida','Stefanou','female','2000-1-16','2018-10-11',31),
    ('Lamia','Manopoulou','female','1981-11-2','2001-8-15',31),
    ('Panagiota','Sioki','female','1996-10-21','2017-12-12',31),
    ('Gogo','Petroula','female','1984-9-24','2008-9-21',31), -- 110
    ('Projectidios','Projectakis','male','1960-12-1','2000-3-17',32);
    
-- Insert executive data
INSERT INTO executive (first_name, last_name, sex) VALUES
	('Giorgos', 'Papaioannou','male'), ('Maria', 'Karavaki','female'), ('Lefteris', 'Astoris','male'), ('Vaggelis', 'Feriskos','male'), ('Vladimiros', 'Sakellariou','male'), -- 1-5
    ('Nikitas', 'Panagiotopoulos','male'),('Fanis','Arguropoulos','male'),('Takis', 'Xrusos','male'),('Agapi', 'Stefanidou','female'),('Elpida','Papasotiriou','female'), -- 6-10
    ('Panos', 'Xrusostefanis','male'),('Stefanos','Kalabros','male'),('Jimmy','Bolanakis','male'),('Petros','Lemonis','male'),('Giorgia','Melitini','female'),-- 11-15
    ('Elpida','Mavromati','female'),('Stefanie','Miller','female'),('John','Doe','male'),('Mark','Bolognese','male'),('Loulis','Sountris','male'), -- 16-20
	('Marios','Tsopanis','male'),('Elon','Musk','male'),('Mlon','Eusk','male'),('Joe','Rogan','male'),('Roe','Jogan','male'),('Barrack','Obama','male'),  -- 17-22
    ('Michael','Jackson','male'),('Takis','Bernoullis','male'),('Stavros','Maxmillian','male'); -- 23-25
    
-- Insert project data
-- 15
INSERT INTO project (title, summary, amount, starting_date, ending_date, program_id, executive_id, organization_id, supervisor_id, evaluator_id, grade, evaluation_date) VALUES
	('Deeper Analysis of 8085', 'Summary 1', 102536, '2022-05-21', '2023-04-22', 8, 2, 2, 1, 2, 51, '2021-05-19'), -- 1
	('Data Analysis of PUM Proteins', 'Summary 2', 150968, '2013-09-14', '2016-09-14', 3, 1, 2, 7, 5, 60, '2012-12-22'), -- 2
	('Dostoevsky: Literary Analysis', NULL, 250200, '1988-11-21', '1992-02-17', 1, 3, 4, 4, 7, 55, '1987-05-05'),
	('Ice pockets on Martian soil', 'Summary 4', 923000, '2000-08-30', '2004-08-30', 3, 5, 1, 5, 1, 69, '1999-10-02'), -- 4
	('Foundations of Signal Processing', 'Summary 5', 805000, '1977-09-11', '1979-09-11', 7, 2, 3, 6, 4, 86, '1976-09-10'),
    ('Analysis of Foundational Rules of Calculus', 'Summary 6', 694200, '2020-10-20', '2023-09-10', 12, 7, 11, 14, 1, 88, '2016-11-05'), -- 6
    ('New Digital Systems', NULL, 1000000, '2019-01-01','2023-01-01', 7, 10, 2, 1, 10, 99, '2000-12-01'),
    ('Underground Water Sources', NULL, 750000,'2000-06-26','2003-07-30', 14, 6, 12, 17, 11, 77, '1999-09-29'), -- 8
    ('Weightless Particle Behavior', 'Summary 9', 805100, '2020-10-10', '2024-09-28',12, 11, 12, 25, 7, 88, '2019-12-12'),
    ('Effects of FPS games on the brain', NULL, 120000, '2019-12-12', '2022-12-30', 3, 10, 12, 20, 3, 63, '2013-10-12'), -- 10
    ('Predatorial Instincts of Primates','Summary 10', 500000, '2020-10-25', '2022-11-30', 9, 7 , 12, 22, 3, 75, '2019-11-12'),
    ('Male-Female Muscle Tissue','Summary 11', 250000, '2022-03-03','2026-01-01',1, 3 , 12 , 20, 1, 89, '2020-12-30'), -- 12
    ('Small Scale Study of Programmer Behaviours',NULL, 100000, '2022-06-02', '2024-07-05', 4, 11, 12, 25, 11, 80, '2020-10-10'),
    ('Outergalactic Meteorites', NULL, 900000, '2020-10-25', '2024-12-13', 8, 10, 12, 25, 7, 90,'2020-09-03'), -- 14
    ('Study of Morbius','Morbius',1000000,'2022-04-30','2026-04-30', 9, 7, 12, 22, 5, 100, '2022-04-15'),
    ('Classical Heroic Archetypes in Movies', 'Summary 15', 300000, '2019-10-15', '2023-09-15', 10, 3, 12, 17, 3, 70, '2018-12-12'), -- 16
    ('Chemical Consistency of Water in Wells', NULL, 600000,'2020-09-21','2022-01-29', 7, 8, 12,  20, 6, 65, '2019-05-26'),
    ('Sociological Behavior in modern media', NULL, 250000, '2020-09-21', '2024-09-21', 3, 5, 12, 22, 3, 79, '2020-08-10'), -- 18
    ('Anatomical Differences in Dog Breeds',  NULL, 150000,'2019-04-20','2022-03-20',11, 7, 12, 26, 2, 57, '2018-12-30'),
    ('Flora with medicinal qualities', NULL, 200000, '2020-07-19','2023-09-18', 6, 2, 13, 27, 17, 80, '2019-06-12'), -- 20
    ('Microbial Density in Infected Apes Livers', 'summary 21', 400000, '2010-07-19','2014-09-29',7, 3, 13, 30, 5, 60, '2010-06-01'),
    ('Scavenger Anthropods in the ocean depths', 'Summary 22', 236120, '2022-01-30','2026-01-30',8,9,13, 28, 6, 84,'2021-10-18'), -- 22
    ('Queueing Systems with dynamic parts','Summary 23', 199000,'2014-03-20','2017-06-28', 3,1, 14, 32, 27, 60,'2013-03-20'),
    ('Image Compressing:AI', NULL, 800500,'2020-10-15','2024-10-05', 4, 10, 14, 33, 10, 92, '2020-06-06'),-- 24
    ('Satellite Applications for faster communications', NULL, 300000, '2022-12-11', '2025-11-10', 3, 9, 14, 35, 9, 78, '2021-10-20'),
    ('Plastic: Turning Old material into tires', NULL, 238000,'2020-7-5','2024-6-3', 4, 10, 15, 36, 3, 63, '2019-6-6'), -- 26 15
    ('Using fungi to absorb plastic foam: A study', 'Summary 27',270000,'2019-6-2','2023-6-2',3,7, 15, 40, 2, 87, '2019-5-26'),
    ('Techniques for efficient paper Recycling', NULL, 100000,'2018-5-1','2021-3-3',4,6,15,40,7,55,'2018-4-25'), -- 28
    ('Cleaning Orbital Trash','Summary 29', 900000, '2022-10-8','2026-10-9',9, 9, 15, 41, 9, 89, '2022-6-3'),
    ('Cleaning the Great Pacific Garbage Patch', NULL, 500000, '2020-9-6','2024-8-6',3,10,15,40,10,76,'2019-12-30'),-- 30
    ('Generating energy from Urban Waste', NULL, 200000, '2019-4-2','2023-2-1', 5, 1, 15, 36, 1, 80, '2019-3-2'),
    ('Methods for Separating Materials', NULL, 130000,'2018-12-30','2023-1-1',7,9,15,42,30,70,'2018-10-10'), -- 32
    ('Smart Biodegradable Materials', NULL, 400000,'2020-9-12','2024-8-10',1,10,15,40,35,99,'2020-8-8'),
    ('Mining on Mars: A theoretical Study','Summary 34',200000,'2021-1-10','2024-1-10', 10, 1,15,38, 33,69,'2020-1-1'),
    ('A study on applications for crude oil waste', NULL, 1000000,'2022-6-3','2026-6-3',5,7,15,40, 30, 58,'2022-6-2'),-- 35
    ('Increasing current Recycling methods efficiency','Summary 35', 200000,'2021-6-18','2022-5-1',4,8,15,45,18,60,'2018-10-29'), -- 15
    ('Primates in their natural environment',NULL, 160000,'2022-6-3','2026-4-4',1,17,16,49,4,80,'2022-4-10'),
    ('Social behavior in large internet groups','Summary 38',100000,'2022-5-5','2025-5-5', 1,19,16,49,2,92,'2022-4-10'), -- 38
    ('Turning unhappy engineers into Robots.Beep','We look at engineers in their environment and enhance them with cybernetics. We do not need to change their software because they dont sleep already'
    ,999999,'2022-1-3','2026-1-4', 1,22,17,51, 10 ,100, '2000-4-10'),
    ('Game Design for Educational Purposes',NULL,500000,'2020-10-9','2024-1-1',18,22,17,50,38,70,'2019-1-1'), -- 40
    ('Effects of Strategic Games on Logical thought',NULL,120000,'2019-11-29','2023-10-10',15,20,17,52,30,70,'2019-10-28'),
    ('Human Religion through time',NULL,100000,'2021-10-10','2023-11-8',10,17,17,51,29,51,'2021-10-9'), -- 42
    ('Treating Cancer with gene modification',NULL,1000000,'2022-1-1','2025-12-29',18,20,18,56,50,90,'2020-7-10'), -- 43,18
    ('Enabling Key Tumor Suppressor Genes','We focus on ways to enable key tumor suppressor genes on aging mice.',250000
    ,'2019-10-12','2023-10-13',18,21,18,56,10,90,'2019-09-10'), -- 44
    ('Looking into Cancer-free communities',NULL,200000,'2020-5-5','2023-10-10',4,7,18,60,4,65,'2020-4-30'),
    ('Early signs Testicular Cancer',NULL,130105,'2019-3-3','2023-1-1',2,7,18,61,29,69,'2019-1-15'), -- 46
    ('Treating Cancer with Microbots','Summary:...', 394092,'2022-6-1','2026-6-2',18,22,18,60,46,78,'2022-2-10'),
    ('Brain Tumors, early Behavioral Changes',NULL,270000,'2022-1-1','2025-1-1',9,16,18,61,50,70,'2021-10-24'), -- 48
    ('Cancer in Immunocompromised Patients','No summary',760000,'2022-6-1','2026-5-30',1,12,18,56,28,63,'2022-5-10'),
    ('Novel Chemotherapy methods', NULL, 900000,'2021-4-2','2025-3-3',4,7,18,60,13,55,'2021-3-20'), -- 50,18
    ('Ray Tracing Optimisation', NULL, 130000,'2022-6-1','2023-1-1',10,12,19,62,59,60,'2022-5-5'),
    ('Pattern Recognition:Human Faces', NULL, 660000,'2017-10-10','2020-5-7',4,12,20,64,3,55,'2016-7-3'), -- 52
    ('Bodybuilding: Nutritional Macros','Summary',140000,'2020-12-1','2024-1-30',7,25,20,67,7,62,'2020-6-17'),
    ('Literary analysis of Odyssey',NULL,100000,'2020-11-3','2023-5-25',1,13,20,65,9,70,'2020-10-26'), -- 54
    ('Optimising Urban Bus routes', NULL, 250000,'2021-10-7','2024-4-27',3,23,20,67,9,86,'2021-6-3'),
    ('Self Learning Robots in Space',NULL,600000,'2022-6-3','2026-6-4',7,21,21,71,20,94,'2022-5-10'), -- 56
    ('Sewer Cleaning Robots:Path Finding','Summary of Project',1000000,'2018-12-20','2022-12-10',15,23,21,68,56,70,'2017-12-31'),
    ('Elastic Robots: Soft Materials',NULL,700000,'2019-10-12','2023-6-6',15,7,21,69,2,80,'2019-6-1'), -- 58
    ('Swarm style machine learning Drones',NULL,650000,'2022-9-19','2025-8-26',6,16,21,69,8,59,'2021-7-18'),
    ('Mathematical Patterns in Nature',NULL,100000,'2021-9-10','2024-12-4',8,22,22,74,4,51,'2021-1-5'), -- 60
    ('Humor and Natural Selection','Summary 61',130000,'2022-1-1','2025-11-26',18,13,23,76,29,64,'2021-10-28'),
    ('Databases used to store other Databses',NULL,999690,'2021-10-3','2024-7-24',11,21,23,77,29,90,'2021-10-2'),-- 62
    ('Reverse Transcription in mRNA Vaccines',NULL,800000,'2021-9-3','2025-1-7',2,14,24,84,76,87,'2021-8-1'),
    ('Novel Artificial Virus Development','NAVD',1000000,'2022-6-4','2026-6-5',1,1,24,82,40,100,'2022-6-3'), -- 64
    ('Recovering and Preserving Ancient Artifacts','RPAA',190300,'2021-1-18','2021-12-30',4,6,26,86,10,70,'2021-1-12'),
    ('Autoimmune Diseases: Causes anc Cures','Summary 66',200000,'2022-2-3','2025-10-10',13,4,27,92,29,100,'2022-2-1'),
    ('Artificial Godhood','We attempt to ascent into godhood by uploading our minds into the Machine. With 3 legends working here we are certain to succeed',
    1000000,'2022-4-18','2026-2-11',9,1,28,95,7,100,'2022-4-17'),
    ('Increasing Fuel Efficiency of BIM',NULL,299000,'2020-12-20','2024-11-19',12,19,29,96,88,70,'2020-11-20'),
    ('Definitive Proof that p=np',NULL,100000,'2021-11-19','2025,12-28',1,22,30,99,70,93,'2021-10-1'),
    ('Novel Cryptocurrencies',NULL,700000,'2018-1-9','2020-1-18',5,19,31,101,90,88,'2018-1-1'), -- 70
    ('Optimising Compilers',NULL,650000,'2018-2-11','2022-1-1',4,18,31,101,10,86,'2018-2-10'), 
    ('Volcanoes on Jupiter',NULL,120000,'2018-3-29','2019-10-12',11,24,31,101,12,88,'2018-1-12'),
    ('Jupiters moons and their gravity',NULL,1000000,'2018-4-30','2021-11-26',12,13,31,101,61,57,'2018-3-19'),
    ('Outergalactic Matter',NULL,780000,'2018-5-12','2020-11-9',5,10,31,101,33,69,'2018-1-30'),
    ('Solar Panels',NULL,630000,'2018-6-15','2022-5-21',19,2,31,101,90,78,'2018-1-3'),
    ('Reinventing Dams',NULL,190000,'2018-7-12','2020-9-19',7,10,31,101,24,70,'2018-4-29'),
    ('Passive water filtration systems',NULL,704000,'2018-8-19','2021-9-11',1,9,31,101,52,98,'2018-3-30'),
    ('Getting rainwater out of cities',NULL,808000,'2018-9-12','2020-12-30',4,12,31,101,60,68,'2018-8-11'),
    ('Urban Waste and efficient Managment',NULL,204300,'2018-10-9','2022-10-1',7,11,31,101,4,71,'2018-1-20'),
    ('Philosophy:Theoretical Aspect of the spoon',NULL,700000,'2018-11-1','2020-12-1',5,19,31,101,91,59,'2018-5-30'),
    ('Asphalt and low temperature recipes',NULL,700000,'2019-12-14','2021-6-17',5,19,31,101,42,68,'2018-3-12'), -- 81
    ('Robotics 1',NULL,100000,'2019-2-1','2020-1-1',1,12,31,102,10,68,'2019-1-1'), -- 82
    ('Robotics 2',NULL,190000,'2019-3-1','2021-12-1',11,1,31,102,10,58,'2019-1-1'),
    ('Robotics 3',NULL,290000,'2019-4-1','2022-1-12',1,21,31,102,10,68,'2019-1-1'),
    ('Nuclear Project 1',NULL,230000,'2019-5-1','2023-10-1',21,1,31,102,10,98,'2019-1-1'),
    ('Nuclear Project 2',NULL,600000,'2019-6-1','2020-11-14',1,13,31,102,10,83,'2019-1-1'),
    ('Nuclear Project 3',NULL,860000,'2019-7-1','2021-2-15',1,13,31,102,10,82,'2019-1-1'),
    ('Mathematical theorems 1',NULL,910000,'2019-8-1','2021-3-16',15,1,31,102,10,87,'2019-1-1'),
    ('Mathematical theorems 2',NULL,120000,'2019-9-1','2021-9-17',1,15,31,102,10,89,'2019-1-1'),
    ('Chemical Warfare Project 1',NULL,170000,'2019-10-1','2021-8-18',12,11,31,102,10,51,'2019-1-1'),
    ('Chemical Warfare Project 2',NULL,230000,'2019-11-1','2021-7-29',20,11,31,102,10,63,'2019-1-1'),
    ('Nuclear Explosives and applications',NULL,1000000,'2019-11-12','2021-11-30',20,13,32,111,10,82,'2019-1-1'), -- 92
    ('1',NULL,230000,'2018-1-1','2019-10-10',13,22,32,111,1,52,'2017-1-1'),
	('2',NULL,780000,'2018-1-1','2019-10-10',12,16,32,111,1,51,'2017-1-1'),
	('3',NULL,990000,'2018-1-1','2019-10-10',11,19,32,111,1,80,'2017-1-1'),
	('4',NULL,540000,'2018-1-1','2019-10-10',21,2,32,111,1,93,'2017-1-1'),
	('5',NULL,150000,'2018-1-1','2019-10-10',12,12,32,111,1,62,'2017-1-1'),
	('6',NULL,1000000,'2018-1-1','2019-10-10',1,12,32,111,1,70,'2017-1-1'),
	('7',NULL,150000,'2018-1-1','2019-10-10',1,12,32,111,1,86,'2017-1-1'),
	('8',NULL,200000,'2018-1-1','2019-10-10',1,12,32,111,1,91,'2017-1-1'),
	('9',NULL,340000,'2018-1-1','2019-10-10',1,12,32,111,1,76,'2017-1-1'),
	('10',NULL,400000,'2018-1-1','2019-10-10',1,12,32,111,1,67,'2017-1-1'),
    ('11',NULL,200000,'2018-1-1','2019-10-10',1,12,32,111,1,92,'2017-1-1'), -- 19
    ('12',NULL,930000,'2018-1-1','2019-10-10',1,12,32,111,1,84,'2017-1-1'),
    ('13',NULL,120000,'2019-1-1','2019-10-10',1,12,32,111,1,52,'2017-1-1'),
    ('14',NULL,180000,'2019-1-1','2019-10-10',1,12,32,111,1,82,'2017-1-1'),
    ('15',NULL,150000,'2019-1-1','2019-10-10',1,12,32,111,1,96,'2017-1-1'),
    ('16',NULL,190000,'2019-1-1','2019-10-10',1,12,32,111,1,94,'2017-1-1'),
    ('17',NULL,260000,'2019-1-1','2019-10-10',1,12,32,111,1,92,'2017-1-1'),
    ('18',NULL,750000,'2019-1-1','2019-10-10',1,12,32,111,1,66,'2017-1-1'),
    ('19',NULL,800000,'2019-1-1','2019-10-10',1,12,32,111,1,76,'2017-1-1'),
    ('20',NULL,910000,'2019-1-1','2019-10-10',1,12,32,111,1,75,'2017-1-1'),
    ('21',NULL,140000,'2019-1-1','2019-10-10',1,12,32,111,1,73,'2017-1-1'),
    ('22',NULL,140000,'2019-1-1','2019-10-10',1,12,32,111,1,57,'2017-1-1'),
    ('23',NULL,280000,'2019-1-1','2019-10-10',1,12,32,111,1,65,'2017-1-1');


    
-- Insert works_on data
INSERT INTO works_on (project_id, researcher_id) VALUES  -- 31=102-110
	(1, 1), (2, 1), (5, 3), (3, 4), (4, 5), (5, 6), (1, 7), (7, 7),(8,20),
	(9, 24), (9,26), (9,20), (9, 17), (9,18), (9, 19), (9,21) ,(9, 23),(10, 18),(10,19),
    (11,17),(11,20),(11,26), (12, 18),(12, 19), (12,21), (14, 17), (14, 20), (14, 22), (14, 23),(15,17),
    (15,18),(15,19),(15,20),(15,26),(16,18),(16,19),(16,20),(16,21),(16,22),(16,23),(16,24),(16,25),(16,26),
    (17, 17), (17,18),(18,17),(18, 20),(18, 26),(18, 24),(19,17),(19,20),(19,25),(20, 28),(20, 30), (21,27),
    (22, 27), (22,29), (22,30),(23,32), (24, 32), (24,33), (24,35), (25,32),(25, 34),(26, 37),(26,38),
    (27,37),(27,38),(28,37),(28,38),(28,39),(29,37),(29,38),(29,39),(29, 40),
    (30,37),(31, 37),(31, 38),(31, 39),(32,38),(33,39),(33,37),(33,42),(33,41),(34,39),(34,37),(35,37),
    (35,38),(35,39),(35,41),(35,42),(35,43),(35,44),(35,45),(36,43),(36,44),(36,37),(37,47),(37,48),(39,52),
    (39,54),(40,51),(40,52),(40,53),(40,54),(41,51),(41,53),(41,54),(41,55),(42,51),(43,57),(43,58),(43,59),(43,60),(44,57),
    (44,58),(44,61),(45,58),(45,57),(45,61),(45,59),(46,58),(46,57),(47,59),(47,57),(47,58),(48,58),(48,59),(49,57),
    (49,58),(49,59),(50,58),(50,57),(52,65),(53,65),(53,66),(54,66),(54,65),(56,69),
    (56,70),(57,69),(57,71),(58,70),(58,71),(59,69),(59,70),(59,71),(60,73),(61,77),(61,78),(61,80),
    (62,77),(62,81),(62,79),(63,83),(64,83),(64,84),(65,87),(66,89),(67,94),(68,98),(69,100),(70,102),(70,103),(70,108),(71,102),
    (71,103),(71,110),(72,105),(72,106),(72,107),(73,106),(73,105),(73,109),(74, 102),(74,107),(75,103),(76,102),(76,110),(76,106),
    (77,105),(77,110),(78,105),(78,107),(78,109),(79,102),(79,103),(80,110),(80,103),(80,106),(81,102),(80,105),(80,109);
    
-- Insert is_about data
INSERT INTO describes (project_id, field_type) VALUES
	(1, 'Computer Engineering'), (1, 'Mathematics'), (2, 'Biology'), (3, 'Literature'), 
    (4, 'Astronomy'), (5, 'Computer Engineering'), (5, 'Mathematics'), (7,'Computer Engineering'), 
    (7,'Programming'), (8,'Geology'), (8,'Physics'), (9,'Physics'),(9, 'Astrophysics'),
    (10,'Computer Engineering'),(10, 'Digital World'),(11,'Biology'),(12,'Biology'),(12, 'Human Anatomy'),
    (13, 'Computer Engineering'),(14,'Astrology'), (14,'Astrophysics'),(15,'Literature'), 
    (15, 'Digital World'),(16, 'Literature'), (16,'Digital World'),(17,'Chemistry'),(17,'Geology'),
    (17, 'Biochemistry'),(18,'Digital World'), (18, 'Sociology'),(19,'Biology'),(20,'Chemistry'),(20, 'Biology'),
    (20, 'Human Anatomy'),(20, 'Biochemistry'), (21, 'Biology'),(21,'Biochemistry'),(22,'Biology'), (22,'Geology'),
    (23,'Digital World'),(23,'Computer Engineering'),(23, 'Physics'),(24,'Computer Engineering'),(24,'Digital World'),
    (24, 'Programming'),(25,'Computer Engineering'),(25,'Astrophysics'),(25,'Physics'),(25,'Programming'),
    (26,'Chemistry'),(26,'Biochemistry'),(26,'Mathematics'),(27,'Biology'),(27,'Biochemistry'),(27,'Chemistry'),
    (28, 'Chemistry'),(28,'Computer Engineering'),(28,'Physics'),(29,'Computer Engineering'),(29,'Programming'),
    (29,'Physics'),(29,'Astrophysics'),(29,'Mathematics'),(30,'Computer Engineering'),(30,'Programming'),(30,'Chemistry'),
    (30,'Biology'),(30,'Biochemistry'),(31,'Biology'),(31, 'Chemistry'),(31, 'Biochemistry'),(31, 'Physics'),(32,'Physics'),
    (32,'Mathematics'),(32,'Biochemistry'),(32,'Computer Engineering'),(33,'Chemistry'),(33,'Biochemistry'),
    (33,'Computer Engineering'),(33,'Biology'),(34,'Computer Engineering'),(34,'Astrophysics'),(34,'Physics'),(34,'Chemistry'),
    (34,'Human Anatomy'),(35,'Physics'),(35,'Biochemistry'),(35,'Computer Engineering'),(35,'Geology'),(35,'Biology'),
    (36,'Biochemistry'),(36,'Mathematics'),(37,'Sociology'),(38,'Sociology'),(38,'Digital World'),(38,'Computer Engineering'),
    (39,'Computer Engineering'),(39,'Biochemistry'),(39,'Chemistry'),(39,'Human Anatomy'),(39,'Programming'), (39,'Biology'),
    (39,'Mathematics'),(39,'Sociology'),(39,'Bioengineering'),(40,'Sociology'),(40,'Programming'),(40,'Computer Engineering'),
    (40,'Digital World'),(41,'Digital World'),(41,'Computer Engineering'),(41,'Sociology'),(41,'Mathematics'),(42,'Theology'),
    (42,'History'),(42,'Digital World'),(42,'Biology'),(42,'Evolutionary Biology'),(42,'Biochemistry'),(42,'Mathematics'),
    (43,'Biology'),(43,'Biochemistry'),(43,'Human Anatomy'),(43,'Chemistry'),(44,'Biology'),(44,'Biochemistry'),
    (44,'Bioengineering'),(44,'Computer Engineering'),(45,'Sociology'),(45,'Biology'),(45,'Human Anatomy'),(46,'Human Anatomy'),
    (46,'Biochemistry'),(46,'Sociology'),(47,'Computer Engineering'),(47,'Human Anatomy'),(47,'Biology'),(47,'Bioengineering'),
    (47,'Artificial Intelligence'),(48,'Sociology'),(48,'Artificial Intelligence'),(48,'Human Anatomy'),(49,'Bioengineering'),
    (49,'Biology'),(49,'Biochemistry'),(50,'Biochemistry'),(50,'Human Anatomy'),(50,'Biology'),(51,'Digital World'),
    (51,'Computer Engineering'),(51,'Programming'),(51,'Game Design'),(52,'Computer Engineering'),(52,'Human Anatomy'),
    (52,'Artificial Intelligence'),(53,'Programming'),(53,'Human Anatomy'),(53,'Biology'),(53,'Biochemistry'),(54,'Literature'),
    (54,'Sociology'),(55,'Artificial Intelligence'),(55,'Sociology'),(55,'Programming'),(56,'Astrophysics'),(56,'Physics'),
    (56,'Computer Engineering'),(56,'Material Designing'),(56,'Hardware'),(57,'Programming'),(57,'Hardware'),(58,'Material Designing'),
    (58,'Computer Engineering'),(58,'Hardware'),(59,'Computer Engineering'),(59,'Artificial Intelligence'),(59,'Hardware'),
    (59,'Mathematics'),(60,'Mathematics'),(60,'Physics'),(60,'Biology'),(60,'Chemistry'),(60,'Biochemistry'),(60,'Astronomy'),
    (60,'Astrology'),(61,'Evolutionary Biology'),(61,'Biology'),(61,'Biochemistry'),(61,'Sociology'),(62,'Programming'),
    (62,'Databases'),(62,'Computer Engineering'),(62,'Literature'),(63,'Biochemistry'),(63,'Biology'),(64,'Biochemistry'),
    (64,'Programming'),(64,'Bioengineering'),(64,'Human Anatomy'),(65,'History'),(65,'Geology'),(66,'Human Anatomy'),(66,'Biology'),
    (66,'Biochemistry'),(67,'Computer Engineering'),(67,'Bioengineering'),(67,'Human Anatomy'),(67,'Programming'),
    (67,'Artificial Intelligence'),(68,'Artificial Intelligence'),(68,'Physics'),(68,'Computer Engineering'),(68,'Mathematics'),
    (69,'Mathematics'),(69,'Programming'),(69,'Computer Engineering'),(70,'Computer Engineering'),(70,'Programming'),(71,'Computer Engineering'),
    (71,'Programming'),(72,'Astrophysics'),(72,'Astrology'),(72,'Astronomy'),(73,'Astrophysics'),(73,'Astronomy'),(74,'Astrophysics'),
    (74,'Chemistry'),(76,'Physics'),(76,'Computer Engineering'),(76,'Chemical Engineering'),(77,'Topography'),(77,'Physics'),(77,'Mathematics'),
    (77,'Computer Engineering'),(78,'Physics'),(78,'Biochemistry'),(79,'Physics'),(79,'Topography'),(80,'Philosophy'),
    (80,'Sociology'),(81,'Biochemistry'),(81,'Physics'),(81,'Chemistry');
  
-- Insert deliverable data
INSERT INTO deliverable (project_id, title, summary, delivery_date) VALUES
	(1, 'deliver 1.1', 'summary 1.1', '2022-06-01'), (1, 'deliver 1.2', 'summary 1.2', '2022-06-02'), 
    (2, 'deliver 2.1', NULL, '2014-09-14'), (4, 'deliver 4.1', 'summary 4.1', '2003-08-30'),
    (5, 'deliver 5.1', 'summary 5.1', '1978-12-31'), (8,'deliver 8.1','summary 8.1','2002-11-11'),
	(20, 'deliver 20.1','summary 20.1', '2021-03-01'),(20, 'deliver 20.2', 'summary 20.2', '2022-02-01'),
    (20, 'deliver 20.3', 'summary 20.3', '2022-06-03'),(24,'deliver 24.1','summary 24.1','2022-01-30'),
	(26,'deliver 26.1','summary 26.1','2022-6-3'),(34,'deliver 34.1',NULL,'2021-10-10'),(34,'deliver 34.2', NULL, '2021-11-11'),
    (36,'deliver 36.1',NULL,'2021-12-30'),(36,'36.2','Summary 36.2','2022-01-05'),(39,'deliver 39.1',NULL,'2022-1-15'),
    (39,'deliver 39.2','summary 1','2022-2-1'),(39,'39.3',NULL,'2022-3-1'),(42,'deliver 42.1',NULL,'2021-11-10'),
    (42,'deliver 42.2','Summary 1','2021-12-10'),(42,'deliver 42.3',NULL,'2021-12-12'),(42,'deliver 42.4',NULL,'2022-5-10'),
    (42,'deliverable 5',NULL,'2022-6-13'),(43,'deliverable 43.1',NULL,'2022-1-10'),(43,'43.2',NULL,'2022-1-30'),
    (45,'deliverable 45.1','Summary of early findings','2022-1-1'),(49,'deliverable 49',NULL,'2022-6-3'),
    (51,'Ray tracing Techinques', NULL, '2022-8-10'),(53,'Importance of Lipids',NULL,'2021-11-25'),
    (54,'deliverable 54', NULL,'2022-6-3'),(60,'DELIVERABLE 60_1',NULL,'2022-1-25'),(60,'DELIVERABLE 60_2',NULL,'2022-3-25'),
    (60,'DELIVERABLE 3',NULL,'2022-3-25'),(62,'Deliv 62.1',NULL,'2022-1-1'),(62,'62.2',NULL,'2022-2-1'),(62,'3',NULL,'2022-3-1'),
    (67,'Deliver 67.1',NULL,'2022-5-30');