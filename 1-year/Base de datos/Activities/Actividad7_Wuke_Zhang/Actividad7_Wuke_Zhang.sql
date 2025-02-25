CREATE DATABASE Actividad7;

USE Actividad7;


CREATE TABLE People(
    Id_person INT PRIMARY KEY,
    Name VARCHAR(15) NOT NULL,
    Hair_type VARCHAR(15) NOT NULL,
    Hair_color VARCHAR(15) NOT NULL,
    Genre ENUM('Male','Female') NOT NULL,
    Skin_tone ENUM('White','Black') NOT NULL,
    Beard BOOLEAN NOT NULL,
    Glasses BOOLEAN NOT NULL,
    Apperance ENUM('Adult','Teen','Old') NOT NULL,
    Arm_raised BOOLEAN NOT NULL,
    Clothes VARCHAR(15) NOT NULL,
    Button BOOLEAN NOT NULL,
);

CREATE TABLE People_Discarded(
    Id_people_discarded INT PRIMARY KEY AUTO_INCREMENT,
    Person_id INT NOT NULL,
    Discarded BOOLEAN,
    CONSTRAINT FK_Characteristics_People_People FOREIGN KEY (Person_id)
    REFERENCES People(Id_person)
);

CREATE TABLE Questions(
    Id_question INT PRIMARY KEY AUTO_INCREMENT,
    Hair_type BOOLEAN NOT NULL,
    Hair_color BOOLEAN NOT NULL,
    Genre BOOLEAN NOT NULL,
    Skin_tone BOOLEAN NOT NULL,
    Beard BOOLEAN NOT NULL,
    Glasses BOOLEAN NOT NULL,
    Apperance BOOLEAN NOT NULL,
    Arm_raised BOOLEAN NOT NULL,
    Clothes BOOLEAN NOT NULL,
    Button BOOLEAN NOT NULL,
    Person_id INT NOT NULL,
    CONSTRAINT FK_Characteristics_People_People FOREIGN KEY (Person_id)
    REFERENCES People(Id_person)
);


INSERT INTO People (Name,Hair_type,Hair_color,Genre,Skin_tone,Beard,Glasses,Apperance,Arm_raised,Clothes,Button)
VALUES ('Paco','straight','Brown','Male','White','TRUE','FALSE','Adult','FALSE','Coat','TRUE'),('Alba'),('Daniel'),('Rafa'),('Paz'),('Noelia'),('Elisa'),('Jorge'),('Pablo'),('Irene'),('Mar'),('Antonio'),('Elena'),('Rosa'),('Lucas'),('Iván'),('Carmen'),
('Tomás'),('Carlos'),('Luis'),('Manolo'),('Julia'),('Paula'),('Cristina'),('Juan'),('Maria'),('Tatiana'),('Lucía');

//*Inserciones de descarte, para cuando adivines*//

INSERT INTO People_Discarded (Person_id,Discarded)
VALUES (1);

//*Inserciones según lo que pregunten*//

INSERT INTO Questions(Hair_type,Hair_color,Genre,Skin_tone,Beard,Glasses,Apperance,Arm_raised,Clothes,Button,Person_id)
VALUES('TRUE','TRUE','TRUE','TRUE','TRUE','TRUE','TRUE','TRUE','TRUE','TRUE','TRUE',1);

