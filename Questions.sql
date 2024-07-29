use data_new;

-- 1. show all columns and rows in the table
SELECT 
    *
FROM
    salaries;

-- 2. Show only the EmployeeName and JobTitle columns.
SELECT 
    EmployeeName, JobTitle
FROM
    salaries;

-- 3. Show the number of employees in the table
SELECT 
    COUNT(*)
FROM
    salaries;

-- 4. Show the unique job titles in the table
SELECT DISTINCT
    JobTitle
FROM
    salaries;

-- 5. show the job title and overtime pay for all employees with overtime pay greater than 50000
SELECT 
    JobTitle, OvertimePay
FROM
    salaries
WHERE
    OvertimePay > 50000;

-- 6. Show the average base pay for all employees
SELECT 
    AVG(BasePay) AS 'average BasePay'
FROM
    salaries;

-- 7. Show the top 10 highest paid employees
SELECT 
    EmployeeName, TotalPay
FROM
    salaries
ORDER BY TotalPay DESC
LIMIT 10;
   
-- 8 show the average of BasePay, Overtimepay, and OtherPay for each employee 
SELECT 
    EmployeeName,
    (BasePay + Overtimepay + OtherPay) / 3 AS avg_BP_OTP_OP
FROM
    salaries;

-- 9. Show all employees who have the word "Manager" in their job title
SELECT 
    EmployeeName, Jobtitle
FROM
    salaries
WHERE
    Jobtitle LIKE '%MANAGER%';
    
-- 10. Show all employees with a job title not equal to "Manager"
SELECT 
    EmployeeName, Jobtitle
FROM
    salaries
WHERE 
    Jobtitle NOT LIKE '%MANAGER%';
-- we can also use WHERE Jobtitle <> '%MANAGER%' or  WHERE Jobtitle != '%MANAGER%'

-- 11. Show all employees with a total pay between 50,000 and 75000.
SELECT 
    EmployeeName, TotalPay
FROM
    salaries
WHERE
    TotalPay >= 50000 AND TotalPay <= 75000;
-- we can also use where TotalPay between 50000 AND 75000;

-- 12. Show all employees with a BasePay less than 50,000 or a TotalPay greater than 100000.
SELECT 
    *
FROM
    salaries
WHERE
    BasePay < 50000 OR TotalPay > 100000;
    
-- 13.Show all employees ordered by their total pay benefits in descending order
-- between 125,000 and 150,000 and a job title containing the word "Director"
SELECT 
    EmployeeName, JobTitle, TotalPayBenefits
FROM
    salaries
WHERE
    TotalpayBenefits BETWEEN 125000 AND 150000 
        AND JobTitle LIKE '%Director%';
#ORDER BY TotalpayBenefits DESC;

-- 14. Show all job titles with an average base pay of 
-- at least 100,000 and order them by the average base pay in descending order.
SELECT 
    Jobtitle, AVG(BasePay) AS 'avg'
FROM
    salaries
GROUP BY jobtitle
HAVING AVG >= 100000
ORDER BY avg DESC;

-- 15	Show all employees with a base pay less than 50,000 
-- or a total pay greater than 100,000.
select * from salaries
where BasePay < 50000 or TotalPay > 100000;

-- 16. Delete the Column -- deleting notes coloumn as it is empty or it has null values
SELECT 
    *
FROM
    salaries; -- check which column to delete
    
alter table salaries
drop column Notes;

-- 17. Update the base pay of all employees with the job title containing 'MANAGER' by increasing it by 10%.
SET SQL_SAFE_UPDATES = 0;  -- Error Code 1175 signifies a safety mechanism in MySQL known as safe update mode. Disabling safe update mode can lead to accidental data loss if not used carefully.
UPDATE salaries 
SET basepay = basepay*1.1
WHERE jobtitle LIKE '%Manager%';

-- 18.Delete all employees who have no OvertimePay
select count(*) from salaries
where overtimepay=0;

delete from salaries
where overtimepay=0;

 
