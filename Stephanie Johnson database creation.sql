CREATE DATABASE PandaHotels;
USE PandaHotels;

CREATE TABLE Customers
(Customer_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
First_name VARCHAR(25) NOT NULL, 
Last_name VARCHAR(25) NOT NULL, 
Email VARCHAR(100) NOT NULL, 
Phone VARCHAR(20) NOT NULL
) AUTO_INCREMENT=100;

CREATE TABLE Hotels
(Hotel_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Location VARCHAR(50) NOT NULL,
Rooms INT NOT NULL,
Smart_TVs VARCHAR(5) NOT NULL,
Spa VARCHAR (5) NOT NULL,
Gym VARCHAR (5) NOT NULL
) AUTO_INCREMENT=10;

CREATE TABLE Rooms
(Room_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Hotel_ID INT NOT NULL,
Room_name VARCHAR(20) NOT NULL,
Capacity INT NOT NULL,
Breakfast VARCHAR(5) NOT NULL,
Price_per_night DECIMAL (5,2) NOT NULL,
FOREIGN KEY (Hotel_ID) REFERENCES Hotels (Hotel_ID)
);

CREATE TABLE Booking_methods
(Method_ID INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
Method_name VARCHAR(25) NOT NULL,
Number_of_reservations INT NOT NULL
) AUTO_INCREMENT=1000;

CREATE TABLE Bookings
(Booking_ID VARCHAR(10) NOT NULL PRIMARY KEY,
Customer_ID INT NOT NULL,
Room_ID INT NOT NULL,
Method_ID INT NOT NULL,
Booking_date DATE,
Guests INT NOT NULL,
Nights INT NOT NULL,
Business_booking VARCHAR(5) NOT NULL,
FOREIGN KEY (Customer_ID) REFERENCES Customers (Customer_ID),
FOREIGN KEY (Room_ID) REFERENCES Rooms (Room_ID),
FOREIGN KEY (Method_ID) REFERENCES Booking_methods (Method_ID)
);

INSERT INTO Customers
(First_name, Last_name, Email, Phone)
VALUES
('Theo', 'Hamilton', 'theo.ham97@maydks.com', '07458 245496'),
('Demi', 'Rollins', 'dau@haselelit.co.uk', '07845 651975'),
('Damson', 'Welch', 'fvitor@fdssa.com', '07633 885859'), 
('Pandora', 'Dillard', '1d.pandora@euskc.co.uk', '07932 626177'), 
('Leah', 'Snow', 'a.snow25@gmtail.com', '07348 355808'), 
('Deanna', 'Simpson', 'simpson.d@sdif.co.uk', '07423 561214'), 
('Astrid', 'Comte', 'astridcomte@ddrk.com', '07851 258928'),
('Hillary', 'Riley', 'in.hendre5@atunc.co.uk', '07768 743633'),
('Michael', 'John', 'm.john51@ddmail.co.uk', '07778 544658'), 
('Layla', 'Sydney', 'Iay.sney5@snix.com', '07259 524358'), 
('Jay', 'Stuart', 'nes.bladit@lacinia.com', '07202 624754'), 
('Andre', 'Smith', 'mdydsn@ciquis.co.uk', '07825 585258'), 
('Timon', 'Frost', 'dxm@cxjmail.co.uk', '07438 180844'), 
('Patricia', 'Van', 'van.pat75@maildd.com', '07613 51123'), 
('Kaley', 'Brooks', 'brkskay@edum.co.uk', '07411 029080');

INSERT INTO Hotels
(Location, Rooms, Smart_TVs, Spa, Gym)
VALUES
('London', '50', 'Yes', 'Yes', 'Yes'),
('Birmingham', '40', 'Yes', 'No', 'No'),
('Liverpool', '45', 'Yes', 'Yes', 'No'),
('Bristol', '35', 'Yes', 'No', 'Yes'),
('Nottingham', '40', 'Yes', 'No', 'No'),
('Leicester', '50', 'Yes', 'No', 'Yes'),
('Manchester', '60', 'Yes', 'Yes', 'Yes');

INSERT INTO Rooms
(Hotel_ID, Room_name, Capacity, Breakfast, Price_per_night)
VALUES
('10','Single A', '1', 'No', '125.00'),
('10','Single B', '1', 'Yes', '150.00'),
('10','Twin/Double A', '2', 'No', '145.00'),
('10','Twin/Double B', '2', 'Yes', '175.00'),
('10','Deluxe A', '4', 'No', '205.00'),
('10','Deluxe B', '4', 'Yes', '260.00'),
('10','Presidential Suite', '5', 'Yes', '325.50'),
('11','Single B', '1', 'Yes', '140.00'),
('11','Twin/Double B', '2', 'Yes', '170.00'),
('11','Deluxe B', '4', 'Yes', '270.00'),
('11','Presidential Suite', '5', 'Yes', '315.90'),
('12','Single A', '1', 'No', '120.70'),
('12','Twin/Double A', '2', 'No', '135.00'),
('12','Twin/Double B', '2', 'Yes', '171.00'),
('12','Deluxe A', '4', 'No', '198.00'),
('12','Presidential Suite', '5', 'Yes', '305.00'),
('13','Single A', '1', 'No', '120.00'),
('13','Single B', '1', 'Yes', '145.00'),
('13','Twin/Double A', '2', 'No', '135.00'),
('13','Twin/Double B', '2', 'Yes', '170.00'),
('14','Single A', '1', 'No', '127.00'),
('14','Single B', '1', 'Yes', '145.55'),
('14','Twin/Double A', '2', 'No', '134.00'),
('14','Twin/Double B', '2', 'Yes', '171.00'),
('14','Deluxe A', '4', 'No', '203.00'),
('14','Deluxe B', '4', 'Yes', '261.00'),
('15','Single A', '1', 'No', '120.00'),
('15','Single B', '1', 'Yes', '145.00'),
('15','Twin/Double A', '2', 'No', '135.00'),
('15','Twin/Double B', '2', 'Yes', '170.00'),
('15','Deluxe B', '4', 'Yes', '260.00'),
('15','Presidential Suite', '5', 'Yes', '320.00'),
('16','Single A', '1', 'No', '130.00'),
('16','Single B', '1', 'Yes', '154.00'),
('16','Twin/Double A', '2', 'No', '137.00'),
('16','Twin/Double B', '2', 'Yes', '168.00'),
('16','Deluxe A', '4', 'No', '209.40'),
('16','Deluxe B', '4', 'Yes', '263.90'),
('16','Presidential Suite', '5', 'Yes', '371.00');


INSERT INTO Booking_methods
(Method_name, Number_of_reservations)
VALUES
('Hotel website', '6'),
('Hotel call', '4'),
('Booking.com', '7'),
('Tripadvisor', '5'),
('Trivago', '3');

INSERT INTO Bookings
(Booking_ID, Customer_ID, Room_ID, Method_ID, Booking_date, Guests, Nights, Business_booking)
VALUES
('A1401', '103', '18', '1000', '2022-12-21', '1', '3', 'No'),
('B1601', '104', '6', '1003', '2022-09-12', '4', '2', 'Yes'),
('C1903', '110', '23', '1002', '2022-01-03', '2', '4', 'No'),
('A1502', '109', '14', '1004', '2022-12-24', '2', '1', 'No'),
('B1801', '102', '20', '1000', '2022-07-15', '2', '5', 'No'),
('C1591', '110', '10', '1002', '2022-05-08', '3', '3', 'No'),
('A1192', '106', '28', '1003', '2022-10-07', '1', '4', 'Yes'),
('B0505', '101', '1', '1001', '2022-07-05', '1', '1', 'Yes'),
('C2555', '108', '25', '1001', '2022-12-21', '4', '1', 'No'),
('A6252', '104', '38', '1002', '2022-01-29', '2', '3', 'Yes'),
('B2926', '109', '33', '1003', '2022-10-02', '1', '2', 'Yes'),
('C9530', '113', '36', '1004', '2022-12-11', '1', '2', 'No'),
('A8202', '107', '10', '1000', '2022-05-16', '2', '3', 'No'),
('B9529', '105', '30', '1001', '2022-05-23', '2', '6', 'No'),
('C9559', '112', '7', '1000', '2022-04-30', '5', '3', 'Yes'),
('A7220', '110', '6', '1004', '2022-12-05', '3', '1', 'No'),
('B2686', '103', '15', '1003', '2022-11-08', '2', '5', 'No'),
('C8263', '114', '15', '1002', '2022-08-09', '3', '6', 'No'),
('A7239', '108', '34', '1002', '2022-11-20', '1', '3', 'No'),
('B2512', '111', '1', '1000', '2022-06-05', '1', '2', 'Yes'),
('C4006', '101', '26', '1001', '2022-02-21', '2', '3', 'No'),
('A5096', '102', '16', '1003', '2022-10-31', '4', '1', 'No'),
('B8000', '109', '39', '1002', '2022-01-10', '1', '5', 'Yes'),
('C6200', '110', '26', '1000', '2022-09-19', '3', '4', 'No'),
('A9004', '101', '32', '1002', '2022-05-30', '5', '3', 'No');

SELECT * FROM Customers;
SELECT * FROM Hotels;
SELECT * FROM Rooms;
SELECT * FROM Booking_methods;
SELECT * FROM Bookings;