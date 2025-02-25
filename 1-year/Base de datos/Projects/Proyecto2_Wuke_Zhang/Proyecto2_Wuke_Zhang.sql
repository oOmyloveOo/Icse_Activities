 CREATE DATABASE PROYECTO2;

 USE PROYECTO2;

CREATE TABLE element(
    id INT(15) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) UNIQUE,
    symbol VARCHAR(5) UNIQUE,
    number INT(10) UNIQUE,
    mass VARCHAR(15) NOT NULL,
    element_group INT(10) NOT NULL,
    period INT(10) NOT NULL,
    element_type_id INT(15) NOT NULL,
    CONSTRAINT FK_element_element_type FOREIGN KEY (element_type_id)
    REFERENCES element_type(id)
);

INSERT INTO `element` (`id`, `name`, `symbol`, `number`, `mass`, `element_group`, `period`,`element_type_id`) VALUES
(1, 'Hydrogen', 'H', 1, 1.00794, 1, 1,8),
(2, 'Helium', 'He', 2, 4.0026, 18, 1,10),
(3, 'Lithium', 'Li', 3, 6.941, 1, 2,1),
(4, 'Beryllium', 'Be', 4, 9.01218, 2, 2,2),
(5, 'Boron', 'B', 5, 10.811, 13, 2,2),
(6, 'Carbon', 'C', 6, 12.0107, 14, 2,8),
(7, 'Nitrogen', 'N', 7, 14.0067, 15, 2,8),
(8, 'Oxygen', 'O', 8, 15.9994, 16, 2,8),
(9, 'Flourine', 'F', 9, 18.9984, 17, 2,9),
(10, 'Neon', 'Ne', 10, 20.1797, 18, 2,10),
(11, 'Sodium', 'Na', 11, 22.9898, 1, 3,1),
(12, 'Magnesium', 'Mg', 12, 24.305, 2, 3,2),
(13, 'Aliminum', 'Al', 13, 26.9815, 13, 3,7),
(14, 'Silicon', 'Si', 14, 28.0855, 14, 3,2),
(15, 'Phophorus', 'P', 15, 30.9738, 15, 3,8),
(16, 'Sulfur', 'S', 16, 32.065, 16, 3,8),
(17, 'Chlorine', 'Cl', 17, 35.453, 17, 3,9),
(18, 'Argon', 'Ar', 18, 39.948, 18, 3,10),
(19, 'Potassium', 'K', 19, 39.098, 1, 4,1),
(20, 'Calcium', 'Ca', 20, 40.078, 2, 4,2),
(21, 'Scandium', 'Sc', 21, 44.9559, 3, 4,7),
(22, 'Titanium', 'Ti', 22, 47.867, 4, 4,7),
(23, 'Vanadium', 'V', 23, 50.9415, 5, 4,7),
(24, 'Chromium', 'Cr', 24, 51.9961, 6, 4,7),
(25, 'Manganese', 'Mn', 25, 54.938, 7, 4,7),
(26, 'Iron', 'Fe', 26, 55.845, 8, 4,7),
(27, 'Cobalt', 'Co', 27, 58.9332, 9, 4,7),
(28, 'Nickel', 'Ni', 28, 58.6934, 10, 4,7),
(29, 'Copper', 'Cu', 29, 63.546, 11, 4,7),
(30, 'Zinc', 'Zn', 30, 65.409, 12, 4,7),
(31, 'Galium', 'Ga', 31, 69.723, 13, 4,7),
(32, 'Germanium', 'Ge', 32, 72.64, 14, 4,2),
(33, 'Arsenic', 'As', 33, 74.9216, 15, 4,2),
(34, 'Selenium', 'Se', 34, 78.96, 16, 4,8),
(35, 'Bromine', 'Br', 35, 79.904, 17, 4,9),
(36, 'Krypton', 'Kr', 36, 83.798, 18, 4,10),
(37, 'Rubidium', 'Rb', 37, 85.4678, 1, 5,1),
(38, 'Strontium', 'Sr', 38, 87.62, 2, 5,2),
(39, 'Yttrium', 'Y', 39, 88.9059, 3, 5,7),
(40, 'Zirconium', 'Zr', 40, 91.224, 4, 5,7),
(41, 'Niobium', 'Nb', 41, 92.9064, 5, 5,7),
(42, 'Molybdenum', 'Mo', 42, 95.94, 6, 5,7),
(43, 'Technetium', 'Tc', 43, 99, 7, 5,7),
(44, 'Ruthenium', 'Ru', 44, 101.07, 8, 5,7),
(45, 'Rhodium', 'Rh', 45, 102.906, 9, 5,7),
(46, 'Palladium', 'Pd', 46, 106.42, 10, 5,7),
(47, 'Silver', 'Ag', 47, 107.868, 11, 5,7),
(48, 'Cadmium', 'Cd', 48, 112.411, 12, 5,7),
(49, 'Indium', 'In', 49, 114.813, 13, 5,7),
(50, 'Tin', 'Sn', 50, 118.71, 14, 5,7),
(51, 'Antimony', 'Sb', 51, 121.76, 15, 5,2),
(52, 'Tellurium', 'Te', 52, 127.6, 16, 5,2),
(53, 'Iodine', 'I', 53, 126.904, 17, 5,9),
(54, 'Xenon', 'Xe', 54, 131.293, 18, 5,10),
(55, 'Cesium', 'Cs', 55, 132.905, 1, 6,1),
(56, 'Barium', 'Ba', 56, 137.327, 2, 6,2),
(57, 'Lanthanum', 'La', 57, 138.906, 0, 6,3),
(58, 'Cerium', 'Ce', 58, 140.116, 0, 6,3),
(59, 'Praseodymiu', 'Pr', 59, 140.908, 0, 6,3),
(60, 'Neodymium', 'Nd', 60, 144.24, 0, 6,3),
(61, 'Promethium', 'Pm', 61, 145, 0, 6,3),
(62, 'Samarium', 'Sm', 62, 150.36, 0, 6,3),
(63, 'Europium', 'Eu', 63, 151.964, 0, 6,3),
(64, 'Gadollnium', 'Gd', 64, 157.25, 0, 6,3),
(65, 'Terbium', 'Tb', 65, 158.925, 0, 6,3),
(66, 'Dysprosium', 'Dy', 66, 162.5, 0, 6,3),
(67, 'Holmium', 'Ho', 67, 164.93, 0, 6,3),
(68, 'Erbium', 'Er', 68, 167.259, 0, 6,3),
(69, 'Thulium', 'Tm', 69, 168.934, 0, 6,3),
(70, 'Ytterbium', 'Yb', 70, 173.04, 0, 6,3),
(71, 'Luteium', 'Lu', 71, 174.967, 3, 6,7),
(72, 'Hafnium', 'Hf', 72, 178.49, 4, 6,7),
(73, 'Tantalum', 'Ta', 73, 180.947, 5, 6,7),
(74, 'Tungsten', 'W', 74, 183.84, 6, 6,7),
(75, 'Rhenium', 'Re', 75, 186.207, 7, 6,7),
(76, 'Osmium', 'Os', 76, 190.23, 8, 6,7),
(77, 'Iridium', 'Ir', 77, 192.217, 9, 6,7),
(78, 'Platinum', 'Pt', 78, 195.078, 10, 6,7),
(79, 'Gold', 'Au', 79, 196.967, 11, 6,7),
(80, 'Mercury', 'Hg', 80, 200.59, 12, 6,7),
(81, 'Thallium', 'Tl', 81, 204.383, 13, 6,7),
(82, 'Lead', 'Pb', 82, 207.2, 14, 6,7),
(83, 'Bismuth', 'Bi', 83, 208.98, 15, 6,7),
(84, 'Polonium', 'Po', 84, 210, 16, 6,2),
(85, 'Astatine', 'At', 85, 210, 17, 6,9),
(86, 'Radon', 'Rn', 86, 222, 18, 6,10),
(87, 'Francium', 'Fr', 87, 223, 1, 7,1),
(88, 'Radium', 'Ra', 88, 226, 2, 7,2),
(89, 'Actinium', 'Ac', 89, 227, 0, 7,3),
(90, 'Thorium', 'Th', 90, 232.038, 0, 7,3),
(91, 'Protactiniu', 'Pa', 91, 231.036, 0, 7,3),
(92, 'Uranium', 'U', 92, 238.029, 0, 7,3),
(93, 'Neptunium', 'Np', 93, 237, 0, 7,3),
(94, 'Plutonium', 'Pu', 94, 244, 0, 7,3),
(95, 'Americium', 'Am', 95, 243, 0, 7,3),
(96, 'Curium', 'Cm', 96, 247, 0, 7,3),
(97, 'Berkelium', 'Bk', 97, 247, 0, 7,3),
(98, 'Californium', 'Cf', 98, 251, 0, 7,3),
(99, 'Einsteinium', 'Es', 99, 254, 0, 7,3),
(100, 'Fermium', 'Fm', 100, 257, 0, 7,3),
(101, 'Mendelevium', 'Md', 101, 260, 0, 7,3),
(102, 'Nobelium', 'No', 102, 259, 0, 7,3),
(103, 'Lawrencium', 'Lr', 103, 262, 3, 7,7),
(104, 'Rutherfordi', 'Rf', 104, 261, 4, 7,7),
(105, 'Dubnium', 'Db', 105, 262, 5, 7,7),
(106, 'Seaborgium', 'Sg', 106, 266, 6, 7,7),
(107, 'Bohrium', 'Bh', 107, 262, 7, 7,7),
(108, 'Hassium', 'Hs', 108, 265, 8, 7,7),
(109, 'Meitnerium', 'Mt', 109, 266, 9, 7,7),
(110, 'Darmstadtiu', 'Ds', 110, 281, 10, 7,7),
(111, 'Roentgenium', 'Rg', 111, 272, 11, 7,7),
(112, 'Copernicium', 'Cn', 112, 285, 12, 7,7),
(113, 'Ununtrium', 'Uut', 113, 284, 13, 7,7),
(114, 'Flerovium', 'Fl', 114, 289, 14, 7,7),
(115, 'Ununpentium', 'Uup', 115, 288, 15, 7,7),
(116, 'Livermorium', 'Lv', 116, 293, 16, 7,7),
(117, 'Ununseptium', 'Uus', 117, 294, 17, 7,9),
(118, 'Ununoctium', 'Uuo', 118, 294, 18, 7,10);

CREATE TABLE element_type(
   id INT(15) PRIMARY KEY AUTO_INCREMENT,
   kinda VARCHAR(15) NOT NULL,
   description VARCHAR(15)
);

INSERT INTO element_type (kinda)
VALUES("Alkali metals"),
("Alkaline earth metals"),
("Lanthanides"),
("Actinide"),
("Pransition metals"),
("Post-transition metals"),
("Metalloids"),
("No metals"),
("Halogens"),
("Noble gases");