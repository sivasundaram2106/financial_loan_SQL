USE  Bank_loan
SELECT * FROM financial_loan

SELECT  COUNT(id) AS Total_Loan_Application FROM financial_loan 

SELECT  COUNT(id) AS MTD_Loan_Application FROM financial_loan 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT  COUNT(id) AS PMTD_Loan_Application FROM financial_loan 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--(MTD-PMTD)/PMTD

SELECT SUM(loan_amount) AS Total_Funded_Data FROM financial_loan

SELECT  SUM(loan_amount) AS MTD_Funded_Data FROM financial_loan 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT  SUM(loan_amount) AS PMTD_Funded_Data FROM financial_loan 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS Total_Amount_Received FROM financial_loan

SELECT  SUM(total_payment) AS MTD_Total_Amount_Received FROM financial_loan 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT  SUM(total_payment) AS PMTD_Total_Amount_Received FROM financial_loan 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


SELECT ROUND(AVG(int_rate),4)* 100 AS avg_Interest_Rate FROM financial_loan

SELECT  ROUND(AVG(int_rate),4)* 100 AS MTD_avg_Interest_Rate FROM financial_loan 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT  ROUND(AVG(int_rate),4)* 100 AS PMTD_avg_Interest_Rate FROM financial_loan 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti),4)*100 AS Avg_DTI FROM financial_loan 


SELECT ROUND(AVG(dti),4)*100 AS MTD_Avg_DTI FROM financial_loan 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti),4)*100 AS MTD_Avg_DTI FROM financial_loan 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


SELECT loan_status  FROM financial_loan

SELECT (COUNT(CASE 
WHEN loan_status ='fully paid' or loan_status ='current'
THEN id
END)*100
) 
/
COUNT(id) AS Good_Loan_Percentage
FROM financial_loan

SELECT COUNT(id) AS Good_Loan_Applications FROM financial_loan
WHERE loan_status ='fully paid' or loan_status ='current'

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM financial_loan
WHERE loan_status ='fully paid' or loan_status ='current'

SELECT (COUNT(CASE 
WHEN loan_status ='Charged Off' 
THEN id
END)*100.00
) 
/
COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan

SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status = 'Charged Off'

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount  FROM financial_loan
WHERE loan_status = 'Charged Off'


SELECT SUM(total_payment) AS Bad_Loan_amount_received  FROM financial_loan
WHERE loan_status = 'Charged Off'

SELECT
        loan_status,
        COUNT(id) AS LoanCount_Application,
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


SELECT 
	MONTH(issue_date) AS Month_Nunber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose


SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose

