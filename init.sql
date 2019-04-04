
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Owner;
DROP TABLE IF EXISTS CareTaker;
DROP TABLE IF EXISTS Pets;
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS History;
DROP TABLE IF EXISTS PetReview;
DROP TABLE IF EXISTS CareTakerReviews;

CREATE TABLE Users (
	UserID INTEGER AUTO_INCREMENT,
	display_name char(15) NOT NULL,
	password char(15) NOT null,
	first_name char(45) NOT NULL,
   	last_name char(45) NOT NULL,
    email char(100) UNIQUE not null,
	gENDer char(1),
	phone_number INTEGER UNIQUE not null,
    address INTEGER NOT NULL,
	country char(100),
	birth_date date,
	PRIMARY KEY(UserID)
);

##IMPLEMENT ISA HIERACHY HERE

CREATE TABLE Owner (
	username char(15),
	email char(100),
    oid INTEGER,
    FOREIGN KEY (oid) REFERENCES Users(UserID),
	FOREIGN KEY (email) references Users(email)
);

CREATE TABLE CareTaker(
	username char(15),
	cid INTEGER,
	email char(100),
    FOREIGN KEY (cid) REFERENCES Users(UserID),
	FOREIGN KEY (email) references Users(email)
);

CREATE TABLE Pets(
	pid INTEGER AUTO_INCREMENT,
	pet_name char(100),
	pet_type char(100),
    oid INTEGER,
	PRIMARY KEY (pid),
	FOREIGN KEY (oid) REFERENCES Owner(oid)
);


CREATE TABLE Service (
	sid INTEGER AUTO_INCREMENT,
	pid INTEGER,
	minbid INTEGER NOT NULL,
	current_doggo INTEGER,
	fromdate DATE, 
	todate DATE NOT NULL,
	last_update timestamp, #without time zone DEFAULT now() NOT NULL
	availability boolean, 
	PRIMARY KEY (sid),
	FOREIGN KEY (pid) REFERENCES Pets(pid)
);

CREATE TABLE History(
	cid INTEGER,
	sid INTEGER,
	pid INTEGER,
	FOREIGN KEY (pid) REFERENCES Service(pid),
	FOREIGN KEY (sid) REFERENCES Service(sid),
	FOREIGN KEY (cid) REFERENCES CareTaker(cid)
);
Create Table CareTakerReviews(
    crid INTEGER AUTO_INCREMENT PRIMARY KEY,
	review TEXT,
	cid INTEGER,
	rid INTEGER,
	FOREIGN KEY (cid) REFERENCES CareTaker(cid),
	FOREIGN KEY (rid) REFERENCES Owner(oid)
);

create Table PetReview(
	prid INTEGER AUTO_INCREMENT PRIMARY KEY,
	pid Integer,
	cid integer,
	review TEXT,
	FOREIGN KEY (pid) REFERENCES Pets(pid),
	FOREIGN KEY (cid) REFERENCES CareTaker(cid)
);
