Extract, Transform, and Load (ETL) on Company Product Order Data
----------------

This is a group project where I collaborated with two other UMUC graduate students: Ryan Cloutier and Bridget Van Gieson.  The project involves using SQL code to create an Extract, Transform, and Load (ETL) sequence on three separate product order datasets from 2012, 2013, and 2014.  The goal is to combine these three files into a single spreadsheet so it can be loaded into our organization's new data mart.

We also designed an Entity-Relationship Diagram (ERD) using ER Assistant to map the tables in our data mart.  This diagram is included in the file "BU Product ERD.erd".  An image of the diagram can be found in Figure 1 of our memo.

All of us played some role in each component of the project, including the code, analysis, and write-up.  Some of my responsibilities include designing the ERD, revising the code, and evaluating growth trends using the data.  I also wrote several sections of the paper and contributed with revising the report.

The full memo can be found in the file "ETL Team Project Memo.pdf".  This report shows a complete breakdown of our analysis, including problem identification, motivation, ERD description, methods, analysis, and proposed solutions.  Metadata, technical terms, and a copy of our code are included in the appendices.

The original data files are "2012_product_data_students.csv", "2013_product_data_students.csv", and "2014_product_data_students.csv".  They were provided by my course instructor at the University of Maryland University College.  These files are used as inputs for our code.  I have also included the file "G1_output_final.csv", which is the output of our code and represents the new data mart.

The SQL file "Week6_business_units.sql" is used to set up the business units table of our database.  It must be run first.  Next, the file "G1_ETL.sql" is used to perform our ETL sequence.  The requirements are described in the file "requirements.txt".  Instructions on how to use these programs are included as comments in the SQL files.  Please read the instructions carefully before executing the code to ensure that the programs function correctly.