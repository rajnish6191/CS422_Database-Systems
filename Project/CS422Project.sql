create database CS422Project;

grant all privileges on CS422Project.* to 'CS422Project'@'localhost'
	identified by 'abcd' with grant option;

flush privileges;


use CS422Project;

CREATE TABLE IF NOT EXISTS `lib_branches` (
  `branch_id` int(20) NOT NULL DEFAULT '0',
  `branch_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `borrowers` (
  `card_id` int(15) NOT NULL,
  `name` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `bor_type` varchar(50) NOT NULL,
  `department` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `book_type` varchar(100) NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `catalog_no` varchar(50) NOT NULL,
  `publishpress` varchar(100) NOT NULL,
  `total_words` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `descri` varchar(230) NOT NULL,
  `publish_date` date NOT NULL,
  `Regis_date` date NOT NULL,
  `Is_new` tinyint(1) NOT NULL,
  `branch_id` int(20) NOT NULL,
  PRIMARY KEY (`book_id`),
FOREIGN KEY (branch_id) REFERENCES lib_branches(branch_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `book_limitation` (
  `borrower_type` varchar(50) NOT NULL,
  `book_type` varchar(50) NOT NULL,
  `no_of_books` varchar(50) NOT NULL,
  `loan_period` varchar(50) NOT NULL,
  `extention_time` varchar(50) NOT NULL,
  `extention_days` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `users` (
  `username` int(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  PRIMARY KEY (`username`),
FOREIGN KEY (username) REFERENCES borrowers(card_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `book_loans` (
  `card_id` int(20) NOT NULL,
  `book_id` int(20) NOT NULL,
  `branch_id` int(20) NOT NULL,
  `due_date` date NOT NULL,
  `checkout_date` date NOT NULL,
  `loan_type` varchar(50) NOT NULL,
  `fine_amount` double NOT NULL,
  `renew_status` tinyint(1) NOT NULL,
  PRIMARY KEY (card_id,book_id,branch_id),
FOREIGN KEY (card_id) REFERENCES borrowers(card_id),
FOREIGN KEY (book_id) REFERENCES books(book_id),
FOREIGN KEY (branch_id) REFERENCES lib_branches(branch_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






INSERT INTO `CS422Project`.`lib_branches` (`branch_id`, `branch_name`) VALUES ('1', 'Branch A'), ('2', 'Branch B'), ('3', 'Branch C');
INSERT INTO `CS422Project`.`borrowers` (`card_id`, `name`, `gender`, `bor_type`, `department`, `email`, `birthdate`) VALUES  
('304470392', 'Rajnish', 'male', 'Graduate Student','Computer Science', 'Rajnish929@gmail.com', STR_TO_DATE( '2/21/1991', '%m/%d/%Y' )),
('304384878', 'Ishan', 'male', 'Graduate Student', 'Mechanical', 'ishan929p@gmail.com', STR_TO_DATE( '11/24/1991', '%m/%d/%Y' )),
('101202505', 'Kunal', 'male', 'Graduate Student', 'Computer Science', 'kunal138pat@gmail.com', STR_TO_DATE( '8/13/1992', '%m/%d/%Y' )),
('201548654', 'Parth', 'male', 'Graduate Student', 'Electric Engineering', 'dontworry929@gmail.com', STR_TO_DATE( '3/23/1992', '%m/%d/%Y' )),
('302569584', 'Jaynav', 'male', 'Graduate Student', 'Electric Engineering', 'jaynav185@gmail.com', STR_TO_DATE( '9/15/1993', '%m/%d/%Y' )),
('205968745', 'Prem', 'male', 'Vocational Student', 'Mechanical', 'prem4515@yahoo.com', STR_TO_DATE( '10/12/1993', '%m/%d/%Y' )),
('302659632', 'Vishakha', 'female', 'Undergraduate Student', 'Commerce', 'vish4u@gmail.com', STR_TO_DATE( '1/16/1992', '%m/%d/%Y' )),
('306985123', 'Mihika Mody', 'female', 'Undergraduate Student', 'Arts', 'mihika143@gmail.com', STR_TO_DATE( '2/26/1989', '%m/%d/%Y' )),
('201523624', 'Kinjal', 'female', 'Vocational Student', 'Civil', 'kinjal@gmail.com', STR_TO_DATE( '9/14/1992', '%m/%d/%Y' )),
('401985698', 'Jia', 'female', 'Graduate Student', 'Computer Science', 'jia@gmail.com', STR_TO_DATE( '2/10/1986', '%m/%d/%Y' )),
('302548596', 'Shivangi', 'female', 'Faculty', 'Civil', 'shivangi@gmail.com', STR_TO_DATE( '9/21/1985', '%m/%d/%Y' )),
('306958742', 'Riya', 'female', 'Vocational Student', 'Computer Science', 'riya@gmail.com', STR_TO_DATE( '8/13/1990', '%m/%d/%Y' )),
('301236548', 'Pooja', 'female', 'Faculty', 'Computer Science', 'pooja@gmail.com', STR_TO_DATE( '4/21/1981', '%m/%d/%Y' )),
('201326598', 'Manshree', 'female', 'Graduate Student', 'Computer Science', 'manshree@gmail.com', STR_TO_DATE( '12/21/1986', '%m/%d/%Y' )),
('302659847', 'Ajay Devgan', 'male', 'Graduate Student', 'Civil', 'singhamandrohit@gmail.com', STR_TO_DATE( '1/1/1979', '%m/%d/%Y' )),
('365987459', 'Himil', 'male', 'Staff', 'Computer Science', 'Himil@gmail.com', STR_TO_DATE( '2/21/1961', '%m/%d/%Y' )),
('306595412', 'Sunny', 'male', 'Graduate Student', 'Computer Science', 'sunny@gmail.com', STR_TO_DATE( '3/31/1961', '%m/%d/%Y' )),
('306985214', 'Manish', 'male', 'Vocational Student', 'Civil', 'mani@gmail.com', STR_TO_DATE( '12/21/1981', '%m/%d/%Y' )),
('396363636', 'Vatsal', 'male', 'Staff', 'Computer Science', 'vats@gmail.com', STR_TO_DATE( '9/15/1971', '%m/%d/%Y' ));



INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, `Regis_date`, `Is_new`, `branch_id`) VALUES ('50', 'Applied Microsoft SQL Server 2008 Reporting Services (2008)', 'Teo Lachev', 'English', '0399501005', 'csula-01-01-S050', 'Meboo', '1.5 million', '110', 'Optimization is the science of making a best choice in the face of conflicting requirements.', '2015-03-01', '2015-03-04', '1', '1');

INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, `Regis_date`, `Is_new`, `branch_id`) VALUES ('51', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', 'Christian ', 'foreign', '0399501003', 'csula-01-01-N020', 'Technical', '0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '2'), ('52', 'Convex Optimization', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of optimization, studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '2');

INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('53', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', 'Christian ', 'foreign', '0399501003', 

'csula-01-01-N003', 'Technical', '0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '1'), 

('54', 'Convex Optimization', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of 

optimization, studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '2');



INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('55', 'Applied Microsoft SQL Server 2008 Reporting Services (2008)', 'Teo Lachev', 'English', '0399501005', 'csula-01-01

-S002', 'Meboo', '1.5 million', '110', 'Optimization is the science of making a best choice in the face of conflicting requirements.', '2015-03-01', '2015-03-04', 

'1', '3');


INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('56', 'Securing SQL Server 2nd Edition (2012)', 'Christian ', 'foreign', '0399501005', 

'csula-01-01-N005', 'Technical', '0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '2'), 

('57', 'Securing SQL Server 2nd Edition (2012)', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of 

optimization, studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '3');




INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('58', 'Securing SQL Server 2nd Edition (2012)', 'Christian ', 'foreign', '0399501005', 

'csula-01-01-N005', 'Technical', 

'0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '1'), 

('59', 'Securing SQL Server 2nd 

Edition (2012)', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of 

optimization, 

studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '3');



INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, `Regis_date`, `Is_new`, `branch_id`) VALUES ('105', 'Applied Microsoft SQL Server 2008 Reporting Services (2008)', 'Teo Lachev', 'English', '0399501005', 'csula-01-01-S002', 'Meboo', '1.5 million', '110', 'Optimization is the science of making a best choice in the face of conflicting requirements.', '2015-03-01', '2015-03-04', '1', '2');

INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, `Regis_date`, `Is_new`, `branch_id`) VALUES ('103', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', 'Christian ', 'foreign', '0399501003', 'csula-01-01-N003', 'Technical', '0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '3'), ('104', 'Convex Optimization', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of optimization, studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '1');

INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('106', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', 'Christian ', 'foreign', '0399501003', 

'csula-01-01-N003', 'Technical', '0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '3'), 

('107', 'Convex Optimization', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of 

optimization, studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '1');



INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('108', 'Applied Microsoft SQL Server 2008 Reporting Services (2008)', 'Teo Lachev', 'English', '0399501005', 'csula-01-01

-S002', 'Meboo', '1.5 million', '110', 'Optimization is the science of making a best choice in the face of conflicting requirements.', '2015-03-01', '2015-03-04', 

'1', '2');


INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('109', 'Securing SQL Server 2nd Edition (2012)', 'Christian ', 'foreign', '0399501005', 

'csula-01-01-N005', 'Technical', '0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '3'), 

('110', 'Securing SQL Server 2nd Edition (2012)', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of 

optimization, studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '1');




INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('111', 'Securing SQL Server 2nd Edition (2012)', 'Christian ', 'foreign', '0399501005', 

'csula-01-01-N005', 'Technical', 

'0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '1'), 

('112', 'Securing SQL Server 2nd 

Edition (2012)', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of 

optimization, 

studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '2');





INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, `Regis_date`, `Is_new`, `branch_id`) VALUES ('113', 'Applied Microsoft SQL Server 2008 Reporting Services (2008)', 'Teo Lachev', 'English', '0399501005', 'csula-01-01-S002', 'Meboo', '1.5 million', '110', 'Optimization is the science of making a best choice in the face of conflicting requirements.', '2015-03-01', '2015-03-04', '1', '2');

INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, `Regis_date`, `Is_new`, `branch_id`) VALUES ('114', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', 'Christian ', 'foreign', '0399501003', 'csula-01-01-N003', 'Technical', '0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '3'), ('115', 'Convex Optimization', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of optimization, studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '1');

INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('116', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', 'Christian ', 'foreign', '0399501003', 

'csula-01-01-N003', 'Technical', '0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '3'), 

('117', 'Convex Optimization', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of 

optimization, studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '1');



INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('118', 'Applied Microsoft SQL Server 2008 Reporting Services (2008)', 'Teo Lachev', 'English', '0399501005', 'csula-01-01

-S002', 'Meboo', '1.5 million', '110', 'Optimization is the science of making a best choice in the face of conflicting requirements.', '2015-03-01', '2015-03-04', 

'1', '2');


INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('119', 'Securing SQL Server 2nd Edition (2012)', 'Christian ', 'foreign', '0399501005', 

'csula-01-01-N005', 'Technical', '0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '3'), 

('120', 'Securing SQL Server 2nd Edition (2012)', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of 

optimization, studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '1');




INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('121', 'Securing SQL Server 2nd Edition (2012)', 'Christian ', 'foreign', '0399501005', 

'csula-01-01-N005', 'Technical', 

'0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '1'), 

('122', 'Securing SQL Server 2nd 

Edition (2012)', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of 

optimization, 

studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '2');



INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, `Regis_date`, `Is_new`, `branch_id`) VALUES ('5', 'Applied Microsoft SQL Server 2008 Reporting Services (2008)', 'Teo Lachev', 'English', '0399501005', 'csula-01-01-S002', 'Meboo', '1.5 million', '110', 'Optimization is the science of making a best choice in the face of conflicting requirements.', '2015-03-01', '2015-03-04', '1', '2');

INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, `Regis_date`, `Is_new`, `branch_id`) VALUES ('3', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', 'Christian ', 'foreign', '0399501003', 'csula-01-01-N003', 'Technical', '0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '3'), ('4', 'Convex Optimization', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of optimization, studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '1');

INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('6', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', 'Christian ', 'foreign', '0399501003', 

'csula-01-01-N003', 'Technical', '0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '3'), 

('7', 'Convex Optimization', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of 

optimization, studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '1');



INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('8', 'Applied Microsoft SQL Server 2008 Reporting Services (2008)', 'Teo Lachev', 'English', '0399501005', 'csula-01-01

-S002', 'Meboo', '1.5 million', '110', 'Optimization is the science of making a best choice in the face of conflicting requirements.', '2015-03-01', '2015-03-04', 

'1', '2');


INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('9', 'Securing SQL Server 2nd Edition (2012)', 'Christian ', 'foreign', '0399501005', 

'csula-01-01-N005', 'Technical', '0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '3'), 

('10', 'Securing SQL Server 2nd Edition (2012)', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of 

optimization, studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '1');




INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, 

`Regis_date`, `Is_new`, `branch_id`) VALUES ('11', 'Securing SQL Server 2nd Edition (2012)', 'Christian ', 'foreign', '0399501005', 

'csula-01-01-N005', 'Technical', 

'0.8 million', '200', 'Professional SQL Server 2012 Internals and Troubleshooting (2012)', '2014-04-01', '2014-04-15', '0', '1'), 

('12', 'Securing SQL Server 2nd 

Edition (2012)', ' Rob Farley', 'foreign', '0399501004', 'csula-01-01-S001', 'Microsoft', '1 millions', '220', 'onvex minimization, a subfield of 

optimization, 

studies the problem of minimizing convex functions over convex sets.', '2014-08-06', '2014-08-31', '0', '2');



INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('304470392', '4', '1', '2015-04-10', '2015-02-02', 'foreign', '0', '0');

INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('301236548', '3', '3', '2015-02-17', '2015-04-17', 'foreign', '0', '0');

INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('306595412', '10', '1', '2015-03-31', '2015-01-31', 'foreign', '0', '0');
INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('396363636', '5', '2', '2015-03-01', '2015-01-01', 'English', '1', '0');

INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('302659632', '9', '3', '2014-12-20', '2015-02-20', 'foreign', '10', '0');

INSERT INTO `book_limitation` (`borrower_type`, `book_type`, `no_of_books`, `loan_period`, `extention_time`, `extention_days`) VALUES  
('Faculty', 'English', '5', '90 Days', '1', '30'),
('Faculty', 'Foreign', '3', '60 Days', '1', '30'),
('Staff', 'English', '7', '60 Days', '1', '30'),
('Staff', 'Foreign', '6', '30 Days', '1', '30'),
('Graduate Student', 'New Book', '6', '7 Days', '0', '0'),
('Graduate Student', 'Foreign', '2', '30 Days', '1', '15'),
('Undergraduate Student', 'English', '5', '60 Days', '1', '30'),
('Undergraduate Student', 'Foreign', '6', '60 Days', '1', '30'),
('Vocational', 'English', '5', '60 Days', '1', '15'),
('Vocational', 'Foreign', '9', '30 Days', '1', '15');


INSERT INTO `CS422Project`.`users` (`username`, `user_type`, `password`) VALUES  
('304470392', 'Graduate Student','02211991'),
('304384878', 'Graduate Student', '11241991'),
('101202505', 'Graduate Student','08131992'),
('201548654', 'Graduate Student','03231992'),
('302569584', 'Graduate Student','09151993'),
('205968745', 'Vocational Student','10121993'),
('302659632','Undergraduate Student', '01161992'),
('306985123','Undergraduate Student','02261989'),
('201523624','Vocational Student', '09141992'),
('401985698', 'Graduate Student','02101986'),
('302548596', 'Faculty','09211985'),
('306958742','Vocational Student','08131990'),
('301236548','Faculty', '04211981'),
('201326598', 'Graduate Student','12211986'),
('302659847','Graduate Student', '0111979'),
('365987459','Staff','02211961'),
('306595412','Graduate Student','03311961'),
('306985214','Vocational Student','12211981'),
('396363636','Staff', '09151971');


INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('304470392', '50', '1', '2015-04-10', '2015-02-02', 'English', '0', '0');

INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('301236548', '51', '2', '2015-02-17', '2015-04-17', 'foreign', '0', '0');

INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('301236548', '52', '2', '2015-02-17', '2015-04-17', 'foreign', '0', '0');

INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('301236548', '53', '1', '2015-02-17', '2015-04-17', 'foreign', '0', '0');

INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('301236548', '54', '2', '2015-02-17', '2015-04-17', 'foreign', '0', '0');

INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('301236548', '55', '3', '2015-02-17', '2015-04-17', 'English', '0', '0');

INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('301236548', '56', '2', '2015-02-17', '2015-04-17', 'foreign', '0', '0');


INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('201523624', '105', '2', '2015-04-10', '2015-02-02', 'English', '0', '0');
INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('201523624', '108', '2', '2015-04-10', '2015-02-02', 'English', '0', '0');
INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('201523624', '113', '2', '2015-04-10', '2015-02-02', 'English', '0', '0');
INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('201523624', '118', '2', '2015-04-10', '2015-02-02', 'English', '0', '0');





INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('101202505', '117', '1', '2015-04-10', '2015-02-02', 'foreign', '0', '0');


use CS422Project;
INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, `Regis_date`, `Is_new`, `branch_id`) VALUES ('520', 'web programming', 'Abc', 'English', '158975336', 'csula-01-01-S113', 'Microsoft', '1.1 million', '150', 'introduction to web programming', '2014-02-24', '2014-02-26', '0', '2');

use CS422Project;
INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, `Regis_date`, `Is_new`, `branch_id`) VALUES ('707', 'Computer Network', 'Lena Pearce', 'French', '1254789632', 'csula-01-02-2514', 'Technical', '25120', '531', 'computer hardware and Networking', '2014-09-03', '2014-07-03', '0', '2');
INSERT INTO `CS422Project`.`borrowers` (`card_id`, `name`, `gender`, `bor_type`, `department`, `email`, `birthdate`) VALUES ('101202910', 'John ', 'Male', 'Graduate Student', 'Finance Department', 'John@gmail.com', '1980-12-08');


INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('101202910', '707', '2', '2015-03-18', '2014-12-31', 'English', '0', '1');



insert INTO `CS422Project`.`borrowers` (`card_id`, `name`, `gender`, `bor_type`, `department`, `email`, `birthdate`) VALUES ('526985658', 'Rahul Bose', 'male', 'Faculty', 'Electrical Depatment', 'Rahul541j@hotmail.com', '1991-03-03');



INSERT INTO `CS422Project`.`book_loans` (`card_id`, `book_id`, `branch_id`, `due_date`, `checkout_date`, `loan_type`, `fine_amount`, `renew_status`) VALUES ('526985658', '7', '1', '2015-03-18', '2015-03-01', 'foreign', '0', '0');

INSERT INTO `CS422Project`.`books` (`book_id`, `name`, `author`, `book_type`, `isbn`, `catalog_no`, `publishpress`, `total_words`, `price`, `descri`, `publish_date`, `Regis_date`, `Is_new`, `branch_id`) VALUES ('1010', 'Networking ', 'John', 'English', '1058963245', 'csula-226-S998', 'Microsoft', '1.5 million', '190', 'introduction to networking', '2014-10-21', '2015-02-23', '1', '3');







