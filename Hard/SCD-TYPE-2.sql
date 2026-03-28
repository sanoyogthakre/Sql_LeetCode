--SCDType-2 problem

create table billings 
(
emp_name varchar(10),
bill_date date,
bill_rate int
);
delete from billings;
insert into billings values
('Sachin','01-JAN-1990',25)
,('Sehwag' ,'01-JAN-1989', 15)
,('Dhoni' ,'01-JAN-1989', 20)
,('Sachin' ,'05-Feb-1991', 30)
;

create table HoursWorked 
(
emp_name varchar(20),
work_date date,
bill_hrs int
);
insert into HoursWorked values
('Sachin', '01-JUL-1990' ,3)
,('Sachin', '01-AUG-1990', 5)
,('Sehwag','01-JUL-1990', 2)
,('Sachin','01-JUL-1991', 4)


SELECT * FROM billings;
SELECT * FROM HoursWorked;


--SOlution--
with cte as (
SELECT *,LEAD(DATEADD(day,-1,bill_date),1,'9999-12-31')OVER(PARTITION by emp_name order by bill_date asc) as billDate_end
FROM billings)
Select h.emp_name,sum(ct.bill_rate * h.bill_hrs) as total_Salary
FROM cte ct 
INNER JOIN HoursWorked h on ct.emp_name = h.emp_name  and h.work_date BETWEEN ct.bill_date and ct.billDate_end
GROUP BY h.emp_name