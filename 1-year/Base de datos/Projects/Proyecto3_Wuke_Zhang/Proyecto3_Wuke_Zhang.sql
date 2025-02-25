CREATE DATABASE Proyecto3;

USE Proyecto3;


CREATE TABLE Opea(
    Id_Opea INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(10) NOT NULL,
    DNI VARCHAR(10) NOT NULL UNIQUE,
    Username VARCHAR(15) NOT NULL UNIQUE,
    Password VARCHAR(15) NOT NULL UNIQUE,
    Institutional_email VARCHAR(15) NOT NULL,
    Personal_email VARCHAR(15) NOT NULL,
    Direction VARCHAR(15) NOT NULL,
    Type ENUM('Administratives','Counsellors')
);

CREATE TABLE User_Data(
    Id_user INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(10) NOT NULL,
    Surname VARCHAR(10) NOT NULL,
    DNI VARCHAR(10) NOT NULL UNIQUE,
    SS_Number VARCHAR(10) UNIQUE,
    Unemployment_start_date DATE NOT NULL,
    Darde_renovation_date DATE NOT NULL,
    Birthdate DATE NOT NULL,
    Genre ENUM('Male','Female') NOT NULL,
    Opea_id INT NOT NULL,
    CONSTRAINT FK_Appointment_Opea FOREIGN KEY(Opea_id)
    REFERENCES Opea(Id_Opea)
);

CREATE TABLE Laboral_Experience(
    Id_laboral_experience INT PRIMARY KEY AUTO_INCREMENT,
    Job_position VARCHAR(10) NOT NULL,
    Job_position_description TEXT,
    Job_sector ENUM('Primary','Secondary','Tertiary') NOT NULL,
    Start_date DATE NOT NULL,
    Finish_date DATE NOT NULL,
    User_id INT NOT NULL,
    CONSTRAINT FK_Laboral_Experience_User_Data FOREIGN KEY(User_id)
    REFERENCES User_Data(Id_user)
);

CREATE TABLE Appointment(
    Id_appointment INT PRIMARY KEY AUTO_INCREMENT,
    Date DATETIME NOT NULL,
    User_id INT NOT NULL,
    CONSTRAINT FK_Appointment_User_Data FOREIGN KEY(User_id)
    REFERENCES User_Data(Id_user)
);

INSERT INTO Opea(Name,DNI,Username,Password,Institutional_email,Personal_email,Direction,Type)
VALUES('Pepe','X9564656','Pepecrack123','Pep123456','Pepe@opea.com','PepGuardiola@gmail.com','juan gutierrez','Administratives');

INSERT INTO User_Data(Name,Surname,DNI,SS_Number,Unemployment_start_date,Darde_renovation_date,Birthdate,Genre,Opea_id)
VALUES ('Ruben','Hernandez','E3547891',NULL,'2022-02-15','2023-04-22','1990-11-30','Male','1');

INSERT INTO Laboral_Experience(Job_position,Job_position_description,Job_sector,Start_date,Finish_date,User_id)
VALUES('Junior','Rookie doing internships in companies','Informatic','2021-12-12','2022-02-14','1');

INSERT INTO Appointment(Date,User_id)
VALUES ('2023-05-29','1');

//*All the info from user with his respective laboral experience and appointment*//

SELECT * FROM Appointment
JOIN User_Data ON Appointment.User_id = Id_user
JOIN Laboral_Experience ON Laboral_Experience.User_id = Id_user

