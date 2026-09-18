create database food_delivery_db;
use food_delivery_db;
show tables;

select count(*) 
from food_delivery;

#Identify top-spending customers
select Customer_ID , 
sum(Order_Value) as total_spending
from food_delivery
group by  Customer_ID
order by total_spending desc
limit 10;

#Analyze age group vs order value
select Age_Group , sum(Order_Value) as total_order_value
from food_delivery
group by Age_Group 
order  by total_order_value desc;

#Weekend vs weekday order patterns
select Order_Day_type , count(*) as total_orders
from food_delivery
group by Order_Day_type
order by total_orders desc;

##Revenue & Profit Analysis
#Monthly revenue trends
select date_format(Order_Date , '%y,%m') as month,
sum(Final_Amount) as monthly_revenue
from food_delivery
group by month
order by month;

#Impact of discounts on profit
select Discount_Applied , 
avg(Profit_Margin)  as profit
from food_delivery
group by Discount_Applied
order by profit;

#High-revenue cities and cuisines
select City as cities , Cuisine_Type as cuisines,
sum(Final_Amount) as revenues
from food_delivery
group by cities, cuisines
order by revenues desc;

#Delivery Performance
#Average delivery time by city)
select City , round(avg(Delivery_Time_Min),3)as delivery_time
from food_delivery
group by city
order by delivery_time desc;

#Distance vs delivery delay analysis
select 
    case
        when Distance_km <= 5 then '0-5 km'
        when Distance_km <= 10 then '6-10 km'
        when Distance_km <= 20 then '11-20 km'
        when Distance_km <= 30 then '21-30 km'
        else '30+ km'
    end as distance_group,
round(avg(Delivery_Time_Min),2) as delivery_time
from food_delivery
group by distance_group
order by delivery_time desc;

#Delivery rating vs delivery time
select Delivery_Rating , 
round(avg(Delivery_Time_Min), 2) as avg_delivery_time
from food_delivery
group by Delivery_Rating
order by Delivery_Rating desc;

#Restaurant Performance
#Top-rated restaurants
select Restaurant_Name, Restaurant_ID,
round(avg(Restaurant_Rating), 2) as Restaurant_Rating
from food_delivery
group by Restaurant_Name, Restaurant_ID
order by Restaurant_Rating desc
limit 10;

#Cancellation rate by restaurant





