-- make auto increment for id number
-- send a diagram to Lilou after done with the database
-- date for payment date type??
-- insert data into the tables (star war movies)

DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
   `movie_id` int  NOT NULL AUTO_INCREMENT,
   `title` varchar(225) NOT NULL,
   `genre` varchar(20) DEFAULT NULL,
   `year` int NOT NULL,
   `description` varchar(4000) DEFAULT NULL,
   `duration` int NOT NULL,
   `rating` decimal(10,1) DEFAULT NULL,
   `language` varchar(15) DEFAULT NULL,
   `imgpath` varchar(50) DEFAULT NULL,
   `poster_URL` varchar(100) DEFAULT NULL,
   `studio_name` varchar(50) DEFAULT NULL,
   PRIMARY KEY (`movie_id`)
 ) ;
 
 INSERT INTO `movie`(`title`,`genre`,`year`,`duration`,`rating`,`language`,`description`,`imgpath`,`poster_URL`) VALUES 

('Rampage', 'fiction', '2017', '120','4.1','English', 'animals', 'rampage.jpg', 'RAMPAGE Trailer.mp4'),
('Black panther', 'fiction', '2017', '140','4.1','English', 'super hero movie', 'blackpanther.jpg', 'Black Panther.mp4'),
('Spiderman homecoming', 'fiction', '2018', '110','4.3','English', 'super hero movie', 'spider-man-homecoming.jpg', 'Spider-Man Homecoming.mp4'),
('Jumanji', 'adventure', '2017', '130','3.8','English', '4 kids stuck in video game', 'jumanji2017.jpg', 'JUMANJI 17.mp4'),
('The conjuring', 'horror', '2013', '120','4.0','English', 'ghost house', 'Conjuring.jpg', 'The Conjuring.mp4'),
('The conjuring 2', 'horror', '2015', '115','4.1','English', 'cursed family', 'conjuring2.jpg', 'The Conjuring 2.mp4'),
('Avengers: infinity war', 'fiction', '2018', '123','4.4','English', 'collaboration of all marvel characters','infinitywar.jpg', 'Avengers Infinity War.mp4'),
('Black Adam', 'action', '2022', '132','4.4','English', '','blackadam.jpg', 'blackadam.mp4'),
('Halloween Ends', 'horror', '2022', '120','4.0','English', 'collaboration of all marvel characters','halloweenends.jpg', 'halloweenends.mp4'),
('The Stranger', 'drama', '2022', '125','4.4','English', 'collaboration of all marvel characters','thestranger.jpg', 'thestranger.mp4');

SELECT * FROM movie;


 DROP TABLE IF EXISTS `account`;
 CREATE TABLE `account` (
   `account_id` int NOT NULL AUTO_INCREMENT,
   `username` varchar(50) NOT NULL,
   `password` varchar(15) NOT NULL,
   `email` varchar(200) NOT NULL,
   PRIMARY KEY (`account_id`)
 ) ;
INSERT INTO `account` (`username`, `password`, `email`) VALUES
('shubhamb756', 'df8692849041', 'shubhamb756@gmail.com'),
('soubik', 'gsb8622849041', 'soubik@gmail.com'),
('niru', 'htr1234287564', 'niru@gmail.com'),
('tamnguyen01', 'jgst082', 'tamm@gmail.com'),
('liamkim', 'liam7564', 'liamkim@gmail.com'),
('kenny21', 'skyy64', 'kenny21@gmail.com'),
('steph', 'htrstepj', 'stephchoi@gmail.com'),
('sunnuu', 'sunnyyy', 'sunny09@gmail.com'),
('andyluu', 'andyemul013', 'andy99@gmail.com'),
('austin789', 'autinsjy09', 'austin900@gmail.com');
 
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
	`user_id` int  NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
	`user_type` varchar(30) NOT NULL,
	`account_id` int NOT NULL,
PRIMARY KEY (`user_id`)
 );
 INSERT INTO `user` (`name`, `user_type`, `account_id`) VALUES
('Shub Browns', 'main', '1'),
('David Browns', 'sub', '1'),
('Kimberly Browns', 'sub', '1'),
('Soubik Smith', 'main', '2'),
('Vai Smith', 'sub', '2'),
('Niru Miller', 'main', '3'),
('Tam Nguyen', 'main', '4'),
('Thanh Nguyen', 'sub', '4'),
('Liam Kim', 'main', '5'),
('Kenny Pham', 'main', '6'),
('Steph Choi', 'main', '7'),
('Sunny Jones', 'main', '8'),
('Andy Luu', 'main', '9'),
('Tiffany Luu', 'sub', '9'),
('Austin Gracia', 'main', '10');

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
	`account_id` int NOT NULL,
	`name` varchar(200) NOT NULL,
	`card_number` varchar(100) NOT NULL,
	`CVV` int NOT NULL,
	`exp_date` varchar(50) NOT NULL,
	`zipcode` int NOT NULL,
   PRIMARY KEY (`account_id`)
);

INSERT INTO `payment` (`account_id`, `name`, `card_number`, `CVV`,`exp_date`,`zipcode`) VALUES
(1, 'Shub Browns','1729374664648986', '456','01/25','95112'),
(2, 'Soubik Smith','5653956485264689', '109','09/23','95111'),
(3, 'Niru Miller','1488356496266320', '484','11/24','95113'),
(4, 'Tam Nguyen','8939465869774057', '056','05/23','95114'),
(5, 'Liam Kim','0698756304989637', '535','09/25','95117'),
(6, 'Kenny Pham','9882333452653796', '986','12/25','95112'),
(7, 'Steph Choi','4398846646489861', '325','03/23','95112'),
(8, 'Sunny Jones','2179397947295452', '012','09/26','95110'),
(9, 'Andy Luu','9485738528234543', '852','10/24','95111'),
(10, 'Austin Gracia','9830845893498723', '415','12/25','95115');

DROP TABLE IF EXISTS `actors`;
CREATE TABLE `actors` (
   `actor_id` int NOT NULL AUTO_INCREMENT,
   `name` varchar(225) NOT NULL,
   `gender` varchar(10) NOT NULL,
   PRIMARY KEY (`actor_id`)
);
INSERT INTO `actors` (`name`, `gender`) VALUES
('Dwayne Johnson','male'),
('Naomie Harris ','female'),
('Malin Åkerman ','female'),
('Jeffrey Dean Morgan','male'),
('Jake Lacy','male'),
('Chadwick Boseman','male'),
('Michael B. Jordan ','male'),
('Danai Gurira','female'),
('Martin Freeman','male'),
('Tom Holland','male'),
('Zendaya','female'),
('Michael Keaton','male'),
('Marisa Tomei','female'),
('Karen Gillan','female'),
('Kevin Hart','male'),
('Jack Black','male'),
('Vera Farmiga','female'),
('Patrick Wilson','male'),
('Sterling Jerins','female'),
('Joseph Bishara','male'),
('Madison Wolfe','female'),
('Lauren Esposito','female'),
('Robert Downey Jr.','male'),
('Josh Brolin','male'),
('Chris Hemsworth','male'),
('Chris Evans','male'),

('Aldis Hodge','male'),
('Noah Centineo','male'),
('Sarah Shahi','female'),
('Jamie Lee Curtis','female'),
('Andi Matichak','female'),
('James Jude Courtney','male'),
('Joel Edgerton','male'),
(' Sean Harris','male'),
('Jada Alberts','female');









DROP TABLE IF EXISTS `directors`;
CREATE TABLE `directors` (
   `director_id` int NOT NULL AUTO_INCREMENT,
   `name` varchar(225) NOT NULL,
   PRIMARY KEY (`director_id`)
);

INSERT INTO `directors` (`name`) VALUES
('Brad Peyton'),
('Ryan Coogler'),
('Jon Watts'),
('Jake Kasdan'),
('Joe Johnson'),
('James Wan'),
('Anthony Russo'),
('Joe Russo'),
('Joss Whedon'),
('Jaume Collet-Serra'),
('David Gordon Green'),
('Thomas Wright');





DROP TABLE IF EXISTS `awards`;
CREATE TABLE `awards` (
   `award_id` int NOT NULL,
   `name` varchar(200) NOT NULL,
   `organization` varchar(225) DEFAULT NULL,
   `country` varchar(30) DEFAULT NULL,
   PRIMARY KEY (`award_id`)
);

DROP TABLE IF EXISTS `cast`;
CREATE TABLE `cast` (
   `movie_id` int NOT NULL,
   `actor_id` int NOT NULL
);
INSERT INTO `cast` (`movie_id`, `actor_id`) VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,6),
(2,7),
(2,8),
(2,9),
(3,10),
(3,11),
(3,12),
(3,13),
(4,14),
(4,15),
(4,16),
(5,17),
(5,18),
(5,19),
(5,20),
(6,17),
(6,18),
(6,21),
(6,22),
(7,23),
(7,24),
(7,25),
(7,26),
(8,1),
(8,27),
(8,28),
(8,29),
(9,30),
(9,31),
(9,32),
(10,33),
(10,34),
(10,35);



DROP TABLE IF EXISTS `directed`;
CREATE TABLE `directed` (
   `movie_id` int NOT NULL,
   `director_id` int NOT NULL
);
INSERT INTO `directed` (`movie_id`, `director_id`) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(4,5),
(5,6),
(6,6),
(7,7),
(7,8),
(7,9),
(8,10),
(9,11),
(10,12);

DROP TABLE IF EXISTS `received`;
CREATE TABLE `received` (
   `movie_id` int NOT NULL,
   `award_id` int NOT NULL
 );

 
DROP TABLE IF EXISTS `liked`;
CREATE TABLE `liked` (
   `user_id` int NOT NULL,
   `movie_id` int NOT NULL
 );
 INSERT INTO `liked` (`user_id`, `movie_id`) VALUES
(1,1),
(1,2),
(2,10),
(1,4),
(5,5),
(2,6),
(2,7),
(3,3),
(4,5),
(7,7),
(8,1);
 
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
   `user_id` int NOT NULL,
   `movie_id` int NOT NULL,
   `rating` int DEFAULT NULL,
   `comment` varchar(500) DEFAULT NULL
);

 INSERT INTO `review` (`user_id`, `movie_id`, `rating`, `comment`) VALUES
(1,3, 4,'good'),
(1,4, 3,'ok movie'),
(2,2, 4,'pretty interesting'),
(3,3, 2,'nah'),
(1,7, 3,'scary but boring'),
(7,1, 4,'good'),
(10,3,4,'good'),
(7,6, 5,'thrilling'),
(8,3, 3,'the movie was ok'),
(2,3, 3,'average movie'),
(5,1, 5,'I like it'),
(4,3, 4,'good'),
(9,3, 3,'boring');
 