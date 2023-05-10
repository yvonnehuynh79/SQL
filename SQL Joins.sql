/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT P.Name as products, C.Name as categories
FROM products as P
INNER JOIN categories as C 
ON C.CategoryID = P.CategoryID
WHERE C.Name = 'computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name as products, p.Price as price, r.Rating as rating
FROM products as P
INNER JOIN reviews as r 
ON r.ProductID = p.ProductID
WHERE r.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.Quantity) as total
FROM sales as S
INNER JOIN employees as e 
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY total DESC
LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name, c.Name
FROM departments as d
INNER JOIN categories as c 
ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, sum(s.Quantity) as 'total sold', sum(s.Quantity * s.PricePerUnit) as 'total price sold'
FROM Products as p
INNER JOIN sales as s 
ON s.ProductID = p.ProductID
WHERE p.ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name as "Product Name", reviews.Reviewer as 'reviewer name', Min(reviews.Rating),  reviews.Comment
FROM products 
INNER JOIN reviews  
ON reviews.ProductID = products.ProductID
WHERE products.ProductID= 857; -- AND reviews.rating = 1
-- GROUP BY products.productID;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT  e.employeeID, e.firstName, e. lastName, p.Name as 'product name', Sum(s.Quantity) as 'total sold'
FROM products as p
INNER JOIN sales as s
ON p.productID = s.productID
INNER JOIN employees as e
ON s.employeeID = e.employeeID
GROUP BY e.employeeID, p.productID
ORDER BY Name; 
