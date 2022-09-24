-- 問題011
/*
select product_category, sum(revenue) as sum_rev 
from sample.sales
inner join sample.products 
using (product_id)
group by product_category
order by sum_rev desc
*/

-- 問題012
/*
with total_qty as (
    select sum(quantity) as ttl_qty from sample.sales
)

select 
product_id, 
sum(quantity) as sum_qty, 
sum(quantity) / avg(ttl_qty) as sales_share
from sample.sales
cross join total_qty
group by product_id
order by sales_share desc
limit 5
*/

-- 問題012別解
/*
with 
qty_by_product as (
    select product_id, sum(quantity) as sum_qty from sample.sales
    group by product_id
), 
total_qty as (
    select sum(quantity) as ttl_qty from sample.sales
)

select product_id, sum_qty, sum_qty / ttl_qty as sales_share
from qty_by_product 
cross join total_qty 
order by sales_share desc 
limit 5
*/

-- 問題013 
/*
select 
case 
when gender = 1 then "男性" 
when gender = 2 then "女性" 
else "不明"
end as customer_gender, 
product_category, 
sum(revenue) as sum_revenue 
from sample.sales 
inner join sample.products 
using (product_id)
inner join sample.customers 
using (user_id)
group by customer_gender, product_category
order by customer_gender asc, sum_revenue desc
*/

-- 問題014
/*
with 
table_a as (
    select product_id, sum(quantity) as sum_qty 
    from sample.sales 
    where date_time between "2019-07-01" and "2019-09-30"
    group by product_id
    having sum_qty >= 10
), 
table_b as (
    select product_id, sum(quantity) as sum_qty 
    from sample.sales 
    where date_time between "2019-10-01" and "2019-12-31"
    group by product_id
    having sum_qty < 10
)

select product_id from table_a 
intersect distinct 
select product_id from table_b
*/

-- 問題015
/*
select 
product_name, 
sum(quantity) as sum_quantity, 
sum(revenue) as sum_revenue, 
sum(quantity * cost) as sum_cost, 
sum(revenue) - sum(quantity * cost) as profit
from sample.sales 
inner join sample.products 
using (product_id)
group by product_name
order by profit desc 
limit 3
*/


