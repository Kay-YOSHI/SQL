-- 問題026
/*
WITH master AS (
    SELECT
        DATETIME_TRUNC(date_time, YEAR) AS year
        , DATETIME_TRUNC(date_time, MONTH) AS year_month
        , SUM(revenue) AS sum_rev
    FROM `sql-book-346912.sample.sales`
    GROUP BY year, year_month
    ORDER BY year, year_month
)

SELECT
    SUBSTR(CAST(year AS STRING), 1, 4) AS year
    , MAX(sum_rev) - MIN(sum_rev) AS hani
FROM master
GROUP BY year
ORDER BY year
*/

-- 問題027
/*
WITH master AS (
    SELECT
        product_category
        , product_name
        , cost
        , RANK() OVER (PARTITION BY product_category ORDER BY cost DESC) AS cost_rank
    FROM
        `sql-book-346912.sample.products`
    )

SELECT *
FROM master
WHERE cost_rank <= 3
*/

-- 問題028
/*
WITH master AS (
    SELECT
        DATETIME_TRUNC(date_time, MONTH) AS year_month
        , product_id
        , SUM(revenue) AS sum_rev
    FROM
        `sql-book-346912.sample.sales`
    GROUP BY
        year_month
        , product_id
    ORDER BY
        year_month
        , product_id
)

, temp AS (
    SELECT
        FORMAT_DATETIME('%Y-%m', year_month) AS year_month
        , product_id
        , sum_rev
        , SUM(sum_rev) OVER (
              PARTITION BY year_month) AS denom
        , SUM(sum_rev) OVER (
              PARTITION BY year_month
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS denom2
        , SUM(sum_rev) OVER (
              PARTITION BY year_month
              ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS denom3
        , sum_rev / SUM(sum_rev) OVER (PARTITION BY year_month) AS monthly_revenue_share
    FROM
        master
)

SELECT
    year_month
    , product_id
    , monthly_revenue_share
FROM
    temp
WHERE
    monthly_revenue_share > 0.40
ORDER BY
    monthly_revenue_share DESC
*/

-- 問題029
/*
WITH master AS (
    SELECT
        user_id
        , product_id
        , date_time
        , ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY date_time, product_id) AS purchase_order
    FROM
        `sql-book-346912.sample.sales`
    ORDER BY
        user_id
        , date_time
)

SELECT
    product_id AS first_purchase_product
    , COUNT(DISTINCT user_id) AS number_of_users
FROM
    master
WHERE
    purchase_order = 1
GROUP BY
    product_id
ORDER BY
    number_of_users DESC
LIMIT 5
*/

-- 問題030
/*
WITH master AS (
    SELECT
        cid
        , session_count
        , date_time
        , page
        , FIRST_VALUE(page) OVER (PARTITION BY cid, session_count ORDER BY date_time) AS landing_page
        --, LAST_VALUE(page) OVER (PARTITION BY cid, session_count ORDER BY date_time) AS exit_page0
        , LAST_VALUE(page) OVER (
                PARTITION BY cid, session_count
                ORDER BY date_time 
                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS exit_page
    FROM
        `sql-book-346912.sample.web_log`
    ORDER BY
        cid
        , session_count
        , date_time
)

SELECT
    CONCAT(landing_page, ' -> ', exit_page) AS landing_and_exit
    , COUNT(DISTINCT CONCAT(cid, session_count)) AS session
FROM
    master
WHERE
    CONCAT(cid, session_count) IN (
        select CONCAT(cid, session_count) AS cid_session_count
        from master
        GROUP BY cid_session_count
        HAVING COUNT(*) > 1
    )
GROUP BY
    landing_and_exit
ORDER BY
    session DESC
LIMIT 5
*/










