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
	('finance', 'finances'), ('HR', 'HR'), ('marketing', 'market'), ('sales', 'selling'),
    ('customer support', 'CS'), ('consulting', 'cons'), ('technical dept', 'td'), ('development', 'dev'); 
    
-- Insert organization data
INSERT INTO organization (abbreviation, Organization_Name, street_name, street_number, zip_code, city, Organization_Type) VALUES
	('aapl', 'Apple', 'Kalisthenous', 32, 11732, 'Athens', 'Private Corporation'),
    ('ntua', 'National Technical University of Athens', 'Katexaki', 53, 13255, 'Athens', 'University'),
    ('eaa', 'Ethniko Asteroskopio Athinon', 'Apostolou Pavlou', 19, 11851, 'Athens', 'Research Center'),
    ('auth', 'Aristoteleio University of Thessaloniki', 'Agion Panton', 77, 25885, 'Thessaloniki', 'University');

-- Insert phone_number data
INSERT INTO phones (phone_number , organization_id) VALUES
	(2103421547, 1), (2108929677, 3), (2108697244, 2), (2119967888, 4), (2310996736, 2);

-- Insert budget_funds data
INSERT INTO budget_funds (budget_type, organization_id) VALUES
	('equity', 1), ('ministry of education', 2), ('ministry of education', 3), ('private action', 3), ('ministry of education', 4); 

-- Insert field data
INSERT INTO fields (field_type) VALUES
	('Mathematics'), ('Computer Engineering'), ('Biology'), ('Literature'), ('Chemistry'), ('Astronomy');
    
-- Insert researcher data
INSERT INTO researcher (first_name, last_name, sex, date_of_birth, date_of_entry, R_Organization_ID) VALUES
	('Xristos', 'Papavasileiou', 'male', '1970-05-06', '1998-09-25', 2),
    ('Pinelopi', 'Karagianni', 'female', '1991-04-12', '2014-10-22', 1),
    ('Andreas', 'Fafalios', 'male', '1950-06-26', '1970-09-04', 3),
    ('Giannis', 'Eleutheriou', 'male', '1956-08-30', '1976-07-23', 4),
    ('Vasiliki', 'Eustathiou', 'female', '1944-08-04', '1962-08-30', 1),
    ('Dafni', 'Kalogeratou', 'female', '1948-11-19', '1966-12-27', 3),
    ('Kostas', 'Romanos', 'male', '1960-09-07', '1980-09-07', 2);
    
-- Insert executive data
INSERT INTO executive (first_name, last_name) VALUES
	('Giorgos', 'Papaioannou'), ('Maria', 'Karavaki'), ('Lefteris', 'Astoris'), ('Vaggelis', 'Feriskos'), ('Vladimiros', 'Sakellariou');

-- Insert project data
INSERT INTO project (title, summary, amount, starting_date, ending_date, program_id, executive_id, organization_id, supervisor_id, evaluator_id, grade, evaluation_date) VALUES
	('Deeper Analysis to DDR5 Memories', 'Summary 1', 102536, '2022-05-21', '2023-04-22', 8, 2, 2, 1, 2, '4', '2021-05-19'),
	('Data Analysis of Glucose Calculations', 'Summary 2', 150968, '2013-09-14', '2016-09-14', 3, 1, 2, 7, 5, '5', '2012-12-22'),
	('Dostoevsky: A new scope', NULL, 250200, '1988-11-21', '1992-02-17', 1, 3, 4, 4, 7, '2', '1987-05-05'),
	('Ice rivers on Mars', 'Summary 4', 923000, '2000-08-30', '2004-08-30', 3, 5, 1, 5, 1, '5', '1999-10-02'),
	('Foundations of Signal Processing', 'Summary 5', 805000, '1977-09-11', '1979-09-11', 7, 2, 3, 6, 4, '3', '1976-09-10');
    
-- Insert works_on data
INSERT INTO works_on (project_id, researcher_id) VALUES
	(1, 1), (2, 1), (5, 3), (3, 4), (4, 5), (5, 6), (1, 7);
    
-- Insert is_about data
INSERT INTO describes (project_id, field_type) VALUES
	(1, 'Computer Engineering'), (1, 'Mathematics'), (2, 'Biology'), (3, 'Literature'), 
    (4, 'Astronomy'), (5, 'Computer Engineering'), (5, 'Mathematics');
  
-- Insert deliverable data
INSERT INTO deliverable (project_id, title, summary, delivery_date) VALUES
	(1, 'deliver 1.1', 'summary 1.1', '2022-07-26'), (1, 'deliver 1.2', 'summary 1.2', '2023-01-21'), 
    (2, 'deliver 2.1', NULL, '2014-09-14'), (4, 'deliver 4.1', 'summary 4.1', '2003-08-30'),
    (5, 'deliver 5.1', 'summary 5.1', '1978-12-31');