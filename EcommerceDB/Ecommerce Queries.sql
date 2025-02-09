use W3schools
/**** Advanced Level *****/
/*1. Select customer name together with each order the customer made*/
select C.CustomerName, O.OrderID
From  customers C
inner join  orders O on C.CustomerID = O.CustomerID ;
/*2. Select order id together with name of employee who handled the order*/
select E.FirstName,E.LastName,O.OrderID
From  employees E
inner join  orders O on E.EmployeeID = O.EmployeeID ;

/*3. Select customers who did not placed any order yet*/
select C.CustomerID,C.CustomerName
from customers C
left join orders O on C.CustomerID = O.CustomerID
where O.OrderID is null ; 

/*4. Select order id together with the name of products*/
select O.OrderID,P.ProductName
from orders O
inner join order_details D on O.OrderID = D.OrderID
inner join products P on D.ProductID = P.ProductID;

/*5. Select products that no one bought*/
select P.ProductName
from products P
left join order_details OD on P.ProductID=OD.ProductID
left join orders O on OD.OrderID=O.OrderID
where O.OrderID is null;

/*6. Select customer together with the products that he bought*/
select C.CustomerName,P.ProductName
from customers C
inner join orders O on C.CustomerID=O.CustomerID
inner join order_details OD on O.OrderID=OD.OrderID
inner join products P on OD.ProductID=P.ProductID;

/*7. Select product names together with the name of corresponding category*/
select P.ProductName,C.CategoryName
from products P
inner join categories C on P.CategoryID = C.CategoryID;

/*8. Select orders together with the name of the shipping company*/
select O.OrderID,S.ShipperID,S.ShipperName
from orders O 
inner join shippers S on O.ShipperID = S.ShipperID;

/*9. Select customers with id greater than 50 together with each order they made*/
select C.CustomerID,C.CustomerName,O.OrderID,O.OrderDate
from customers C
inner join orders O on C.CustomerID=O.CustomerID
where C.CustomerID > 50 ;

/*10. Select employees together with orders with order id greater than 10400*/
select E.EmployeeID,E.FirstName,E.LastName,O.OrderID,O.OrderDate
from employees E
inner join orders O on E.EmployeeID=O.EmployeeID
where O.OrderID > 10400 ;


/************ Expert Level ************/

/*1. Select the most expensive product*/
select ProductName , Price AS MostExpensive
from  products
order by price Desc
limit 1 ;

/*2. Select the second most expensive product*/
select ProductName , Price
from  products
order by price Desc
limit 1 
offset 1;

/*3. Select name and price of each product, sort the result by price in decreasing order*/
select ProductName , Price
from  products
order by price Desc;

/*4. Select 5 most expensive products*/
select ProductName , Price
from  products
order by price Desc
limit 5 ;

/*5. Select 5 most expensive products without the most expensive (in final 4 products)*/
select ProductName , Price
from  products
order by price Desc
limit 5 
offset 1;



# 6. Select name of the cheapest product

select ProductName , Price
from  products
order by price ASC
limit 1 ;

/*7. Select number of employees with LastName that starts with 'D'*/
select EmployeeID , LastName
from employees 
where LastName like 'D%' ;

/*9. Select customer name together with the number of orders made by the corresponding customer 
sort the result by number of orders in decreasing order*/
select C.CustomerName , Count(O.OrderID) AS ORDERS_COUNT
from customers C
inner join orders O on C.CustomerID=O.CustomerID
GROUP BY C.CustomerName
order by ORDERS_COUNT Desc;

/*10. Add up the price of all products*/
select sum(Price) AS TotalPrice
from products;

/*11. Select orderID together with the total price of  that Order, order the result by total price of order in increasing order*/
select O.OrderID, SUM(OD.Quantity * P.Price) AS TotalPrice
from orders O
inner join order_details OD ON O.OrderID = OD.OrderID
inner join products P ON OD.ProductID = P.ProductID
group by O.OrderID
order by TotalPrice ASC;

/*12. Select customer who spend the most money*/
select C.CustomerName,O.OrderID, SUM(OD.Quantity * P.Price) AS TotalPrice
from customers C
inner join orders O on C.CustomerID=O.CustomerID
inner join order_details OD ON O.OrderID = OD.OrderID
inner join products P ON OD.ProductID = P.ProductID
group by C.CustomerName,O.OrderID
order by TotalPrice Desc
limit 1;
/*13. Select customer who spend the most money and lives in Canada*/
select C.CustomerName,C.Country,O.OrderID, SUM(OD.Quantity * P.Price) AS TotalPrice
from customers C
inner join orders O on C.CustomerID=O.CustomerID
inner join order_details OD ON O.OrderID = OD.OrderID
inner join products P ON OD.ProductID = P.ProductID
where C.Country = 'Canada'
group by C.CustomerName,O.OrderID
order by TotalPrice Desc;
/*14. Select customer who spend the second most money*/
select C.CustomerName,O.OrderID, SUM(OD.Quantity * P.Price) AS TotalPrice
from customers C
inner join orders O on C.CustomerID=O.CustomerID
inner join order_details OD ON O.OrderID = OD.OrderID
inner join products P ON OD.ProductID = P.ProductID
group by C.CustomerName,O.OrderID
order by TotalPrice Desc
limit 1
offset 1;

/*15. Select shipper together with the total price of proceed orders*/
SELECT S.ShipperName, SUM(OD.Quantity * P.Price) AS TotalPrice
FROM shippers S
INNER JOIN orders O ON S.ShipperID = O.ShipperID
INNER JOIN order_details OD ON O.OrderID = OD.OrderID
INNER JOIN products P ON OD.ProductID = P.ProductID
GROUP BY S.ShipperName
order by TotalPrice Desc;