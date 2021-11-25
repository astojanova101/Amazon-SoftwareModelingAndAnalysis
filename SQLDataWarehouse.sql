CREATE DATABASE AmazonDatawarehouse
USE AmazonDatawarehouse
 

CREATE TABLE DimSupplier(
 SupplierID int not null,
 SupplierName varchar(20), 
 SupplierCountry varchar(20)
 CONSTRAINT PK_DimSupplier PRIMARY KEY (SupplierID)
);

CREATE TABLE DimCategory(
 CategoryID int not null,
 CategoryName varchar(20), 
 CategoryDetails varchar(20)
 CONSTRAINT PK_DimCategory PRIMARY KEY (CategoryID)
);

CREATE TABLE DimProduct(
 ProductID int not null,
 ProductName varchar(20), 
 ProductQuantity int,
 ProductOrigin varchar(20),
 ProductDetails varchar(500),
 ProductPrice decimal,
 CONSTRAINT PK_DimProduct PRIMARY KEY (ProductID)
);



CREATE TABLE DimCustomer(
 CustomerID int not null,
 FirstName varchar(20), 
 LastName varchar(20),
 Address varchar(30),
 PhoneNumber int,
 Email nvarchar(30),
 CONSTRAINT PK_DimCustomer PRIMARY KEY(CustomerID)
);

CREATE TABLE DimCartItem(
 CartItemID int not null,
 ProductID int not null, 
 ProductName varchar(20),
 Quantity int,
 Subtotal decimal,
 CONSTRAINT PK_DimCartItem PRIMARY KEY(CartItemID),
  CONSTRAINT FK_DimProductCartItem FOREIGN KEY (ProductID)
    REFERENCES DimProduct(ProductID)
);

CREATE TABLE DimShoppingCart(
 CartID int not null,
 ProductID int not null, 
 CustomerID int not null,
 Address nvarchar(20),
 Quantity int,
 Date datetime,
 CONSTRAINT PK_DimShoppingCart PRIMARY KEY(CartID),

  CONSTRAINT FK_DimProductShoppingCart FOREIGN KEY (ProductID)
    REFERENCES DimProduct(ProductID),

	 CONSTRAINT FK_DimCustomerShoppingCart FOREIGN KEY (CustomerID)
    REFERENCES DimCustomer(CustomerID)



);



CREATE TABLE FactShippingDetails(
 ShippingID int not null,
 CartItemID int not null, 
 SupplierID int not null,
 ShippingType varchar(20),
 ShippingName varchar(20),
 ShippingCountry varchar(20),
 ShippingCost decimal,
 ShippingDate datetime,
CONSTRAINT PK_FactShippingDetails PRIMARY KEY(ShippingID),

CONSTRAINT FK_DimCartItemFactShippingDetails FOREIGN KEY (CartItemID)
    REFERENCES DimCartItem(CartItemID),
CONSTRAINT FK_DimSupplierFactShippingDetails FOREIGN KEY (SupplierID)
    REFERENCES DimSupplier(SupplierID)
);

CREATE TABLE FactOrders(
 OrderID int not null,
 ShippingID int not null, 
 CartID int not null,
 CategoryID int not null,
 CustomerName varchar(20),
 DateCreated datetime,
 DateShipped datetime,
 Status varchar(20),
 PriorityMail bit,

 CONSTRAINT PK_FactOrders PRIMARY KEY(OrderID),

  CONSTRAINT FK_FactShippingDetailsFactOrders FOREIGN KEY (ShippingID)
    REFERENCES FactShippingDetails(ShippingID),

	 CONSTRAINT FK_DimShoppingCartFactOrders FOREIGN KEY (CartID)
    REFERENCES DimShoppingcart(CartID),

	CONSTRAINT FK_DimCategoryFactOrders FOREIGN KEY (CategoryID)
    REFERENCES DimCategory(CategoryID),


);

--dimsupplier


INSERT INTO DimSupplier(SupplierID,SupplierName,SupplierCountry)
VALUES(1,'MEDIMOPS','GERMANY');

INSERT INTO DimSupplier(SupplierID,SupplierName,SupplierCountry)
VALUES(2,'MEDIMOPSCHINA','CHINA');

INSERT INTO DimSupplier(SupplierID,SupplierName,SupplierCountry)
VALUES(3,'MEDIMOPSKOREA','KOREA');

INSERT INTO DimSupplier(SupplierID,SupplierName,SupplierCountry)
VALUES(4,'MEDIMOPSEU','SWITZERLAND');

INSERT INTO DimSupplier(SupplierID,SupplierName,SupplierCountry)
VALUES(5,'MEDIMOPSNORWAY','NORWAY');

INSERT INTO DimSupplier(SupplierID,SupplierName,SupplierCountry)
VALUES(6,'MEDIMOPSUK','UK');

INSERT INTO DimSupplier(SupplierID,SupplierName,SupplierCountry)
values(7,'Cloudtail','UK');

INSERT INTO DimSupplier(SupplierID,SupplierName,SupplierCountry)
values(8,'CloudtailGreece','GREECE');

INSERT INTO DimSupplier(SupplierID,SupplierName,SupplierCountry)
values(9,'CloudtailBG','BULGARIA');

INSERT INTO DimSupplier(SupplierID,SupplierName,SupplierCountry)
values(10,'CloudtailUSA','WASHINGTON');

INSERT INTO DimSupplier(SupplierID,SupplierName,SupplierCountry)
values(11,'musicMagpie','Bulgaria');


--DimCategory

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(222,'Accessories','New, Certified refurbished, and Used');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(236,'Automotive and Powersports','New, Certified refurbished, and Used');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(276,'Baby Products','New');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(336,'Beauty','New');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(289,'Books','New,Used,Collectible');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(263,'Camera and Photo','New,Certified, Refurbished, New');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(666,'Cell Phones and Accessories','New,Used,Certified, Fefurbished,Unlocked');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(365,'Collectibles','Collectible like new');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(596,'Consumer Electronics','New, Certified Refurbished, Used');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(756,'Fine Art','New, Antique');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(996,'Grocery and Gourmet Foods','New');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(789,'Health and Personal Care','New');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(459,'Home and Garden','New,Certified refurbished,Used,Collectible');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(176,'Major Appliances','New,Used,Collectible');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(669,'Music and DVD','New,Used,Collectible');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(676,'Musical Instruments','New,Certified,Used,Collectible');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(287,'Office products','New,Certified,Used,Collectible');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(367,'Outdoors','New,Certified,Used');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(555,'Personal Computers','New, Certified, Used');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(569,'Pet Supplies','New, Certified, Used');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(531,'Software','New, Used');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(739,'Sports','New,Certified refurbished, Used');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(719,'Tools and Home Improvement','New, Certified, Used');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(518,'Toys and Games','New and Collectible');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(572,'Video,DVD, Blu-ray','New, Used, Collectible');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(299,'Video Games','New, Used, Collectible');

INSERT INTO DimCategory(CategoryID,CategoryName,CategoryDetails)
values(999,'Watches','New, Used');


-- DIMPRODUCT

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('22','Headphones','100','CHINA','Sony','55');

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('66','Dove Soap','500','GERMANY','Dove','5');

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('61','Elephan toy','699','GERMANY','Lego','10');

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('65','Superman toy','1220','GERMANY','Lego','56');

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('220','Mug','100','CHINA','Stainless steel','55');

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('69','Windows tablet','1400','CHINA','Windows','256');

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('45','Rolex watch','100','SWITZERLAND','24 karat gold','20000');

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('78','Pandora bracelet','4566','SWITZERLAND','silver 975','150');

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('27','Band aid','14000','CHINA','first aid','6');

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('22','Trampoline','100','GERMANY','kids','59');

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('99','Paint Markers','100','CHINA','12 color set','18');

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('76','Dress','10550','CHINA','HM','61');

INSERT INTO DimProduct (ProductID,ProductName,ProductQuantity,ProductOrigin,ProductDetails,ProductPrice)
values('67','Notebook','45100','GERMANY','ThreeThree','5');


--dim customer

INSERT INTO DimCustomer(CustomerID,FirstName,LastName,Address,PhoneNumber,Email)
values (22,'Alexandra', 'Stoyanova', 'Bul.Bulgaria 256',0877456256, 'astojanova00@gmail.com');
INSERT INTO DimCustomer(CustomerID,FirstName,LastName,Address,PhoneNumber,Email)
values (31,'Stefaniya','Ilievska', 'Golacka 56',0878666666,'stefanijailievska12@yahoo.com');
INSERT INTO DimCustomer(CustomerID,FirstName,LastName,Address,PhoneNumber,Email)
values (122,'Sara', 'Nikolova', 'Pitu Guli 37', 078965896,'snikolova09@gmail.com');
INSERT INTO DimCustomer(CustomerID,FirstName,LastName,Address,PhoneNumber,Email)
values  (425,'Atanas', 'Atanasov','Bul.Bulgaria 47',0899569856,'aat47@abv.bg');
INSERT INTO DimCustomer(CustomerID,FirstName,LastName,Address,PhoneNumber,Email)
values (153,'Ivan','Ivanov','Bul.Solun 65', 0879999666,'iivan123@abv.bg');
INSERT INTO DimCustomer(CustomerID,FirstName,LastName,Address,PhoneNumber,Email)
values (166,'Louise','Freeman','Bankq 56',0899698698, 'lfreeman@gmail.com');

INSERT INTO DimCustomer(CustomerID,FirstName,LastName,Address,PhoneNumber,Email)
values (457,'Maya', 'Stoyanova', 'Bul.Bulgaria 456',0877456286, 'stojanova00@gmail.com');
INSERT INTO DimCustomer(CustomerID,FirstName,LastName,Address,PhoneNumber,Email)
values (368,'Sanya','Ilievska', 'Golacka 166',0874466666,'ilievska12@yahoo.com');
INSERT INTO DimCustomer(CustomerID,FirstName,LastName,Address,PhoneNumber,Email)
values (329,'Sara', 'Nikol', 'Pitu Guli 156', 078965899,'nikolova09@gmail.com');
INSERT INTO DimCustomer(CustomerID,FirstName,LastName,Address,PhoneNumber,Email)
values  (43,'Atanas', 'Atanasov','Bul.Bulgaria 788',0899569855,'at47@abv.bg');
INSERT INTO DimCustomer(CustomerID,FirstName,LastName,Address,PhoneNumber,Email)
values (4,'Ivan','Ivan','Bul.Solun 899', 0879999669,'ivan123@abv.bg');
INSERT INTO DimCustomer(CustomerID,FirstName,LastName,Address,PhoneNumber,Email)
values (17,'Louise','Eeman','Bankq 156',0899698699, 'freeman@gmail.com');



--DIMCARTITEM


INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (45,'99','Paint Markers',5,140);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (78,'67','Notebook',5,156);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (55,'45','Rolex watch',1,20000);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (49,'69','Windows tablet',1,256);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (66,'99','Paint Markers',2,60);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (57,'67','Notebook',8,1566);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (58,'45','Rolex watch',2,40000);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (88,'69','Windows tablet',2,456);


INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (63,'99','Paint Markers',5,140);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (12,'67','Notebook',5,156);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (2,'45','Rolex watch',1,20000);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (19,'69','Windows tablet',1,256);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (33,'99','Paint Markers',2,60);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (28,'67','Notebook',8,1566);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (17,'45','Rolex watch',2,40000);

INSERT INTO DimCartItem(CartItemID,ProductID,ProductName,Quantity,Subtotal)
VALUES (37,'69','Windows tablet',2,456);



--DIMSHOPPINGCART DATE CONSTRAINT

ALTER TABLE DimShoppingCart ADD CONSTRAINT DF_DimShoppingCart_Date_Default
DEFAULT GETUTCDATE() FOR Date;

--DimShoppingCart

INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('59','67',22,'Bul.Bulgaria 236',2);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('480','76',31,'Bul.Bulgaria 999',1);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('99','99',122,'Pitu Guli',5);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('59','67',425,'Bul.Bulgaria 236',2);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('77','45',153,'Bul.Solun',4);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('47','77',166,'Bankq 56',2);



INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('59','22',457,'Bul.Bulgaria 236',2);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('480','66',368,'Bul.Bulgaria 999',1);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('99','61',43,'Pitu Guli',5);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('78','65',329,'Bul.Bulgaria 236',2);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('55','220',43,'Bul.Solun',4);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('47','69',4,'Bankq 56',2);



INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('59','69',17,'Bul.Bulgaria 236',2);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('480','45',22,'Bul.Bulgaria 999',1);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('99','78',31,'Pitu Guli',5);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('59','27',122,'Bul.Bulgaria 236',2);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('77','22',425,'Bul.Solun',4);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('47','27',153,'Bankq 56',2);



INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('59','95',166,'Bul.Bulgaria 236',2);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('480','76',457,'Bul.Bulgaria 999',1);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('99','67',368,'Pitu Guli',5);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('59','65',43,'Bul.Bulgaria 236',2);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('77','220',4,'Bul.Solun',4);


INSERT INTO DimShoppingCart(CartID,ProductID,CustomerID,Address,Quantity)
values('47','69',17,'Bankq 56',2);

SELECT*FROM DimShoppingCart

--FactShippingDetails

ALTER TABLE FactShippingDetails ADD CONSTRAINT DF_FactShippingDetails_ShippingDate_Default
DEFAULT GETUTCDATE() FOR ShippingDate;

INSERT INTO FactShippingDetails(ShippingID,CartItemID,SupplierID,ShippingType,ShippingName,ShippingCountry,ShippingCost)
VALUES(323,37,6,'fast','DHL','CHINA',5.09);

INSERT INTO FactShippingDetails(ShippingID,CartItemID,SupplierID,ShippingType,ShippingName,ShippingCountry,ShippingCost)
VALUES(78,'56',5,'next day','Speedy','GERMANY',9.09);

INSERT INTO FactShippingDetails(ShippingID,CartItemID,SupplierID,ShippingType,ShippingName,ShippingCountry,ShippingCost)
VALUES(55,'455',4,'post','FDH','SWITZERLAND',51.09);

INSERT INTO FactShippingDetails(ShippingID,CartItemID,SupplierID,ShippingType,ShippingName,ShippingCountry,ShippingCost)
VALUES(79,45,3,'post','CHINA POST','CHINA',59.41);

SELECT*FROM FactShippingDetails

--FactOrders
ALTER TABLE FactOrders ADD CONSTRAINT DF_FactOrders_DateCreated_Default
DEFAULT GETUTCDATE() FOR DateCreated;

ALTER TABLE FactOrders ADD CONSTRAINT DF_FactOrders_DateShipped_Default
DEFAULT GETUTCDATE() FOR DateShipped;


INSERT INTO FactOrders(OrderID,ShippingID,CartID,CategoryID,CustomerName,Status,PriorityMail)
VALUES(45,1,23,56,'Sara','shipped',1);

INSERT INTO FactOrders(OrderID,ShippingID,CartID,CategoryID,CustomerName,Status,PriorityMail)
VALUES(79,2,23,56,'Sara','shipped',1);


select*from FactOrders

