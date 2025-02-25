CREATE DATABASE Actividad8;

USE Actividad8;


CREATE TABLE Courses(
    Id_course INT PRIMARY KEY AUTO_INCREMENT,
    Subject ENUM('Formation_training','Informatic_system_programation', 'Support_people_risk_social_exclusion',
    'Sound_image','Cooking_restoration','Sport_animation')
);

CREATE TABLE Teachers(
    Id_teacher INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(15) NOT NULL,
    Surname VARCHAR(15) NOT NULL
);

CREATE TABLE Classrooms(
    Id_classroom INT PRIMARY KEY AUTO_INCREMENT,
    Rooms ENUM('1.1-Informatic_room','1.2-Normal_room','1.3-Health_workshop_room','2.1-Image_workshop_room'
    ,'2.2-Restaurant_workshop_room','2.3-Gym_room')
);

CREATE TABLE Relations(
    Id_relation INT PRIMARY KEY AUTO_INCREMENT,
    Course_id INT NOT NULL,
    Teacher_id INT NOT NULL,
    Classroom_id INT NOT NULL,
    CONSTRAINT FK_Relations_Courses FOREIGN KEY (Course_id)
    REFERENCES Courses(Id_course),
    CONSTRAINT FK_Relations_Teachers FOREIGN KEY (Teacher_id)
    REFERENCES Teachers(Id_teacher),
    CONSTRAINT FK_Relations_Classrooms FOREIGN KEY (Classroom_id)
    REFERENCES Classrooms(Id_classroom)
);

INSERT INTO Courses(Subject)
VALUES('Formation_training'),('Informatic_system_programation'),('Support_people_risk_social_exclusion'),('Sound_image'),('Cooking_restoration'),
('Sport_animation');

INSERT INTO Teachers(Name,Surname)
VALUES('Hadriel','Quintero'),('Abián','Mejías'),('Diego','Lozano'),('Gabriel','Gordillo'),('Álvaro','Doblado');

INSERT INTO Classrooms(Rooms)
VALUES('1.1-Informatic_room'),('1.2-Normal_room'),('1.3-Health_workshop_room'),('2.1-Image_workshop_room'),('2.2-Restaurant_workshop_room'),('2.3-Gym_room');

INSERT INTO Relations(Course_id,Teacher_id,Classroom_id)
VALUES(2,1,1),(1,2,3),(3,3,3),(4,4,4),(5,4,5),(6,5,6);


//*All the relations with his respective info*//
SELECT Subject,Id_teacher,Name,Surname,Rooms,Id_relation FROM Relations
JOIN Courses ON Id_course = Course_id
JOIN Teachers ON Id_teacher = Teacher_id
JOIN Classrooms ON Id_classroom = Classroom_id
