create database Capstone_project

-----Case scenerio 1
select * from [dbo].[KMS Sql Case Study]

--1. which product category had the hifhest sales?;
select product_category, sales from [dbo].[KMS Sql Case Study]
where sales = (select max(sales) from [dbo].[KMS Sql Case Study])

---2. what are the top 3 and botom 3 regions in terms of sales?
select top 3 region, sum(sales) as totalsales from [dbo].[KMS Sql Case Study]
group by region
order by totalsales desc

select top 3 region, sum(sales) as totalsales from [dbo].[KMS Sql Case Study]
group by region
order by totalsales asc

----3. what is the total sales of appliances in ontario?

select sum(sales) as totalsales from [dbo].[KMS Sql Case Study]
where region = 'ontario'

-----4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customer

select top 10 * from [dbo].[KMS Sql Case Study]
order by profit desc

select top 10 * from [dbo].[KMS Sql Case Study]
order by profit asc
---shipping cost - order quality
---unit price
------I will advice Kms to increase discount for customers and also increase advertisment to more customers

---5. KMS incurred the most shipping cost using which shipping method?
--select max(shipping_cost),ship_mode from [dbo].[KMS Sql Case Study]
---group by ship_mode

select shipping_cost,ship_mode from [dbo].[KMS Sql Case Study]
where shipping_cost =(select max(shipping_cost) as max_shipping_cost from [dbo].[KMS Sql Case Study])

----Case Scenerio II
----6. Who are the most valuable customers, and what products or services do they typically purchase?
select * from [dbo].[KMS Sql Case Study]
select top 5 profit, product_name, customer_name
from [dbo].[KMS Sql Case Study]
order by profit Desc

----7. Which small business customer had the highest sales?
select top 1 customer_name, sum(sales) as total_sales
from [dbo].[KMS Sql Case Study]
where customer_segment ='small business'
group by customer_name
order by total_sales desc

----8.Which Corporate Customer placed the most number of orders in 2009 – 2012?
select * from [dbo].[KMS Sql Case Study] 
select top 1 customer_name, count(order_id) as order_count
from [dbo].[KMS Sql Case Study]
where customer_segment = 'coporate'
group by customer_name
order by order_count desc

----9. Which consumer customer was the most profitable one?
select top 1 customer_name, sum(profit) as total_profit
from [dbo].[KMS Sql Case Study]
where customer_segment ='consumer'
group by customer_name
order by total_profit desc

----10. Which customer returned items, and what segment do they belong to?
select * from [dbo].[Order_Status]
select ko.customer_name, ko.customer_segment, count(os.order_id) as total_returned_items
from [dbo].[KMS Sql Case Study] as ko
inner join
[dbo].[Order_Status] as os
on ko.order_id = os.order_id
group by
ko.customer_name, ko.Customer_segment


---11. If the delivery truck is the most economical but the slowest shipping method and 
---Express Air is the fastest but the most expensive one, do you think the companyappropriately spent shipping costs based on the Order 
--Priority? Explain your answer
select ship_mode, order_priority, shipping_cost, ship_date from [dbo].[KMS Sql Case Study] 
order by shipping_cost Asc



