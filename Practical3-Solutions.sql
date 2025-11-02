--Q1. Find all records where Size is missing and the purchase_amount is greater than 50. 
---Expected Columns: Customer ID, Size, purchase_amount, Item Purchased 

SELECT CUSTOMER_ID, 
SIZE, 
purchase_amount, 
ITEM_PURCHASED 
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
WHERE SIZE IS NULL AND PURCHASE_AMOUNT >50;

-----------------------------------------------------------------------------------------------------------------------------
--Q2. List the total number of purchases grouped by Season, treating NULL values as 'Unknown Season'. 
--Expected Columns: Season, Total Purchases 

SELECT COUNT(*) AS TOTAl_PURCHASE,
IFNULL(SEASON,'UNKNOWN SEASON') AS SEASON
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
GROUP BY SEASON;

-----------------------------------------------------------------------------------------------------------------------------
--Q3. Count how many customers used each Payment Method, treating NULLs as 'Not Provided'. 
---Expected Columns: Payment Method, Customer Count 

SELECT  COUNT (*) AS Customer_Count,
IFNULL(PAYMENT_METHOD,'Not Provided') AS PAYMENT_METHOD 
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
GROUP BY PAYMENT_METHOD;

-----------------------------------------------------------------------------------------------------------------------------
--Q4. Show customers where Promo Code Used is NULL and Review Rating is below 3.0. 
---Expected Columns: Customer ID, Promo Code Used, Review Rating, Item Purchased

SELECT CUSTOMER_ID, 
PROMO_CODE_USED, 
REVIEW_RATING, 
ITEM_PURCHASED
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
WHERE PROMO_CODE_USED IS NULL AND REVIEW_RATING <3;

-----------------------------------------------------------------------------------------------------------------------------
--Q5. Group customers by Shipping Type, and return the average purchase_amount, treating missing values as 0. 
--Expected Columns: Shipping Type, Average purchase_amount 

SELECT AVG(IFNULL(PURCHASE_AMOUNT,0))AS Average_purchase_amount,
SHIPPING_TYPE
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
GROUP BY SHIPPING_TYPE;

----------------------------------------------------------------------------------------------------------------------------
--Q6. Display the number of purchases per Location only for those with more than 5 purchases and no NULL Payment Method. 
---Expected Columns: Location, Total Purchases 

SELECT COUNT(*)AS Total_Purchases,
LOCATION
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
WHERE PAYMENT_METHOD IS NOT NULL
GROUP BY LOCATION
HAVING COUNT(*)>5;

---------------------------------------------------------------------------------------------------------------------------
--Q7. Create a column Spender Category that classifies customers using CASE: 
----'High' if amount > 80, 'Medium' if BETWEEN 50 AND 80, 
----'Low' otherwise. Replace NULLs in purchase_amount with 0. 
---Expected Columns: Customer ID, purchase_amount, Spender Category 

SELECT CUSTOMER_ID, 
IFNULL (PURCHASE_AMOUNT,0) AS PURCHASE_AMOUNT, 
CASE
WHEN PURCHASE_AMOUNT > 80 THEN 'High' 
WHEN PURCHASE_AMOUNT BETWEEN 50 AND 80 THEN 'Medium' 
ELSE 'Low' 
END AS Spender_Category 
FROM PRATICAL3.SHOPPING_TRENDS.DATASET;

---------------------------------------------------------------------------------------------------------------------------
--Q8. Find customers who have no Previous Purchases value but whose Color is not NULL. 
---Expected Columns: Customer ID, Color, Previous Purchases 

SELECT CUSTOMER_ID, 
Color, 
PREVIOUS_PURCHASES 
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
WHERE PREVIOUS_PURCHASES IS NULL AND COLOR IS NOT NULL;

-------------------------------------------------------------------------------------------------------------------------
--Q9. Group records by Frequency of Purchases and show the total amount spent per group, treating NULL frequencies as 'Unknown'. 
---Expected Columns: Frequency of Purchases, Total purchase_amount 

SELECT SUM(PURCHASE_AMOUNT) AS Total_purchase_amount,
IFNULL (FREQUENCY_OF_PURCHASES,'Unknown') AS FREQUENCY_OF_PURCHASES
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
GROUP BY FREQUENCY_OF_PURCHASES;

-----------------------------------------------------------------------------------------------------------------------------
--Q10. Display a list of all Category values with the number of times each was purchased, excluding rows where Categoryis NULL. 
---Expected Columns: Category, Total Purchases 

SELECT COUNT(*) AS Total_Purchases,  
CATEGORY
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
WHERE CATEGORY IS NOT NULL
GROUP BY CATEGORY;

----------------------------------------------------------------------------------------------------------------------------
--Q11. Return the top 5 Locations with the highest total purchase_amount, replacing NULLs in amount with 0. 
--Expected Columns: Location, Total purchase_amount 

SELECT  LOCATION,
SUM(IFNULL (PURCHASE_AMOUNT,0)) AS TOTAL_PURCHASE_AMOUNT
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
GROUP BY LOCATION
ORDER BY SUM(IFNULL (PURCHASE_AMOUNT,0)) DESC
LIMIT 5;

----------------------------------------------------------------------------------------------------------------------------
--Q12. Group customers by Gender and Size, and count how many entries have a NULL Color. 
---Expected Columns: Gender, Size, Null Color Count 

SELECT Gender, 
Size, 
COUNT(*)AS Null_Color_Count 
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
WHERE COLOR IS NULL
GROUP BY GENDER,
SIZE;

----------------------------------------------------------------------------------------------------------------------------
--Q13. Identify all Item Purchased where more than 3 purchases had NULL Shipping Type. 
---Expected Columns: Item Purchased, NULL Shipping Type Count 

SELECT ITEM_PURCHASED,
COUNT(*) AS  NULL_Shipping_Type_Count
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
WHERE SHIPPING_TYPE IS NULL 
GROUP BY ITEM_PURCHASED
HAVING COUNT(*)>3;

----------------------------------------------------------------------------------------------------------------------------
--Q14. Show a count of how many customers per Payment Method have NULL Review Rating. 
---Expected Columns: Payment Method, Missing Review Rating Count 

SELECT PAYMENT_METHOD, 
COUNT(*) AS Missing_Review_Rating_Count
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
WHERE REVIEW_RATING IS NULL
GROUP BY PAYMENT_METHOD;

----------------------------------------------------------------------------------------------------------------------------
--15. Group by Category and return the average Review Rating, replacing NULLs with 0, and filter only where average is greater than 3.5. 
---Expected Columns: Category, Average Review Rating 

SELECT  Category,
AVG(IFNULL(REVIEW_RATING,0)) AS Average_Review_Rating 
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
GROUP BY CATEGORY
HAVING AVG(IFNULL(REVIEW_RATING,0))> 3.5;

---------------------------------------------------------------------------------------------------------------------------
--16. List all Colors that are missing (NULL) in at least 2 rows and the average Age of customers for those rows. 
---Expected Columns: Color, Average Age 

SELECT Color, 
AVG(AGE) AS Average_Age 
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
WHERE COLOR IS NULL
GROUP BY COLOR
HAVING COUNT(*) >=2;

----------------------------------------------------------------------------------------------------------------------------
--Q17. Use CASE to create a column Delivery Speed: 
--------'Fast' if Shipping Type is 'Express' or 
--------'Next Day Air', 'Slow' if 'Standard', 
--------'Other' for all else including NULL. Then count how many customers fall into each category. 
---Expected Columns: Delivery Speed, Customer Count 

SELECT COUNT(*) AS  Customer_Count,
CASE
WHEN SHIPPING_TYPE IN ('Express','Next Day Air') THEN 'FAST'
WHEN SHIPPING_TYPE IN ('Standard') THEN 'SLOW'
ELSE 'OTHER'
END AS DELIVERY_SPEED
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
GROUP BY DELIVERY_SPEED;

----------------------------------------------------------------------------------------------------------------------------
--Q18. Find customers whose purchase_amount is NULL and whose Promo Code Used is 'Yes'. 
---Expected Columns: Customer ID, purchase_amount, Promo Code Used 

SELECT CUSTOMER_ID, 
purchase_amount, 
PROMO_CODE_USED
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
WHERE PURCHASE_AMOUNT IS NULL AND PROMO_CODE_USED IN ('Yes');

----------------------------------------------------------------------------------------------------------------------------
--Q19. Group by Location and show the maximum Previous Purchases, replacing NULLs with 0, only where the average rating is above 4.0. 
---Expected Columns: Location, Max Previous Purchases, Average Review Rating 

SELECT LOCATION,
MAX(IFNULL(PREVIOUS_PURCHASES,0)) AS MAX_PREVIOUS_PURCHASES,
AVG(REVIEW_RATING) AS Average_Review_Rating
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
GROUP BY LOCATION
HAVING AVG(REVIEW_RATING)>4;

----------------------------------------------------------------------------------------------------------------------------
--Q20. Show customers who have a NULL Shipping Type but made a purchase in the range of 30 to 70 USD. 
---Expected Columns: Customer ID, Shipping Type, purchase_amount, Item Purchased

SELECT CUSTOMER_ID, 
SHIPPING_TYPE, 
PURCHASE_AMOUNT, 
ITEM_PURCHASED
FROM PRATICAL3.SHOPPING_TRENDS.DATASET
WHERE SHIPPING_TYPE IS NULL AND PREVIOUS_PURCHASES BETWEEN 30 AND 70;
