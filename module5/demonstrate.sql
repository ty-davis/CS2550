-- Question 1:
INSERT INTO GameTypes (Name, Description)
VALUES ('Roblox', 'Roblox mini-game to play with others online.');
SET @NewGameTypeID = LAST_INSERT_ID(); -- I found this nifty function for MySQL

INSERT INTO Games (Title, GameTypeID, ReleaseDate)
VALUES ('Gun Game', @NewGameTypeID, '2018-06-04');
SET @NewGameID = LAST_INSERT_ID();

INSERT INTO Players (Username, Email, JoinDate)
VALUES ('spaceman1', 'spaceman@gmail.com', CURDATE());
SET @NewPlayerID = LAST_INSERT_ID();

INSERT INTO Scores (PlayerID, GameID, ScoreValue, DateAchieved)
VALUES (@NewPlayerID, @NewGameID, 1000, CURDATE());

-- Question 2:
INSERT INTO Achievements (GameID, PlayerID, Description, DateAdded)
VALUES (@NewGameID, @NewPlayerID, 'You won gun game', CURDATE());

-- Question 3:
INSERT INTO Scores (PlayerID, GameID, ScoreValue, DateAchieved)
VALUES (@NewPlayerID, @NewGameID, 1100, CURDATE()),
       (@NewPlayerID, @NewGameID, 1200, CURDATE());

-- Question 4:
SET @@autocommit = 0;
SET SQL_SAFE_UPDATES = 0;

UPDATE Scores
SET ScoreValue = ScoreValue + 1000;

-- Question 5:
ROLLBACK;

-- Question 6:
UPDATE Scores
SET ScoreValue = 10000
WHERE PlayerID = @NewPlayerID;
COMMIT;

SELECT * FROM Scores
WHERE GameID = @NewGameID;

-- Question 7:
SET @@autocommit = 1;

UPDATE Scores
SET GameID = 20
WHERE GameID = 1;

-- Question 8:
ALTER TABLE Scores
DROP FOREIGN KEY scores_ibfk_2;

ALTER TABLE Scores
ADD CONSTRAINT FK_Scores_GameID
    FOREIGN KEY (GameID) REFERENCES Games(GameID)
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- the same foreign key constraint exists on the achievements table
ALTER TABLE Achievements
DROP FOREIGN KEY achievements_ibfk_1;

ALTER TABLE Achievements
ADD CONSTRAINT FK_Achievements_GameID
	FOREIGN KEY (GameID) REFERENCES Games(GameID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Question 9:
UPDATE Games
SET GameID = 111
WHERE GameID = @NewGameID;

SELECT * FROM Scores
WHERE GameID = 111;

-- Question 10:
DELETE FROM Games
WHERE GameID = 111;
-- This works because all of the foreign keys that point
-- to Games(GameID) are `ON DELETE CASCADE`, which means
-- that when this game was deleted, the corresponding
-- rows in the scores and achievements tables were
-- also deleted.

-- I think the best thing to do would be restrict the deletion
-- of games, and put a new column on the games database called
-- GameActive BOOLEAN NOT NULL DEFAULT TRUE 
-- and when that attribute is false then you never show results
-- for its scores or achievements in any SELECT statements.