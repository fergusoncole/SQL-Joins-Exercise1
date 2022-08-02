/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT p.Name, c.Name
FROM products p
INNER JOIN categories c 
ON p.CategoryID = c.CategoryID
WHERE p.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating
FROM reviews r
INNER JOIN products p
ON r.ProductID = p.ProductID
WHERE r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.Firstname, e.LastName, SUM(s.Quantity) AS 'Total'
FROM sales s 
INNER JOIN employees e
ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name, c.Name
FROM departments d
INNER JOIN categories c
ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Games' OR c.Name = 'appliances';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) AS 'Total Sold', SUM(s.Quantity * s.PricePerUnit) AS 'Total Price Sold'
FROM products p
INNER JOIN sales s
ON s.ProductID = p.ProductID
WHERE p.ProductID = 97; 


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM reviews r
INNER JOIN products p
ON p.ProductID = r.ProductID
WHERE p.ProductID = 857 AND Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.ProductID, p.Name, Sum(s.Quantity) AS Quantity, s.Date
FROM sales s
INNER JOIN employees e
ON e.EmployeeID = s.EmployeeID
INNER JOIN products p
ON p.productid = s.productid
GROUP BY e.employeeid, e.FirstName, e.LastName, p.productid, p.name, s.Date;

SELECT e.EmployeeID, e.FirstName, e.LastName, p.ProductID,
	   p.Name, SUM(s.Quantity) AS 'Total Sold'
FROM sales s
INNER JOIN employees e
ON e.EmployeeID = s.EMPLOYEEID 
INNER JOIN products p
ON p.productid = s.productid
GROUP BY e.employeeID, p.productID;
