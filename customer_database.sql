
select * from customer_database;

/*Count customers per risk level and flag "big loans"*/
SELECT 
    Risk,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN `Credit amount` > 10000 THEN 1 ELSE 0 END) AS big_loans
FROM customer_database
GROUP BY Risk;

/*Variation of credit risk across different age groups*/
WITH Risk_summary AS (
    SELECT `Age group`, `Risk`, COUNT(*) AS Total
    FROM customer_database
    GROUP BY `Age group`, `Risk`
)
SELECT `Age group`,
       MAX(CASE WHEN `Risk` = 'High Risk' THEN Total ELSE 0 END) AS high_risk_count,
       MAX(CASE WHEN `Risk` = 'Low Risk' THEN Total ELSE 0 END) AS low_risk_count
FROM Risk_summary
GROUP BY `Age group`;


/*Which loan purposes have the highest average loan amounts?*/
SELECT 
    Purpose,
    AVG(`Credit amount`) AS avg_loan,
    DENSE_RANK() OVER (ORDER BY AVG(`Credit amount`) DESC) AS purpose_rank
FROM customer_database
GROUP BY purpose;


/*Do longer loan durations relate to higher loan amounts or lower credit scores?*/
SELECT 
    duration,
    AVG(`credit amount`) AS avg_loan,
    AVG(`credit points`) AS avg_score
FROM customer_database
GROUP BY duration
ORDER BY duration;


/*How many short-term vs. long-term loans exist in the dataset?*/
SELECT 'Short Term' AS loan_type, COUNT(*) AS cnt
FROM customer_database
WHERE duration <= 12
UNION ALL
SELECT 'Long Term', COUNT(*)
FROM customer_database
WHERE duration > 12;


/*Which customers contribute the most to total loan exposure?*/
WITH loan_exposure AS (
    SELECT id, `credit amount`,
           SUM(`credit amount`) OVER() AS total_exposure
    FROM customer_database
)
SELECT id,
      `credit amount`,
       ROUND(100.0 * `credit amount`/ total_exposure, 2) AS pct_of_portfolio
FROM loan_exposure
ORDER BY pct_of_portfolio DESC
LIMIT 10;


/*Among people with the same job, which two customers have the biggest difference in loan amounts?*/
SELECT a.id AS cust1, b.id AS cust2, 
       ABS(a.`credit amount` - b.`credit amount`) AS loan_diff
FROM customer_database a
JOIN customer_database b
  ON a.job = b.job
 AND a.id < b.id
ORDER BY loan_diff DESC
LIMIT 10;


/*Which job categories have the highest average credit score?*/
SELECT job,
       AVG(`credit points`) AS avg_score,
       COUNT(*) AS customer_count
FROM customer_database
GROUP BY job
ORDER BY avg_score DESC;


/*Which loan purposes show the highest risk (default rate)?*/
SELECT Purpose,
       COUNT(*) AS total_loans,
       SUM(CASE WHEN Risk = 'High Risk' THEN 1 ELSE 0 END) AS high_risk_loans,
       ROUND(100.0 * SUM(CASE WHEN Risk = 'High Risk' THEN 1 ELSE 0 END) / COUNT(*), 2) AS high_risk_pct
FROM customer_database
GROUP BY purpose
ORDER BY high_risk_pct DESC;


/*What’s the average repayment duration for high-risk vs low-risk customers?*/
SELECT Risk,
       AVG(Duration) AS avg_duration
FROM customer_database
GROUP BY Risk;


/*Repayment preformance by risk category*/
CREATE TABLE Repayments AS
SELECT ID,
       CASE 
           WHEN Risk = 'High Risk' AND RAND() < 0.5 THEN 'Default'
           WHEN Risk = 'Medium Risk' AND RAND() < 0.2 THEN 'Default'
           WHEN Risk = 'Low Risk' AND RAND() < 0.05 THEN 'Default'
           ELSE 'Paid'
       END AS repayment_status
FROM customer_database;

SELECT c.Risk, r.repayment_status, COUNT(*) AS num_customers
FROM customer_database c
JOIN repayments r
  ON c.id = r.id
GROUP BY c.Risk, r.repayment_status
ORDER BY c.Risk, r.repayment_status;






 
