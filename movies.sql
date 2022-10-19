CREATE TABLE `movie` (
   `movie_id` int NOT NULL,
   `title` varchar(225) NOT NULL,
   `year` int NOT NULL,
   `genre` varchar(15) DEFAULT NULL,
   `description` varchar(2000) DEFAULT NULL,
   `duration` decimal(10,0) DEFAULT NULL,
   `rating` decimal(10,0) DEFAULT NULL,
   `language` varchar(15) DEFAULT NULL,
   `studio_id` int DEFAULT NULL,
   PRIMARY KEY (`movie_id`)
 ) 