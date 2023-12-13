-- Total accidents for each year
select year(Date) as [Year], count(*) as total_year
from [NYC].[dbo].[NYC]
group by year(Date)
order by [Year], total_year;

-- Number of Accidents per borough
select Borough, count(*) as count_borough
from [NYC].[dbo].[NYC] 
where Borough IS NOT NULL
group by Borough
order by count_borough desc;

-- Number of Victims per Borough
select Borough, sum(Persons_Killed + Persons_Injured) as Total_victims
from [NYC].[dbo].[NYC]
where Borough IS NOT NULL
group by Borough 
order by Total_victims desc;

-- Top 10 streets with the most accidents reported?
select TOP 10 count(*) as Num_Accidents, Street_Name
from [NYC].[dbo].[NYC]
group by Street_Name
order by Num_Accidents desc;

-- Top 3 exact locations that have most accidents reported?
-- Going to use latitude/longitude to find exact location, then add Street Name to see correlation
select count(*) as count_coordinates, Latitude, Longitude
from [NYC].[dbo].[NYC]
where latitude is not null and longitude is not null
group by latitude, longitude
order by count_coordinates desc;



-- What was the most common contributing factor for the accidents reported?
select Contributing_Factor, count(*) as factor_count
from [NYC].[dbo].[NYC]
group by Contributing_Factor
order by factor_count desc;

-- What about for fatal accidents specifically?
select Contributing_Factor, count(*) as fatal_count
from [NYC].[dbo].[NYC]
where Persons_Killed = 1 and Contributing_Factor IS NOT NULL
group by Contributing_Factor
order by fatal_count desc;

-- What are the different levels of severity and distribution amongst them?
-- What percent does each category represent out of the total

-- Going to create new column 'Total Victims' where I am adding Persons Injured + Persons Killed
-- Creating New Table to combine Persons Injured & Persons Killed
ALTER TABLE [NYC].[dbo].[NYC]
ADD Total_Victims INT;

-- Computing the values in the column to be the sum of Persons Injured and Persons Killed, and treating Null values as 0;
UPDATE [NYC].[dbo].[NYC]
SET Total_Victims = ISNULL(Persons_Injured, 0) + ISNULL(Persons_Killed, 0);

-- Using CASE to bin together specific number ranges as severity level
-- 0-1 Total Victims = Low; 2-4 Total Victims = Medium; 5< Total Victims = High
-- Began with this to start, and shortly realized I wont be able to group by the alias in that same query
select
	case
		when Total_Victims between 0 and 1 then 'Low'
		when Total_Victims between 2 and 4 then 'Medium'
		else 'High'
	end as Severity,
	count(*) as Accident_count
from [NYC].[dbo].[NYC]
group by Accident_count;


-- To fix this, I tried just putting the case statement (minus the alias) in the group by and it worked
select
	case
		when Total_Victims between 0 and 1 then 'Low'
		when Total_Victims between 2 and 4 then 'Medium'
		else 'High'
	end as Severity,
	count(*) as Accident_count
from [NYC].[dbo].[NYC]
group by
	case
		when Total_Victims between 0 and 1 then 'Low'
		when Total_Victims between 2 and 4 then 'Medium'
		else 'High'
	end;

-- Creted this to get rid of the double case statement; The group by is now applied to the main query (Not Inner Query)

select Severity,
	   count(*) as Accident_count
from
	(select 
		case
			when Total_Victims between 0 and 1 then 'Low'
			when Total_Victims between 2 and 4 then 'Medium'
			else 'High'
		end as Severity
	from [NYC].[dbo].[NYC]) as Victim_category
group by Severity
order by Accident_count desc;


-- Once I went to look at the percentages of the total, I realized it would be sort of a pain to continually write
-- the case statement over and over, and knew I could create a CTE to easily reference the case statement for the questions



-- Had to look up structure of CTE to get some guidance for setting up the case within it
-- 1. Set it up like this and then wanted to take into account
With category as (
	select
		case
			when Total_Victims between 0 and 1 then 'Low'
			when Total_Victims between 2 and 4 then 'Medium'
			else 'High'
		end as Severity
	from [NYC].[dbo].[NYC])

select Severity,
	   count(*) as Accident_Count
from category
group by Severity;

-- 2. Got guidance on creating the percentages and then used this as the query, to use the cte if I need to
-- do more analysis down the road

With category as (
	select
		case
			when Total_Victims between 0 and 1 then 'Low'
			when Total_Victims between 2 and 4 then 'Medium'
			else 'High'
		end as Severity
	from [NYC].[dbo].[NYC])
select Severity,
	   count(*) as Accident_count,
	   cast(count(*) * 100.0 / sum(count(*)) over () as decimal(10, 2)) as Percentage
from category
group by Severity;












