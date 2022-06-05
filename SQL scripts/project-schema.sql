SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS,
    UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
    FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE,
    SQL_MODE = 'TRADITIONAL';

DROP SCHEMA IF EXISTS project;
CREATE SCHEMA project;
USE project;


-- 
-- Table structure for table 'Organization'
--
CREATE TABLE Organization (
    Organization_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Organization_Name VARCHAR(75) NOT NULL,
    Abbreviation VARCHAR(15),
    City VARCHAR(20),
    Street_Name VARCHAR(40),
    Street_Number VARCHAR(5),
    Zip_Code INT,
    Organization_Type ENUM(
        'University',
        'Research Center',
        'Private Corporation'
    ),
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Organization_ID)
);

-- 
-- Table structure for table 'Researcher'
--

CREATE TABLE Researcher (
    Researcher_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    First_Name VARCHAR(45) NOT NULL,
    Last_Name VARCHAR(45) NOT NULL,
    Sex ENUM('Male', 'Female'),
    Date_of_Birth DATE NOT NULL,
    R_Organization_ID INT UNSIGNED NOT NULL,
    Date_of_Entry DATE,
    CONSTRAINT fk_Researcher_Organization_ID FOREIGN KEY (R_Organization_ID) REFERENCES Organization(Organization_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    /* If we delete an organization then we want to delete it's projects */
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Researcher_ID)
);

-- 
-- Table structure for table 'Executive'
--

CREATE TABLE Executive (
    Executive_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    First_Name VARCHAR(45) NOT NULL,
    Last_Name VARCHAR(45) NOT NULL,
    Sex ENUM('Male', 'Female') NOT NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Executive_ID)
);


-- 
-- Table structure for table 'Program'
--
CREATE TABLE Program (
    Program_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Program_name VARCHAR(45) NOT NULL,
    HFRI_Address VARCHAR(45),
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Program_ID)
);

-- 
-- Table structure for table 'Project'
--

CREATE TABLE Project (
    Project_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Title VARCHAR(50) NOT NULL,
    Summary TEXT,
    Starting_Date DATE NOT NULL,
    Ending_Date DATE NOT NULL,
    CONSTRAINT Check_Dates CHECK (Ending_Date > Starting_Date),
    Amount INT,
    CONSTRAINT Check_Amount CHECK (Amount BETWEEN 100000 AND 1000000),
    Grade INT,
    CONSTRAINT Check_Grade CHECK (Grade BETWEEN 1 AND 100),
    Evaluation_Date DATE,
    CONSTRAINT Check_Evaluation_Date CHECK (
        (Evaluation_Date > "1940-01-01")             /* we assume that H.F.R.I was founded in 1940 */ 
        AND (Evaluation_Date < Starting_Date)        /* a project must be evaluated first in order to start */
    ),
    Executive_ID INT UNSIGNED NOT NULL,
    CONSTRAINT fk_Project_Executive_ID FOREIGN KEY (Executive_ID) REFERENCES Executive(Executive_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
    /* A project must have an executive. So we can't delete it's executive. We have to change project's executive first. */
    Organization_ID INT UNSIGNED NOT NULL,
    CONSTRAINT fk_Project_Organization_ID FOREIGN KEY (Organization_ID) REFERENCES Organization(Organization_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    /* A project is handled by an organization. So if we delete an organization then we need to delete it's projects too. */
    Supervisor_ID INT UNSIGNED NOT NULL,
    CONSTRAINT fk_Project_Supervisor_ID FOREIGN KEY (Supervisor_ID) REFERENCES Researcher(Researcher_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
    /* A project must have a supervisor. So we can't delete a supervisor. We have to change project's supervisor first. */
    Evaluator_ID INT UNSIGNED NOT NULL,
    CONSTRAINT fk_Project_Evaluator_ID FOREIGN KEY (Evaluator_ID) REFERENCES Researcher(Researcher_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
    /* A project must have an evaluator. So we can't delete it's evaluator. We have to change project's evaluator first. */
    Program_ID INT UNSIGNED NOT NULL,
    CONSTRAINT fk_Project_Program_ID FOREIGN KEY (Program_ID) REFERENCES Program(Program_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
    /* A project is funded by a program. So we can't delete it's program. We have to change the program that fund the project first. */
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Project_ID)
);

-- 
-- Table structure for table 'Fields'
--

CREATE TABLE Fields (
    Field_type VARCHAR(45) NOT NULL,
    Field_Description TEXT,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Field_type)
);

-- 
-- Table structure for table 'Phones'
--

CREATE TABLE Phones (
    Organization_ID INT UNSIGNED NOT NULL,
    CONSTRAINT fk_Phones_Organization_ID FOREIGN KEY (Organization_ID) REFERENCES Organization (Organization_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    /* If we delete an organization then we don't want too keep its phone numbers. */
    Phone_number BIGINT,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Organization_ID, Phone_number)
);

-- 
-- Table structure for table 'Budget_Funds'
--

CREATE TABLE Budget_Funds (
    Organization_ID INT UNSIGNED NOT NULL,
    CONSTRAINT fk_Budget_Funds_Organization_ID FOREIGN KEY (Organization_ID) REFERENCES Organization (Organization_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    /* If we delete an organization then we don't want to keep its budget funds */
    Budget_type VARCHAR(45),
    Amount INT,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Organization_ID, Budget_type)
);

-- 
-- Table structure for table 'Descibes'
--

CREATE TABLE Describes (
    Project_ID INT UNSIGNED NOT NULL,
    CONSTRAINT fk_Describes_Proejct_ID FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    /* If there is no project then there is no reason for this table to exist. */
    Field_type VARCHAR(45) NOT NULL,
    CONSTRAINT fk_Describes_Field_type FOREIGN KEY (Field_type) REFERENCES Fields(Field_type) ON DELETE CASCADE ON UPDATE CASCADE,
    /* If there is no Field then there is no reason for this table to exist. */
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Project_ID, Field_type)
);

-- 
-- Table structure for table 'Deliverable'
--

CREATE TABLE Deliverable (
    Deliverable_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Title VARCHAR(45),
    Summary TEXT,
    Delivery_Date DATE,
    Project_ID INT UNSIGNED NOT NULL,
    CONSTRAINT fk_Deliverable_Proejct_ID FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    /* If we delete deliverable's project then we want to delete deliverable too. */
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Deliverable_ID,Project_ID)
);

-- 
-- Table structure for table 'Works_On'
--

CREATE TABLE Works_On (
    Researcher_ID INT UNSIGNED NOT NULL,
    CONSTRAINT fk_Works_On_Researcher_ID FOREIGN KEY (Researcher_ID) REFERENCES Researcher(Researcher_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    /* If there is no reasercher then there is no reason for this table to exist. */
    Project_ID INT UNSIGNED NOT NULL,
    CONSTRAINT fk_Works_On_Project_ID FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    /* If there is no project then there is no reason for this table to exist. */
    Active BOOLEAN,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Researcher_ID, Project_ID)
);

ALTER TABLE Researcher
    ADD COLUMN age INT as (floor(DATEDIFF(CURRENT_DATE, Date_of_Birth)) / 365),
    ADD CONSTRAINT check_Researcher_age CHECK (age BETWEEN 18 AND 80);          /* We assume that each researcher can work from 18 yo to 80 yo */

ALTER TABLE Project
    ADD COLUMN duration INT as (floor(DATEDIFF(Ending_Date, Starting_Date)) / 365),
    ADD CONSTRAINT check_Project_duration CHECK (duration BETWEEN 1 AND 4),     /* Duration 1-4 years */
    ADD COLUMN Active BOOLEAN as ((Starting_Date < CURRENT_DATE) AND (Ending_Date > CURRENT_DATE))
;

/*#############################################################################*/
/*#######################   Triggers for Constraints   ########################*/
/*#############################################################################*/

DELIMITER ;;

/* Trigger #1 */
/* Trigger for Starting date */
CREATE TRIGGER Check_Project_Starintg_Date 
BEFORE INSERT ON Project 
FOR EACH ROW BEGIN

    /* Valid starting year 1940 - (current year + 10) */
    IF (
        (New.Starting_Date < "1940-01-01")
        OR 
        (DATEDIFF(New.Starting_Date, CURRENT_DATE) > 36512)  /* 36512 days = 10 years */
    ) THEN SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'Invalid starting date!';
END IF;
END ;;


/* Trigger #2 */
/* Trigger for  delivery date */
CREATE TRIGGER Check_Delivery_Date 
BEFORE INSERT ON Deliverable
FOR EACH ROW BEGIN
        
    /* Delivery_Date must be between starting and ending date */    
    IF NOT(
        NEW.Delivery_Date BETWEEN (
            SELECT Starting_Date
            FROM Project
            WHERE Project.Project_ID = NEW.Project_ID
        )
        AND (
            SELECT Ending_Date
            FROM Project
            WHERE Project.Project_ID = NEW.Project_ID
        )
    ) THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Invalid delivery date!';
END IF;
END ;;


/* Trigger #3 */
/* Trigger for Date of Entry */ 
CREATE TRIGGER Check_Date_of_Entry
BEFORE INSERT ON Researcher
FOR EACH ROW BEGIN

    /* Researcher's Date of entry:
    1. < current date,
    2. year must be > 1940 and
    3. 18 years < (Date of entry - Date of birth) < 80 years    
    */
    IF (
        (New.Date_of_Entry > CURDATE())
        OR 
        (NEW.Date_of_Entry < "1940-01-01")
        OR 
        DATEDIFF(New.Date_of_Entry, New.Date_of_Birth) NOT BETWEEN (365 * 18 + 4) AND (365 * 80 + 20)
    ) THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Invalid date of entry!';
END IF;
END ;;


/* Trigger #4 */
/* Trigger for evaluator */
CREATE TRIGGER check_Evaluator_ID
BEFORE INSERT ON Project
FOR EACH ROW BEGIN 

    /* Evaluator and project must belong in different organization */
    IF (
        New.Organization_ID = (
            SELECT r.R_Organization_ID 
            FROM Researcher r WHERE New.Evaluator_ID = r.Researcher_ID
            )
      )  THEN SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid evaluator ID, Evaluator must belong in different organization!';
END IF;
END ;;


/* Trigger #5 */
/* Trigger for researcher's organization */
CREATE TRIGGER check_Researcher_R_Organization_ID 
BEFORE INSERT ON Works_On 
FOR EACH ROW BEGIN

    /* Researcher's projects and researcher must belong to the same organization */ 
    IF(
        (
            SELECT DISTINCT p.Organization_ID
            FROM Project p
            INNER JOIN Works_On ON p.Project_ID = New.Project_Id 
            INNER JOIN Researcher r ON r.Researcher_ID = New.Researcher_ID
        ) 
        <> 
        (
            SELECT DISTINCT r.R_Organization_ID
            FROM Researcher r
            INNER JOIN Works_On ON New.Researcher_ID = r.Researcher_ID
         ) 
    )THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Invalid Researcher, Researchers work only on projects for the organizations that employed them!';
END IF;
END ;;


/* Trigger #6 */
/* Trigger for evaluation date */
CREATE TRIGGER check_Project_Evaluation_Date 
BEFORE INSERT ON Project
FOR EACH ROW BEGIN

    /* Evaluation date must be <= current date */
    IF(New.Evaluation_Date > CURDATE()) 
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Invalid Evaluation Date, Evaluation date must be <= current date!';
END IF;
END ;; 


/* Trigger #7 */
/* Trigger for Date of Birth and Starting Date */ 
CREATE TRIGGER Check_Date_of_Birth_and_Starting_Date
BEFORE INSERT ON Works_On
FOR EACH ROW BEGIN

    /* 18 years < (Project's Starting Date - Researcher's Date of birth) < 80 years    
    */
    IF (DATEDIFF(
        (
            SELECT DISTINCT p.Starting_Date
            FROM Project p
                WHERE NEW.Project_ID = p.Project_ID
        )
        , (
            SELECT DISTINCT r.Date_of_Birth
            FROM Researcher r 
                WHERE r.Researcher_ID = NEW.Researcher_ID)
         )
    NOT BETWEEN (365 * 18 + 4) AND (365 * 80 + 20))
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Projetcs starintg date - researchers birth date must be between 18-80 years old!';
END IF;
END ;;


/* Trigger #8 */
/* Trigger for evaluation date and evaluator's date of entry */
CREATE TRIGGER check_Evaluation_Date_and_Evaluators_Date_of_Entry
BEFORE INSERT ON Project
FOR EACH ROW BEGIN

    /* Evaluator's Date of Entry <= Evaluation Date */
    IF( 
        (
            SELECT r.Date_of_Entry
            FROM Researcher r
                WHERE New.Evaluator_ID = r.Researcher_ID
        ) > New.Evaluation_Date
    )
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Evaluators Date of Entry must be <= Projects Evaluation Date!';
END IF;
END ;;


/*#############################################################################*/
/*########################    Triggers for Updates    #########################*/
/*#############################################################################*/


/* Trigger #1 */
/* Trigger for Starting date */
CREATE TRIGGER Check_Project_Starintg_Date_updts 
BEFORE UPDATE ON Project 
FOR EACH ROW BEGIN

    /* Valid starting year 1940 - (current year + 10) */
    IF (
        (New.Starting_Date < "1940-01-01")
        OR 
        (DATEDIFF(New.Starting_Date, CURRENT_DATE) > 36512)  /* 36512 days = 10 years */
    ) THEN SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'Invalid starting date!';
END IF;
END ;;


/* Trigger #2 */
/* Trigger for  delivery date */
CREATE TRIGGER Check_Delivery_Date_updts 
BEFORE UPDATE ON Deliverable
FOR EACH ROW BEGIN
        
    /* Delivery_Date must be between starting and ending date */    
    IF NOT(
        NEW.Delivery_Date BETWEEN (
            SELECT Starting_Date
            FROM Project
            WHERE Project.Project_ID = NEW.Project_ID
        )
        AND (
            SELECT Ending_Date
            FROM Project
            WHERE Project.Project_ID = NEW.Project_ID
        )
    ) THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Invalid delivery date!';
END IF;
END ;;


/* Trigger #3 */
/* Trigger for Date of Entry */ 
CREATE TRIGGER Check_Date_of_Entry_updts
BEFORE UPDATE ON Researcher
FOR EACH ROW BEGIN

    /* Researcher's Date of entry:
    1. < current date,
    2. year must be > 1940 and
    3. 18 years < (Date of entry - Date of birth) < 80 years    
    */
    IF (
        (New.Date_of_Entry > CURDATE())
        OR 
        (NEW.Date_of_Entry < "1940-01-01")
        OR 
        DATEDIFF(New.Date_of_Entry, New.Date_of_Birth) NOT BETWEEN (365 * 18 + 4) AND (365 * 80 + 20)
    ) THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Invalid date of entry!';
END IF;
END ;;


/* Trigger #4 */
/* Trigger for evaluator */
CREATE TRIGGER check_Evaluator_ID_updts
BEFORE UPDATE ON Project
FOR EACH ROW BEGIN 

    /* Evaluator and project must belong in different organization */
    IF (
        New.Organization_ID = (
            SELECT r.R_Organization_ID 
            FROM Researcher r WHERE New.Evaluator_ID = r.Researcher_ID
            )
      )  THEN SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid evaluator ID, Evaluator must belong in different organization!';
END IF;
END ;;


/* Trigger #5 */
/* Trigger for researcher's organization */
CREATE TRIGGER check_Researcher_R_Organization_ID_updts 
BEFORE UPDATE ON Works_On 
FOR EACH ROW BEGIN

    /* Researcher's projects and researcher must belong to the same organization */ 
    IF(
        (
            SELECT DISTINCT p.Organization_ID
            FROM Project p
            INNER JOIN Works_On ON p.Project_ID = New.Project_Id 
            INNER JOIN Researcher r ON r.Researcher_ID = New.Researcher_ID
        ) 
        <> 
        (
            SELECT DISTINCT r.R_Organization_ID
            FROM Researcher r
            INNER JOIN Works_On ON New.Researcher_ID = r.Researcher_ID
         ) 
    )THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Invalid Researcher, Researchers work only on projects for the organizations that employed them!';
END IF;
END ;;


/* Trigger #6 */
/* Trigger for evaluation date */
CREATE TRIGGER check_Project_Evaluation_Date_updts 
BEFORE UPDATE ON Project
FOR EACH ROW BEGIN

    /* Evaluation date must be <= current date */
    IF(New.Evaluation_Date > CURDATE()) 
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Invalid Evaluation Date, Evaluation date must be <= current date!';
END IF;
END ;; 


/* Trigger #7 */
/* Trigger for Date of Birth and Starting Date */ 
CREATE TRIGGER Check_Date_of_Birth_and_Starting_Date_updts
BEFORE UPDATE ON Works_On
FOR EACH ROW BEGIN

    /* 18 years < (Project's Starting Date - Researcher's Date of birth) < 80 years    
    */
    IF (DATEDIFF(
        (
            SELECT DISTINCT p.Starting_Date
            FROM Project p
                WHERE NEW.Project_ID = p.Project_ID
        )
        , (
            SELECT DISTINCT r.Date_of_Birth
            FROM Researcher r 
                WHERE r.Researcher_ID = NEW.Researcher_ID)
         )
    NOT BETWEEN (365 * 18 + 4) AND (365 * 80 + 20))
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Projetcs starintg date - researchers birth date must be between 18-80 years old!';
END IF;
END ;;


/* Trigger #8 */
/* Trigger for evaluation date and evaluator's date of entry */
CREATE TRIGGER check_Evaluation_Date_and_Evaluators_Date_of_Entry_updts
BEFORE UPDATE ON Project
FOR EACH ROW BEGIN

    /* Evaluator's Date of Entry <= Evaluation Date */
    IF( 
        (
            SELECT  r.Date_of_Entry
            FROM Researcher r
                WHERE New.Evaluator_ID = r.Researcher_ID
        ) > New.Evaluation_Date
    )
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Evaluators Date of Entry must be <= Projects Evaluation Date!';
END IF;
END ;;


/* Trigger #9 */
/* Trigger for number of phones */

CREATE TRIGGER check_Organization_number_of_phones_updts
BEFORE UPDATE ON Organization
FOR EACH ROW BEGIN

    /* Organization must have at least two phone numbers */
    IF(
        SELECT count(DISTINCT Phone_number) 
        FROM Phones ph 
            INNER JOIN Organization ON ph.Organization_ID = New.Organization_ID
        
    ) < 2
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Organizations must have at least two phone numbers!';
END IF;
END ;;


CREATE TRIGGER set_active_works_on
BEFORE INSERT ON Works_ON
FOR EACH ROW BEGIN
    SET New.Active = ( 
        (
        SELECT DISTINCT p.Ending_Date
        FROM Project p 
        WHERE New.Project_ID = p.Project_ID           
        ) > CURDATE()
    );
END;;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;