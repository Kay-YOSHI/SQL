-- 問題006
/*
select birthday, count(distinct user_id) as users
from sample.customers
where birthday is not null
group by birthday
having users >= 2
*/

-- 問題007
/*
select user_id, count(page) as pageviews
from sample.web_log
where user_id is not null and media = "email"
group by user_id
having pageviews >= 10
*/

-- 問題008
/*
select prefecture, count(distinct user_id) as users
from sample.customers
where is_premium is true
group by prefecture
order by users desc
limit 1
*/

-- 問題009
/*
select cid, max(session_count) - min(session_count) + 1 as number_of_visits
from sample.web_log
group by cid
order by number_of_visits desc
limit 3
*/

-- 問題010
/*
select
case 
when cost between 0 and 299 then "0円以上300円未満"
when cost between 300 and 599 then "300円以上600円未満"
when cost between 600 and 899 then "600円以上900円未満"
when cost between 900 and 1198 then "900円以上1,199円未満"
end as cost_range, 
count(distinct product_id) as items
from sample.products
group by cost_range
order by cost_range
*/


