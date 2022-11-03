DROP TABLE IF EXISTS `movie`;
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
   PRIMARY KEY (`movie_id`)
 ) ;
 
 INSERT INTO `movie`(`title`,`genre`,`year`,`duration`,`rating`,`language`,`description`,`imgpath`) VALUES 
('Rampage', 'action', '2018', '107','4.1','English', 'It is based on the video game series of the same name by Midway Games,', 'rampage.jpg'),
('Black Panther', 'fiction', '2018', '134','4.1','English', 'An American superhero film based on the Marvel Comics character of the same name.', 'blackpanther.jpg'),
('Spiderman Homecoming', 'action', '2017', '133','4.3','English', 'An American superhero film based on the Marvel Comics character Spider-Man.', 'spider-man-homecoming.jpg'),
('Jumanji: Welcome to the Jungle', 'adventure', '2017', '119','3.8','English', 'The story focuses on a group of teenagers who come across Jumanji, now transformed into a video game twenty-two years after the events of the 1995 film. They find themselves trapped in the game as a set of adult avatars, seeking to complete a quest alongside another player who has been trapped since 1996.', 'jumanji2017.jpg'),
('The conjuring', 'horror', '2013', '112','4.0','English', 'ghost house', 'Conjuring.jpg'),
('The conjuring 2', 'horror', '2015', '115','4.1','English', 'cursed family', 'conjuring2.jpg'),
('Avengers: infinity war', 'fiction', '2018', '149','4.4','English', ' The Avengers and the Guardians of the Galaxy attempt to prevent Thanos from collecting the six all-powerful Infinity Stones as part of his quest to kill half of all life in the universe.','infinitywar.jpg'),
('Black Adam', 'action', '2022', '124','4.4','English', 'An American superhero film based on the DC Comics character of the same name.','blackadam.jpg'),
('Halloween Ends', 'horror', '2022', '111','4.0','English', 'An American slasher film that is the sequel to Halloween Kills (2021), the thirteenth installment in the Halloween franchise, and the final film in the trilogy of sequels that started with the 2018 film, which directly follows the 1978 film.','halloweenends.jpg'),
('The Stranger', 'drama', '2022', '116','4.4','English', "Based on the non-fiction book The Sting: The Undercover Operation That Caught Daniel Morcombe's Killer by Kate Kyriacou, and inspired by the murder investigation of Daniel Morcombe,[1] the film follows an investigation of a child abduction case, with an undercover police officer (Edgerton) in a sting operation tasked with getting close to and forming a friendship with the prime suspect (Harris).",'thestranger.jpg');

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
   `award_id` int NOT NULL AUTO_INCREMENT,
   `name` varchar(200) NOT NULL,
   `organization` varchar(225) DEFAULT NULL,
   `year` int DEFAULT NULL,
   `movie_id` int NOT NULL,
   PRIMARY KEY (`award_id`)
);
INSERT INTO `awards`(`name`,`organization`,`year`,`movie_id`) VALUES
('Best Achievement in Costume Design', 'Oscar', 2019, 2),
('Best Achievement in Production Design', 'Oscar', 2019, 2),
('Best Achievement in Special Visual Effects', 'BAFTA Film Award', 2019, 2),
('Best Performance by a Younger Actor','Saturn Award', 2018, 3),
('Favorite Movie Actress', 'Blimp Award', 2018, 3),
('Best Billboard', 'Golden Trailer',2018, 4),
('Favorite Movie', 'Blimp Award',2018, 4),
('Best Horror Film', 'Saturn Award',2014, 5),
('Best Horror', 'Empire Award', 2014, 5),
('Top Box Office Films', 'ASCAP Award', 2017, 6),
('Best Horror TV Spot', 'Golden Trailer', 2016, 6),
('Feature Film VFX', 'AEAF', 2018, 7),
('Best Visual Effects', 'ACCA', 2019, 7);


DROP TABLE IF EXISTS `star-in`;
CREATE TABLE `star-in` (
   `movie_id` int NOT NULL,
   `actor_id` int NOT NULL
);
INSERT INTO `star-in` (`movie_id`, `actor_id`) VALUES
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
(4,1),
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

 
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
   `user_id` int NOT NULL,
   `movie_id` int NOT NULL
 );
 INSERT INTO `favorite` (`user_id`, `movie_id`) VALUES
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

 