CREATE DATABASE student;
CREATE DATABASE teachers;

USE student;

CREATE TABLE users
	(
		user_id INT Primary KEY,
		name TEXT,
		email TEXT,
		age INTEGER
	);

SELECT * FROM users;

INSERT INTO users(user_id, name, email, age)
VALUES 
	(4, 'Kamal', 'kamal@gmail.com', 20),
	(3, 'Jamal', 'jamal@gmail.com', 30);


SELECT * FROM users WHERE age > 23;

SELECT COUNT(*) FROM users;

SELECT SUM(age) FROM users

SELECT AVG(age) FROM users;


SELECT MIN(age) FROM users;

SELECT MAX(age) FROM users;

SELECT * FROM users WHERE age IN (20, 25, 30);

SELECT * FROM users WHERE age NOT IN (20, 25, 30);

SELECT USER_ID as userID, name AS FullName from users;