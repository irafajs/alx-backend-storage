-- SCRIPT TO CREATE A TABLE USER
-- EVERY DATABASE SHOULD HAVE A USER TABLE
CREATE TABLE IF NOT EXISTs users(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255)
);
