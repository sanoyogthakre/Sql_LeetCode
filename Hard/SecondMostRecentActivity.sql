-- find the second most recent activity and if user has only 1 activity then return that as it is. 
--We will use SQL window functions to solve this problem.

create table UserActivity
(
username      varchar(20) ,
activity      varchar(20),
startDate     Date   ,
endDate      Date
);

insert into UserActivity values 
('Alice','Travel','2020-02-12','2020-02-20')
,('Alice','Dancing','2020-02-21','2020-02-23')
,('Alice','Travel','2020-02-24','2020-02-28')
,('Bob','Travel','2020-02-11','2020-02-18');


Select * FROM UserActivity;


---solution----

with cte as (
Select *,COUNT(*) Over(PARTITION by username) as total_activity,
RANK() OVER(PARTITION by username order by startDate desc) as rnk
FROM UserActivity)
select username,activity,startDate,endDate from cte
where total_activity =1 or rnk = 2



