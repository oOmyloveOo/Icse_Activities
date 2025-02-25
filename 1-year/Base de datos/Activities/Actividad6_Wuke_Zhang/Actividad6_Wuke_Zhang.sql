CREATE DATABASE Actividad_6_Hemodonación;

CREATE TABLE Blood(
    id_blood INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(10) NOT NULL
);

CREATE TABLE Donors(
    id_donor INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL
);

CREATE TABLE Receivers(
    id_receiver INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL
);

CREATE TABLE Compatibilities(
    id_compatibililty INT PRIMARY KEY AUTO_INCREMENT,
    donor_type_id INT NOT NULL,
    receiver_type_id INT NOT NULL,
    CONSTRAINT FK_Donors_Blood_Compatibilities FOREIGN KEY(donor_type_id)
    REFERENCES Blood(id_blood),
    CONSTRAINT FK_Receivers_Blood_Compatibilities FOREIGN KEY(receiver_type_id)
    REFERENCES Blood(id_blood)
);

CREATE TABLE Donations(
    id_donation INT PRIMARY KEY AUTO_INCREMENT,
    receiver_id INT NOT NULL,
    donor_id INT NOT NULL,
    donated_blood_type_id INT NOT NULL,
    donation_dates DATE NOT NULL,
    transfusion_dates DATE NOT NULL,
    direction VARCHAR(15) NOT NULL,
    CONSTRAINT FK_Receivers_Donations FOREIGN KEY(receiver_id)
    REFERENCES Receivers(id_receiver),
    CONSTRAINT FK_Donors_Donations FOREIGN KEY(donor_id)
    REFERENCES Donors(id_donor),
    CONSTRAINT FK_Blood_Donations FOREIGN KEY(donated_blood_type_id)
    REFERENCES Blood(id_blood)
);

INSERT INTO Blood (type)
VALUES ('A+'), ('A-'), ('B+'), ('B-'), 
('AB+'), ('AB-'), ('O+'), ('O-');


INSERT INTO Donors (name)
VALUES('Pepe'),('Antu'),('Joaco');

INSERT INTO Receivers (name)
VALUES('Koke'),('Mendoza'),('Monosable');

INSERT INTO Compatibilities (donor_type_id,receiver_type_id)
VALUES(1,1),(1,5),(3,3),(3,5),(5,5);

INSERT INTO Donations (receiver_id, donor_id, donated_blood_type_id, donation_dates, transfusion_dates, direction)
VALUES
    (1, 3, 5, '2017-06-15', '2017-06-16', 'Tamaraceite'),
    (2, 1, 1, '2017-06-1', '2017-06-2', 'Telde'),
    (3, 2, 3, '2017-01-15', '2017-02-01', 'Vecindario');



//* All the donations with his respective donated blood type *//
SELECT * FROM `Donations` 
JOIN Blood ON id_blood = donated_blood_type_id;


//* All the compatibilities with his respective type *//
SELECT * FROM `compatibilities`
JOIN blood AS donor_blood ON donor_blood.id_blood = donor_type_id
JOIN blood AS receiver_blood ON receiver_blood.id_blood = receiver_type_id;

