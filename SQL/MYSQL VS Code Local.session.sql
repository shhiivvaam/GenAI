-- to show all the databases
show DATABASES;

-- to create a new database
CREATE DATABASE test;

-- using some particular database  -> from the point executigng this command, the below code and tasks will only work for this selected database { and we can change the database anytime we want }
use test;

-- creating a table in the database, if it does not exist( IF NOT EXISTS -> the table will also be created while not adding this statement)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- inserting values a table
INSERT INTO users (username, email) VALUES
    ('shivam', 'life.shivam2394@gmail.com'),
    ('shivam1', 'shivam_kumar_cs.aiml21@gla.ac.in'),
    ('shivam2', 'highthackers.04@gmail.com');


-- SELECT QUERIES

-- cheking for the values in some table
SELECT * FROM users;
-- checking the values but also giving the result column name -> (user) : this is an alias name
SELECT * FROM users as user;
-- chekcing for only first 10 entries(rows) of the table users
SELECT * FROM users limit 10;        -- only first 10 records will be displayed

-- returns the count of the records(entries) for some column of a table users
SELECT count('username') from users;
-- returns the count of some column records with an alis name(column name of the result column)
SELECT count('username') as countT from users;             -- countT -> this is just the alias name
-- provides the count of all the columns present in the given table of a table users
SELECT count(*) as total_number_of_records from users;     -- it will count all the column count present in the table
-- to count the records of multiple columns of a table users
SELECT count(name) as count_names, count(birthplace) as count_birthplace from test;

-- returns the column (Customer ID) of the table test
Select `Customer ID` from test;      -- returns the { Customer ID } column only
-- returns the column (Customer ID) of the table test
Select (`Customer ID`) from test;
-- returns only the unique fields(records) of the column { Customer ID } 
Select distinct(`Customer ID`) from users;
-- providing and alias name to the return column of the distinct records of { Customer ID } column
Select distinct(`Customer ID`) as unique_customers test from users;

-- returns the count of all the distinct(unique) records of the column { Customer ID } from the users table
Select count(distinct(`Customer ID`)) from users;   -- returns the count of the unique fields of the column { Customer ID }
-- returns the count of all the distinct(unique) records of the column { Customer ID } with an alias name from the users table
Select count(distinct(`Customer ID`)) as unique_customer_count from test;

Select count(`Customer ID`), count(`username`) from users where color = 'green' AND category = 'South INDIAN' limit 10;
Select count(*) from users where color = 'green' AND category = 'South INDIAN' limit 10;



-- FILTER QUERIES

-- WHERE COMMAND   (OR, AND, BETWEEN)
-- LIKE
-- NOT LIKE
-- IN


-- WHERE

-- returns all the records of all the columns having the column(Quantity) value greater then (5) in the users table
Select * from users where Quantity > 5;
-- returns all the records of the column(`Customer ID`) only where column(Quantity) value greater then (5) in the users table
Select `Customer ID` from users where Quantity > 5;
-- (<> not equals to {operator}) this will return all the records(entries) from column(`Customer ID`) of the the users table where the column(Quantity) is not equals(!=   ==   <>) to 5
Select `Customer ID` from users where Quantity <> 5 limit 10;    -- the order of execution here will be }  1.(from users)  2.(where Quantity <> 5)  3.(select `Customer ID`)   4.(limit 10) 

Select * from users where color = 'green' OR length = 'short';
Select * from users where color = 'green' AND length = 'short';
Select `Customer ID`, `username` from users where color = 'green' AND category = 'South INDIAN' limit 10;
Select * from users where buttons BETWEEN 1 AND 5;
Select `Customer ID`, `username` from users where buttons BETWEEN 1 AND 5;
Select `Customer ID`, `username` from users where buttons BETWEEN 1 AND 5 limit 10;
Select title from users where (color = 'green' OR color = 'red') AND (buttons = 1 OR buttons = 5)l


-- LIKE
-- It is used to search for a pattern in a field
    -- 1. (%) matches 0, 1, or many characters -> 'Ade%'
    -- 2. (_) matches a single character ->  'Shiva_'

Select `Customer ID` from users where color LIKE 'gre%';
Select `Customer ID` from users where color LIKE 'gree_';
Select `Customer ID` from users where color LIKE '%n';
Select `Customer ID` from users where color LIKE 'gre__';
Select `Customer ID` from users where color LIKE '___en';
Select `Customer ID` from users where color LIKE '__e%';


-- NOT LIKE
Select * from users where color NOT LIKE 'A%';  -- this will result all the records from all the column not staring with letter A in the color column
Select `Customer ID` from users where color NOT LIKE 'A%';


-- IN
Select title from films where release_year IN (1920, 1930, 1940);
Select * from mall_customers where age IN (19, 21, 22);   -- this will return all the records having age values (19, 21 and 22)


-- SUMMARIZING DATA
    -- AGGREGATION FUNCTIONS   -- It returns a single value
    -- (SUM(), AVG(), MIN(), MAX(), COUNT())

    -- Remember :
        -- 1. AVG() and SUM() : This is applied only in NUMERIC Datatypes
        -- 2. MIN(), MAX() and COUNT() is applied on various data types ( Non-Numerical Data )

Select avg(Sales) from mall_customers;
Select avg(Sales) as avg_sales from mall_customers;
Select sum(Sales) from mall_customers;
Select min(Sales) from mall_customers;
Select max(Sales) from mall_customers;
Select count(Sales) from mall_customers;
Select min(annual_income) from mall_customers where (`spending_score`) > 20;

    -- ROUND(number_to_round, decimal_place)
Select round(avg(annual_income), 2) from mall_customers;
Select round(avg(annual_income)) from mall_customers;  -- not providing any { decimal_places } parameter will result in returnig the entire whole number



-- SORTING DATA
    -- ORDER BY
Select * from mall_customers ORDER BY age limit 10;    -- by default the sorting will be in Ascendign Order

-- this will returns the all the records with respect to the age(ORDERED in ascending Order)
Select * from mall_customers ORDER BY ASC limit 10;
Select * from mall_customers ORDER BY `Customer ID` asc limit 10;
-- this will returns the all the records with respect to the age(ORDERED in Descending Order)
Select * from mall_customers ORDER BY age desc limit 10;
Select * from mall_customers ORDER BY `Customer ID` desc limit 10;

-- This will first sort the data(in ) with respect to the { age } column and then sor
Select * from mall_customers ORDER BY age DESC, spending_score ASC limit 20;
Select * from mall_customers ORDER BY Sales, age DESC limit 10;



-- GROUPING  DATA   -- whenever using the GROUPING DATA function -> always use it with some AGGREGATION FUCNTIONS(AVG(), SUM(), MIN(), MAX(), count())

-- GROUP BY
select age, max(annual_income) from mall_customers group by age ASC limit 10;    
-- remember the selection column name and th GROUP BY column name (should be same)



-- ORDER BY with GROUP BY
Select annual_income, count(age) as age_count from mall_customers GROUP BY annual_income ORDER BY age_count DESC limit 20;
-- remember to use the { alias name and also use that alias name with ORDER BY, else won't work} ans also Remeber to Select the same column as the GROUP BY column selection