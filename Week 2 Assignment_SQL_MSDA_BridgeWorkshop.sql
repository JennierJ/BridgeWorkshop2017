-- SQL Week 3 Assignment

-- In this assignment, we'll practice working with one-to-many relationship in SQL. Suppose you are tasked with keeping track of a database that contain the best "how-to" videos on MySQL.

-- You may want to first create a new database (schema) for this assignment.

-- 1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or other publicly available resources. 

DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS reviewers;


CREATE TABLE videos (
         id int PRIMARY KEY,
         title VARCHAR (100),
         length INT,
         url VARCHAR (150) NOT NULL
         );
      

INSERT INTO videos (id, title, length, url) VALUES ( 1, 'Boss Baby', '97', 'https://www.youtube.com/watch?v=RBfCQuQqgNs&list=PLHPTxTxtC0iaNb2gYer181oSTHvU3JLmU&disable_polymer=true');
INSERT INTO videos (id, title, length, url) VALUES ( 2, 'Beauty and the Beast', '130', 'https://www.youtube.com/watch?v=g-DkY-drN9Q');
INSERT INTO videos (id, title, length, url) VALUES ( 3, 'Split', '117', 'https://www.youtube.com/watch?v=eIcWdeNglFM');

SELECT * FROM videos;

-- 2. Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of at least two of the videos. These should be imaginary reviews that include columns for the user's name ("Asher", "Cyd", etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review ("Love it!"). There should be a column that links back to the ID column in the table of videos.

CREATE TABLE reviewers (
         review_id int PRIMARY KEY,
         reviewer VARCHAR (100),
         rating int,
         review VARCHAR (100),
         id INT REFERENCES videos
         );
         
INSERT INTO reviewers (review_id, reviewer, rating, review, id) VALUES (1, 'Asher', '5', 'Love it!', 1);
INSERT INTO reviewers (review_id, reviewer, rating, review, id) VALUES (2, 'Cyd', '3', 'Okay !', 1);
INSERT INTO reviewers (review_id, reviewer, rating, review, id) VALUES (3, 'Asher', '4', 'Good!', 2);
INSERT INTO reviewers (review_id, reviewer, rating, review, id) VALUES (4, 'Cyd', '5', 'Love it!', 2);
INSERT INTO reviewers (review_id, reviewer, rating, review, id) VALUES (5, 'Asher', '1', 'Bad !', 3);
INSERT INTO reviewers (review_id, reviewer, rating, review, id) VALUES (6, 'Cyd', '2', 'So so!', 3);

SELECT * FROM reviewers;

-- 3. Report on Video Reviews. Write a JOIN statement that shows information from both tables.

SELECT * FROM videos;

SELECT * FROM reviewers;

SELECT * 
	FROM videos
	INNER JOIN reviewers
	ON videos.id = reviewers.id
	ORDER BY videos.id;
	