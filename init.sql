
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
	primary key(email)
);

##IMPLEMENT ISA HIERACHY HERE

CREATE TABLE Owner (
	username char(15),
	oid SERIAL primary key,
	email char varying,
	foreign key (username) references Users,
	FOREIGN key (email) references Users
);

CREATE TABLE CareTaker(
	username char(15),
	cid SERIAL,
	email char(100),
	foreign key (username) references Users,
	FOREIGN key (email) references Users);

CREATE TABLE Pets(
	pid SERIAL,
	pet_name char(100),
	pet_type char(100),
	oid INTEGER NOT NULL,
	PRIMARY KEY (pid),
	FOREIGN KEY (oid) REFERENCES Owner
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
	FOREIGN KEY (oid) REFERENCES Owners,
);

CREATE TABLE History(
	cid INTEGER,
	sid INTEGER,
	pid INTEGER,
	FOREIGN KEY (pid) REFERENCES Service,
	FOREIGN KEY (sid) REFERENCES Service,
	FOREIGN KEY (cid) REFERENCES CareTaker,
);

Create Table CareTakerReviews(
    crid Serial,
	cid integer FOREIGN key (cid) CareTaker,
	rid integer FOREIGN key (oid) Owner,
	review character varying
);

create Table PetReview(
	prid SERIAL,
	pid Integer,
	cid integer,
	review character varying,
	foreign key (pid) REFERENCES Pets,
	foreign key (cid) REFERENCES CareTaker
);
