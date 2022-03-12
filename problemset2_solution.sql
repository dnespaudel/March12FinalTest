with join1 as (select d.name as Department,e.name as Employee, e.salary as Salary
                from department d
                join employee e
                on d.id = e.departmentid
                order by d.name, e.salary desc, employee),

    ranks as (select *,
                dense_rank() over(partition by department order by salary desc) as rank
                from join1)
       
select department, employee, salary 
from ranks                
where rank <=3;