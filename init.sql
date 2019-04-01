-#Initialize schema
CREATE TABLE Admin (
	Admin_ID		INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	PRIMARY KEY (Admin_ID),
	FOREIGN KEY (user_id)
);
CREATE TABLE Users (
	userid serial NOT NULL 
	username char(15) UNIQUE NOT NULL PRIMARY,
	display_name char(15) NOT NULL,
	password char(15) NOT NULL
	first_name char(45) NOT NULL,
   	last_name char(45) NOT NULL,
    email char(100) UNIQUE NOT NULL PRIMARY,
	phone_number UNIQUE character varying PRIMARY,
    address_id INTEGER NOT NULL,
	location char(1000),
	birth_date date,
	isAdmin boolean ,
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
	servicetype CHAR(100),
	status CHAR(100)
	start_date date
	minbid INTEGER CHECK(MinBid > 0),
	fromdate DATE, 
	todate DATE CHECK(todate > fromdate),
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
----
#Create functions
CREATE FUNCTION new_user(username_in character varying, firstname_in character varying, lastname_in character varying, address_in character varying, location_in character varying, 
email_in character varying, phone_number_in character varying, display_name_in char(15), password_in character varying, birth_date_in date, OUT customerid_out integer 
) RETURNS integer
    AS '
  DECLARE
    rows_returned INT;
  BEGIN
    SELECT COUNT(*) INTO rows_returned FROM Users WHERE email = username_in;
    IF rows_returned = 0 THEN
	    INSERT INTO Users (
		username,
		display_name,
		password,
		first_name,
		last_name,
		email,
		phone_number,
		address,
		birth_date,
		)
	    VALUES(
	     username_in,
		display_name_in,
		password_in,
		first_name_in,
		last_name_in,
		email_in,
		phone_number_in,
		address_in,
		birth_date_in,
	      )
	     ;
    select currval(pg_get_serial_sequence(''users'', ''userid'')) into userid_out;
  ELSE 
  	userid_out := 0;
  END IF;
END
'
    LANGUAGE plpgsql;
					 
create function bid ()
create function availability()
create function new_service(oid INTEGER, pid INTEGER)
create function accepts(cid INTEGER, sid INTEGER)



