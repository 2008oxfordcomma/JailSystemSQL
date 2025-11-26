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

create table `staff`(
	`staff_id` int primary key,
	`first_name` varchar(255) not null,
    `last_name` varchar(255) not null,
    `role` enum('Guard', 'Warden', 'Administrator', 'Kitchen', 'Counselor') NOT NULL,
    `shift` enum('Morning', 'Evening', 'Night'),
    `phone_number` varchar(12),
    `email` varchar(255)
);

create table `block`(
	`block_id` int primary key,
    `name` varchar(255) NOT NULL UNIQUE,
    `type` enum('Male', 'Female', 'Juvenile', 'Solitary') NOT NULL,
	`capacity` INT NOT NULL CHECK (`capacity` > 0) NOT NULL,
    supervisor_id INT,
    
    FOREIGN KEY (supervisor_id) REFERENCES staff(staff_id)
);

create table `cell`(
	`cell_id` int NOT NULL,
    `block_id` int NOT NULL,
	`capacity` INT NOT NULL CHECK (`capacity` > 0),
    `security_level` enum('Low', 'Medium', 'High', 'Maximum') NOT NULL,
    
    PRIMARY KEY (cell_id, block_id),
    FOREIGN KEY (block_id) references block(block_id)
);

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
	`security_level` enum('Low', 'Medium', 'High', 'Maximum') NOT NULL,
    
    FOREIGN KEY (cell_id) REFERENCES cell(cell_id)
);

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

select @@version;
