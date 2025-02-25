CREATE DATABASE Proyecto4;

CREATE TABLE racing(
    id_race INT PRIMARY KEY AUTO_INCREMENT,
    modalities VARCHAR(35) NOT NULL,
    minimum_time TIME NOT NULL,
    maximum_time TIME NOT NULL,
    maximum_participants_number INT NOT NULL,
    race_date DATE NOT NULL
);

CREATE TABLE categories(
    id_category INT PRIMARY KEY AUTO_INCREMENT, 
    life_stage ENUM('Childish','Junior','Master','Senior') NOT NULL,
    genre ENUM('Male','Female') NOT NULL,
    type ENUM('Company','Independent') NOT NULL,
    race_id INT NOT NULL,
    CONSTRAINT FK_categories_racing FOREIGN KEY (race_id)
    REFERENCES racing(id_race)
);

CREATE TABLE competitors(
    id_competitor  INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    surname VARCHAR(15) NOT NULL,
    DNI VARCHAR(15) NOT NULL UNIQUE,
    age INT NOT NULL,
    genre ENUM('Male','Female') NOT NULL,
    location VARCHAR(30) NOT NULL,
    nationality VARCHAR(15) NOT NULL,
    bib_number  INT NOT NULL,
    club_federated BOOLEAN NOT NULL
);

CREATE TABLE clubs(
    id_club INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(25)
);

CREATE TABLE competitor_club (
    competitor_id INT,
    club_id INT,
    PRIMARY KEY (competitor_id, club_id),
    CONSTRAINT FK_competitor FOREIGN KEY (competitor_id) REFERENCES competitors(id_competitor),
    CONSTRAINT FK_club FOREIGN KEY (club_id) REFERENCES clubs(id_club)
);

CREATE TABLE inscriptions (
    id_inscription INT PRIMARY KEY AUTO_INCREMENT,
    competitor_id INT,
    race_id INT,
    category_id INT,
    FOREIGN KEY (competitor_id) REFERENCES competitors(id_competitor),
    FOREIGN KEY (race_id) REFERENCES racing(id_race),
    FOREIGN KEY (category_id) REFERENCES categories(id_category)
);

INSERT INTO competitors (name, surname, DNI, age, genre, location, nationality, bib_number, club_federated)
VALUES ('CompetidorInfantil', 'ApellidoInfantil', '12345678A', 10, 'Male', 'CiudadInfantil', 'NacionalidadInfantil', 1001, 0);

INSERT INTO competitors (name, surname, DNI, age, genre, location, nationality, bib_number, club_federated)
VALUES ('CompetidorJunior', 'ApellidoJunior', '12345678B', 20, 'Female', 'CiudadJunior', 'NacionalidadJunior', 2002, 1);

INSERT INTO competitors (name, surname, DNI, age, genre, location, nationality, bib_number, club_federated)
VALUES ('CompetidorMaster', 'ApellidoMaster', '12345678C', 30, 'Male', 'CiudadMaster', 'NacionalidadMaster', 3003, 0);

INSERT INTO competitors (name, surname, DNI, age, genre, location, nationality, bib_number, club_federated)
VALUES ('CompetidorSenior', 'ApellidoSenior', '12345678D', 40, 'Female', 'CiudadSenior', 'NacionalidadSenior', 4004, 1);