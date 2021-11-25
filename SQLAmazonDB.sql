CREATE DATABASE AMAZONDB;
USE AMAZONDB
CREATE TABLE User1 (
UserID nvarchar(20) NOT NULL UNIQUE,
Password nvarchar(20) NOT NULL,
CONSTRAINT PK_User PRIMARY KEY (UserID)
);

CREATE TABLE Customer (
CustomerID nvarchar(20) NOT NULL UNIQUE,
UserID nvarchar(20) NOT NULL UNIQUE,
FirstName varchar(20) not null,
LastName varchar(20) not null,
Address nvarchar(30) not null,
PhoneNumber int not null,
Email varchar(30) not null,

CONSTRAINT PK_Customer PRIMARY KEY (CustomerID),

CONSTRAINT FK_CustomerUser FOREIGN KEY (UserID)
    REFERENCES User1(UserID)
);

CREATE TABLE Admin(
EmployeeID nvarchar(20) not null unique,
UserID nvarchar(20) NOT NULL UNIQUE,
CONSTRAINT PK_Admin PRIMARY KEY (EmployeeID),
CONSTRAINT FK_AdminUser FOREIGN KEY (UserID)
REFERENCES User1(UserID)
);

CREATE TABLE Category(
CategoryID int not null unique,
CategoryName varchar(50) not null,
CategoryDetails nvarchar(500),
CONSTRAINT PK_Category PRIMARY KEY (CategoryID)
);

CREATE TABLE Supplier(
SupplierID varchar(20) not null unique,
SupplierName varchar(20) not null
CONSTRAINT PK_Supplier PRIMARY KEY (SupplierID)
);

CREATE TABLE Product(
ProductID int not null unique,
ProductName varchar(20) not null,
ProductQuantity int not null,
ProductDetails nvarchar(500),
ProductPrice decimal not null

CONSTRAINT PK_Product PRIMARY KEY (ProductID)
);

CREATE TABLE ShippingDetails(
ShippingID varchar(20) not null unique,
ShippingType nvarchar(30) not null,
ShippingCost decimal not null,
ShippingDate datetime not null,
CONSTRAINT PK_ShippingDetails PRIMARY KEY (ShippingID)
);


CREATE TABLE ShoppingCart(
CartID varchar(20) not null unique,
ProductID int not null unique,
Address varchar(30) not null,
Quntity int not null,
Date datetime not null
CONSTRAINT PK_ShoppingCart PRIMARY KEY (CartID),

CONSTRAINT FK_ShoppingCartProduct FOREIGN KEY (ProductID)
REFERENCES Product(ProductID)

);

CREATE TABLE CartItem (
CartItemID varchar(20) not null unique,
ProductID int not null unique,
ProductName varchar(20) not null,
Quantity int not null,
Subtotal decimal not null,

CONSTRAINT PK_CartItem PRIMARY KEY (CartItemID),

CONSTRAINT FK_CartItemProduct FOREIGN KEY (ProductID)
REFERENCES Product(ProductID)
);

CREATE TABLE Orders (
OrderID varchar(20) not null unique,
CustomerID nvarchar(20) not null unique,
ShippingID varchar(20) not null unique,
CustomerName nvarchar(30) not null,
DateCreated datetime not null,
DateShipped datetime not null,
Status nvarchar(30) not null,
PriorityMail bit not null

CONSTRAINT PK_Orders PRIMARY KEY (OrderID),

CONSTRAINT FK_OrdersCustomer FOREIGN KEY (CustomerID)
REFERENCES Customer(CustomerID),

CONSTRAINT FK_OrdersShippingDetails FOREIGN KEY (ShippingID)
REFERENCES ShippingDetails(ShippingID)
);


--data insertion
--USER1
INSERT INTO User1(UserID,Password)
values (1, 'bank123');
INSERT INTO User1(UserID,Password)
values (1,'voda98@');
INSERT INTO User1(UserID,Password)
values (2,'alexonline');
INSERT INTO User1(UserID,Password)
values ( 2,'56569aaa');
INSERT INTO User1(UserID,Password)
values (3,'6569898');
INSERT INTO User1(UserID,Password)
values (3,'stef45!');

--Customer
INSERT INTO Customer(CustomerID,UserID,FirstName,LastName,Address,PhoneNumber,Email)
values (22,1,'Alexandra', 'Stoyanova', 'Bul.Bulgaria 256',0877456256, 'astojanova00@gmail.com');
INSERT INTO Customer(CustomerID,UserID,FirstName,LastName,Address,PhoneNumber,Email)
values (31,4,'Stefaniya','Ilievska', 'Golacka 56',0878666666,'stefanijailievska12@yahoo.com');
INSERT INTO Customer(CustomerID,UserID,FirstName,LastName,Address,PhoneNumber,Email)
values (12,2,'Sara', 'Nikolova', 'Pitu Guli 37', 078965896,'snikolova09@gmail.com');
INSERT INTO Customer(CustomerID,UserID,FirstName,LastName,Address,PhoneNumber,Email)
values  (42,5,'Atanas', 'Atanasov','Bul.Bulgaria 47',0899569856,'aat47@abv.bg');
INSERT INTO Customer(CustomerID,UserID,FirstName,LastName,Address,PhoneNumber,Email)
values (15,3,'Ivan','Ivanov','Bul.Solun 65', 0879999666,'iivan123@abv.bg');
INSERT INTO Customer(CustomerID,UserID,FirstName,LastName,Address,PhoneNumber,Email)
values (16,6,'Louise','Freeman','Bankq 56',0899698698, 'lfreeman@gmail.com');


--Admin
INSERT INTO Admin(EmployeeID,UserID)
values('as122',1);
INSERT INTO Admin(EmployeeID,UserID)
values('sn26',2);


--Category
INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(222,'Accessories','New, Certified refurbished, and Used');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(236,'Automotive and Powersports','New, Certified refurbished, and Used');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(276,'Baby Products','New');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(336,'Beauty','New');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(289,'Books','New,Used,Collectible');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(263,'Camera and Photo','New,Certified, Refurbished, New');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(666,'Cell Phones and Accessories','New,Used,Certified, Fefurbished,Unlocked');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(365,'Collectibles','Collectible like new');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(596,'Consumer Electronics','New, Certified Refurbished, Used');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(756,'Fine Art','New, Antique');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(996,'Grocery and Gourmet Foods','New');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(789,'Health and Personal Care','New');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(459,'Home and Garden','New,Certified refurbished,Used,Collectible');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(176,'Major Appliances','New,Used,Collectible');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(669,'Music and DVD','New,Used,Collectible');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(676,'Musical Instruments','New,Certified,Used,Collectible');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(287,'Office products','New,Certified,Used,Collectible');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(367,'Outdoors','New,Certified,Used');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(555,'Personal Computers','New, Certified, Used');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(569,'Pet Supplies','New, Certified, Used');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(531,'Software','New, Used');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(739,'Sports','New,Certified refurbished, Used');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(719,'Tools and Home Improvement','New, Certified, Used');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(518,'Toys and Games','New and Collectible');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(572,'Video,DVD, Blu-ray','New, Used, Collectible');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(299,'Video Games','New, Used, Collectible');

INSERT INTO Category(CategoryID,CategoryName,CategoryDetails)
values(999,'Watches','New, Used');

--Supplier

INSERT INTO Supplier(SupplierID,SupplierName)
values(4569,'MEDIMOPS');

INSERT INTO Supplier(SupplierID,SupplierName)
values(4895,'Cloudtail');

INSERT INTO Supplier(SupplierID,SupplierName)
values(4897,'musicMagpie');

INSERT INTO Supplier(SupplierID,SupplierName)
values(2369,'Appario');

INSERT INTO Supplier(SupplierID,SupplierName)
values(1598,'momax fr');

INSERT INTO Supplier(SupplierID,SupplierName)
values(7895,'Pharmapacks');

INSERT INTO Supplier(SupplierID,SupplierName)
values(4598,'World of Book LTD');

INSERT INTO Supplier(SupplierID,SupplierName)
values(9512,'reBuy');

INSERT INTO Supplier(SupplierID,SupplierName)
values(3694,'Zappos');

INSERT INTO Supplier(SupplierID,SupplierName)
values(4259,'Utopia Deals');

INSERT INTO Supplier(SupplierID,SupplierName)
values(3333,'iServe');

INSERT INTO Supplier(SupplierID,SupplierName)
values(6666,'Sky Wing');

--PRODUCT

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('22','Headphones','100','Sony','55');

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('66','Dove Soap','500','Dove for sensitive skin','5');

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('61','Elephan toy','699','Lego','10');

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('65','Superman toy','1220','Lego','56');

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('220','Mug','100','Stainless steel camping coffee mug','55');

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('69','Windows tablet','1400','Windows tablet ab4589 4gb ram','256');

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('45','Rolex watch','100','24 karat gold watch rolex','20000');

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('78','Pandora bracelet','4566','Bracelet with charms - silver 975','150');

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('27','Band aid','14000','Flexible fabric, adhesive,first aid','6');

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('22','Trampoline','100','Amazon exclusive kids','59');

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('99','Paint Markers','100','12 color set','18');

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('76','Dress','10550','HM','61');

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('67','Notebook','45100','ThreeThree','5');

SELECT*FROM Product

--ShoppingCart date constraint
ALTER TABLE ShoppingCart ADD CONSTRAINT DF_ShoppingCart_Date_Default
DEFAULT GETUTCDATE() FOR Date;

--Shopping cart

INSERT INTO ShoppingCart(CartID,ProductID,Address,Quntity)
values('59','67','Bul.Bulgaria 236',2);


INSERT INTO ShoppingCart(CartID,ProductID,Address,Quntity)
values('480','76','Bul.Bulgaria 999',1);


INSERT INTO ShoppingCart(CartID,ProductID,Address,Quntity)
values('99','99','Pitu Guli',5);


INSERT INTO ShoppingCart(CartID,ProductID,Address,Quntity)
values('59','67','Bul.Bulgaria 236',2);


INSERT INTO ShoppingCart(CartID,ProductID,Address,Quntity)
values('77','45','Bul.Solun',4);


INSERT INTO ShoppingCart(CartID,ProductID,Address,Quntity)
values('47','77','Bankq 56',2);


SELECT*FROM ShoppingCart


--Subtotal SUM

SELECT 
    ProductID, 
    SUM(ProductPrice * ProductQuantity) subtotal
FROM
    Product
GROUP BY ProductID
ORDER BY subtotal DESC;


--CART ITEM

INSERT INTO CartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (45,'99','Paint Markers',5,140);

INSERT INTO CartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (78,'67','Notebook',5,156);

INSERT INTO CartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (55,'45','Rolex watch',1,20000);

INSERT INTO CartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (49,'69','Windows tablet',1,256);

select*from CartItem


--SHIPPING DATE CONSTRAINT
ALTER TABLE ShippingDetails ADD CONSTRAINT DF_ShippinfDetails_ShippingDate_Default
DEFAULT GETUTCDATE() FOR ShippingDate;

---shipping details

INSERT INTO ShippingDetails(ShippingID,ShippingType,ShippingCost)
VALUES(323,'DHL',5);

INSERT INTO ShippingDetails(ShippingID,ShippingType,ShippingCost)
VALUES(666,'China Post',2);

INSERT INTO ShippingDetails(ShippingID,ShippingType,ShippingCost)
VALUES(498,'DHL',10);

INSERT INTO ShippingDetails(ShippingID,ShippingType,ShippingCost)
VALUES(325,'Amazon prime',0);

INSERT INTO ShippingDetails(ShippingID,ShippingType,ShippingCost)
VALUES(789,'FDX',30);

INSERT INTO ShippingDetails(ShippingID,ShippingType,ShippingCost)
VALUES(773,'Amazon regular',10);


--ORDER

ALTER TABLE Orders ADD CONSTRAINT DF_DateCreated_Default
DEFAULT GETUTCDATE() FOR DateCreated;

ALTER TABLE Orders ADD CONSTRAINT DF_DateShipped_Default
DEFAULT GETUTCDATE() FOR DateShipped;

INSERT INTO Orders(OrderID,CustomerID,ShippingID,CustomerName,Status,PriorityMail)
values(4566,31,773,'Stefaniya Ilievska', 'sent',1);

INSERT INTO Orders(OrderID,CustomerID,ShippingID,CustomerName,Status,PriorityMail)
values(4567,12,666,'Atanas Atanasov', 'sent','true');

INSERT INTO Orders(OrderID,CustomerID,ShippingID,CustomerName,Status,PriorityMail)
values(4568,22,789,'Alex Stoyanova', 'prepearing','true');

INSERT INTO Orders(OrderID,CustomerID,ShippingID,CustomerName,Status,PriorityMail)
values(4599,42,498,'Sara Nikolova', 'sent','false');

INSERT INTO Orders(OrderID,CustomerID,ShippingID,CustomerName,Status,PriorityMail)
values(4590,15,323,'Ivan Ivanov', 'not sent','false');


select*from Orders


--Stored Procedure

CREATE PROCEDURE GetProducts
AS
BEGIN
    SELECT
        ProductName,
        ProductPrice
    FROM 
        Product
    ORDER BY
        ProductPrice;
END;
---------------------------------------

ALTER PROCEDURE GetProducts(@min_price AS DECIMAL,
@max_price AS DECIMAL
)
AS
BEGIN
    SELECT
        ProductName,
        ProductPrice
    FROM 
        Product
    WHERE
        ProductPrice >= @min_price AND
		ProductPrice <= @max_price
    ORDER BY
         ProductPrice;
END;

EXEC GetProducts 10, 1000;

--Trigger: INSERT, UPDATE, DELETE -> BEFORE, AFTER, FOR

CREATE TRIGGER tr_DeleteProduct
ON Product
FOR DELETE
AS
BEGIN
PRINT 'YOU CANNOT DELETE PRODUCT OPERATION';
ROLLBACK TRANSACTION;
END

delete from Product where ProductID = 22

CREATE TRIGGER tr_AfterInsertProduct
ON Product
AFTER INSERT 
AS
BEGIN
UPDATE Product SET ProductName = 1 FROM inserted
WHERE Product.ProductID = inserted.ProductID;
END

INSERT INTO Product (ProductID,ProductName,ProductQuantity,ProductDetails,ProductPrice)
values('1','TEST','100','Sony','55');

SELECT*FROM Product
DELETE FROM Product WHERE ProductID = 1;

