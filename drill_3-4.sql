-- 問題001
/*
select * except (revenue), revenue * 1.1 as revenue_with_tax
from sample.sales
order by order_id 
limit 3
*/

-- 問題002
/*
select order_id, quantity, revenue, quantity + 1 as new_qty, (quantity + 1) * (revenue / quantity) as new_revenue
from sample.sales
order by new_revenue desc
limit 3
*/

-- 問題003
/*
select * 
from sample.customers
where birthday is not null and is_premium is true
order by birthday desc, register_date
limit 3
*/

-- 問題004
/*
select * 
from sample.customers
where (is_premium is true or birthday between "1970-01-01" and "1979-12-31") and (name like ("%美")) and gender = 2
order by birthday 
limit 3
*/

-- 問題005
/*
select * 
from sample.customers
where prefecture not in ("東京", "千葉", "埼玉", "神奈川") and is_premium is true
order by birthday desc
limit 3
*/