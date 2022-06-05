DELIMITER &&

/* Procedure to display a field's projects */
CREATE PROCEDURE Fields_Projects (IN f_type VARCHAR(45))
BEGIN
SELECT p.Project_ID, p.Title
FROM Project p
INNER JOIN Describes d ON p.Project_ID = d.Project_ID
INNER JOIN Fields f ON d.Field_type = f.Field_type
WHERE f.Field_type = f_type;
END&&   


/* Procedure to display the projects a researcher works on */
CREATE PROCEDURE Projects_per_Researcher (IN r_ID INT UNSIGNED)
BEGIN
SELECT p.Project_ID, p.Title
FROM Researcher r  
INNER JOIN Works_On w ON r.Researcher_ID = w.Researcher_ID
INNER JOIN Project p  ON w.Project_ID = p.Project_ID
WHERE r.Researcher_ID = r_ID;
END &&

/* Procedure to display the researchers that work on a project */
CREATE PROCEDURE Researchers_per_Project (IN p_ID INT UNSIGNED)
BEGIN
SELECT r.Researcher_ID, r.First_Name, r.Last_Name
FROM Researcher r  
INNER JOIN Works_On w ON r.Researcher_ID = w.Researcher_ID
INNER JOIN Project p  ON w.Project_ID = p.Project_ID
WHERE p.Project_ID = p_ID;
END &&


/* Procedure to display the researchers that belong on an organization */
CREATE PROCEDURE Researchers_per_Organization (IN o_ID INT UNSIGNED)
BEGIN
SELECT r.Researcher_ID, r.First_Name, r.Last_Name
FROM Researcher r  
INNER JOIN Organization o ON r.Organization_ID = o.Organization_ID
WHERE o.Organization = o_ID;
END &&


/* Procedure to display organization's phones */
CREATE PROCEDURE Organization_phones (IN o_ID INT UNSIGNED)
BEGIN
SELECT ph.Phone_Number 
FROM Phone ph 
INNER JOIN Organization o ON ph.Organization_ID = o.Organization_ID
WHERE o.Organization_ID = o_ID;
END&&


/* Procedure to display Project's Deliverables */
CREATE PROCEDURE Project_Deliverables (IN p_ID INT UNSIGNED)
BEGIN
SELECT d.Deliverable_ID, d.Title, d.Delivery_Date, d.Summary
FROM Deliverable d
INNER JOIN Project p ON d.Project_ID = p.Project_ID
WHERE p.Project_ID = p_ID;
END&&


/* Procedure to display the projects that a program funds */
CREATE PROCEDURE Program_Projects (IN pr_ID INT UNSIGNED)
BEGIN
SELECT p.Project_ID, p.Title
FROM Project p
INNER JOIN Program pr ON p.Program_ID = pr.Program_ID
WHERE pr.Program_ID = pr_ID;
END&&

/* Procedure to display Executive's projects */
CREATE PROCEDURE Executive_Project (IN ex_ID INT UNSIGNED)
BEGIN
SELECT p.Project_ID, p.Title
FROM Project p
INNER JOIN Executive ex ON p.Executive_ID = ex.Executive_ID
WHERE ex.Executive_ID = ex_ID;
END &&

/*Procedure to display Organization's Projects */
CREATE PROCEDURE Organization_Projects (IN org_ID INT UNSIGNED)
BEGIN
SELECT p.Project_ID, p.Title
FROM Project p
INNER JOIN Organization o ON o.Organization_ID = p.Organization_ID
WHERE o.Organization_ID = org_ID;
END &&

/* Query 3.3 */
CREATE PROCEDURE Query_4 (IN field VARCHAR(45)) 
BEGIN
SELECT p.Project_ID, p.Title, r.Researcher_ID, r.First_Name, r.Last_Name, f.Field_type
FROM fields f
INNER JOIN Describes d ON f.Field_type = d.Field_type
INNER JOIN Project p ON d.Project_ID = p.Project_ID
INNER JOIN Works_On w ON p.Project_ID = w.Project_ID
INNER JOIN Researcher r ON w.Researcher_ID = r.Researcher_ID
WHERE f.Field_type = field AND w.Active = 1 AND p.Active = 1;
END &&


/* ASSISTANT VIEW FOR QUERY 4 */
CREATE VIEW Query_4_assist  AS
SELECT count(*) AS number_of_projects, p.Organization_ID, o.Organization_Name, YEAR(p.Starting_Date) AS year
FROM Project p
INNER JOIN Organization o ON o.Organization_ID = p.Organization_ID
GROUP BY YEAR(p.Starting_Date), p.Organization_ID
ORDER BY p.Organization_ID; 

/* Qeury 4 */
CREATE VIEW Query_4 AS
SELECT ass1.number_of_projects, ass1.Organization_ID,ass1.Organization_Name, ass1.year AS year1, ass2.year AS year2
FROM Query_4_assist ass1
INNER JOIN Query_4_assist ass2 ON ass1.Organization_ID = ass2.Organization_ID AND ass1.year = ass2.year+1
INNER JOIN Organization o ON o.Organization_ID = ass1.Organization_ID
WHERE ass1.number_of_projects = ass2.number_of_projects AND ass1.number_of_projects >= 10;


/* Query 3.5 */
CREATE VIEW Query_5 AS
SELECT count(*) AS appearences, d1.Field_type AS field_1, d2.Field_type AS field_2
FROM Describes d1
INNER JOIN Describes d2 ON (d1.Project_ID = d2.Project_ID) AND (d1.Field_type <> d2.Field_type)  
WHERE d1.Field_type > d2.Field_type
GROUP BY d1.Field_Type, d2.Field_Type
ORDER BY appearences DESC LIMIT 3;

/* Query 3.6 */
CREATE VIEW Query_6 AS
SELECT r.Researcher_ID, r.First_Name, r.Last_Name, count(*) as number_of_projects 
FROM Researcher r
INNER JOIN Works_On w ON r.Researcher_ID = w.Researcher_ID
INNER JOIN  Project p ON p.Project_ID = w.Project_ID 
WHERE r.age < 40 AND p.Active = 1  
GROUP BY r.Researcher_ID
ORDER BY number_of_projects DESC LIMIT 10;


/* Query 3.7 */
CREATE VIEW Query_7 AS
SELECT ex.Executive_ID, ex.First_Name, ex.Last_Name, p.Amount, o.Organization_Name 
FROM Executive ex 
INNER JOIN Project p ON ex.Executive_ID = p.Executive_ID 
INNER JOIN Organization o ON p.Organization_ID = o.Organization_ID
WHERE o.Organization_Type = 'Private Corporation'
ORDER BY p.Amount DESC LIMIT 5;


/* Query 3.8 */
CREATE VIEW Query_8 AS 
SELECT r.First_Name, r.Last_Name, count(*) as number_of_projects 
FROM Researcher r 
INNER JOIN Works_On w ON r.Researcher_ID = w.Researcher_ID
INNER JOIN  Project p ON p.Project_ID = w.Project_ID 
WHERE p.Project_ID NOT IN (SELECT p2.Project_ID
                            FROM Project p2
                            INNER JOIN Deliverable d ON p2.Project_ID = d.Project_ID)
GROUP BY r.Researcher_ID
HAVING number_of_projects >= 5
ORDER BY number_of_projects DESC;