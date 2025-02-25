CREATE TABLE Library(
    id_library INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    ubication VARCHAR(15) NOT NULL
);
CREATE TABLE Books(
    id_book INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(15) NOT NULL,
    author VARCHAR(15) NOT NULL,
    release_year DATE NOT NULL,
    Library_id INT,
    CONSTRAINT FK_Library_Books FOREIGN KEY (Library_id)
    REFERENCES Library(id_library)
);
CREATE TABLE Member(
    id_member INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    email VARCHAR(30) NOT NULL,
);
CREATE TABLE Loan(
    id_loan INT PRIMARY KEY AUTO_INCREMENT,
    CONSTRAINT FK_Books_Loan FOREIGN KEY (Books_id)
    REFERENCES Books(id_book),
    Books_id INT,
    CONSTRAINT FK_Loan_Member FOREIGN KEY (Member_id)
    REFERENCES Member(id_member),
    Member_id INT,
    loan_date DATE NOT NULL,
    refund_date DATE NOT NULL
);