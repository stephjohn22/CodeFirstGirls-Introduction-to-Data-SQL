USE PandaHotels;

# |Views/Joins| Demonstrates the prices of the rooms at each hotel location

CREATE VIEW Hotel_room_prices AS
SELECT Rooms.Room_ID, Rooms.Room_name, Hotels.Location, Rooms.Price_per_night
FROM Rooms
INNER JOIN Hotels ON
Rooms.Hotel_ID = Hotels.Hotel_ID;

SELECT * From Hotel_room_prices;

# Demonstrates the rooms that customers have booked and when they booked them

CREATE VIEW Customer_room_bookings AS
SELECT Customers.First_name, Customers.Last_name, Bookings.Booking_date, Rooms.Room_name
FROM Customers
INNER JOIN Bookings ON Customers.Customer_ID = Bookings.Customer_ID
INNER JOIN Rooms ON Rooms.Room_ID = Bookings.Room_ID;

SELECT * From Customer_room_bookings;

# Demonstrates the customers' total spending at all of their bookings

CREATE VIEW Customer_expenditure AS
SELECT Bookings.Customer_ID, Customers.First_name, SUM(Rooms.Price_per_night*Bookings.Nights) AS Amount_spent
FROM Bookings
INNER JOIN Customers ON Bookings.Customer_ID = Customers.Customer_ID
INNER JOIN Rooms ON Bookings.Room_ID = Rooms.Room_ID
GROUP BY Bookings.Customer_ID
ORDER BY Amount_Spent DESC;

SELECT * From Customer_expenditure;

# Customer with Booking_ID B0505 wants to know whether the hotel they booked has a spa

SELECT Bookings.Booking_ID, Customers.First_name, Hotels.Location, Hotels.Spa
From Bookings
JOIN Customers ON Bookings.Customer_ID = Customers.Customer_ID
JOIN Rooms ON Bookings.Room_ID = Rooms.Room_ID
JOIN Hotels ON Rooms.Hotel_ID = Hotels.Hotel_ID
WHERE Bookings.Booking_ID = 'B0505'
AND Hotels.Spa = 'Yes';

# |Stored Function| This function will give customers a 10% discount during a sale season

DELIMITER //
CREATE FUNCTION Discounted_price(input_amount DECIMAL (7,2))
RETURNS DECIMAL (7,2)
DETERMINISTIC
BEGIN
DECLARE Output_amount DECIMAL (7,2);
SET Output_amount = Input_amount - 10/100 * Input_amount;
RETURN Output_amount;
END//
DELIMITER ;
# Example demonstrating the cost of current bookings if discount is applied
SELECT Bookings.Room_ID, Rooms.Room_name, Rooms.Price_per_night*Bookings.Nights AS Price_of_booking, Discounted_price(Rooms.Price_per_night*Bookings.Nights) AS Price_after_Discount
From Bookings
JOIN Rooms ON Bookings.Room_ID = Rooms.Room_ID;

# |Query with subquery| Customers that have bookings with spa access made in December

SELECT Customers.First_name, COUNT(Bookings.Booking_ID) AS Number_of_spa_booking 
FROM Bookings
JOIN Customers ON Bookings.Customer_ID = Customers.Customer_ID
JOIN Rooms ON Bookings.Room_ID = Rooms.Room_ID
JOIN Hotels ON Rooms.Hotel_ID = Hotels.Hotel_ID
WHERE Customers.Customer_ID IN (SELECT Customers.Customer_ID 
			FROM Bookings WHERE MONTH(Bookings.Booking_date)= 12) 
            AND Hotels.spa = 'Yes'
GROUP BY Customers.First_name

# |Stored Procedure| Finding out what customers have booked on the current date

DELIMITER //
CREATE PROCEDURE Booked(Booked_today DATE)
BEGIN
SELECT Customers.First_name, Customers.Last_name, Rooms.Room_name, Bookings.Booking_date AS Booked_today
FROM Bookings
JOIN Customers ON Bookings.Customer_ID = Customers.Customer_ID
JOIN Rooms ON Bookings.Room_ID = Rooms.Room_ID
WHERE Bookings.Booking_date = Booked_today;
END//
DELIMITER ;

CALL Booked(CURRENT_DATE());

# |Query with GROUP BY and HAVING| Demonstrates the best performing room types that have are generatated sales over £800 per a customer's stay and the hotel locations of these rooms.

SELECT Rooms.Room_Name, Hotels.Location, SUM(Rooms.Price_per_night*Bookings.Nights) AS Hotel_Sales_by_room
FROM Bookings
INNER JOIN Rooms ON Bookings.Room_ID = Rooms.Room_ID
INNER JOIN Hotels ON Rooms.Hotel_ID = Hotels.Hotel_ID
GROUP BY Bookings.Room_ID
HAVING Hotel_Sales_by_room > 800
ORDER by Hotel_Sales_by_room DESC;