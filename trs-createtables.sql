drop database trs;
create database trs;
use trs;

create table if not exists Users(
	username varchar(25) primary key, 
	password varchar(25), 
	firstName varchar(45), 
	lastName varchar(45), 
	address varchar(45), 
	city varchar(45), 
	state char(2), 
	zipCode char(5), 
	phone char(10), 

	userType varchar(25), 


	CCNumber char(16), 
	email varchar(45), 
	creationDate date, 


	startDate date,
	ssn char(9),
	hourlyRate int

);


create table if not exists Preferences_prefer(
	prefID int AUTO_INCREMENT,  
	username varchar(25), 
	meal varchar(45), 
	seatType varchar(25),
	primary key(prefID, username),
	foreign key(username) references Users(username) on delete cascade
);



create table if not exists Airlines(
	name char(45),
	airlineID char(2) primary key
);



create table if not exists Airports(
	airportID char(3) primary key,
	city varchar(45),
	country varchar(45), 
	name varchar(45)
);



create table if not exists Flight_operates(
	flightNumber int, 
	airlineID char(2),
	seatCount int, 
	dominter varchar(25), 
	primary key(airlineID, flightNumber),
	foreign key(airlineID) references Airlines(airlineID) on delete cascade
);



create table if not exists Days_occurs(
	flightNumber int, 
	airlineID char(2), 
	weekday varchar(25), 
	primary key(flightNumber, airlineID, weekday),
	foreign key (airlineID, flightNumber) references Flight_operates(airlineID, flightNumber)
);




create table if not exists FareRestrictions(
	frID int AUTO_INCREMENT, 
	advancePurchase varchar(45), 
	lengthOfStay int,
	primary key (frID)
);




create table if not exists Reservations(
	resNo int AUTO_INCREMENT, 
	dateReserved date, 
	totalFare int, 
	bookingFee float,
	passengers int, 
	type varchar(20), 
	cust_username varchar(25), 
	primary key (resNo)
);
ALTER TABLE Reservations AUTO_INCREMENT = 1001;


create table if not exists Records(
	resNo int, 
	username varchar(25),
	primary key(resNo), 
	foreign key(resNo) references Reservations(resNo) on delete cascade,
	foreign key(username) references Users(username) on delete cascade
);



create table if not exists Tickets(
	ticketID int AUTO_INCREMENT, 
	seatNo int, 
	seatType varchar(25), 
	meal varchar(45), 
	class varchar(45), 
	deptDateTime datetime, 
	arrivalDateTime datetime,
	deptAirportID char(3),
	arrAirportID char(3), 
	cust_username varchar(25), 
	primary key (ticketID)
);
ALTER TABLE Tickets AUTO_INCREMENT = 101;


create table if not exists Purchases(
	ticketID int, 
	username varchar(25), 
	resNo int, 
	flightNumber int, 
	airlineID char(2),
	primary key(ticketID, username, resNo, flightNumber, airlineID),
	foreign key(ticketID) references Tickets(ticketID) on delete cascade, 
	foreign	key(username) references Users(username) on delete cascade, 
	foreign key(resNo) references Reservations(resNo) on delete cascade, 
	foreign key(airlineID, flightNumber) references Flight_operates(airlineID, flightNumber) on delete cascade
);


create table if not exists Has_1(
	frID int, 
	flightNumber int, 
	airlineID char(2), 
	primary key(frID, flightNumber, airlineID), 
	foreign key(frID) references FareRestrictions(frID) on delete cascade,
	foreign key(airlineID, flightNumber) references Flight_operates(airlineID, flightNumber) on delete cascade
);

create table if not exists Has_3(
	frID int, 
	resNo int, 
	primary key(frID, resNo), 
	foreign key(frID) references FareRestrictions(frID) on delete cascade, 
	foreign key(resNo) references Reservations(resNo) on delete cascade
);




create table if not exists Routes(
	routeID int AUTO_INCREMENT, 
	fare double, 
	primary key (routeID) 
);

create table if not exists Runs(
	airlineID char(2), 
	flightNumber int, 
	routeID int, 
	primary key (airlineID, flightNumber, routeID), 
	foreign key (airlineID, flightNumber) references Flight_operates(airlineID, flightNumber) on delete cascade, 
	foreign key	(routeID) references Routes(routeID) on delete cascade
);




create table if not exists Arrive(
	routeID int,
	arrairportID char(3),
	arrivalTime time,
	primary key(routeID), 
	foreign key(routeID) references Routes(routeID) on delete cascade, 
	foreign key(arrairportID) references Airports(airportID) on delete cascade
);


create table if not exists Depart(
	routeID int,
	deptairportID char(3),
	deptTime time,
	primary key(routeID), 
	foreign key(routeID) references Routes(routeID) on delete cascade, 
	foreign key(deptairportID) references Airports(airportID) on delete cascade
);



/*temp table */

create table if not exists Customer_Reservations(
	username varchar(25), 
	passengers int, 
	departure_date date, 
	return_date date, 
	departure varchar(3), 
	destination varchar(3), 
	ticket_type varchar(1)
);