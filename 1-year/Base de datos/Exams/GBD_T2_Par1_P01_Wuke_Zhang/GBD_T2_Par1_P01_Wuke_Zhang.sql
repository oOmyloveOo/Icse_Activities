CREATE DATABASE icseflix;

CREATE TABLE User(
    Id_user INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(15) NOT NULL,
    Surname VARCHAR(15) NOT NULL,
    Email VARCHAR(15) UNIQUE,
    PhoneNumber VARCHAR(15) NOT NULL,
    CreditCard VARCHAR(30) UNIQUE
);

CREATE TABLE Genre(
    Id_genre INT PRIMARY KEY AUTO_INCREMENT,
    Genres ENUM ('Action','Adventure','Comedy','Drama','Fantasy','Horror') NOT NULL,
    User_id INT,
    CONSTRAINT FK_Genre_User FOREIGN KEY (User_id)
    REFERENCES User(Id_user)
);


CREATE TABLE Titles(
    Id_title INT PRIMARY KEY  AUTO_INCREMENT,
    TitleName VARCHAR(25) NOT NULL,
    Released_year DATE NOT NULL,
    Synopsis TEXT,
    Age_range ENUM ('All','13_years','16_years','18_years') NOT NULL,
    Genre_id INT,
    CONSTRAINT FK_Titles_Genre FOREING KEY (Genre_id)
    REFERENCES Genre(Id_genre)
);

CREATE TABLE Seasons(
    Id_season INT PRIMARY KEY AUTO_INCREMENT,
    Season_number INT NOT NULL,
    Title_id INT,
    CONSTRAINT FK_Season_Title FOREIGN KEY (Title_id)
    REFERENCES Titles(Id_title)
);

CREATE TABLE  Episodes(
   Id_episode INT PRIMARY KEY AUTO_INCREMENT,
   Episode_number INT NOT NULL,
   Episode_name VARCHAR(40),
   Season_id INT,
   CONSTRAINT FK_Episodes_Seasons FOREIGN KEY (Season_id)
   REFERENCES Seasons(Id_season)
);

CREATE TABLE Follows(
    Id_followed INT,
    Id_followers INT,
    PRIMARY KEY (Id_followers, Id_followed),
    FOREIGN KEY (Id_followers) REFERENCES User(Id_user),
    FOREIGN KEY (Id_followed) REFERENCES User(Id_user)
);

CREATE TABLE  Rates(
    Id_rate INT PRIMARY KEY AUTO_INCREMENT,
    Stars ENUM('1', '2','3', '4', '5'),
    Comments TEXT,
    user_Id INT,
    title_Id INT,  
    CONSTRAINT FK_Rates_User FOREIGN KEY (user_Id) 
    REFERENCES User(Id_user),
    CONSTRAINT FK_Rates_Titles FOREIGN KEY (title_Id) 
    REFERENCES Titles(Id_title)
);


