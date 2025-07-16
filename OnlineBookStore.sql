Create Database Books;

Create Table Books(
		Book_ID Serial primary key,
Title  varchar(100),
Author varchar(100),
Genre varchar(100),
Published_Year int,
Price Numeric(10,2),
Stock Int
);

Drop table Onlinebookstore;

Drop table if exists customers;

Create table customers(
Customer_ID  serial primary key,
Name varchar(50),
Email varchar(50),
Phone varchar(50),
City varchar(50),
Country varchar(150)
);

Drop table if exists Orders;
Create table Orders(
Order_ID serial primary key,
Customer_ID int references Customers(Customer_id),
Book_ID INT references books(Book_ID) ,
Order_Date date,
Quantity int,
Total_Amount numeric(10,2)
);
----------------------
Select * from Books;
Select * from Customers;
Select * from Orders;
-----------------------
Select * from books
where genre ='Fiction';

Select * from books
where published_year>1950;
-------------------------
Select * from customers
where country ='Canada';
-----------------------------
Select * from Orders
where order_date between '2023-11-01' and '2023-11-30';
--------------------------------------
Select SUM(stock) as total_stock
from books;
-------------------------------------
Select * from books order by price DESC limit 1;
----------------------------------------------
Select * from Orders
where quantity>1;
----------------------------

Select * from Orders
where total_amount>20;
-----------------------
Select DISTINCT genre from books;
------------------------

Select * from books
Order by stock
limit 1;
----------------------

Select Sum(total_amount) as revenue
from Orders;
-----------------------
Select b.genre, SUM (o.quantity) as TOTAL_quantity_sold
from Orders o
join books b
on 
o.book_id=b.book_id
group by genre;
----------------------
Select avg(price) as average_price
from Books
where genre ='fantasy';
----------------------------
Select o.customer_id,c.name,Count(o.order_id) as Order_count
from orders o
join customers c on o.customer_id=c.customer_id
group by o.customer_id, c.name
having count(order_id)>=2;
------------------------------------

Select Book_ID,Count(order_id) as Order_count
from Orders
Group by Book_id
order by Order_count DESC
limit 1;
-------------------------------
Select * from books
where genre= 'Fantasy'
Order by price desc
limit 3 
;
------------------
Select b.author,Sum (o.quantity) as total_quantiy
from Orders o
join books b
on o.book_id=b.book_id
Group by b.author;
-------------------------------

Select distinct c.city
from orders o
join customers c on o.customer_id=c.customer_id
where o.total_amount >30;
-------------------------
Select c.customer_id, c.name,sum(o.total_amount) as total_spent
from orders o
join customers c on o.customer_id=c.customer_id
group by c.customer_id,c.name
order by total_spent desc limit 1;
-------------------------------------------
Select b.book_id,b.title,b.stock,coalesce (SUM(quantity),0) as order_quantity
from books b
left join orders o
on
b.book_id=o.book_id
group by b.book_id;
---------------------------------------------------------














































