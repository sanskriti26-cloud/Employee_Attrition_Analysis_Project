## Employee Attrition Analysis

This project analyzes employee attrition using HR data to identify key factors driving employee turnover. 
Using exploratory data analysis and visualization, the project uncovers patterns related to salary, overtime, job roles, and work-life balance, and provides actionable HR recommendations.

## Tools Used:
- Microsoft Excel (data cleaning)
- SQL (data querying)
- Power BI (data visualization)

## ## Project Structure
├── data/         # Original dataset  
├── sql/          # SQL queries for data analysis  
├── dashboard/    # Dashboard summarizing key findings  
├── README.md     # Project documentation  

## Problem Statement
1. What are the ke factors causing of attrition?
3. Whta are main drivers/factors of attrition?
4. What HR stratesies can be implemented to reduce attrition rate?

## Objectives
1. Identify key factors driving attrition
2. Analyse contribution of relevant factors like income, overtime, travel frequency, etc.
3. Provide actionable insights for improving employee retention

## Data Understanding
- The dataset in the project is a sample dataset created by IBM data scientists for learning purposes.
- It contains employee-related information such as age, income and job role.
- The key attributes analyzed include:
1. MonthlyIncome
2. BusinessTravel
3. OverTime
4. JobRole
5. WorkLifeBalance
6. Age

## Data Cleaning
The dataset was cleaned and prepared for analysis. The cleaning process included:
1. Removing irrelevant data
2. Checking for duplicate values
3. Checking for null values (no null values found)

## Exploratory Data Analysis
The following analysis was conducted to identify patterns and trends in employee attrition:

### Attrition Distribution
Attrition rate is high. So, HR managers need to focus on employee retention.

### Key Attrition Drivers
Patterns seen among employees who left the comppany include lower monthly income, higher overtime working employees, higher business travel frequency, certain job roles like "Sales Representative", "Laboratory Technician" and "Human Resources", younger workforce and lower satisfaction with workplace.

### Financial Cost
Calculated rough financial cost of attrition considering it is 50% of annual salary per employee.

## Insights
- Sales Representatives, Laboratory Technicians, and Human Resources show the highest turnover
- Attrition rate among employees in the age group 18-25 is about 2.5 times higher than that in employee above 25 years of age. 
- Employees whose earnings fall into lw salary slab range show higher attrition
- Employees working overtime have significantly higher attrition rates
- The insights are summarized in the dashboard below  
<img width="893" height="496" alt="Insights_Dashboard" src="https://github.com/user-attachments/assets/11a48abd-226e-40ca-b7ef-e18b10d7bd52" />

## Recommendations
Based on the analysis, the following actions are recommended:
- Introduce retention bonuses or salary restructuring for low-income employees
- Reduce overtime workload or introduce shift balancing policies
- Design targeted retention strategies for high-risk roles (Sales Representative, HR, Laboratory Technician)
- Implement early-career mentorship programs to retain younger employees  

## Limitations 
The limitations of this study include:
- The dataset is a sample dataset and may not fully represent real-world scenarios  
- Limited features restrict deeper analysis of certain factors  
- Lack of real-time data prevents dynamic analysis  

## Conclusion
The analysis identified key drivers of attrition: low income, overtime, high travel frequency, certain job roles, low workplace satisfaction and early stage of career. Addressing these factors can help organizations improve employee retention.
