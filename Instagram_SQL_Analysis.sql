select * from dim_dates;
select * from fact_account;
select * from fact_content;


-- How many unique post types are found in the 'fact_content' table?

select DISTINCT post_type from fact_content;


select post_type, count(1) as no_of_posts from fact_content
GROUP BY post_type
order by no_of_posts desc;

-- What are the highest and lowest recorded impressions for each post type?

select post_type, MIN(impressions) as Lowest_recorded_Impressions , MAX(impressions) as Highest_recorded_impressions
from fact_content
 group by post_type;
 
 -- Filter all the posts that were published on a weekend in the month of March and April and export them to a separate csv file.
 
select f.* 
from fact_content f 
INNER JOIN dim_dates d ON f.date = d.date
WHERE MONTH(d.date) IN (3,4) and lower(d.weekday_or_weekend) = "weekend";

-- Create a report to get the statistics for the account. 
-- The final output includes the following fields: month_name, total_profile_visits, total_new_followers

select MONTHNAME(date) as month_name , SUM(profile_visits) as total_profile_visits , SUM(new_followers) as total_new_followers
from fact_account
GROUP BY MONTHNAME(date);

-- Write a CTE that calculates the total number of 'likes’ for each 'post_category' during the month of 'July' and subsequently, 
-- arrange the 'post_category' values in descending order according to their total likes.

select post_category, SUM(likes) as total_likes 
from fact_content
WHERE MONTH(date) = 7
GROUP BY post_category 
ORDER BY total_likes desc;

/*
Create a report that displays the unique post_category names alongside their respective counts for each month. 
The output should have three columns: month_name , post_category_names, post_category_count
Example: 'April', 'Earphone,Laptop,Mobile,Other Gadgets,Smartwatch', '5'
'February', 'Earphone,Laptop,Mobile,Smartwatch', '4' */

select monthname(date), group_concat(DISTINCT post_category) as post_category_names, count(DISTINCT post_category)  as post_category_count
from fact_content
GROUP BY monthname(date);

/* 
What is the percentage breakdown of total reach by post type? The final output includes the following fields:
post_type, total_reach, reach_percentage
*/

select post_type, SUM(reach) as total_reach, ROUND(100*(SUM(reach) / SUM(SUM(reach)) OVER()),2) as reach_percentage
from fact_content
group by post_type;


/*
Create a report that includes the quarter, total comments, and total saves recorded for each post category. Assign the following quarter groupings:
(January, February, March) → “Q1”
(April, May, June) → “Q2”
(July, August, September) → “Q3”
The final output columns should consist of: post_category,quarter,total_comments,total_saves */

with cte_quarters as(
select * , CONCAT("Q" ,CEIL(MONTH(date) /3)) as Quarter from dim_dates)

select c.post_category,q.quarter, SUM(c.comments) as total_comments , SUM(c.saves) as total_saves
from cte_quarters q LEFT JOIN fact_content c ON c.date = q.date
group by c.post_category,q.quarter;


/*
List the top three dates in each month with the highest number of new followers. The final output should include the following columns:
month,date,new_followers */

with cte_rnk as(
select *, dense_rank() OVER(PARTITION BY MONTH(date) order by new_followers desc) as rnk 
from fact_account)

select monthname(date) as Month , date, new_followers from cte_rnk where rnk <=3;

/*
Create a stored procedure that takes the 'Week_no' as input and generates a report displaying the total shares for each 'Post_type'. 
The output of the procedure should consist of two columns:
post_type
total_shares */

select c.post_type , SUM(shares) as total_shares from 
dim_dates d INNER JOIN
fact_content c ON d.date = c.date
where d.week_no = "W1"
group by c.post_type;




CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_shares_by_week`(
			IN in_week_num VARCHAR(2)
)
BEGIN
	select c.post_type , SUM(shares) as total_shares from 
dim_dates d INNER JOIN
fact_content c ON d.date = c.date
where d.week_no = in_week_num
group by c.post_type;

END




CALL get_total_shares_by_week("W2");


