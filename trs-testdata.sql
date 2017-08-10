/*TODO add if not exists somewhere in the insert statements */


/*Fake Manager User*/
insert into Users (username, password, firstName, lastName, 
					address, city, state, zipCode, phone, 
					userType, startDate, ssn, hourlyRate) values 
	
	('gandalf', 'pass', 'Gandalf', 'Grey', 
		'123 Cherry Lane', 'Cheese City', 'NJ', '08901', '9999999999', 
		'Manager', '2017-01-01', '111111111', 100  
);

insert into Users (username, password, firstName, lastName, 
					address, city, state, zipCode, phone, 
					userType, startDate, ssn, hourlyRate) values 
	
	('yoda', 'pass', 'Yoda', 'Master', 
		'23 Jedi Lane', 'Jedi Council', 'NY', '08904', '9449999999', 
		'Manager', '2017-01-04', '221111111', 184  
);

/* Fake Customer Users */
insert into Users (username, password, firstName, lastName, 
					address, city, state, zipCode, phone, 
					userType, creationDate, email, CCNumber) values 
	
	('jon', 'pass', 'Jon', 'Snow', 
		'294 Helms Keep', 'Knights Watch', 'CA', '95059', '1541586845', 
		'Customer', '2017-01-15', 'jonsnow@ghost.com', '123412341234'  
);

insert into Users (username, password, firstName, lastName, 
					address, city, state, zipCode, phone, 
					userType, creationDate, email, CCNumber) values 
	
	('arya', 'pass', 'Arya', 'Stark', 
		'234 No Face Street', 'Bravvos', 'CA', '15059', '1341586845', 
		'Customer', '2017-01-29', 'aryastark@manyface.com', '222412341234'  
);


insert into Users (username, password, firstName, lastName, 
					address, city, state, zipCode, phone, 
					userType, creationDate, email, CCNumber) values 
	
	('joffrey', 'pass', 'Joffrey', 'Baratheon', 
		'234 Shiny Castle Lane', 'Kings Landing', 'DE', '13059', '5321586845', 
		'Customer', '2017-02-28', 'iamthe@king.com', '233412341234'  
);

insert into Users (username, password, firstName, lastName, 
					address, city, state, zipCode, phone, 
					userType, creationDate, email, CCNumber) values 
	
	('jamie', 'pass', 'Jamie', 'Lannister', 
		'234 Shiny Castle Lane', 'Kings Landing', 'DE', '13059', '9999998888', 
		'Customer', '2017-04-29', 'kingslayer@lion.com', '233412344444'  
);




/*Fake Customer Representative */
insert into Users (username, password, firstName, lastName, 
					address, city, state, zipCode, phone, 
					userType, startDate, ssn, hourlyRate) values 
	
	('sanic', 'pass', 'Sonic', 'Hedgehog', 
		'1 Fast Lane', 'Green Hill Zone', 'FL', '84201', '1234567412', 
		'CustomerRep', '2017-01-11', '123454567', 69  
);



insert into Users (username, password, firstName, lastName, 
					address, city, state, zipCode, phone, 
					userType, startDate, ssn, hourlyRate) values 
	
	('tails', 'pass', 'Tails', 'Milespower', 
		'2 Fast Lane', 'Emerald Hill Zone', 'FL', '84231', '3334567412', 
		'CustomerRep', '2017-01-16', '333454567', 68  
);



insert into Users (username, password, firstName, lastName, 
					address, city, state, zipCode, phone, 
					userType, startDate, ssn, hourlyRate) values 
	
	('samus', 'pass', 'Samus', 'Aran', 
		'15 Metroid Street', 'Brinstar', 'CO', '84201', '9234567412', 
		'CustomerRep', '2017-02-20', '853454567', 980  
);


insert into Users (username, password, firstName, lastName, 
					address, city, state, zipCode, phone, 
					userType, startDate, ssn, hourlyRate) values 
	
	('mario', 'pass', 'Mario', 'Plumbah', 
		'34 Peachtree St', 'Peachs Castle', 'DE', '84234', '1423567412', 
		'CustomerRep', '2017-03-01', '999454567', 80  
);





/******************************************************************************/
/******************************************************************************/
/******************************************************************************/


/* Airline Data */

-- create table if not exists Airlines(
-- 	name char(45),
-- 	airlineID char(2) primary key
-- );

insert into Airlines (name, airlineID) values
	('Delta Airlines', 'DA');

insert into Airlines (name, airlineID) values
	('Jet Blue', 'JB');

insert into Airlines (name, airlineID) values
	('United Airlines', 'UA');

insert into Airlines (name, airlineID) values
	('Southwest Airlines', 'SW');

insert into Airlines (name, airlineID) values
	('American Airlines', 'AA');



/*Airport Data*/

-- create table if not exists Airports(
-- 	airportID char(3) primary key,
-- 	city varchar(45),
-- 	country varchar(45), 
-- 	name varchar(45)
-- );

insert into Airports (airportID, city, country, name) values
	('EWR', 'Newark', 'United States', 'Newark International Airport');


insert into Airports (airportID, city, country, name) values
	('JFK', 'New York', 'United States', 'John F. Kennedy International Airport');


insert into Airports (airportID, city, country, name) values
	('ATL', 'Atlanta', 'United States', 'Jackson Atlanta International Airport');


insert into Airports (airportID, city, country, name) values
	('BEK', 'Chaoyang-Shunyi', 'China', 'Beijing Capital International Airport');

insert into Airports (airportID, city, country, name) values
	('DXB', 'Garhoud', 'Dubai', 'Dubai International Airport');

insert into Airports (airportID, city, country, name) values
	('LAX', 'Los Angeles', 'United States', 'Los Angeles International Airport');

insert into Airports (airportID, city, country, name) values
	('HND', 'Tokyo', 'Japan', 'Tokyo International Airport');

insert into Airports (airportID, city, country, name) values
	('LHR', 'London', 'United Kingdom', 'O Hare International Airport');






/*FLIGHTS*/
/******************************************************************************/
/******************************************************************************/
/******************************************************************************/


insert into Flight_operates(flightNumber, airlineID, seatCount, dominter) values 
	(2221, 'UA', 100, 'Domestic');
insert into Days_occurs(flightNumber, airlineID, weekday) values 
	(2221, 'UA', 'Saturday');
insert into Days_occurs(flightNumber, airlineID, weekday) values 
	(2221, 'UA', 'Sunday');

insert into Routes(fare) values (100); /*routeID 1*/
insert into Runs(airlineID, flightNumber, routeID) values
	('UA', 2221, 1);

insert into Routes(fare) values (110); /*routeID 2*/
insert into Runs(airlineID, flightNumber, routeID) values
	('UA', 2221, 2);

insert into Depart(routeID, deptairportID, deptTime) values 
	(1, 'ATL', '15:00:00');
insert into Arrive(routeID, arrairportID, arrivalTime) values 
	(1, 'EWR', '18:00:00');

insert into Depart(routeID, deptairportID, deptTime) values 
	(2, 'EWR', '19:00:00');
insert into Arrive(routeID, arrairportID, arrivalTime) values 
	(2, 'JFK', '20:00:00');





/******************************************************************************/
/******************************************************************************/
/******************************************************************************/


insert into Flight_operates(flightNumber, airlineID, seatCount, dominter) values 
	(2221, 'DA', 200, 'International');
insert into Days_occurs(flightNumber, airlineID, weekday) values 
	(2221, 'DA', 'Monday');
insert into Days_occurs(flightNumber, airlineID, weekday) values 
	(2221, 'DA', 'Wednesday');

insert into Routes(fare) values (125); /*routeID 3*/
insert into Runs(airlineID, flightNumber, routeID) values
	('DA', 2221, 3);

insert into Routes(fare) values (150); /*routeID 4*/
insert into Runs(airlineID, flightNumber, routeID) values
	('DA', 2221, 4);

insert into Depart(routeID, deptairportID, deptTime) values 
	(3, 'ATL', '05:00:00');
insert into Arrive(routeID, arrairportID, arrivalTime) values 
	(3, 'HND', '12:00:00');

insert into Depart(routeID, deptairportID, deptTime) values 
	(4, 'HND', '13:00:00');
insert into Arrive(routeID, arrairportID, arrivalTime) values 
	(4, 'DXB', '20:00:00');


/******************************************************************************/
/******************************************************************************/
/******************************************************************************/


insert into Flight_operates(flightNumber, airlineID, seatCount, dominter) values 
	(1111, 'SW', 100, 'Domestic');
insert into Days_occurs(flightNumber, airlineID, weekday) values 
	(1111, 'SW', 'Tuesday');
insert into Days_occurs(flightNumber, airlineID, weekday) values 
	(1111, 'SW', 'Friday');

insert into Routes(fare) values (125); /*routeID 5*/
insert into Runs(airlineID, flightNumber, routeID) values
	('SW', 1111, 5);

insert into Routes(fare) values (150); /*routeID 6*/
insert into Runs(airlineID, flightNumber, routeID) values
	('SW', 1111, 6);

insert into Depart(routeID, deptairportID, deptTime) values 
	(5, 'JFK', '04:00:00');
insert into Arrive(routeID, arrairportID, arrivalTime) values 
	(5, 'EWR', '06:00:00');

insert into Depart(routeID, deptairportID, deptTime) values 
	(6, 'EWR', '08:00:00');
insert into Arrive(routeID, arrairportID, arrivalTime) values 
	(6, 'LAX', '12:00:00');





/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/



/*RESERVATIONS*/

/*jon buys 2 tickets one-way for UA2221 resNo1, tickets 1 and 2*/
insert into Reservations (dateReserved, totalFare, bookingFee, passengers, type, cust_username) values
	('2017-01-11', 470, 50, 2, "One-Way", 'jon');

insert into Records (resNo, username) values (1001, 'sanic');

insert into Tickets (seatNo, seatType, meal, class, deptDateTime, arrivalDateTime, deptAirportID, arrAirportID, cust_username) values
	(1, "Window", "Chicken", "Business", 
		"2017-07-01 15:00:00", 
		"2017-07-01 20:00:00", 
		"ATL", "JFK", 'jon'
	);

insert into Tickets (seatNo, seatType, meal, class, deptDateTime, arrivalDateTime, deptAirportID, arrAirportID, cust_username) values
	(2, "Window", "Fish", "Business", 
		"2017-07-01 15:00:00", 
		"2017-07-01 20:00:00", 
		"ATL", "JFK", 'jon'
	);

insert into Purchases (ticketID, username, resNo, flightNumber, airlineID) values 
	(101, 'jon', 1001, 2221, 'UA');

insert into Purchases (ticketID, username, resNo, flightNumber, airlineID) values 
	(102, 'jon', 1001, 2221, 'UA');





/******************************************************************************/


/*arya buys 1 ticket one-way for UA2221 resNo2, ticket 3*/
insert into Reservations (dateReserved, totalFare, bookingFee, passengers, type, cust_username) values
	('2017-01-12', 150, 50, 1, "One-Way", 'arya');

insert into Records (resNo, username) values (1002, 'sanic');

insert into Tickets (seatNo, seatType, meal, class, deptDateTime, arrivalDateTime, deptAirportID, arrAirportID, cust_username) values
	(3, "Window", "Steak", "Business", 
		"2017-07-08 15:00:00", 
		"2017-07-08 20:00:00", 
		"ATL", "EWR", 'arya'
	);

insert into Purchases (ticketID, username, resNo, flightNumber, airlineID) values 
	(103, 'arya', 1002, 2221, 'UA');



/******************************************************************************/


/*arya buys 1 ticket one-way for UA2221 resNo3, ticket 4*/
insert into Reservations (dateReserved, totalFare, bookingFee, passengers, type, cust_username) values
	('2017-01-10', 200, 50, 1, "One-Way", 'jamie');

insert into Records (resNo, username) values (1003, 'sanic');

insert into Tickets (seatNo, seatType, meal, class, deptDateTime, arrivalDateTime, deptAirportID, arrAirportID, cust_username) values
	(1, "Window", "Steak", "Business", 
		"2017-07-08 13:00:00", 
		"2017-07-08 20:00:00", 
		"HND", "DXB", 'jamie'
	);

insert into Purchases (ticketID, username, resNo, flightNumber, airlineID) values 
	(104, 'jamie', 1003, 2221, 'DA');


