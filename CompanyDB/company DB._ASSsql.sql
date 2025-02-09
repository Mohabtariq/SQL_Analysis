USE companydb;
-- Display the name and city of all customers  
SELECT CUST_NAME, CUST_CITY  
FROM CUSTOMER;  

-- Display all columns for all customers  
SELECT *  
FROM CUSTOMER;  

-- Display the details of customers who belong to the city of 'London'  
SELECT *  
FROM CUSTOMER  
WHERE CUST_CITY = 'London';  

-- Display the details of customers with the customer code 'C00015'  
SELECT *  
FROM CUSTOMER  
WHERE CUST_CODE = 'C00015';  

-- Display the details of customers who belong to the countries 'USA' or 'India'  
SELECT *  
FROM CUSTOMER  
WHERE CUST_COUNTRY IN ('USA', 'India');  

-- Display the details of customers who do not belong to the city 'Bangalore'  
SELECT *  
FROM CUSTOMER  
WHERE CUST_CITY != 'Bangalore';  

-- Display all customer details in descending order of their cities  
SELECT *  
FROM CUSTOMER  
ORDER BY CUST_CITY DESC;  

-- Display the maximum order amount placed  
SELECT MAX(ORD_AMOUNT) AS Max_Order_Amount  
FROM ORDERS;  

-- Display the total number of orders placed  
SELECT COUNT(*) AS Total_No_Orders  
FROM ORDERS;  

-- Display the average order amount of all orders placed  
SELECT AVG(ORD_AMOUNT) AS Orders_Avg  
FROM ORDERS;  

-- Display the details of customers whose names start with the letter 'm'  
SELECT *  
FROM CUSTOMER  
WHERE CUST_NAME LIKE 'm%';  

-- Display the details of customers whose names end with the letter 's'  
SELECT *  
FROM CUSTOMER  
WHERE CUST_NAME LIKE '%s';  

-- Display the details of customers who belong to the countries 'Australia', 'USA', or 'UK'  
SELECT *  
FROM CUSTOMER  
WHERE CUST_COUNTRY IN ('Australia', 'USA', 'UK');  

-- Display the details of orders placed in January  
SELECT *  
FROM ORDERS  
WHERE MONTH(ORD_DATE) = 1;  

-- Display the names and payment amounts of customers who paid between 1000 and 4000  
SELECT CUST_NAME, PAYMENT_AMT  
FROM CUSTOMER  
WHERE PAYMENT_AMT BETWEEN 1000 AND 4000;  

-- Display the top 10 customers with the highest payment amounts  
SELECT CUST_NAME, PAYMENT_AMT  
FROM CUSTOMER  
ORDER BY PAYMENT_AMT DESC  
LIMIT 10;  

-- Display customers' names and payment amounts sorted by payment in ascending order  
-- and names in ascending order  
SELECT CUST_NAME, PAYMENT_AMT  
FROM CUSTOMER  
ORDER BY PAYMENT_AMT ASC, CUST_NAME ASC;  

-- Display the total number of customers in each country, sorted in descending order  
SELECT CUST_COUNTRY, COUNT(*) AS Total_Customers  
FROM CUSTOMER  
GROUP BY CUST_COUNTRY  
ORDER BY Total_Customers DESC;  

-- Display the total number of orders handled by each agent  
SELECT AGENT_CODE, COUNT(*) AS Total_Orders  
FROM ORDERS  
GROUP BY AGENT_CODE  
ORDER BY Total_Orders DESC;  

-- Display the total number of customers in each city along with their country  
SELECT CUST_COUNTRY, CUST_CITY, COUNT(*) AS Total_Customers  
FROM CUSTOMER  
GROUP BY CUST_COUNTRY, CUST_CITY  
ORDER BY Total_Customers DESC;  
