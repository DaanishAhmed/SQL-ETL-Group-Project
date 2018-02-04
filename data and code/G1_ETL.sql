# DATA 620 Assignment 6.1 
# Written by Ryan Cloutier for Group 1
# Group 1 Members Ryan Cloutier, Daanish Ahmed, And Bridget Van Gieson
# Semester Spring 2017
# Professor Dr. Majed AL-Ghandour
# 
# First, we create the grp1 database and select it.  We drop the database if it already exists.
# This part of the script should only be run once at the very beginning, unless you are starting over.
Drop Database if exists grp1;
Create Database grp1;
Use grp1;

# Before the rest of this script can be run, the Week6_business_units.sql needs to be run.
# The three data files `2012_product_data_students.csv`, `2013_product_data_students.csv`, and
# `2014_product_data_students.csv` need to be imported as tables to the grp1 database
# TO achieve this right click on the grp1 database and choose the Data Table Import Wizard
# Browse to the location of the csv and select one (will need to do same steps for all three)
# Select the csv and import the data by clicking next and accepting the pre-configured settings
#
# This script is designed to remove the ETLCombine table and repopulate it from the 
# 2012, 2013, and 2014 Product Data Students tables that were created by importing
# CSV files to SQL Tables. Depending on the size of the table it would be more efficient
# to append the new data to the table instead of rebuilding it entirely
#
# First step is to drop the ETLCombine table so we can rebuild it
Drop Table if exists `ETLCombine`;
# Next is to create the table and creating with the 'as' statement will create the table with the columns we selected
Create Table ETLCombine as
# The first select statement is pulling data from the `2012_product_data_students` Table that was created from importing the csv
# of the same name

SELECT 
    BU_Designation,
    product_bu.BU_Name,
    Product,
    Region,
# The Prod_BU_Year column needed to be formated as 'Year' for the final output	
    Prod_BU_Year as Year,
    Month,
# The Quantity column needed to be formated as 'Sum of Order Total' for the final output		
    Quantity as `Sum of Quantity`,
    `Order Total` as `Sum of Order Total`
   From  `2012_product_data_students` AS z
# The product_bu table is joined to get the BU_Name
		JOIN
    product_bu  ON product_bu.Product_Name = z.Product 
# Since the first section was pulling from the 2012 data and no date was provided in the `2012_product_data_students` table
# the product_bu table was joined also where Prod_BU_Year = 2012
		AND Prod_BU_Year = 2012
# The business_unit table is joined to get the BU_Designation        
		JOIN
# Since it was determined we did not want any row where the BU_Designation was = to 'Decline'
		business_unit ON business_unit.BU_Name = product_bu.BU_Name and BU_Designation != 'Decline'
# Our group chose to not include when quantity was 0
		Where Quantity >0 
# Union All is then used to append all of the second table to the first
Union All

# The Second select statement is pulling data from the `2013_product_data_students` Table that was created from importing the csv
# of the same name
SELECT 
    BU_Designation,
    product_bu.BU_Name,
    Product,
    Region,
# The Prod_BU_Year column needed to be formated as 'Year' for the final output	
    Prod_BU_Year as Year,
    Month,
    Quantity_1+Quantity_2 as `Sum of Quantity`,
    Quantity_1+Quantity_2*`Per-Unit Price` as `Sum of Order Total`
   From  `2013_product_data_students` AS z
# The product_bu table is joined to get the BU_Name
		JOIN
    product_bu  ON product_bu.Product_Name = z.Product 
# Since the SECOND section was pulling from the 2013 data and no date was provided in the `2013_product_data_students` table
# the product_bu table was joined also where Prod_BU_Year = 2013 
		AND Prod_BU_Year = 2013
# The business_unit table is joined to get the BU_Designation          
		JOIN
# Since it was determined we did not want any row where the BU_Designation was = to 'Decline' I filtered it here
    business_unit ON business_unit.BU_Name = product_bu.BU_Name and BU_Designation != 'Decline'
# Our group chose to not include when quantity was 0, In this case there were two quantity fields that made the totals
	Where Quantity_1+Quantity_2 >0 	
# Union All is then used to append all of the third table to the first   
Union All

# The Third select statement is pulling data from the `2014_product_data_students` Table that was created from importing the csv
# of the same name
SELECT 
    BU_Designation,
    product_bu.BU_Name,
    Product,
    Region,
# The Prod_BU_Year column needed to be formated as 'Year' for the final output		
    Prod_BU_Year as Year,
    Month,
    Quantity as `Sum of Quantity`,

    `Order Subtotal`-`Quantity Discount` as `Sum of Order Total`

   From  `2014_product_data_students` AS z
# The product_bu table is joined to get the BU_Name
		JOIN
    product_bu  ON product_bu.Product_Name = z.Product 
# Since the third section was pulling from the 2014 data and no date was provided in the `2014_product_data_students` table
# the product_bu table was joined also where Prod_BU_Year = 2014
        AND Prod_BU_Year = 2014
# The business_unit table is joined to get the BU_Designation  
        JOIN
# Since it was determined we did not want any row where the BU_Designation was = to 'Decline' I filtered it here
	business_unit ON business_unit.BU_Name = product_bu.BU_Name and BU_Designation != 'Decline'
# Our group chose to not include when quantity was 0
	Where Quantity >0   
# The final output of the script is then sorted by each column    
    Order by  BU_Designation,
    BU_Name,
    Product,
    Region,
	`Year`,
    Month,
    `Sum of Quantity`,
    `Sum of Order Total`;

# Then the new table can be used to output to a csv file
# The entire table was selected because the table is already formated how we need	
SELECT * FROM grp1.etlcombine
# The results are then saved to the Comma separated values file where the comma is added between the fields using the 'Fields terminated by' command
into outfile 'C:/temp/G1_output_final.csv' fields terminated by ',';