-- ATTRITION ANALYSIS
-- Total number of employees
SELECT
    COUNT(*) AS TotalEmployees
FROM [IBM Employee Attrition Analysis];
--------------------------------------------------------------------------------------------------------------------------------

-- Number of employees left
SELECT 
    SUM(CASE 
         WHEN Attrition = 1 THEN 1 
         ELSE 0 
        END) AS EmployeesLeft 
FROM [IBM Employee Attrition Analysis];
------------------------------------------------------------------------------------------------------------------------------------

-- Rate of attrition
SELECT 
    SUM(CASE 
         WHEN Attrition = 1 THEN 1 
         ELSE 0 
        END)*100.0/COUNT(*) AS AttritionRate 
FROM [IBM Employee Attrition Analysis];
-------------------------------------------------------------------------------------------------------------------------------

-- Average, maximun and mininum income
SELECT 
    AVG(MonthlyIncome) AS AverageMonthlyIncome, 
    MAX(MonthlyIncome) AS MaximumMonthlyIncome, 
    MIN(MonthlyIncome) AS MinimumMonthlyIncome 
FROM [IBM Employee Attrition Analysis];

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Percent of employees whose income is lower than average
SELECT 
    100.0*COUNT(*)/(SELECT COUNT(*) FROM [IBM Employee Attrition Analysis]) AS EmployeePercent
FROM [IBM Employee Attrition Analysis]
WHERE MonthlyIncome < (SELECT AVG(MonthlyIncome) FROM [IBM Employee Attrition Analysis]);
---------------------------------------------------------------------------------------------------------------------------

-- Percentage of overtime
SELECT 
    SUM(CASE 
         WHEN Overtime = 1 THEN 1 
         ELSE 0 
        END)*100.0/COUNT(*) AS OvertimeEmployees
FROM [IBM Employee Attrition Analysis];

-- Overtime working employees by department
SELECT 
    Department,
    SUM(CASE 
            WHEN OverTime = 1 THEN 1 
            ELSE 0 
        END)*100.0/COUNT(*) AS OvertimeEmpPercentage
FROM [IBM Employee Attrition Analysis]
GROUP BY Department
ORDER BY OvertimeEmpPercent DESC;

-- Insight: Percentage of employees working overtime is similar in each department
-------------------------------------------------------------------------------------------------------------------------------

-- Departments exploration
SELECT 
    Department, 
    COUNT(*) AS EmployeesInDepartment
FROM [IBM Employee Attrition Analysis]
Group By Department;
---------------------------------------------------------------------------------------------------------------------------------

-- Job roles in departments
SELECT 
    Department, 
    JobRole
FROM [IBM Employee Attrition Analysis]
Group By Department, JobRole
ORDER BY Department, JobRole;
-----------------------------------------------------------------------------------------------------------------------------------

-- Business travel frequency proportion
SELECT 
    BusinessTravel, 
    COUNT(BusinessTravel),
    COUNT(*)*100.0/(SELECT COUNT(*) FROM [IBM Employee Attrition Analysis]) AS EmployeePercent
FROM [IBM Employee Attrition Analysis]
Group By BusinessTravel
ORDER BY EmployeePercent DESC;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--->BIVARIATE ANALYSIS

-- Average income of employees who left vs stayed
SELECT 
    Attrition, 
    AVG(MonthlyIncome) AS AverageIncome 
FROM [IBM Employee Attrition Analysis]
GROUP BY Attrition;

-- Insight: Income of employees who didn't leave is about 1.4 times higher that income of employees who left.
-----------------------------------------------------------------------------------------------------------------------------------

--Average income across job roles
SELECT 
    Department, JobRole, 
    AVG(MonthlyIncome) AS AverageMonthlyIncome, 
    COUNT(*) AS EmployeeCount
FROM [IBM Employee Attrition Analysis]
Group By Department, JobRole
ORDER BY Department, JobRole;
-- Insight: Income of job roles in sales is lower
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--How does attrition rate vary by gender?
SELECT 
    Gender, 
    COUNT(*) as TotalEmployees, 
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    100 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)/COUNT(*) as AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY Gender;

--Interpretation: Attrition rate of male employees is only slightly higher.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by department
SELECT 
    Department,
    COUNT(*) AS TotalEmployees, 
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeft,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) * 100.0/COUNT(*) as AttritionRate
FROM [IBM Employee Attrition Analysis] 
GROUP BY Department
ORDER BY AttritionRate DESC;

-- Insight: Sales and Human Resources department has higher attrition rate
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by age group
SELECT 
    CASE
     WHEN Age BETWEEN 18 AND 25 THEN '18-25'
     WHEN Age BETWEEN 26 AND 35 THEN '26-35'
     WHEN Age BETWEEN 36 AND 45 THEN '36-45'
     WHEN Age BETWEEN 46 AND 55 THEN '46-55'
     ELSE '56+'
     END AS AgeGroup,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeaving,
    ROUND(
     SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
     2
    ) AS AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY 
    CASE
     WHEN Age BETWEEN 18 AND 25 THEN '18-25'
     WHEN Age BETWEEN 26 AND 35 THEN '26-35'
     WHEN Age BETWEEN 36 AND 45 THEN '36-45'
     WHEN Age BETWEEN 46 AND 55 THEN '46-55'
     ELSE '56+'
     END
ORDER BY AttritionRate DESC;

-- Insight: Attrition rate in the age group 18-25 is significantly higher
-----------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate in age group of 18-25 vs others
SELECT 
    CASE
     WHEN Age BETWEEN 18 AND 25 THEN '18-25'
     ELSE '25+'
     END AS AgeGroup,
    COUNT(*) AS TotalEmployees,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeaving,
    ROUND(
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
     2
    ) AS AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY 
    CASE
     WHEN Age BETWEEN 18 AND 25 THEN '18-25'
     ELSE '25+'
     END;

-- Insight: Attrition rate among employees in the age group 18-25 is about 2.5 times higher than overall attrition rate
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by income?
SELECT 
    CASE
        WHEN MonthlyIncome BETWEEN 1000 AND 2000 THEN '1000-2000'
        WHEN MonthlyIncome BETWEEN 2001 AND 3000 THEN '2001-3000'
        WHEN MonthlyIncome BETWEEN 3001 AND 4000 THEN '3001-4000'
        WHEN MonthlyIncome BETWEEN 4001 AND 5000 THEN '4001-5000'
        ELSE '5001+'
    END AS MonthlyIncomeRange,
    COUNT(*) AS TotalEmployees,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeaving,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*) AS AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY 
    CASE
        WHEN MonthlyIncome BETWEEN 1000 AND 2000 THEN '1000-2000'
        WHEN MonthlyIncome BETWEEN 2001 AND 3000 THEN '2001-3000'
        WHEN MonthlyIncome BETWEEN 3001 AND 4000 THEN '3001-4000'
        WHEN MonthlyIncome BETWEEN 4001 AND 5000 THEN '4001-5000'
        ELSE '5001+'
    END
    ORDER BY AttritionRate DESC;
-- Insight: A consistent trend is seen. As income decreases, attrition increases
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by stock option
SELECT 
    StockOptionLevel, 
    COUNT(*) as TotalEmployees, 
     SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
         END) AS EmployeesLeft,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) * 100/COUNT(*) as AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY StockOptionLevel
ORDER BY AttritionRate DESC;
--Interpretation: It's the employees with 0 stock otion level that left the most
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by salary hike percentage
SELECT 
    CASE
        WHEN PercentSalaryHike BETWEEN 0 AND 10 THEN '0-10'
        WHEN PercentSalaryHike BETWEEN 11 AND 15 THEN '11-15'
        WHEN PercentSalaryHike BETWEEN 16 AND 20 THEN '16-20'
        WHEN PercentSalaryHike BETWEEN 21 AND 25 THEN '21-25'
        ELSE '26+'
    END AS SalaryHikeRange,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeaving,
    ROUND(
     SUM(CASE 
             WHEN Attrition = 1 THEN 1 
             ELSE 0 
         END) * 100.0 / COUNT(*),
     2
    ) AS AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY 
    CASE
        WHEN PercentSalaryHike BETWEEN 0 AND 10 THEN '0-10'
        WHEN PercentSalaryHike BETWEEN 11 AND 15 THEN '11-15'
        WHEN PercentSalaryHike BETWEEN 16 AND 20 THEN '16-20'
        WHEN PercentSalaryHike BETWEEN 21 AND 25 THEN '21-25'
        ELSE '26+'
     END
ORDER BY AttritionRate DESC;
--Interpretation: similar
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate vary by overtime
SELECT 
    OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeft,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END)*100.0/COUNT(*) AS AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY OverTime
ORDER BY AttritionRate DESC;
------------------------------------------------------------------------------------------------------------------------------

--How does attrition rate vary by frequency of business travel?
SELECT 
    BusinessTravel, 
    COUNT(*) as TotalEmployees, 
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeft,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) * 100.0/COUNT(*) as AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY BusinessTravel
ORDER BY AttritionRate DESC;

-- Attrition rate by job role
SELECT 
    JobRole,
    COUNT(*) AS TotalEmployees,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeft,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END)*100/COUNT(*) AS AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY JobRole
ORDER BY AttritionRate DESC;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by job satsfaction
SELECT 
    JobSatisfaction, 
    COUNT(*) as TotalEmployees, 
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeft,
    100 * SUM(CASE 
                  WHEN Attrition = 1 THEN 1 
                  ELSE 0 
              END)/COUNT(*) as AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY JobSatisfaction
ORDER BY AttritionRate DESC;

--Interpretation: Attrition rate increases as job satisfaction decreases

-- Department which has greater percentage of less satsfied employees
SELECT 
    Department,
    100.0 * SUM(CASE 
                    WHEN JobSatisfaction BETWEEN 0 AND 2 THEN 1 
                    ELSE 0 
                END) / COUNT(*) AS OverallEmployee,
    100.0 * SUM(CASE 
                    WHEN JobSatisfaction BETWEEN 0 AND 2 AND Attrition = 1 THEN 1 
                    ELSE 0 
                END)/COUNT(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionEmployee
FROM [IBM Employee Attrition Analysis]
GROUP BY Department
ORDER BY AttritionEmployee DESC

-- Insight: Job satisfaction is lowest in HR department, which correlates with high attrition in the department
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by work-life balance
SELECT 
    WorkLifeBalance,
    COUNT(*) AS TotalEmployees,
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeft,
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END)*100/COUNT(*) AS AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY WorkLifeBalance
ORDER BY AttritionRate DESC;

--Interpretation: Employees who rated work-life balance as 1 left the most. Strangely, the category that follows is of the ones who rated work-life balance as 4.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by relationship satsfaction
SELECT 
    RelationshipSatisfaction, 
    COUNT(*) as TotalEmployees,
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeft,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) * 100.0/COUNT(*) as AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY RelationshipSatisfaction
ORDER BY AttritionRate DESC;

--Interpretation: Employees least satisfied with relationships within organization left the most
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by environment satisfaction
SELECT 
    EnvironmentSatisfaction, 
    COUNT(*) as TotalEmployees,
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeft,
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) * 100.0/COUNT(*) as AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY EnvironmentSatisfaction
ORDER BY AttritionRate DESC;

--Interpretation: Attrition rate increases as environment satisfaction decreases
------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by job level
SELECT 
    JobLevel, 
    COUNT(*) as TotalEmployees,
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeft,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) * 100.0/COUNT(*) as AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY JobLevel
ORDER BY AttritionRate DESC;

--Interpretation: Attrition rate increases as job level decreases, employees at higher job level tend to be more stable
-----------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by job involvement
SELECT 
    JobInvolvement, 
    COUNT(*) as TotalEmployees, 
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeft,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) * 100.0/COUNT(*) as AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY JobInvolvement
ORDER BY AttritionRate DESC;

--Interpretation: Attrition rate increases as job involvement decreases
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by number of trainings last year
SELECT 
    TrainingTimesLastYear, 
    COUNT(*) as TotalEmployees, 
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeft,
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) * 100.0/COUNT(*) as AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY TrainingTimesLastYear
ORDER BY AttritionRate DESC;

--Interpretation: Employees with 0 and 4 times (maximun) training left the most
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by years with current manager
SELECT 
    YearsWithCurrManager, 
    COUNT(*) as TotalEmployees,
    SUM(CASE
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) AS EmployeesLeft,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) * 100.0/COUNT(*) as AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY YearsWithCurrManager
ORDER BY AttritionRate DESC;

--Interpretation:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Attrition by years at the company
SELECT 
    YearsAtCompany, 
    COUNT(*) as TotalEmployees,
    SUM(CASE
            WHEN Attrition = 1 THEN 1
            ELSE 0 
        END) AS EmployeesLeft,
    SUM(CASE 
            WHEN Attrition = 1 THEN 1 
            ELSE 0 
        END) * 100.0/COUNT(*) as AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY YearsAtCompany
ORDER BY AttritionRate DESC;

--Interpretation: No consistent pattern is seen
-------------------------------------------------------------------------------------------------------------------------

-- Attrition rate by total working years
SELECT 
    CASE
        WHEN TotalWorkingYears BETWEEN 0 AND 10 THEN '0-10'
        WHEN TotalWorkingYears BETWEEN 11 AND 20 THEN '11-20'
        WHEN TotalWorkingYears BETWEEN 21 AND 30 THEN '21-30'
        WHEN TotalWorkingYears BETWEEN 31 AND 40 THEN '31-40'
        ELSE '41+'
    END AS TotalWorkingYearsRange,
COUNT(*) AS TotalEmployees,
SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeaving,
ROUND(
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
) AS AttritionRate
FROM [IBM Employee Attrition Analysis]
GROUP BY 
CASE
    WHEN TotalWorkingYears BETWEEN 0 AND 10 THEN '0-10'
    WHEN TotalWorkingYears BETWEEN 11 AND 20 THEN '11-20'
    WHEN TotalWorkingYears BETWEEN 21 AND 30 THEN '21-30'
    WHEN TotalWorkingYears BETWEEN 31 AND 40 THEN '31-40'
    ELSE '41+'
END
ORDER BY AttritionRate DESC;

--Interpretation: Employees with total working years between 0 and 10 is seen to have higher attrition rate than others. These are employees still in there early career phase.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Income of employees working overtime vs of employees not working overtime
SELECT 
  Department,
  AVG(CASE 
          WHEN OverTime = 0 THEN MonthlyIncome 
      END) AS NoOvertimeIncome,
  AVG(CASE 
          WHEN OverTime = 1 THEN MonthlyIncome 
      END) AS OverTimeIncome
FROM [IBM Employee Attrition Analysis]
GROUP BY Department;

-- Insight: Income of overtime employees is almost same as employees not working overtime in sales and R&D departments, while in HR, it's higher
--------------------------------------------------------------------------------------------------------------------------------

-- High risk employee segment
SELECT 
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0/(SELECT COUNT(*) FROM [IBM Employee Attrition Analysis] WHERE Attrition = 1) AS AttritionRate
FROM [IBM Employee Attrition Analysis]
WHERE MonthlyIncome < (SELECT AVG(MonthlyIncome) FROM [IBM Employee Attrition Analysis])
    OR Overtime = 1
    OR JobRole = 'Sales Representative'
    OR BusinessTravel = 'Travel_Frequently'
    OR Age BETWEEN 18 AND 25
    OR EnvironmentSatisfaction IN(0, 1, 2)
    OR WorkLifeBalance IN(0, 1, 2);
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Approximate financial cost of attrition (assuming 50% of annual salary as cost per employee)
SELECT 
    Department,
    COUNT(*) AS Leavers,
    AVG(MonthlyIncome)*12 AS AverageIncome,
    COUNT(*)*AVG(MonthlyIncome)*12*0.5 AS AverageAnnualCost
FROM [IBM Employee Attrition Analysis]
WHERE Attrition = 1
GROUP BY Department;