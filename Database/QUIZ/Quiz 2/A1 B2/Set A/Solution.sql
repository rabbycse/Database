Q1[10 Points]: For each employee, Find the total number of employees who were hired before him/her
and who were hired after him/her. Print employee's last name, total employees hired before him/her, and
total employees hired after him/her'.
Ans:
select e.last_name,(select count(*) from employees e1 where e1.hire_date<e.hire_date) Before_the_employee,
(select count(*) from employees e1 where e1.hire_date>e.hire_date) After_the_employee
from employees e;



Q2[10 Points]: Find the last names of employees and their salaries for the top Five highest salaried
employees. The number of employees in your output should be more than Five if there are employees with
same salary.
Ans:
select e.last_name,e.salary
from employees e
where 5>=(
select count(*)
from employees e1
where e1.salary<e.salary
)
order by e.salary
;



Q3[10 Points]: Find the last names and salaries of those employees whose salary is within 5000 of
the average salary of Sales department.
Hint: Use ABS() function.
Ans:
SELECT E.LAST_NAME,E.SALARY
FROM EMPLOYEES E
where E.SALARY BETWEEN
((select avg(salary) from employees group by department_id having department_id=any
(select department_id from departments where department_name='Sales'))-5000)
AND
((select avg(salary) from employees group by department_id
having department_id=any(select department_id from departments where department_name='Sales'))
+5000);



Q4[10 Points]: Display employees whose salary is above the average salary of his/her department.
Print employee's last name, department name, salary, and his/her department's average salary.
Ans:
SELECT E.LAST_NAME,E.DEPARTMENT_ID,E.SALARY,J.AVGSAL,J.CO
FROM EMPLOYEES E,(SELECT DEPARTMENT_ID,AVG(SALARY) AVGSAL,COUNT(*) CO FROM EMPLOYEES E GROUP BY DEPARTMENT_ID) J
WHERE E.DEPARTMENT_ID=J.DEPARTMENT_ID AND E.SALARY > J.AVGSAL;
