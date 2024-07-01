USE	bestbuy;

/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name as 'Product Name', c.Name as 'Category Name' FROM products p
 JOIN categories c ON p.CategoryID = c.CategoryID
 WHERE c.Name LIKE 'computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT Name, Price, Ratings FROM products p
 JOIN reviews r ON p.ProductID = r.ProductID
 WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.EmployeeID, SUM(s.Quantity) as 'Total Sales' FROM employees e
JOIN sales s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name as 'Department Name', c.Name as 'Category Name' FROM categories c
JOIN departments d ON c.DepartmentID = d.DepartmentID
WHERE c.Name like 'appliances' OR c.Name like 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) as 'Quantity Sold', SUM(p.Price * s.Quantity)as 'Total Price' FROM products p
JOIN sales s ON p.ProductID = s.ProductID
WHERE p.Name like 'eag%ia'
GROUP BY p.Name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment FROM products p
JOIN reviews r ON p.ProductID = r.ProductID
WHERE r.Rating = 1
AND p.Name LIKE 'visio%';

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, concat(e.FirstName, ' ', e.LastName) as 'Employee Name', p.Name as 'Product Name', s.Quantity FROM employees e
JOIN sales s ON e.EmployeeID = s.EmployeeID
	JOIN products p ON s.ProductID = p.ProductID;