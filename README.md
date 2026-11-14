## Employee Attrition Analysis

This project analyzes employee attrition using HR data to identify key factors driving employee turnover. 
Using exploratory data analysis and visualization, the project uncovers patterns related to salary, overtime, job roles, and work-life balance, and provides actionable HR recommendations.

## Project Structure
├── data (Original dataset)  
├── sql (SQL queries for data analysis)  
├── dashboard (Dashboard summarizing key findings)  
├── Report (Project report)
 

## Problem Statement
The organization wants to find out why their attrition rates are high for this specific time period, and what the HR team can do to reduce it.

## Business questions answered in this project
1. What are the key factors associated with attrition?
2. What are the key factors causing attrition?
3. What HR strategies can be implemented to reduce attrition rate?

## Objectives
The main objectives of this project include:
1. to identify potential causes of attrition
2. to create interactive dashboards summarizing key findings
3. to provide actionable insights and recommendations to HR for improving employee retention

## Data Source
- The dataset in the project is a sample dataset created by IBM data scientists for learning purposes.
- Data Source: "IMB HR Analytics Employee Attrition & Performance" dataset on Kaggle

## Tools Used:
- SQL (data querying)
- Power BI (data visualization)

## Data Understanding
- It contains employee-related information such as age, income and job role.
- The key attributes analyzed include:
1. MonthlyIncome
2. BusinessTravel
3. OverTime
4. JobRole
5. WorkLifeBalance
6. Age

## Data Cleaning
The dataset was checked for missing data, duplicate data and overall fit for analysis. I found out that the dataset was already cleaned. 

## Exploratory Data Analysis
The following analysis was conducted to identify patterns and trends in employee attrition:

### Attrition Distribution
Attrition rate is high. So, HR managers need to focus on employee retention.

### Key Attrition Drivers
These trends that were often found among the employees who left the company includes lower monthly income, higher overtime working employees, higher business travel frequency, certain job roles like "Sales Representative", "Laboratory Technician" and "Human Resources", younger workforce and lower satisfaction with workplace.

## Insights
- Sales Representatives, Laboratory Technicians, and Human Resources show the highest turnover.
- Attrition rate among employees in the age group 18-25 is about 2.5 times higher than that in employee above 25 years of age. 
- Employees whose earnings fall into low salary slab range show higher attrition.
- Employees working overtime have significantly higher attrition rates.

### Key highlights:
- Attrition by job role
- Attrition by salary
- Attrition among younger employees
- Overtime impact

## Recommendations
Based on the analysis, I recommend the following actions:
- Introduce retention bonuses or salary restructuring for low-income employees
- Reduce overtime workload or introduce shift balancing policies
- Design targeted retention strategies for high-risk roles (Sales Representative, HR, Laboratory Technician)
- Implement early-career mentorship programs to retain younger employees  

## Limitations 
The limitations of this study include:
- The dataset was already cleaned, which doesn't account for the messiness of the real world datasets.
- The dataset is a sample dataset and may not fully represent real-world scenarios  
- Limited features restrict deeper analysis of certain factors  
- Lack of real-time data prevents dynamic analysis  

## Conclusion
The analysis identified key drivers of attrition: low income, overtime, high travel frequency, certain job roles, low workplace satisfaction and early stage of career. Addressing these factors can help organizations improve employee retention.
