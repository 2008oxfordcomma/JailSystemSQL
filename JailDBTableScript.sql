drop database `Jail System`;

create database `Jail System`;
use `Jail System`;

create table `visitor`(
	`visitor_id` int primary key,
    `first_name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    `relationship` varchar(255),
    `phone_number` varchar(255),
    `email` varchar(255),
	`approved` boolean DEFAULT false
);

insert into visitor values(
	79345920, 'Alexa', 'Arreola', 'Wife', '952-712-0993', 'alexa.arreola@gmail.com', true
);

insert into visitor values(
	9327532, 'Brandy', 'Arreola', 'Mother', '763-392-0212', 'brandythecrazy@protonmail.org', true
);

insert into visitor(visitor_id, first_name, last_name, relationship, phone_number, approved) values(
	027598276, 'Mary', 'Blaschka', 'Mother', '612-022-6775', true
);
    
insert into visitor(visitor_id, first_name, last_name) values(
	059170591, 'Tom', 'Schott'
);

insert into visitor values(
	091382751, 'Jerry', 'Freeborn', 'Boyfriend', '507-992-3209', 'jerrytheharry@hotmail.com', true
);

insert into visitor values(
	60987312, 'Bob', 'Marley', 'Friend', '209-845-9967', 'bobmarley@bobmarley.com', true
);

insert into visitor values(
	50682623, 'Steve', 'Hall', 'Brother', '320-312-8228', 'stevehall@yopmail.com', true
);

insert into visitor values(
	016798328, 'Darrell', 'Kock', 'Son', '218-799-0131', 'fortkockd@gmail.com', false
);

insert into visitor values(
	673189203, 'Carly', 'Johnson', 'Sister', '651-771-0752', 'carly.leeper@yahoo.com', true
);

insert into visitor values(
	0985263, 'Trung', 'Nguyen', 'Brother', '320-521-9090', 'trung.nguyen@go.minnstate.edu', true
);

insert into visitor values(
	072368926, 'Crystal', 'Pace', 'Ex-Wife', '512-722-6767', 'crystalthebrystal@gmail.com', true
);

insert into visitor(visitor_id, first_name, last_name, relationship, phone_number) values(
	07268932, 'Liam', 'Schulz', 'Cousin', '952-322-0828'
);

insert into visitor values(
	275309143, 'Saul', 'Goodman', 'Lawyer', '505-560-4852', 'saulgoodman@saulgoodman.com', true
);

insert into visitor values(
	97234509, 'Manning', 'Payton', 'Cousin', '218-954-7667', 'therealpayton@gmail.com', true
);

insert into visitor values(
	05792835, 'Tracey', 'Montgomery', 'Wife', '320-330-5821', 'traceymont@hotmail.com', true
);

create table `staff`(
	`staff_id` int primary key,
	`first_name` varchar(255) not null,
    `last_name` varchar(255) not null,
    `role` enum('Guard', 'Warden', 'Administrator', 'Kitchen', 'Counselor') NOT NULL,
    `shift` enum('Morning', 'Evening', 'Night'),
    `phone_number` varchar(12),
    `email` varchar(255)
);

insert into staff(staff_id, first_name, last_name, role) values
	(504237, 'Ethan', 'Larson', 1),
	(62702768, 'Dre', 'Harm', 4);

INSERT INTO staff VALUES
    (76234896, 'Shimin', 'Li', 2, 1, '952-397-7718', 'shimin.li@go.winona.edu'),
    (5728934, 'Boscar', 'Iyengar', 3, 1, '952-182-4549', 'iygenar@go.winona.edu'),
    (2093746, 'Gerald', 'Cichanowski', 1, 1, '763-972-3355', 'gerald.cichanowski@go.winona.edu'),
    (7852313, 'Mingrui', 'Zhang', 1, 1, '952-97-8450', 'mingrui.zhang@go.winona.edu'),
    (2354071, 'Eric', 'Wright', 1, 2, '651-314-6307', 'eric.wright@go.winona.edu'),
    (23540798, 'Nadia', 'Miranda', 1, 3, '612-581-3449', 'nadia.miranda@go.winona.edu'),
    (2364078, 'Collin', 'Engstrom', 1, 3, '507-782-3990', 'collin.engstrom@go.winona.edu'),
    (798253, 'George', 'Bush', 5, 1, '214-782-9338', 'georgebush@president.gov'),
    (798534, 'Barack', 'Obama', 5, 2, '808-973-4789', 'barackobama@president.gov');


create table `block`(
	`block_id` int primary key,
    `name` varchar(255) NOT NULL UNIQUE,
    `type` enum('Male', 'Female', 'Juvenile', 'Solitary') NOT NULL,
	`capacity` INT NOT NULL CHECK (`capacity` > 0) NOT NULL,
    supervisor_id INT,
    
    FOREIGN KEY (supervisor_id) REFERENCES staff(staff_id)
);

insert into `block` values
    (1, 'A', 1, 30, 504237),
    (2, 'B', 2, 16, 23540798),
    (3, 'C', 3, 16, 2354071),
    (4, 'D', 4, 4, 2093746);


create table `cell`(
	`cell_id` int NOT NULL,
    `block_id` int NOT NULL,
	`capacity` INT NOT NULL CHECK (`capacity` > 0),
    `security_level` enum('Low', 'Medium', 'High', 'Maximum') NOT NULL,
    
    PRIMARY KEY (cell_id, block_id),
    FOREIGN KEY (block_id) references block(block_id)
);

insert into cell values
    -- Block A
    (1, 1, 4, 1),
    (2, 1, 4, 1),
    (3, 1, 4, 1),
    (4, 1, 2, 1),
    (5, 1, 4, 1),
    (6, 1, 4, 1),
    (7, 1, 3, 1),
    (8, 1, 3, 1),
    (9, 1, 2, 1),
    -- Block B
    (1, 2, 4, 1),
    (2, 2, 4, 1),
    (3, 2, 4, 1),
    (4, 2, 4, 1),
    -- Block C
    (1, 3, 4, 2),
    (2, 3, 4, 2),
    (3, 3, 2, 2),
    (4, 3, 4, 2),
    (5, 3, 2, 2),
    -- Block D
    (1, 4, 1, 4),
    (2, 4, 1, 4),
    (3, 4, 1, 4),
    (4, 4, 1, 4);

create table `inmate`(
	`inmate_id` int primary key,
    `cell_id` int not null,
    `block_id` int not null,
	`first_name` varchar(255) not null,
    `last_name` varchar(255) not null,
    `dob` date not null,
    `gender` enum('M', 'F', 'Other') not null,
    `admission_date` date not null,
    `release_date` date,
    `status` enum('In-Custody', 'Released', 'Transferred', 'Deceased') default 'In-Custody',
	`security_level` enum('Low', 'Medium', 'High', 'Maximum') NOT NULL,
    
    FOREIGN KEY (block_id, cell_id) REFERENCES cell(block_id, cell_id)
);

INSERT INTO inmate VALUES
	(58148, 1, 1, 'Anthony', 'Arreola', '1987-04-20', 1, '2025-08-23', '2025-12-01', 1, 1),
    (376003, 1, 1, 'Benjamin', 'Blaschka', '1977-06-25', 1, '2025-11-21', '2026-11-21', 1, 1),
    (5540, 1, 2, 'Trisha', 'Fenske', '1974-09-13', 2, '2025-11-25', '2026-11-25', 1, 1),
    (1207523, 1, 2, 'Jessica', 'Freeborn', '1986-02-08', 2, '2025-11-15', '2026-02-15', 1, 1),
    (1180024, 2, 1, 'Christopher', 'Grant', '2005-10-01', 1, '2025-11-25', '2025-12-25', 1, 1),
    (5068, 1, 4, 'Jason', 'Garfield', '1979-12-31', 1, '2025-11-18', '9999-12-31', 1, 4),
    (55444, 3, 1, 'Michael', 'Hall', '1979-11-18', 1, '2025-05-21', '2026-05-21', 1, 1),
    (81325, 3, 1, 'Jim', 'Kauten', '1960-06-30', 1, '2025-11-13', '2027-11-13', 1, 1),
    (121201, 2, 2, 'Ava', 'Kock', '1960-01-09', 2, '2025-08-13', '2026-08-13', 1, 1),
    (1347693, 5, 1, 'Dylan', 'Leeper', '1993-08-08', 1, '2025-09-28', '2026-09-28', 1, 1),
    (31945, 5, 1, 'Marshawn', 'Levreston', '2000-12-13', 1, '2025-07-29', '2026-07-29', 1, 1),
    (7043, 6, 1, 'Thomas', 'McGann', '1977-04-01', 1, '2025-11-18', '2026-01-18', 1, 1),
    (163537, 2, 1, 'Andrew', 'Montgomery', '1998-03-14', 1, '2025-10-29', '2026-10-29', 1, 1),
    (4977, 2, 1, 'Craig', 'Neyers', '1973-07-22', 1, '2025-09-29', '2026-09-29', 1, 1),
    (118105, 3, 1, 'Matthew', 'Nguyen', '1985-02-16', 1, '2025-08-11', '2026-08-11', 1, 1),
    (123235, 3, 1, 'Adam', 'Pace', '1984-12-02', 1, '2025-10-21', '2026-10-21', 1, 1),
    (415883, 4, 1, 'Jonathan', 'Payton', '1985-09-11', 1, '2025-11-06', '2026-11-06', 1, 1),
    (61372, 1, 2, 'Erin', 'Roberts', '1998-05-25', 2, '2025-10-07', '2026-10-07', 1, 1),
    (361915, 5, 1, 'Chad', 'Schultz', '1975-03-09', 1, '2025-11-24', '2026-11-24', 1, 1),
    (334581, 6, 1, 'Troy', 'Spann', '1967-04-01', 1, '2025-11-19', '2026-11-19', 1, 1),
	(599909, 1, 2, 'Chelsea', 'Welker', '1993-10-17', 2, '2025-11-25', '2026-11-25', 1, 1);

create table `Offense`(
	`offense_id` int primary key,
    `inmate_id` int not null,
    `charge` varchar(255) not null,
    `court_case_number` varchar(255) not null,
    `start_date` date not null,
    `end_date` date not null,
    `parole_eligible` boolean default false,
    `sentence_length` INT GENERATED ALWAYS AS (TIMESTAMPDIFF(day, start_date, end_date)),
    FOREIGN KEY (inmate_id) references inmate(inmate_id)
);
	
insert into Offense(offense_id, inmate_id, charge, court_case_number, start_date, end_date, parole_eligible) values
(901234, 58148, 'Trespass-Return to Property Within One Year', '16088-1', '2025-08-23', '2026-08-23', true),
(901235, 58148, 'Domestic Abuse - Violate Order for Protection', '16088-2', '2025-08-23', '2026-08-23', false),
(901236, 58148, 'Drugs - 5th Degree - Possess Schedule 1,2,3,4', '16088-3', '2025-08-23', '2026-08-23', true),
(901237, 58148, 'Domestic Assault-Felony', '16088-4', '2025-08-23', '2026-08-23', false),
(901238, 58148, 'Obstruct Legal Process-Interfere w/Peace Officer', '16088-5', '2025-08-23', '2026-08-23', true),
(901239, 58148, 'Harassment; Restraining Order - Violate Restriction', '16088-6', '2025-08-23', '2026-08-23', false),
(901240, 58148, 'Disorderly Conduct', '16088-7', '2025-08-23', '2026-08-23', true),
(901241, 58148, 'Assault-2nd Degree-Dangerous Weapon', '16088-8', '2025-08-23', '2026-08-23', false),
(901242, 376003, 'Drugs - 5th Degree - Possess Schedule 1,2,3,4', '16345-1', '2025-11-21', '2026-11-21', true),
(901244, 1207523, 'Traffic - DWI - Operate Motor Vehicle Under Influence', '16317-1', '2025-11-15', '2026-02-15', true),
(901245, 1180024, 'Trespass-Occupy/Enter Dwelling/Locked/Posted', '16356-1', '2025-11-25', '2025-12-25', false),
(901246, 55444, 'Possess Pornographic Work-Computer Disk/Electronic', '15786-1', '2025-05-21', '2026-05-21', true),
(901247, 81325, 'Criminal Sexual Conduct-1st Degree-Penetration', '16318-1', '2025-11-13', '2026-11-13', false),
(901248, 121201, 'Assault-2nd Degree-Dangerous Weapon', '16061-1', '2025-08-13', '2026-08-13', true),
(901249, 121201, 'Murder - 2nd Degree - With Intent-Not Premeditated', '16061-2', '2025-08-13', '2026-08-13', false),
(901250, 1347693, 'Aggravated Robbery-1st Degree', '16196-1', '2025-09-28', '2026-09-28', true),
(901251, 31945, 'Trespass-Return to Property Within One Year', '16006-1', '2025-07-29', '2026-07-29', false),
(901252, 31945, 'Damage to Property-4th Deg-Intentional Damage', '16006-2', '2025-07-29', '2026-07-29', true),
(901254, 7043, 'Drugs - 5th Degree - Possess Schedule 1,2,3,4', '16337-1', '2025-11-18', '2026-01-18', true),
(901255, 163537, 'Domestic Assault-Misdemeanor-Commits Act to Cause Fear', '16276-1', '2025-10-29', '2026-10-29', false),
(901256, 163537, 'Threats of Violence - Display/exhibit/brandish', '16276-2', '2025-10-29', '2026-10-29', true),
(901257, 163537, 'Assault-2nd Degree-Dangerous Weapon', '16276-3', '2025-10-29', '2026-10-29', false),
(901258, 163537, 'False Imprisonment-Intentional Restraint', '16276-4', '2025-10-29', '2026-10-29', true),
(901259, 4977, 'Drugs - 1st Degree - Possess 50 grams or more', '16199-1', '2025-09-29', '2026-09-29', false),
(901260, 4977, 'Drugs - 1st Degree - Sale - 17 Grams or More', '16199-2', '2025-09-29', '2026-09-29', true),
(901261, 118105, 'Assault - 4th Degree - Peace Officer - Throws Object', '16050-1', '2025-08-11', '2026-08-11', false),
(901262, 123235, 'Domestic Abuse - Violate Order for Protection', '16258-1', '2025-10-21', '2026-10-21', true),
(901263, 415883, 'Possess Ammo/Any Firearm - Conviction or Adjudication', '16300-1', '2025-11-06', '2026-11-06', false),
(901264, 61372, 'Traffic - DWI - Operate Motor Vehicle - Alcohol', '16224-1', '2025-10-07', '2026-10-07', true),
(901265, 361915, 'Drugs - 5th Degree - Possess Schedule 1,2,3,4', '16353-1', '2025-11-24', '2026-11-24', false),
(901266, 334581, 'Predatory Offender - Knowingly commits act or omission', '16340-1', '2025-11-19', '2026-11-19', true),
(901267, 599909, 'Theft-Take/Use/Transfer Movable Prop-No Consent', '16354-1', '2025-11-25', '2026-11-25', false),
(901268, 599909, 'Drugs - 5th Degree - Possess Schedule 1,2,3,4', '16354-2', '2025-11-25', '2026-11-25', true);

create table `visit`(
	`visit_id` int primary key,
    `inmate_id` int NOT NULL,
    `visitor_id` int NOT NULL,
    `staff_id` int NOT NULL,
    `visit_date` datetime NOT NULL,
	`duration_minutes` float,
    foreign key (inmate_id) references inmate(inmate_id),
    foreign key (visitor_id) references visitor(visitor_id),
    foreign key (staff_id) references staff(staff_id)
);

insert into visit(visit_id, inmate_id, visitor_id, staff_id, visit_date, duration_minutes) values
(1, 58148, 79345920, 504237, '2025-09-01 10:00:00', 45),
(2, 58148, 9327532, 2093746, '2025-09-05 14:30:00', 60),
(3, 376003, 027598276, 7852313, '2025-11-22 09:15:00', 30),
(4, 5540, 059170591, 2354071, '2025-11-26 11:00:00', 50),
(5, 1207523, 091382751, 2364078, '2025-11-16 13:45:00', 40),
(6, 1180024, 60987312, 2354071, '2025-11-26 15:00:00', 60),
(7, 5068, 50682623, 504237, '2025-11-20 16:30:00', 35),
(8, 55444, 016798328, 2093746, '2025-06-01 10:00:00', 25),
(9, 81325, 673189203, 7852313, '2025-11-14 14:00:00', 55),
(10, 121201, 0985263, 2364078, '2025-08-14 09:45:00', 40),
(11, 1347693, 072368926, 2354071, '2025-09-30 11:15:00', 50),
(12, 31945, 07268932, 504237, '2025-07-30 13:30:00', 45),
(13, 361915, 275309143, 2093746, '2025-11-25 10:00:00', 60),
(14, 599909, 275309143, 7852313, '2025-11-26 14:00:00', 60),
(15, 61372, 97234509, 2364078, '2025-10-08 09:30:00', 50),
(16, 415883, 05792835, 2354071, '2025-11-07 15:00:00', 40);


--  Derived value

create view inmate_age as
	select *, floor(datediff(curdate(), dob)/365) as age from inmate;
  
CREATE VIEW cell_occupancy AS
	SELECT c.*,
    (SELECT COUNT(*) FROM inmate i WHERE i.block_id = c.block_id AND i.cell_id  = c.cell_id) AS occupancy
FROM cell c;

-- Checks to see filled or overfilled cells exist
 select cell_id, block_id, capacity, occupancy from cell_occupancy where occupancy >= capacity;

-- Checks to see if inmate is in custody longer than should be
 -- select inmate_id, first_name, last_name, release_date, status from inmate where (datediff(curdate(), release_date)) >= 0 and status = 1;

-- select @@version;
