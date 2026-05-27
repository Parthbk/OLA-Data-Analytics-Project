create database ola_db;

use ola_db;

select * from customer;

-- 1. Retrieve all successful bookings:
	select *  from customer where Booking_status='Success';

-- 2. Find the average ride distance for each vehicle type:
	select  Vehicle_Type,round(avg(Ride_Distance),2) as Average_Distance
    from customer
    group by Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:
	select count(Booking_Status) from customer
    where Booking_Status='canceled by customer';
    
-- 4. List the top 5 customers who booked the highest number of rides:
	select customer_id,count(*) as Total_rides
    from customer
    group by customer_id
    order by Total_rides desc
    LIMIT 5;
    
-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
	select count(booking_id) as Rides_Cancelled_by_Driver
    from customer
    where Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
	select max(Driver_Ratings) as Maximum_driver_ratings ,
    min(Driver_Ratings) as Minimum_driver_ratings
    from customer
    where vehicle_Type='Prime Sedan';
    
-- 7. Retrieve all rides where payment was made using UPI:
	select Booking_ID,Payment_Method
    from customer
    where Payment_Method='UPI';
    
-- 8. Find the average customer rating per vehicle type:
	select Vehicle_Type,round(avg(Customer_Rating),2) as Avg_Customer_rating_per_Vehcile_Type
    from customer
    group by Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
	select sum(Booking_Value) as Total_Booking_Value from customer 
    where Booking_Status = 'Success'
    AND Booking_Value IS NOT NULL;
    
-- 10. List all incomplete rides along with the reason:
	Select Booking_ID,Booking_Status,Vehicle_Type from customer
    where Booking_Status != 'Success';
    
-- 11.Give the count of all success bookings:
	select count(Booking_id) 
    from customer
    where Booking_Status='Success';
    
    
-- 12. Give the count of all unsuccessful bookings:
    select count(Booking_id) from customer 
    where Booking_Status not like 'Success';