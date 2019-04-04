
CREATE TABLE Users (
	UserID SERIAL,
	display_name char(15) NOT NULL,
	password char(15) NOT null,
	first_name char(45) NOT NULL,
   	last_name char(45) NOT NULL,
    email char(100) UNIQUE not null,
	gENDer char(1),
	phone_number INTEGER UNIQUE not null,
    address INTEGER NOT NULL,
	country char(1000),
	birth_date date,
	PRIMARY KEY(email)
);

##IMPLEMENT ISA HIERACHY HERE

CREATE TABLE Owner (
	username char(15),
	oid SERIAL PRIMARY KEY,
	email char varying,
	FOREIGN KEY (username) references Users(username),
	FOREIGN KEY (email) references Users(email)
);

CREATE TABLE CareTaker(
	username char(15),
	cid SERIAL,
	email char(100),
	FOREIGN KEY (username) references Users(username),
	FOREIGN KEY (email) references Users(email);

CREATE TABLE Pets(
	pid SERIAL,
	pet_name char(100),
	pet_type char(100),
	oid INTEGER NOT NULL,
	PRIMARY KEY (pid),
	FOREIGN KEY (oid) REFERENCES Owner(oid)
);


CREATE TABLE Service (
	sid serial,
	oid INTEGER,
	minbid INTEGER CHECK(MinBid > 0),
	current_doggo integer,
	fromdate DATE, 
	todate DATE CHECK(todate > fromdate),
	last_update timestamp without time zone DEFAULT now() NOT null,
	availability boolean, 
	PRIMARY KEY (sid),
	FOREIGN KEY (oid) REFERENCES Owners(oid),
);

CREATE TABLE History(
	cid INTEGER,
	sid INTEGER,
	pid INTEGER,
	FOREIGN KEY (pid) REFERENCES Service(pid),
	FOREIGN KEY (sid) REFERENCES Service(sid),
	FOREIGN KEY (cid) REFERENCES CareTaker(cid),
);

Create Table CareTakerReviews(
    crid Serial,
	cid integer FOREIGN KEY (cid) CareTaker(cid),
	rid integer FOREIGN KEY (oid) owner(oid),
	review VARCHAR
);

create Table PetReview(
	prid SERIAL,
	pid Integer,
	cid integer,
	review VARCHAR,
	FOREIGN KEY (pid) REFERENCES Pets(pid),
	FOREIGN KEY (cid) REFERENCES CareTaker(cid)
);
