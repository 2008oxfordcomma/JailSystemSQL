drop database `Jail System`;

create database `Jail System`;
use `Jail System`;

-- complete 
create table `visitor`(
	`visitor_id` int primary key,
    `first_name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    `relationship` varchar(255),
    `phone_number` varchar(255),
    `email` varchar(255),
	`approved` boolean DEFAULT false
);

-- AGE needs to be derived as view
create table `inmate`(
	`inmate_id` int primary key,
    `cell_id` int,
	`first_name` varchar(255) not null,
    `last_name` varchar(255) not null,
    `dob` date not null,
    `gender` enum('M', 'F', 'Other') not null,
    `admission_date` date not null,
    `release_date` date,
    `status` enum('In-Custody', 'Released', 'Transferred', 'Deceased') default 'In-Custody',
	`security_level` enum('Low', 'Medium', 'High', 'Maximum') NOT NULL
	-- `age` INT GENERATED ALWAYS AS (TIMESTAMPDIFF(year, dob, curdate())
);

 -- insert into `inmate`(inmate_id, cell_id, first_name, last_name, dob, gender, admission_date, release_date, status, security_level) values(123, 12, 'bob', 'cat', '2000-01-01', 'M', '2023-03-24', '2025-01-01', 'In-Custody', 'Low');
 
-- complete
create table `staff`(
	`staff_id` int primary key,
	`first_name` varchar(255) not null,
    `last_name` varchar(255) not null,
    `role` enum('Guard', 'Warden', 'Administrator', 'Kitchen', 'Counselor') NOT NULL,
    `shift` enum('Morning', 'Evening', 'Night'),
    `phone_number` varchar(12),
    `email` varchar(255)
);

-- SENTENCE_LENGTH NEEDS TO BE FIXED
create table `Offense`(
	`offense_id` int primary key,
    `inmate_id` int not null,
    `charge` varchar(255) not null,
    `court_case_number` date not null,
    `start_date` date not null,
    `end_date` date not null,
    `parole_eligible` boolean default false,
    `sentence_length` INT GENERATED ALWAYS AS (TIMESTAMPDIFF(day, end_date, start_date)),
    foreign key (inmate_id) references inmate(`inmate_id`)
);

-- complete 
create table `Visit`(
	`visit_id` int primary key,
    `inmate_id` int NOT NULL,
    `visitor_id` int NOT NULL,
    `staff_id` int NOT NULL,
    `visit_date` datetime NOT NULL,
	`duration_minutes` float,
    foreign key (inmate_id) references inmate(`inmate_id`),
    foreign key (visitor_id) references visitor(`visitor_id`),
    foreign key (staff_id) references staff(`staff_id`)
);


create table `block`(
	`block_id` int primary key,
    `name` varchar(255) NOT NULL UNIQUE,
    `type` enum('Male', 'Female', 'Juvenile', 'Solitary') NOT NULL,
	`capacity` INT CHECK (`capacity` > 0) NOT NULL
);

-- OCCUPANCY needs to be derived as view
create table `cell`(
	`cell_id` int,
    `block_id` int,
	`capacity` INT CHECK (`capacity` > 0) NOT NULL,
    `security_level` enum('Low', 'Medium', 'High', 'Maximum') NOT NULL,

    PRIMARY KEY (cell_id, block_id)
);

select @@version;
