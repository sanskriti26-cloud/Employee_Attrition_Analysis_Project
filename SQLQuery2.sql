select count(*) as TotalEmployees, sum(case
when attrition = 1 then 1 else 0 end) as EmployeesLeft, businesstravel,
100 * sum(case when attrition = 1 then 1 else 0 end)/count(*) as AttritionRate
from [ibm hr attrition]
group by Businesstravel
order by Attritionrate desc