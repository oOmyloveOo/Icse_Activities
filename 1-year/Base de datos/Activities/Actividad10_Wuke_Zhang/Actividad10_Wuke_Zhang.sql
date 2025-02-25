CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(10) UNIQUE NOT NULL,
    Description VARCHAR(10),
    Picture VARCHAR(10)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(10),
    ContactName VARCHAR(10),
    ContactTitle VARCHAR(10),
    Address VARCHAR(10),
    City VARCHAR(10),
    PostalCode VARCHAR(10),
    Country VARCHAR(10),
    Phone VARCHAR(15),
    Fax VARCHAR(15),
    HomePage TEXT
);

CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    CompanyName VARCHAR(10),
    Phone VARCHAR(15)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CompanyName VARCHAR(10),
    ContactName VARCHAR(10),
    ContactTitle VARCHAR(10),
    Address VARCHAR(10),
    City VARCHAR(10),
    Region VARCHAR(10),
    PostalCode VARCHAR(10),
    Country VARCHAR(10),
    Phone VARCHAR(15),
    Fax VARCHAR(15)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(10),
    FirstName VARCHAR(10),
    Title VARCHAR(10),
    TitleOfCourtesy VARCHAR(10),
    BirthDate DATETIME,
    HireDate DATETIME,
    Address VARCHAR(10),
    City VARCHAR(10),
    Region VARCHAR(10),
    PostalCode VARCHAR(10),
    Country VARCHAR(10),
    HomePhone VARCHAR(15),
    Extension VARCHAR(10),
    Photo VARCHAR(10),
    Notes TEXT,
    ReportsTo VARCHAR(10)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(10),
    SupplierID INT,
    CategoryID INT,
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued BIT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATETIME,
    RequiredDate DATETIME,
    ShippedDate DATETIME,
    ShipVia INT,
    Freight DECIMAL(10, 2),
    ShipName VARCHAR(10),
    ShipAddress VARCHAR(10),
    ShipCity VARCHAR(10),
    ShipRegion VARCHAR(10),
    ShipPostalCode VARCHAR(10),
    ShipCountry VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ShipVia) REFERENCES  Shippers(ShipperID)
);

CREATE TABLE OrderDetails (
  OrderID INT,
  ProductID INT,
  UnitPrice DECIMAL(10,2),
  Quantity INT,
  Discount DECIMAL(10,2),
  PRIMARY KEY (OrderID, ProductID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE INDEX CompanyNameIDX
ON Suppliers (CompanyName);

CREATE INDEX PostalCodeIDX2_Suppliers
ON Suppliers (PostalCode);

CREATE INDEX ProductNameIDX
ON Products (ProductName);

CREATE INDEX LastNameIDX
ON  Employees (LastName);

CREATE INDEX PostalCodeIDX2_Employees
ON Employees  (PostalCode);

CREATE INDEX OrderDateIDX
ON Orders (OrderDate);

CREATE INDEX ShippedDateIDX
ON Orders (ShippedDate);

CREATE INDEX ShipPostalCodeIDX
ON Orders  (ShipPostalCode);

CREATE INDEX CompanyNameIDX_Customers
ON Customers  (CompanyName);

CREATE INDEX CityIDX
ON Customers (City);

CREATE INDEX RegionIDX
ON  Customers (Region);

CREATE INDEX PostalCodeIDX3
ON Customers (PostalCode);


