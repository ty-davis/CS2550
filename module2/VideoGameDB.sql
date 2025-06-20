-- Drop the database if it already exists
DROP DATABASE IF EXISTS VideoGameDB;
CREATE DATABASE VideoGameDB;
USE VideoGameDB;

CREATE TABLE Player (
	ID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(30) NOT NULL, -- variable length string
    LastName VARCHAR(30) NOT NULL,  -- up to 30 characters is enough for names.
    Email VARCHAR(50) NOT NULL,     -- Use a little longer for email
    Phone CHAR(10),                 -- not just a number, always needs 10 digits, don't require phone number
    Street VARCHAR(100),            -- Some streets have long names, don't require address
    CITY VARCHAR(30),               -- Same as FirstName/LastName
    State CHAR(2),                  -- Always same length so use "CHAR"
    ZIP VARCHAR(10),                -- 5 digits, but maybe 10 digits with XXXXX-XXXX
    JoinDate DATE NOT NULL,         -- We only need DATE not DATETIME
    PRIMARY KEY (ID)
);

ALTER TABLE Player
ADD Username VARCHAR(30) NOT NULL;

SHOW COLUMNS FROM Player;