-- Drop the database if it already exists
DROP DATABASE IF EXISTS VideoGameDB;

-- Create the database
CREATE DATABASE VideoGameDB;

-- Use the newly created database
USE VideoGameDB;

-- Table for Game Types
CREATE TABLE GameTypes (
    GameTypeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT
);

-- Table for Games
CREATE TABLE Games (
    GameID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    GameTypeID INT,
    ReleaseDate DATE,
    FOREIGN KEY (GameTypeID) REFERENCES GameTypes(GameTypeID) ON DELETE SET NULL
);

-- Table for Players
CREATE TABLE Players (
    PlayerID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    JoinDate DATE
);

-- Table for Scores
CREATE TABLE Scores (
    ScoreID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerID INT,
    GameID INT,
    ScoreValue INT NOT NULL,
    DateAchieved DATE,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID) ON DELETE CASCADE,
    FOREIGN KEY (GameID) REFERENCES Games(GameID) ON DELETE CASCADE
);

-- Table for Achievements
CREATE TABLE Achievements (
    AchievementID INT AUTO_INCREMENT PRIMARY KEY,
    GameID INT,
    PlayerID INT,
    Description TEXT,
    DateAdded DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (GameID) REFERENCES Games(GameID) ON DELETE CASCADE
);

INSERT INTO GameTypes (Name, Description) VALUES
('Adventure', 'Exploration-based games with puzzles and quests'),
('Role-Playing', 'Story-driven RPG games with character progression'),
('Shooter', 'Action-packed games with shooting mechanics'),
('Sports', 'Competitive games based on real-world sports'),
('Puzzle', 'Logic-based games with brain-teasing challenges'),
('Platformer', 'Games with jumping and climbing across platforms'),
('Fighting', 'Combat-focused games with one-on-one battles'),
('Racing', 'Speed-based games featuring vehicles'),
('Horror', 'Scary games designed to frighten players'),
('Simulation', 'Games that simulate real-world activities'),
('Strategy', 'Games focused on planning and tactics'),
('Sandbox', 'Open-world games with player freedom'),
('Multiplayer Online', 'Games designed for large-scale multiplayer gameplay'),
('Survival', 'Games centered around resource gathering and staying alive'),
('Arcade', 'Classic-style games with simple mechanics'),
('Educational', 'Games designed for learning and skill development'),
('MMORPG', 'Massively multiplayer online role-playing games'),
('Stealth', 'Games where avoiding detection is key'),
('Rhythm', 'Music and timing-based gameplay'),
('VR', 'Virtual reality games with immersive experiences'),
('Shooter (FPS)', 'First-person perspective shooting games'),
('Card Games', 'Digital versions of card-based games'),
('Board Games', 'Digital versions of classic board games'),
('Trivia', 'Quiz-based games testing player knowledge');

INSERT INTO Games (Title, GameTypeID, ReleaseDate) VALUES
('Space Quest', 1, '2023-01-01'),
('Fantasy Quest', 1, '2024-03-15'),
('Battle Arena', 3, '2023-06-10'),
('Soccer Pro', 4, '2023-09-01'),
('Mind Bender', 5, '2023-05-15'),
('Sky Jumper', 6, '2024-01-20'),
('Battle Zone', 7, '2023-09-12'),
('Turbo Racers', 8, '2023-11-30'),
('Nightmare Escape', 1, '2023-10-31'),
('City Builder Pro', 10, '2023-07-01'),
('War Tactician', 11, '2023-12-15'),
('Island Explorer', 12, '2023-08-21'),
('Warrior Guild', 13, '2023-06-10'),
('Zombie Survival', 14, '2023-04-01'),
('Retro Blaster', 15, '2023-03-05'),
('Math Quest', 16, '2023-02-28'),
('Legends Online', 17, '2023-04-12'),
('Silent Ops', 18, '2024-01-05'),
('Dance Hero', 19, '2023-09-30'),
('VR Space Adventure', 1, '2024-02-10'),
('Sniper Elite', 21, null),
('Solitaire Deluxe', 22, null),
('Chess Master 3000', 23, null),
('Quiz Mania', 24, null);

INSERT INTO Players (Username, Email, JoinDate) VALUES
('PlayerOne', 'playerone@email.com', '2023-02-01'),
('GamerDude', 'gamerdude@email.com', '2023-03-05'),
('Speedster', 'speedster@email.com', '2023-05-20'),
('AceGamer', 'acegamer@email.com', '2023-07-10'),
('NightWolf', 'nightwolf@email.com', '2023-06-01'),
('StarGazer', 'stargazer@email.com', '2023-06-02'),
('ShadowFury', 'shadowfury@email.com', '2023-06-03'),
('BlazeKing', 'blazeking@email.com', '2023-06-04'),
('IceQueen', 'icequeen@email.com', '2023-06-05'),
('LunarEclipse', 'lunareclipse@email.com', '2023-06-06'),
('FireStorm', 'firestorm@email.com', '2023-06-07'),
('ThunderBolt', 'thunderbolt@email.com', '2023-06-08'),
('IronClad', 'ironclad@email.com', '2023-06-09'),
('SteelShadow', 'steelshadow@email.com', '2023-06-10'),
('PhoenixRider', 'phoenixrider@email.com', '2023-06-11'),
('GhostHunter', 'ghosthunter@email.com', '2023-06-12'),
('DragonSlayer', 'dragonslayer@email.com', '2023-06-13'),
('CyberKnight', 'cyberknight@email.com', '2023-06-14'),
('PixelMage', 'pixelmage@email.com', '2023-06-15'),
('StormBreaker', 'stormbreaker@email.com', '2023-06-16'),
('MysticWarden', 'mysticwarden@email.com', '2023-06-17'),
('DarkReaper', 'darkreaper@email.com', '2023-06-18'),
('NeonRider', 'neonrider@email.com', '2023-06-19'),
('SolarFlare', 'solarflare@email.com', '2023-06-20');

INSERT INTO Scores (PlayerID, GameID, ScoreValue, DateAchieved) VALUES
(1, 1, 200, '2023-04-01'), -- PlayerOne in Space Quest
(2, 1, 350, '2023-04-02'), -- GamerDude in Space Quest
(3, 2, 500, '2024-03-20'), -- Speedster in Fantasy Quest
(4, 3, 300, '2023-06-15'),
(5, 5, 1200, '2023-05-20'),
(6, 6, 1500, '2024-02-01'),
(7, 7, 1700, '2023-09-15'),
(8, 8, 1900, '2023-12-01'),
(9, 9, 900, '2023-11-01'),
(10, 10, 1800, '2023-08-01'),
(11, 11, 800, '2023-12-20'),
(12, 12, 1100, '2023-09-01'),
(13, 13, 1000, '2023-06-15'),
(14, 14, 2000, '2023-04-10'),
(15, 15, 300, '2023-03-10'),
(16, 16, 400, '2023-03-01'),
(17, 17, 2500, '2023-05-10'),
(18, 18, 2200, '2024-01-10'),
(19, 19, 2700, '2023-10-01'),
(20, 20, 2900, '2024-03-01'),
(1, 2, 3100, '2023-04-20'),
(2, 3, 3500, '2023-05-01'),
(3, 4, 1800, '2023-06-01'),
(4, 5, 900, '2023-07-01'); -- AceGamer in Battle Arena

INSERT INTO Achievements (GameID, PlayerID, Description, DateAdded) VALUES
(1, 1, 'Found a hidden area in the game', '2023-03-01'),
(2, 1, 'Defeated the dragon in the final battle', '2024-04-01'),
(3, 1, 'Achieved a 90% accuracy rate', '2023-06-12'),
(4, 1, 'Won the Soccer Pro league championship', '2023-10-01'),
(5, 1, 'Solved 50 puzzles', '2023-05-18'),
(6, 1, 'Completed all levels', '2024-02-02'),
(7, 1, 'Defeated all enemies', '2023-09-13'),
(8, 2, 'Finished in under 2 minutes', '2023-11-25'),
(9, 2, 'Escaped the nightmare', '2023-10-31'),
(10, 2, 'Built a city of 10,000 people', '2023-07-05'),
(11, 3, 'Won without losing a unit', '2023-12-18'),
(12, 3, 'Discovered all islands', '2023-08-30'),
(13, 3, 'Formed the largest guild', '2023-06-18'),
(14, 4, 'Survived 100 waves', '2023-04-15'),
(15, 4, 'Achieved a high score of 10,000', '2023-03-12'),
(16, 4, 'Solved all math problems', '2023-03-01'),
(17, 4, 'Reached level 100', '2023-04-20'),
(18, 4, 'Completed the mission without detection', '2024-01-07'),
(19, 4, 'Hit 100% of the notes', '2023-10-01'),
(20, 4, 'Discovered a new galaxy', '2024-02-15');




