# DATA 620 Assignment 6.1
# 
# SQL Script to create the business units table
# Assumes the database you want to put them into already exists

DROP TABLE if exists business_unit ; 
DROP TABLE if exists product_BU ; 

-- A business unit is division of the company

CREATE TABLE Business_Unit (
BU_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
BU_Name VARCHAR(25),
BU_Designation VARCHAR(25)
);

-- Each product is assigned to one business unit for a given year

CREATE TABLE Product_BU (
Prod_BU_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
BU_Name VARCHAR(25),
Product_Name VARCHAR(25),
Prod_BU_Year INT(4)
);


-- Adding records to the Business Unit table
INSERT INTO Business_Unit (BU_Name, BU_Designation)
VALUES
('Snack', 'Growth'),
('On the go', 'Growth'),
('Energy', 'Growth'),
('Health', 'Mature'),
('Lunchtime', 'Mature'),
('Sugar', 'Decline'),
('GMO', 'Decline')
;


-- Adding records to the Product/Business Unit table
INSERT INTO Product_BU (BU_Name, Product_Name, Prod_BU_Year)
VALUES
('On the go', 'Blue Rock Candy', '2012'),
('On the go', 'Blue Rock Candy', '2013'),
('On the go', 'Blue Rock Candy', '2014'),
('Snack', 'Crocodile Tears', '2012'),
('Snack', 'Crocodile Tears', '2013'),
('Snack', 'Crocodile Tears', '2014'),
('Sugar', 'Giant Gummies', '2012'),
('Sugar', 'Giant Gummies', '2013'),
('Sugar', 'Giant Gummies', '2014'),
('Sugar', 'Green Lightning', '2012'),
('Lunchtime', 'Green Lightning', '2013'),
('Lunchtime', 'Green Lightning', '2014'),
('GMO', 'Grey Gummies', '2012'),
('GMO', 'Grey Gummies', '2013'),
('GMO', 'Grey Gummies', '2014'),
('Sugar', 'Nap Be Gone', '2012'),
('Sugar', 'Nap Be Gone', '2013'),
('Sugar', 'Nap Be Gone', '2014'),
('GMO', 'Orange Creepies', '2012'),
('GMO', 'Orange Creepies', '2013'),
('Lunchtime', 'Orange Creepies', '2014'),
('Health', 'Panda Gummies', '2012'),
('Health', 'Panda Gummies', '2013'),
('Health', 'Panda Gummies', '2014'),
('On the go', 'Pink Bubble Gum', '2012'),
('On the go', 'Pink Bubble Gum', '2013'),
('On the go', 'Pink Bubble Gum', '2014'),
('Energy', 'Purple Pain', '2012'),
('Energy', 'Purple Pain', '2013'),
('Energy', 'Purple Pain', '2014'),
('Energy', 'Red Hot Chili Peppers', '2012'),
('Energy', 'Red Hot Chili Peppers', '2013'),
('Energy', 'Red Hot Chili Peppers', '2014'),
('Lunchtime', 'Yellow Zonkers', '2012'),
('Lunchtime', 'Yellow Zonkers', '2013'),
('Lunchtime', 'Yellow Zonkers', '2014')
;
