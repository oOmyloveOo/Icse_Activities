CREATE DATABASE repaso;

CREATE TABLE pupiles(
    id_pupil INT AUTO_INCREMENT PRIMARY KEY;
    Enrollment_Num INT UNIQUE NOT NULL;
    Name VARCHAR(15) NOT NULL;
    Born_Date DATE NOT NULL;
    Phone_Num INT NOT NULL
);

CREATE TABLE subjects(
    id_subject INT  AUTO_INCREMENT PRIMARY KEY, 
    Subject_cod INT NOT NULL;
    Name VARCHAR(15) NOT NULL
);

CREATE TABLE teachers(
    id_teacher INT AUTO_INCREMETN PRIMARY KEY;
    Name VARCHAR(15) NOT NULL;
    DNI VARCHAR(15) NOT NULL;
    Speciality VARCHAR(30);
    Phone_Num INT NOT NULL
);

CREATE TABLE courses(
    id_course INT AUTO_INCREMENT PRIMARY KEY;
    Course_Name VARCHAR(20) NOT NULL;
    Course_year CHAR(4) NOT NULL;
    pupil_id INT NOT NULL;
    subject_id INT NOT NULL;
    teacher_id INT;
    CONSTRAINt FK_course_teacher FOREING KEY(teacher_id)
    REFERENCES teacher(id_teacher);
    CONSTRAINt FK_course_subject FOREING KEY(subject_id)
    REFERENCES subject(id_subject);
    CONSTRAINT FK_course_alumno FOREING KEY(pupil_id)
    REFERENCES pupil(id_pupil)
);

/* Se quiere saber el curso escolar en el que cada alumno está matriculado de cada asignatura. */

SELECT * FROM course
JOIN pupil ON pupil_id = id_pupil
JOIN subject ON subject_id = id_subject;

CREATE TABLE regions(
    id_region INT AUTO_INCREMENT PRIMARY KEY;
    Region_cod INT NOT NULL;
    Region_name VARCHAR(15) NOT NULL
);

CREATE TABLE provinces(
    id_province INT AUTO_INCREMENT PRIMARY KEY;
    Province_cod INT NOT NULL;
    Province_name VARCHAR(15) NOT NULL;
    region_id INT;
    CONSTRAINT FK_province_region  FOREIGN KEY (region_id)
    REFERENCES region(id_region)
);

CREATE TABLE localities(
    id_locality INT AUTO_INCREMENT PRIMARY KEY;
    Locality_cod INT NOT NULL;
    Locality_name VARCHAR(15) NOT NULL;
    province_id INT;
    CONSTRAINT FK_locality_province FOREIGN KEY (province_id) 
    REFERENCES province(id_province)
);

CREATE TABLE employees(
    id_employee INT AUTO_INCREMENT PRIMARY KEY;
    Employee_name VARCHAR(15) NOT NULL;
    Employee_surname VARCHAR(15) Not NULL;
    DNI VARCHAR(10) UNIQUE NOT NULL;
    Phone_Num INT NOT NULL;
    Salary VARCHAR(10) NOT NULL;
    locality_id INT;
    CONSTRAINT FK_employee_locality FOREIGN KEY (locality_id)
    REFERENCES locality(id_locality)
);