-- 問題016
/*
WITH temp1 AS (
    SELECT
        product_id
        , SUM(quantity) AS sum_quantity
        , SUM(revenue) AS sum_revenue
        , AVG(revenue / quantity) AS ave_unit_price
    FROM
        `sql-book-346912.sample.sales`
    GROUP BY product_id
)

SELECT *
FROM
    temp1
CROSS JOIN
    (
      SELECT
          AVG(ave_unit_price) AS ave_unit_price_by_product
      FROM
          temp1
    ) AS temp2
WHERE
    temp1.ave_unit_price > temp2.ave_unit_price_by_product
ORDER BY
    ave_unit_price DESC
*/

-- 問題017
/*
WITH temp AS (
    SELECT *
    FROM `sql-book-346912.sample.customers` AS a
    INNER JOIN
        (
          SELECT
              prefecture
              , COUNT(*) AS num_premium
          FROM
              `sql-book-346912.sample.customers`
          WHERE
              is_premium IS TRUE
          GROUP BY
              prefecture
        ) AS b
    ON
        a.prefecture = b.prefecture
    WHERE
        b.num_premium >= 4
)

SELECT *
FROM temp
WHERE
    birthday IN
        (
          SELECT MIN(birthday)
          FROM temp
        )    
*/

-- 問題018
/*
SELECT
    COUNT(DISTINCT concat(cid,'_',session_count)) AS session
    , COUNT(*) AS sum_pageviews
FROM
    `sql-book-346912.sample.web_log`
*/

-- 問題019
/*
SELECT
    SUM(revenue) - 
        (SELECT SUM(revenue) FROM `sql-book-346912.sample.sales` WHERE is_proper IS FALSE) AS revenue_diff
FROM
    `sql-book-346912.sample.sales`
WHERE
    is_proper IS TRUE
*/

-- 問題020
/*
WITH temp1 AS (
    SELECT SUM(revenue) AS true_rev
    FROM `sql-book-346912.sample.sales`
    WHERE product_id = 1
)

, temp2 AS (
    SELECT SUM(quantity * unit_price) AS imaginary_rev
    FROM `sql-book-346912.sample.sales`
    CROSS JOIN
        (
          SELECT
              AVG(revenue / quantity) AS unit_price
          FROM `sql-book-346912.sample.sales`
          WHERE product_id = 1 AND is_proper IS TRUE
        )
    WHERE product_id = 1
)

SELECT temp2.imaginary_rev - temp1.true_rev AS sum_lost_revenue
FROM temp1
CROSS JOIN temp2
*/






