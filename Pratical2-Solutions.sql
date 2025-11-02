SELECT*
FROM PRATICAL2.SALES.CUSTOMERS;

SELECT*
FROM PRATICAL2.SALES.ORDERS;

SELECT*
FROM PRATICAL2.SALES.PRODUCTS;

----------------------------------------------------------------------------------------------------------------------------
--Q1: List all orders along with the customer name and product name. 
---Expected Output Columns: OrderID, OrderDate, CustomerName, ProductName, Quantity

SELECT A.OrderID, 
A.OrderDate,
B.CustomerName, 
C.ProductName, 
A.Quantity
FROM PRATICAL2.SALES.ORDERS AS A
INNER JOIN PRATICAL2.SALES.CUSTOMERS AS B
ON A.Customerid= B.Customerid
INNER JOIN PRATICAL2.SALES.PRODUCTS AS C
ON C.PRODUCTID=A.PRODUCTID;

----------------------------------------------------------------------------------------------------------------------------
--Q2: Which customers have placed at least one order?
---Expected Output Columns: CustomerID, CustomerName, Country, OrderID, OrderDate

SELECT A.CustomerID,
A.CustomerName, 
A.Country, 
B.OrderID, 
B.OrderDate
FROM PRATICAL2.SALES.CUSTOMERS AS A
INNER JOIN PRATICAL2.SALES.ORDERS AS B
ON A.CustomerID= B.CustomerID
WHERE QUANTITY>1;

----------------------------------------------------------------------------------------------------------------------------
--Q3: List all customers and any orders they might have placed. Include customers who have not placed any orders. 
---Expected Output Columns: CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT A.CustomerID, 
A.CustomerName, 
A.Country, 
B.OrderID, 
B.OrderDate, 
B.ProductID, 
B.Quantity
FROM PRATICAL2.SALES.CUSTOMERS AS A                 
LEFT JOIN PRATICAL2.SALES.ORDERS AS B
ON A.CustomerID= B.CustomerID;

----------------------------------------------------------------------------------------------------------------------------
--Q4: List all products and how many times each was ordered (if any). 
---Expected Output Columns: ProductID, ProductName, TotalOrders (TotalOrders is the count of how many times the product appears in orders)

SELECT A.ProductID, 
A.ProductName, 
COUNT(Orderid) AS TotalOrders
FROM PRATICAL2.SALES.PRODUCTS AS A
LEFT JOIN PRATICAL2.SALES.ORDERS AS B
ON A.ProductID = B.ProductID
GROUP BY 
    A.ProductID,
    A.ProductName;
    
----------------------------------------------------------------------------------------------------------------------------
--Q5: Find all orders along with product details, including any products that might not have been ordered. 
---Expected Output Columns: OrderID, OrderDate, ProductID, ProductName, Price, Quantity

SELECT  B.OrderID, 
B.OrderDate, 
A.ProductID, 
A.ProductName, 
A.Price,
B.Quantity
FROM PRATICAL2.SALES.PRODUCTS AS A
RIGHT JOIN PRATICAL2.SALES.ORDERS AS B
ON A.ProductID = B.ProductID;

----------------------------------------------------------------------------------------------------------------------------
--Q6: Which customers have made orders, and include customers even if they have never placed an order. 
---Expected Output Columns: CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT B.CustomerID, 
B.CustomerName, 
B.Country,
A.OrderID, 
A.OrderDate, 
A.ProductID, 
A.Quantity
FROM PRATICAL2.SALES.ORDERS AS A
RIGHT JOIN PRATICAL2.SALES.CUSTOMERS AS B
ON  A.CustomerID= B.CustomerID;

----------------------------------------------------------------------------------------------------------------------------
--Q7: List all customers and orders, showing NULLs where customers have not ordered or where orders have no customer info. 
---Expected Output Columns: CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT A.CustomerID, 
A.CustomerName, 
A.Country, 
B.OrderID, 
B.OrderDate, 
B.ProductID,
B.Quantity,
FROM PRATICAL2.SALES.CUSTOMERS AS A
FULL OUTER JOIN PRATICAL2.SALES.ORDERS AS B
ON A.CustomerID=B.CustomerID;

----------------------------------------------------------------------------------------------------------------------------
--Q8: List all products and orders, showing NULLs where products were never ordered or orders are missing product info. 
---Expected Output Columns: ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity

SELECT A.ProductID, 
A.ProductName, 
A.Price,
B.OrderID,
B.OrderDate,
B.CustomerID, 
B.Quantity
FROM  PRATICAL2.SALES.PRODUCTS AS A
FULL OUTER JOIN PRATICAL2.SALES.ORDERS AS B
ON A.ProductID = B.ProductID;



