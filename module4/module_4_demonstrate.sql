USE VideoGameDB;
-- Question 1:
SELECT * FROM Scores;

-- Question 2:
SELECT PlayerID, GameID, ScoreValue FROM Scores WHERE ScoreValue > 10;

-- Question 3:
SELECT * FROM Games WHERE GameID in (1, 2);

-- Question 4:
SELECT UCASE(Username) FROM Players WHERE Username LIKE 's%';

-- Question 5:
SELECT * FROM Scores WHERE (MONTH(DateAchieved) = 4 AND YEAR(DateAchieved) = 2023 AND ScoreValue > 300);

-- Question 6:
SELECT * FROM Games WHERE (ReleaseDate IS NULL);

-- Question 7:
SELECT * FROM Scores WHERE (ScoreValue BETWEEN 300 AND 900) ORDER BY ScoreValue DESC;

-- Question 8:
SELECT DISTINCT ScoreValue FROM Scores;

-- Question 9:
SELECT DAY(DateAchieved) FROM Scores;

-- Question 10:
SELECT DATEDIFF(CURDATE(), DateAdded) FROM Achievements;