/*
=======
Query the data 
======= */


-- overview of data 

DESC; 

DESC staging.joined_table;



---- SELECT ALL OR SOME  COLUMN 

select * from staging.joined_table;

select 
    order_date
    customer_first_name 
    customer_last_name
    product_name
from staging.joined_table
WHERE customer_first_name = 'Marvin';   


-- create a new table for order status description

CREATE TABLE if not exists  staging.order_status (
    order_status integer,
    order_status_discription varchar  ---- variable caracter : that could be so meny carcter 
);

select * from staging.order_status;

insert into     
    staging.order_status

values 
    (1, 'pending'),
    (2 , 'processing'),
    (3, 'regekted'),
    (4 , 'completed');





/* ======================
Investigate unique customers 
==========================*/


-- DISTINCT 

SELECT DISTINCT order_id 
from staging.joined_table
ORDER BY order_id DESC;
 

 --FIND INIQUE VALUES OF CUSTOMER_ID 
SELECT DISTINCT customer_id 
from staging.joined_table
ORDER BY customer_id ASC;



--find unique value of customer full name 
select distinct customer_first_name, customer_last_name
from staging.joined_table 
ORDER BY customer_first_name,customer_last_name;


--it is 'Justina Jenkins'that is the issue 
-- thie can be found out by one window function 
-- below olsow show WHERE clause whith tow conditions
select 
  customer_id,
  customer_first_name,
  customer_last_name,
  customer_city
from staging.joined_table
where customer_first_name = 'Justina'
and customer_last_name = 'Jenkins'


/*==========
Intruduce 
aggregation
==========0*/ 

--- aggregate over rows 
--- there are other ways to aggregation(max,min ...)
select
  order_id,
  product_name,
  quantity,
  list_price 
from staging.joined_table;


-- what is the total revenues from all orders ?

select  
  round(sum (quantity*list_price)) AS totale_revenue 
from staging.joined_table;


-- try other aggegation functions

select  
  round(min (quantity*list_price)) AS min_revenue,
  round(max(quantity*list_price))as max_revenue 
from staging.joined_table;


/*==========
case ... when 
 ==========*/

--similar if else in other lenguages 

--we can replace the order_status column to some discriptions 


