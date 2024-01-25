BANK LOAN REPORT QUERY DOCUMENT
A.	BANK LOAN REPORT | SUMMARY
KPI’s:
Total Loan Applications
SELECT COUNT(id) AS Total_Loan_Application FROM financial_loan

 
MTD Loan Applications
SELECT  COUNT(id) AS MTD Loan_Application FROM financial_loan 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

 
PMTD Loan Applications
SELECT  COUNT(id) AS PMTD_Loan_Application FROM financial_loan 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
 

Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Data FROM financial_loan
 
MTD Total Funded Amount
SELECT  SUM(loan_amount) AS MTD_Funded_Data FROM financial_loan 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

 




PMTD Total Funded Amount
SELECT  SUM(loan_amount) AS PMTD_Funded_Data FROM financial_loan 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
 


Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Received FROM financial_loan
 
MTD Total Amount Received

SELECT  SUM(total_payment) AS MTD_Total_Amount_Received FROM financial_loan 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
 
PMTD Total Amount Received
SELECT  SUM(total_payment) AS PMTD_Total_Amount_Received FROM financial_loan 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
 

Average Interest Rate
SELECT ROUND(AVG(int_rate),4)* 100 AS avg_Interest_Rate FROM financial_loan 
MTD Average Interest
SELECT  ROUND(AVG(int_rate),4)* 100 AS MTD_avg_Interest_Rate FROM financial_loan 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
  
PMTD Average Interest
SELECT  ROUND(AVG(int_rate),4)* 100 AS PMTD_avg_Interest_Rate FROM financial_loan 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
  





Avg DTI

SELECT ROUND(AVG(dti),4)*100 AS Avg_DTI FROM financial_loan
 
MTD Avg DTI
SELECT ROUND(AVG(dti),4)*100 AS MTD_Avg_DTI FROM financial_loan 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

 
PMTD Avg DTI
SELECT ROUND(AVG(dti),4)*100 AS MTD_Avg_DTI FROM financial_loan 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
 


GOOD LOAN ISSUED
Good Loan Percentage
SELECT (COUNT(CASE 
WHEN loan_status ='fully paid' or loan_status ='current'
THEN id
END)*100
) 
/
COUNT(id) AS Good_Loan_Percentage
FROM financial_loan

 
Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM financial_loan
WHERE loan_status ='fully paid' or loan_status ='current'
 
Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM financial_loan
WHERE loan_status ='fully paid' or loan_status ='current'
 

Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
 

BAD LOAN ISSUED
Bad Loan Percentage
SELECT (COUNT(CASE 
WHEN loan_status ='Charged Off' 
THEN id
END)*100.00
) 
/
COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan
 
Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status = 'Charged Off'
 
Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount  FROM financial_loan
WHERE loan_status = 'Charged Off'
  
Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received  FROM financial_loan
WHERE loan_status = 'Charged Off'
  






LOAN STATUS
	SELECT
        loan_status,
        COUNT(id) AS LoanCounT-Application,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        financial_loan
    GROUP BY
        loan_status
 



SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loan
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status
 



B.	BANK LOAN REPORT | OVERVIEW
MONTH
SELECT 
	MONTH(issue_date) AS Month_Nunber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)
 





STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state
 





TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term
 

EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length
 
PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose
 

HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership
 #
Note: We have applied multiple Filters on all the dashboards. You can check the results for the filters as well by modifying the query and comparing the results.
For e.g
See the results when we hit the Grade A in the filters for dashboards.
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose
 
