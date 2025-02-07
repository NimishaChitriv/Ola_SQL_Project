CREATE DATABASE netflix_db;  /*giving a name*/
Use netflix_db;

SELECT * from bookings;

/* Solving Business Problem */ 

/* 1. Retrieve all the successful bookings */

CREATE VIEW Successful_Bookings AS 
SELECT Booking_ID 
FROM Bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;

/*2. Find average ride distance by each query type */

SELECT Vehicle_Type, AVG(Ride_Distance) AS Average_Distance
FROM Bookings
GROUP BY Vehicle_Type;

/* 3. Get the total number of cancelled rides by customers*/

SELECT Count(*) AS Canceled_Rides FROM Bookings
WHERE Booking_Status = 'Canceled by Customer' ;

/* 4. List the top 5 Customers who booked the highest number of rides*/

SELECT Customer_ID, COUNT(Booking_ID) as Total_rides
FROM Bookings
GROUP BY Customer_ID
ORDER by Total_rides DESC LIMIT 5;

/* 5. Get the number of rides canceled by drivers due to personal and car-related issues */
SELECT Count(Booking_ID) as Rides_Canceled_
FROM Bookings
WHERE Canceled_Rides_by_driver = 'Personal & Car related issue';

/* 6. Find the maximum and minimum driver ratings for Prime Sedan Bookings*/

SELECT  Vehicle_Type, 
MAX(Driver_Ratings) as max_rating, 
MIN(Driver_Ratings) as min_rating
FROM Bookings
WHERE Vehicle_Type = 'Prime Sedan';


/* 7. Retrieve all rides where payment was made using UPI */

SELECT Booking_ID, Customer_ID, Payment_Method
FROM Bookings
WHERE Payment_Method = 'UPI'; 

/* 8. Find the average customer rating per vehicle type */

SELECT Vehicle_Type, ROUND(AVG(Customer_Rating),2) 
FROM Bookings
GROUP BY Vehicle_Type;

/* 9. Calculate the total booking value of rides completed successfully*/

SELECT SUM(Booking_value) AS Total_booking_value
FROM Bookings
WHERE Booking_Status = 'Success';

/* 10. List all incomplete ride along with the reason */

SELECT Booking_ID, Incomplete_Rides_Reason
FROM Bookings
WHERE Incomplete_Rides = 'Yes';



