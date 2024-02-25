-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id
SELECT owners.id AS owner_id, owners.first_name, owners.last_name, vehicles.id AS vehicle_id, vehicles.make, vehicles.model, vehicles.year, vehicles.price, vehicles.owner_id
FROM owners
LEFT JOIN vehicles ON owner.id = vehicles.owner_id;

-- This query selects all columns from both tables and joins them based on the owner_id column. The LEFT JOIN ensures that all records from the owners table are included, even if there is no corresponding record in the vehicles table.
-- When you run this query, you should get output similar to the desired format provided in the assignment instructions.

-- We're using a LEFT JOIN in this scenario because we want to ensure that all records from the owners table are included in the result set, regardless of whether there is a matching record in the vehicles table.
-- Here's why we chose a LEFT JOIN:
-- Preserving All Records from the Left Table (owners):
-- The LEFT JOIN ensures that all records from the left table (owners) are included in the result set, even if there are no matching records in the right table (vehicles). This means that every owner will appear in the output, regardless of whether they own any vehicles or not.

-- Count the number of cars for each owner. Display the owners first_name , last_name and count of vehicles. The first_name should be ordered in ascending order. 
SELECT owners.first_name, owners.last_name, --we select the owners first and last name from the owners table 
COUNT(vehicles.id) AS vehicle_count --we use the count function to count the number of vehicles (vehicles.id) associated with each owner, and use an alias 
FROM owners
LEFT JOIN vehicles ON owners.id = vehicles.owner.id --we perform a left join between the owners table and vehicles table to ensure all owners are included in the result set
GROUP BY owners.first_name, owners.last_name --we then group the owners by first and last name 
ORDER BY owners.first_name ASC; --the order by first name in ascending order 

-- Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name , last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000. 
SELECT owners.first_name,
        owneres.last_name, --We select the first_name and last_name columns from the owners table.
        CAST(AVG(vehicles.price) AS INTEGER) AS average_price, --We use the AVG() function to calculate the average price of the vehicles (vehicles.price) associated with each owner. We cast the result to an integer using CAST() to display the average price as integers.the CAST() function is used to convert the result of the AVG(vehicles.price) function from a decimal or floating-point number to an integer.
        COUNT(vehicles.id) AS vehicle_count --We use the COUNT() function to count the number of vehicles associated with each owner.
FROM owners
JOIN vehicles ON owners.id = vehicles.owners.id --We perform an inner join (JOIN) between the owners and vehicles tables based on the owner_id.
GROUP BY owners.first_name, owners.last_name --We group the results by owners.first_name and owners.last_name using the GROUP BY clause.
HAVING COUNT(vehicles.id) > 1 --We use the HAVING clause to filter the results to only include owners with more than one vehicle 
    AND AVG(vehicles.price) > 1000
ORDER BY owners.first_name DESC; --Finally, we order the results by owners.first_name in descending order using the ORDER BY clause.
