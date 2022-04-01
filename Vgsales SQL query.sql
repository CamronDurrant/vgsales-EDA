#Pulling all the data from the games_data database
select * 
from vgsales

#Retreiving consle names by writing a distinct argument to return only the unique values in the column 
select distinct ConsleNames 
from vgsales v 

#Retreiving Publisher names by writing a distinct argument to return only the unique values in the column 
select distinct Publisher 
FROM vgsales v 

#reoving the commas found in column year 
select replace(`Year`,',','') as `Year` 
from vgsales v 

#Calcuating how much revenue each platform made globally in millions
SELECT ConsleNames, sum(global_sales) as Total_Sales_millions
  from vgsales
  group by ConsleNames #using this as a tableau vizulization
 
  #Finding out how many games that were released from publishers anually
 select Publisher, replace(`Year`,',','') as `Year`, sum(Video_Games) as Games_released_anually
 from vgsales v 
 group by `Year` 
  
 #Finding games that starts with the letter data
  select Video_Games 
  from vgsales v 
  where Video_Games like 'D%'
  
  #Rating the video games global sales
  select Video_Games, Global_Sales,
 CASE
  WHEN Global_Sales > 5 THEN 'Fantastic'
  WHEN Global_Sales < 5 THEN 'Poor'
  ELSE 'Avoid at All Costs'
 end as Sales_Performance
FROM vgsales v #using this as a tableau vizulization

#Figuring out which game genre made the most Sales
select Genre, sum(round(Global_Sales,0)) as Genre_sales_millions 
from vgsales
group by Genre 
order by Global_Sales #using this for tableau vizulization 

#specifically selecting the action Genre from the vgsales table but keeps everythiong else
SELECT *
FROM vgsales v 
WHERE year > 2001
   OR genre = 'action';
#same as the query above but slightly diff here i want two genres which are sports and shooter genres
SELECT *
FROM vgsales v 
WHERE genre = 'Shooter'
 OR genre = 'Sports'
 
 #Calculating the total sales of each Publisher made
 select Publisher, sum(Global_Sales) as Total_Sales_millions 
 from vgsales
 group by Publisher