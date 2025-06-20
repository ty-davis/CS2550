-- Drop the database if it already exists
DROP DATABASE IF EXISTS ZooDB;
CREATE DATABASE ZooDB;
USE ZooDB;

-- Table: Habitats
CREATE TABLE Habitats (
    HabitatID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    ClimateType VARCHAR(50) NOT NULL,
    SizeSqFt INT NOT NULL,
    MaxCapacity INT NOT NULL
);

-- Table: Diets
CREATE TABLE Diets (
    DietID INT PRIMARY KEY AUTO_INCREMENT,
    DietType ENUM('Herbivore', 'Carnivore', 'Omnivore') NOT NULL,
    FeedingSchedule VARCHAR(100) NOT NULL
);

-- Table: Animals
CREATE TABLE Animals (
    AnimalID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Species VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male', 'Female') NOT NULL,
    HealthStatus VARCHAR(50) NOT NULL DEFAULT 'Healthy',
    HabitatID INT,
    DietID INT,
    FOREIGN KEY (HabitatID) REFERENCES Habitats(HabitatID) ON DELETE RESTRICT,
    FOREIGN KEY (DietID) REFERENCES Diets(DietID) ON DELETE RESTRICT
);

-- Table: Zookeepers
CREATE TABLE Zookeepers (
    ZookeeperID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255),
    AssignedHabitatID INT,
    FOREIGN KEY (AssignedHabitatID) REFERENCES Habitats(HabitatID) ON DELETE RESTRICT
);

-- Table: Veterinarians
CREATE TABLE Veterinarians (
    VetID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Email VARCHAR(255)
);

-- Table: MedicalRecords
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    AnimalID INT NOT NULL,
    VetID INT NOT NULL,
    Diagnosis TEXT NOT NULL,
    Treatment TEXT NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (AnimalID) REFERENCES Animals(AnimalID) ON DELETE RESTRICT,
    FOREIGN KEY (VetID) REFERENCES Veterinarians(VetID) ON DELETE RESTRICT
);

-- Table: Visitors
CREATE TABLE Visitors (
    VisitorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 0),
    MembershipStatus ENUM('Regular', 'VIP', 'Annual Pass') DEFAULT 'Regular'
);

-- Table: Tickets
CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,
    VisitorID INT NOT NULL,
    Price DECIMAL(5,2) NOT NULL,
    DatePurchased DATE NOT NULL,
    FOREIGN KEY (VisitorID) REFERENCES Visitors(VisitorID) ON DELETE RESTRICT
);

-- Insert Sample Habitats
INSERT INTO Habitats (Name, ClimateType, SizeSqFt, MaxCapacity)
VALUES 
('Savanna Exhibit', 'Tropical', 5000, 10),
('Rainforest Dome', 'Humid', 6000, 12),
('Arctic Zone', 'Cold', 4000, 6),
('Reptile House', 'Warm', 3000, 15);

-- Insert Sample Diets
INSERT INTO Diets (DietType, FeedingSchedule)
VALUES 
('Herbivore', '08:00 AM, 06:00 PM'),
('Carnivore', '10:00 AM, 08:00 PM'),
('Omnivore', '09:00 AM, 07:00 PM');

-- Insert Sample Animals
INSERT INTO Animals (Name, Species, DateOfBirth, Gender, HealthStatus, HabitatID, DietID)
VALUES 
('Leo', 'Lion', '2018-06-12', 'Male', 'Healthy', null, 2),
('Ella', 'Elephant', '2015-09-20', 'Female', 'Healthy', 1, 1),
('Milo', 'Monkey', '2020-02-15', 'Male', 'Healthy', 2, 3),
('Frost', 'Polar Bear', '2016-12-05', 'Male', 'Injured', 3, 2),
('Iggy', 'Iguana', '2019-04-25', 'Female', 'Healthy', 4, 1),
('Simba', 'Lion', '2017-05-10', 'Male', 'Healthy', 1, 2),
('Zara', 'Giraffe', '2016-08-02', 'Female', 'Healthy', 1, 1),
('Cleo', 'Cheetah', '2019-11-25', 'Female', 'Healthy', 1, 2),
('Willy', 'Wolf', '2020-04-01', 'Male', 'Healthy', 3, 2),
('Tina', 'Tiger', '2018-01-15', 'Female', 'Healthy', 1, 2),
('Terry', 'Toucan', '2022-06-20', 'Male', 'Healthy', 2, 3),
('Maggie', 'Kangaroo', '2016-12-05', 'Female', 'Healthy', 1, 1),
('Jack', 'Penguin', '2021-07-12', 'Male', 'Healthy', 3, 2),
('Luna', 'Koala', '2020-05-30', 'Female', 'Healthy', 4, 1),
('Rocky', 'Raccoon', '2022-01-05', 'Male', 'Healthy', 2, 3);

-- Insert Sample Zookeepers
INSERT INTO Zookeepers (FirstName, LastName, Email, AssignedHabitatID)
VALUES 
('John', 'Smith', 'john.smith@zoo.com', 1),
('Sarah', 'Johnson', 'sarah.johnson@zoo.com', 2),
('Michael', 'Brown', 'michael.brown@zoo.com', 3),
('Emily', 'Davis', 'emily.davis@zoo.com', 4),
('Anna', 'White', 'anna.white@zoo.com', 1),
('Oliver', 'Blue', 'oliver.blue@zoo.com', 2),
('Emma', 'Green', 'emma.green@zoo.com', 3),
('Lucas', 'Gray', 'lucas.gray@zoo.com', 4);

-- Insert Sample Veterinarians
INSERT INTO Veterinarians (FirstName, LastName, Specialization, Email)
VALUES 
('Lisa', 'Parker', 'Large Mammals', 'lisa.parker@zoo.com'),
('David', 'Clark', 'Reptiles', 'david.clark@zoo.com');

-- Insert Sample MedicalRecords
INSERT INTO MedicalRecords (AnimalID, VetID, Diagnosis, Treatment, Date)
VALUES 
(4, 1, 'Broken paw', 'Bandaged, pain medication', '2025-01-15'),
(5, 2, 'Skin infection', 'Antibiotic cream', '2025-01-20'),
(1, 1, 'Minor scratches', 'Wound care, observation', '2025-02-01'),
(2, 1, 'Foot injury', 'Bandage and rest', '2025-02-02'),
(3, 1, 'Ear infection', 'Antibiotic treatment', '2025-02-03'),
(4, 2, 'Fever', 'Fluid therapy, medication', '2025-02-04'),
(5, 1, 'General check-up', 'Vaccination', '2025-02-05'),
(6, 2, 'Skin irritation', 'Topical ointment', '2025-02-06'),
(7, 1, 'Eye irritation', 'Eye drops', '2025-02-07'),
(8, 2, 'Nasal congestion', 'Antibiotics', '2025-02-08'),
(9, 1, 'Stomach upset', 'Special diet', '2025-02-09'),
(10, 2, 'Parasite infection', 'Deworming medication', '2025-02-10');

-- Insert Sample Visitors
INSERT INTO Visitors (FirstName, LastName, Age, MembershipStatus)
VALUES 
('Alice', 'White', 30, 'Annual Pass'),
('Bob', 'Green', 25, 'Regular'),
('Charlie', 'Black', 12, 'VIP'),
('Diane', 'Clark', 45, 'VIP'),
('Ethan', 'Hill', 22, 'Regular'),
('Grace', 'Thompson', 34, 'Annual Pass'),
('Henry', 'Young', 19, 'Regular'),
('Isabella', 'Scott', 29, 'VIP'),
('James', 'Lee', 40, 'Regular'),
('Kathy', 'Martinez', 26, 'Annual Pass'),
('Liam', 'Harris', 31, 'Regular'),
('Megan', 'King', 27, 'VIP'),
('Nina', 'Adams', 36, 'Regular');

-- Insert Sample Tickets
INSERT INTO Tickets (VisitorID, Price, DatePurchased)
VALUES 
(1, 25.00, '2025-02-01'),
(2, 30.00, '2025-02-02'),
(3, 20.00, '2025-02-03'),
(4, 25.00, '2025-02-04'),
(5, 30.00, '2025-02-05'),
(6, 20.00, '2025-02-06'),
(7, 28.00, '2025-02-07'),
(8, 32.00, '2025-02-08'),
(9, 30.00, '2025-02-09'),
(10, 22.00, '2025-02-10'),
(1, 35.00, '2025-02-11'),
(2, 24.00, '2025-02-12'),
(3, 28.00, '2025-02-13');
