-- E1
select PRODUCT_ID,PRODUCT_NAME,CATEGORY_NAME from product_table inner join
category_table on
product_table.FK_CATEGORY_ID = category_table.CATEGORY_ID
where CATEGORY_NAME = "Beverages";
-- E2
select * from customer_table
where CUSTOMER_CITY = 'MUMBAI';

-- E3
select * from branch_table left join status_table 
on branch_table.FK_STATUS_ID = status_table.STATUS_ID
where STATUS_UPDATE = "ACTIVE";

-- E4
select * from product_table
order by D_MART_PRICE desc
limit 10;

-- E5
select count(*) as Total_order_placed from order_table ;

-- E6
select * from order_table
where GRAND_TOTAL > 5000;

-- E7
select distinct(METHOD) from payment_table;

-- E8
select PRODUCT_NAME,CATEGORY_NAME from product_table inner join category_table on
product_table.FK_CATEGORY_ID = category_table.CATEGORY_ID;

-- E9
select * from customer_table
where CUSTOMER_GENDER = 'FEMALE';

-- E10
select count(PRODUCT_ID) as 'Product_count' ,CATEGORY_NAME from product_table inner join category_table
on product_table.FK_CATEGORY_ID = category_table.CATEGORY_ID
group by CATEGORY_NAME;

-- M1
select round(sum(GRAND_TOTAL),2) as Total_Revenue,BRANCH_NAME from order_table inner join branch_table on 
order_table.FK_BRANCH_ID = branch_table.BRANCH_ID
group by BRANCH_NAME
order by Total_Revenue desc;

-- M2
select SUM(GRAND_TOTAL ) AS TOTAL_SPEND,CUSTOMER_NAME from customer_table INNER join order_table ON
customer_table.CUSTOMER_ID = order_table.FK_CUSTOMER_ID
group by CUSTOMER_ID
order by TOTAL_SPEND DESC
limit 5;

-- CUSTOMER WHO NEVER ORDER A SINGLE PRODUCT 
SELECT CUSTOMER_NAME FROM order_table RIGHT JOIN customer_table ON 
order_table.FK_CUSTOMER_ID = customer_table.CUSTOMER_ID 
WHERE ORDER_ID IS NULL;
-- M3
SELECT * FROM product_table LEFT JOIN order_item_table ON
product_table.PRODUCT_ID = order_item_table.FK_PRODUCT_ID
WHERE order_item_table.ORDER_ITEM_ID IS NULL; 

-- M4
SELECT ROUND(AVG(RATING),2) AS AVG_RATING,PRODUCT_NAME FROM product_table INNER JOIN order_item_table
ON product_table.PRODUCT_ID = order_item_table.FK_PRODUCT_ID
INNER JOIN review_table ON
order_item_table.ORDER_ITEM_ID=review_table.FK_ORDER_ITEM_ID
group by PRODUCT_ID
order by AVG_RATING DESC;

-- M5 LAST 30 DAYS ORDER FROM 2026-07-08 - IM DOING THIS NOW -05-08-2026 SO I MENTIONED DIRECTLY DATE RATHER THAN CURDATE()
SELECT ORDER_ID,datediff('2026-07-08',ORDER_DATE) AS TOTAL_ORDER_DAYS,ORDER_DATE FROM order_table
HAVING TOTAL_ORDER_DAYS BETWEEN 0 AND 30
ORDER BY TOTAL_ORDER_DAYS ASC;

-- M6 
	SELECT count(ORDER_ID) AS ORDER_COUNT,CUSTOMER_NAME,CUSTOMER_ID FROM customer_table RIGHT JOIN order_table ON 
	customer_table.CUSTOMER_ID = order_table.FK_CUSTOMER_ID
	GROUP BY CUSTOMER_ID,CUSTOMER_NAME
    HAVING ORDER_COUNT >2;

-- M7
SELECT sum(GRAND_TOTAL) AS TOTAL_REVENUE , date_format(ORDER_DATE,'%Y-%m') AS YEAR_MONTH_TREND FROM order_table
GROUP BY YEAR_MONTH_TREND
ORDER BY YEAR_MONTH_TREND ASC;

-- M8
SELECT COUNT(*) AS NO_OF_TIMES_USED,METHOD FROM payment_table
GROUP BY METHOD
ORDER BY NO_OF_TIMES_USED DESC
;

-- M9
SELECT datediff(EXPIRY_DATE,CURDATE()) AS NO_OF_DAYS_TO_EXPIRY,PRODUCT_NAME,EXPIRY_DATE FROM  product_table
HAVING NO_OF_DAYS_TO_EXPIRY BETWEEN 0 AND 15
ORDER BY NO_OF_DAYS_TO_EXPIRY DESC;

-- M10
SELECT ROUND(AVG(DISCOUNT),2) AS AVG_DISCOUNT,CATEGORY_NAME,CATEGORY_ID FROM product_table INNER join category_table ON
product_table.FK_CATEGORY_ID = category_table.CATEGORY_ID
GROUP BY CATEGORY_NAME,CATEGORY_ID
ORDER BY AVG_DISCOUNT DESC;

-- M11
SELECT COUNT(REASON_ID) AS RETURN_COUNT,REASON_ID,RETURN_REASON FROM return_table INNER JOIN reason_table ON 
return_table.FK_RETURN_REASON_ID = reason_table.REASON_ID
GROUP BY REASON_ID,RETURN_REASON
ORDER BY RETURN_COUNT DESC;

-- M12
SELECT CASE
	WHEN GRAND_TOTAL < 1000 THEN 'SMALL'
    WHEN GRAND_TOTAL BETWEEN 1000 AND 5000 THEN 'MEDUIM'
    WHEN GRAND_TOTAL >5000 THEN 'LARGE'
    ELSE 'NOT SPECIFY'
    END AS BUCKET_CATEGORY,count(ORDER_ID) AS ORDERS_COUNTS
 FROM order_table
 group by BUCKET_CATEGORY
 order by ORDERS_COUNTS DESC;
 
-- SUBQUERY APPROACH 
 SELECT BUCKET_CATEGORY,COUNT(ORDER_ID) AS ORDER_COUNT FROM
 
 (SELECT ORDER_ID,CASE
	WHEN GRAND_TOTAL < 1000 THEN 'SMALL'
    WHEN GRAND_TOTAL BETWEEN 1000 AND 5000 THEN 'MEDUIM'
    WHEN GRAND_TOTAL >5000 THEN 'LARGE'
    ELSE 'NOT SPECIFY'
    END AS BUCKET_CATEGORY
FROM order_table) AS BUCKET_TABLE
GROUP BY BUCKET_CATEGORY
ORDER BY ORDER_COUNT DESC;

-- M13 
SELECT * FROM branch_table INNER JOIN status_table ON 
branch_table.FK_STATUS_ID = status_table.STATUS_ID
WHERE STATUS_UPDATE != 'ACTIVE';

-- M14
SELECT REVIEW_ID,CUSTOMER_NAME,PRODUCT_NAME,RATING FROM review_table INNER join order_item_table ON 
review_table.FK_ORDER_ITEM_ID = order_item_table.ORDER_ITEM_ID
INNER JOIN product_table ON
product_table.PRODUCT_ID = order_item_table.FK_PRODUCT_ID
INNER JOIN customer_table ON
customer_table.CUSTOMER_ID = review_table.FK_CUSTOMER_ID
WHERE RATING =1;

-- H1
SELECT PRODUCT_NAME,CATEGORY_NAME,D_MART_PRICE,RANK() OVER (partition by CATEGORY_NAME ORDER BY D_MART_PRICE DESC) AS RANK_PRODUCT FROM product_table INNER JOIN category_table ON 
product_table.FK_CATEGORY_ID = category_table.CATEGORY_ID;

-- H2
SELECT * FROM
(
SELECT PRODUCT_NAME,D_MART_PRICE,CATEGORY_NAME, RANK() OVER (partition by CATEGORY_NAME ORDER BY D_MART_PRICE DESC) AS RANKING_CAT FROM product_table INNER JOIN category_table ON 
product_table.FK_CATEGORY_ID = category_table.CATEGORY_ID ) AS RANK_TABLE
WHERE RANKING_CAT = 2;

-- H3 RUNNIN TOTAL EACH BRANCH BY DATE
SELECT BRANCH_ID , BRANCH_NAME , ORDER_ID, date_format(ORDER_DATE,'%Y-%m') AS DATE_FORMAT ,SUM(GRAND_TOTAL) OVER (partition by BRANCH_ID ORDER BY ORDER_DATE ASC)  
AS TOTAL_REVENUE FROM order_table INNER JOIN branch_table ON
order_table.FK_BRANCH_ID =  branch_table.BRANCH_ID;

-- H4
SELECT cu.CUSTOMER_ID, cu.CUSTOMER_NAME
FROM CUSTOMER_TABLE cu
WHERE NOT EXISTS (
  SELECT 1 FROM ORDER_TABLE o
  JOIN ORDER_ITEM_TABLE oi ON o.ORDER_ID = oi.FK_ORDER_ID
  JOIN RETURN_TABLE rt ON rt.FK_ORDER_ITEM_ID = oi.ORDER_ITEM_ID
  WHERE o.FK_CUSTOMER_ID = cu.CUSTOMER_ID
);

SELECT distinct CUSTOMER_ID,CUSTOMER_NAME FROM customer_table
WHERE NOT exists (
SELECT 1 FROM order_table INNER JOIN order_item_table ON 
order_table.ORDER_ID = order_item_table.FK_ORDER_ID 
INNER JOIN return_table ON
return_table.FK_ORDER_ITEM_ID = order_item_table.ORDER_ITEM_ID 
WHERE customer_table.CUSTOMER_ID=order_table.FK_CUSTOMER_ID);


 -- H5 . Using a CTE, find the top 3 best-selling products (by quantity sold) overall.
 
 with cte_table as(
	select sum(QUANTITY) as Total_Quantity,PRODUCT_ID,PRODUCT_NAME from product_table inner  join order_item_table on
	product_table.PRODUCT_ID=order_item_table.FK_PRODUCT_ID inner join
	order_table on
	order_table.ORDER_ID = order_item_table.FK_ORDER_ID
    group by PRODUCT_ID,PRODUCT_NAME
)
select * from cte_table
order by Total_Quantity desc
limit 3;

-- H6. For each customer, find their most recent order date and how many days ago that was.

select CUSTOMER_ID,customer_table.CUSTOMER_NAME ,max((date_format(order_date,"%Y-%m-%d"))) as Last_order_Date,datediff(curdate(),max(order_date))as Days_ago from order_table inner join customer_table on
customer_table.CUSTOMER_ID=order_table.FK_CUSTOMER_ID
group by CUSTOMER_ID,CUSTOMER_NAME
order by Last_order_Date desc;

	-- H7. Find the month-over-month percentage growth/decline in total revenue.

	with cte_table as(
	select sum(GRAND_TOTAL) as Total_Revenue,date_format(ORDER_DATE,'%Y-%m' ) as year_month_col from order_table
	group by year_month_col),
	cte_table2 as (select *,
	lag(Total_Revenue) over(order by year_month_col) as prev_month_total from cte_table)
	select * , round(((Total_Revenue - prev_month_total)/prev_month_total)*100,2) as MoM_percentage from cte_table2
	order by year_month_col ;
    
-- H8. Identify branches whose return rate (returns ÷ items sold) is above 15%.
select BRANCH_NAME,count(distinct return_id) as returnn , count(distinct order_item_id) as item_sold,
round((count(distinct return_id)/count(distinct order_item_id))*100,2) as return_rate from order_item_table left join return_table on 
order_item_table.ORDER_ITEM_ID = return_table.FK_ORDER_ITEM_ID
inner join order_table on
order_table.ORDER_ID =order_item_table.FK_ORDER_ID
inner join
branch_table on 
branch_table.BRANCH_ID = order_table.FK_BRANCH_ID
group by BRANCH_ID
having return_rate > 15;


-- H9. Find the top-selling product per branch (i.e., partition by branch, rank by quantity sold).

with product_sales as(
select PRODUCT_ID,PRODUCT_NAME,BRANCH_ID,BRANCH_NAME,sum(QUANTITY) as total_quantity from order_table inner join order_item_table on 
order_table.ORDER_ID = order_item_table.FK_ORDER_ID inner join product_table on
product_table.PRODUCT_ID =order_item_table.FK_PRODUCT_ID inner join branch_table on
branch_table.BRANCH_ID = order_table.FK_BRANCH_ID
group by PRODUCT_ID,PRODUCT_NAME,BRANCH_ID,BRANCH_NAME)
,cte_table2 as (
select *,rank() over (partition by branch_id order by total_quantity desc) as ranking_product from product_sales)
select sum(total_quantity), branch_name,product_name,ranking_product from cte_table2
group by branch_name,product_name
having ranking_product =1
order by sum(total_quantity) desc 
;

-- H10  Find customers whose total spend is above the overall average customer spend.
with cte_table1 as (
select sum(GRAND_TOTAL) as total_spend,CUSTOMER_NAME,CUSTOMER_ID from customer_table inner join order_table on 
customer_table.CUSTOMER_ID = order_table.FK_CUSTOMER_ID
group by customer_id,customer_name)
select customer_id ,customer_name,total_spend from cte_table1
where total_spend > (select avg(total_spend) from cte_table1)
order by total_spend desc;

-- H11. Write a query using a self-referencing style comparison to find products priced above the average price of their own category (correlated subquery).
with cte_table1 as  (
select PRODUCT_ID,PRODUCT_NAME,FK_CATEGORY_ID,CATEGORY_NAME ,D_MART_PRICE, avg(D_MART_PRICE) over(partition by fk_category_id ) avg_price  from product_table inner join category_table on 
product_table.FK_CATEGORY_ID = category_table.CATEGORY_ID)
select product_id,product_name, category_name,avg_price,d_mart_price from cte_table1
where d_mart_price > avg_price;

-- S1 -- 
-- Our marketing head wants to run a loyalty campaign. 
-- Give me the top 10 customers by lifetime spend, along with their city and number of orders, so we know who to target.
	select sum(GRAND_TOTAL) as total_spend ,count(ORDER_ID) as total_order, CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_CITY from order_table inner join customer_table on
	order_table.FK_CUSTOMER_ID = customer_table.CUSTOMER_ID
	group by CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_CITY
	order by total_spend desc
	limit 10;
    
-- S2. "Store managers are complaining about the Bhopal and Lucknow branches. Pull return-rate data by branch and tell me which branches are underperforming.

select 	count(RETURN_ID) as returnn,count(ORDER_ITEM_ID) as item_sold,
round((count(distinct return_id)/count(distinct order_item_id))*100,2) as return_rate,BRANCH_NAME,BRANCH_ID from order_table 
inner join order_item_table on 
order_table.ORDER_ID = order_item_table.FK_ORDER_ID 
left join return_table on 
return_table.FK_ORDER_ITEM_ID = order_item_table.ORDER_ITEM_ID 
inner join branch_table on 
branch_table.BRANCH_ID = order_table.FK_BRANCH_ID
group by BRANCH_id,branch_name
order by return_rate desc;


select count(distinct RETURN_ID) as return_count,RETURN_REASON,BRANCH_NAME from return_table inner join reason_table on 
reason_table.REASON_ID =return_table.FK_RETURN_REASON_ID
inner join order_item_table on 
order_item_table.ORDER_ITEM_ID = return_table.FK_ORDER_ITEM_ID
inner join order_table on
order_table.ORDER_ID = order_item_table.FK_ORDER_ID
inner join branch_table on 
branch_table.BRANCH_ID =order_table.FK_BRANCH_ID
where BRANCH_NAME in ('DMart Bhopal - MP Nagar')
group by return_reason,BRANCH_NAME
order by return_count desc;
-- quality is issue and late delivery in lucknow 
-- higher price , duplicate order , product not as describe ,quality in Bhopal 	

-- S3."We're running low on shelf space. Give me a list of products expiring in the next 2 weeks,sorted by soonest expiry, along with category and current stock discount."

