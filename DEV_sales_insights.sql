# Data Analysis Using SQL

/* 1. Show all customer records */
select * from customers;

/* 1. Show total number of customers */
select count(*) from customers;

/* 1. Show transactions for Chennai market (market code for chennai is Mark001 */
select count(*) from transactions
where market_code='Mark001';

/* 1. Show distrinct product codes that were sold in chennai */
select distinct product_code, market_code 
from transactions
where market_code='Mark001';

/*1. Show transactions where currency is US dollars*/
select * from transactions
where currency = 'usd';

/*1. Show transactions in 2020 join by date table*/
SELECT transactions.*, date.* FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2020;

/*1. Show total revenue in year 2020,*/
select sum(transactions.sales_amount) as '2020 revenue'
from transactions
inner join date 
ON transactions.order_date=date.date 
where date.year=2020 
and transactions.currency="INR\r" 
or transactions.currency="USD\r";

/*1. Show total revenue in year 2020, January Month, */
SELECT SUM(transactions.sales_amount)
FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date where date.year=2020 
and date.month_name="February" 
and (transactions.currency="INR\r" 
or transactions.currency="USD\r");

/* 1. Show total revenue in year 2020 in Chennai */
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020
and transactions.market_code="Mark001";