
CREATE TABLE zzSummary (
	status		TEXT
);


CREATE TABLE Admin (
	Admin_ID		INTEGER,
	PRIMARY KEY (Admin_ID)
);
CREATE TABLE Users (
	User_ID INTEGER unique,
	User_Name char(100) NOT NULL,
	Display_name char(100) NOT NULL, 
	first_name char(45) NOT NULL,
   	last_name char(45) NOT NULL,
    	email char(100) NOT NULL,
    	address_id INTEGER NOT NULL,
	location char(1000)
	birth_date date
	PRIMARY KEY (User_ID),
);

##IMPLEMENT ISA HIERACHY HERE

CREATE TABLE Owner (
	oid INTEGER,
	pid INTEGER NOT NULL,
	PRIMARY KEY (oid),
	FOREIGN KEY (pid) REFERENCES Pets
);

CREATE TABLE CareTaker(
	cid INTEGER,
	location char(100),
	review VAR(1000)??
	PRIMARY KEY (cid)

CREATE TABLE Pets(
	pid INTEGER,
	Pet_type var(100),
	oid INTEGER NOT NULL,
	PRIMARY KEY (pid),
	FOREIGN KEY (oid) REFERENCES Owner
);


CREATE TABLE Service (
	sid INTEGER,
	oid INTEGER,
	pid INTEGER,
	type VAR(100),
	start_date date
	end_data date
	bid INTEGER NOT NULL,
	last_update timestamp without time zone DEFAULT now() NOT NULL
	PRIMARY KEY (sid),
	FOREIGN KEY (oid) REFERENCES Owners,
	FOREIGN KEY (pid) REFERENCES Pets
);

CREATE TABLE ClientHistory(
	cid INTEGER,
	sid INTEGER,
	pid INTEGER,
	FOREIGN KEY (pid) REFERENCES Service,
	FOREIGN KEY (sid) REFERENCES Service,
	FOREIGN KEY (cid) REFERENCES CareTaker,
);

create function bid ()
create function availability()
create function new_service(oid INTEGER, pid INTEGER)
create function accepts(cid INTEGER, sid INTEGER)



