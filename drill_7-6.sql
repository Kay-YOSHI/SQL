-- 問題021
/*
SELECT
    name
    , SUBSTR(name, 1, INSTR(name, " ") - 1) AS family_name
    , SUBSTR(name, INSTR(name, " ") + 1) AS first_name
    --, CONCAT(SUBSTR(name, 1, INSTR(name, " ") - 1), SUBSTR(name, INSTR(name, " ") + 1)) AS non_spaced
FROM
    `sql-book-346912.sample.customers`
LIMIT 5
*/

-- 問題022
/*
SELECT
    product_id
    --, SUM(revenue) AS sample
    , CAST(ROUND(SUM(revenue), -3) AS INT64) AS sum_revenue
FROM
    `sql-book-346912.sample.sales`
GROUP BY
    product_id
ORDER BY
    sum_revenue DESC
LIMIT 5
*/

-- 問題023
/*
SELECT
    CASE WHEN CAST(FLOOR(DATE_DIFF(DATE('2019-12-31'), birthday, DAY) / 365) AS INT64) >= 50
        THEN CONCAT(name, 'さま')
        ELSE CONCAT(name, 'さん') END AS name_with_keisho
    , CAST(FLOOR(DATE_DIFF(DATE('2019-12-31'), birthday, DAY) / 365) AS INT64) AS age
    , birthday
FROM
    `sql-book-346912.sample.customers`
WHERE
    birthday IS NOT NULL
    AND
    REGEXP_CONTAINS(name, r'美馬|森村')
*/

-- 問題024
/*
SELECT
    SUBSTR(CAST(DATETIME_TRUNC(date_time, MONTH) AS STRING), 1, 7) AS year_month
    --FORMAT_DATETIME('%Y-%m', date_time) AS year_month
    , COUNT(page) AS pageviews
FROM
    `sql-book-346912.sample.web_log`
GROUP BY
    year_month
ORDER BY
    pageviews DESC
LIMIT 3
*/

-- 問題025
/*
SELECT
    name
    , SUBSTR(name, INSTR(name, " ") + 1) AS first_name
FROM
    `sql-book-346912.sample.customers`
WHERE
    REGEXP_CONTAINS(name, r'^.川\s..子$')
    --REGEXP_CONTAINS(SUBSTR(name, 1, INSTR(name, " ") - 1), r'.{1}川$')
    --AND
    --REGEXP_CONTAINS(SUBSTR(name, INSTR(name, " ") + 1), r'.{2}子$')
*/

-- 問題025（別解）
/*
SELECT
    name
    , REGEXP_EXTRACT(name, r'^.川\s(..子)$') AS first_name
FROM
    `sql-book-346912.sample.customers`
WHERE
    REGEXP_EXTRACT(name, r'^.川\s(..子)$') IS NOT NULL
*/







