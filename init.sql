

CREATE TABLE Users (
	UserID SERIAL,
	display_name char(15) NOT NULL,
	password char(15) NOT null,
	first_name char(45) NOT NULL,
   	last_name char(45) NOT NULL,
    email char(100) UNIQUE not null,
	gender char(1),
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

--user realated functions

CREATE FUNCTION new_user(username_in character varying, firstname_in character varying, lastname_in character varying, address_in character varying, location_in character varying, 
email_in character varying, gender_in char(1), phone_number_in character varying, display_name_in char(15), password_in char(15),
country_in character varying, birth_date_in date, OUT customerid_out integer ) AS 
  DECLARE
    rows_returned INT
  BEGIN
    SELECT COUNT(*) INTO rows_returned FROM Users WHERE email = email_in or username = username_in;
    IF rows_returned = 0 THEN
	    INSERT INTO Users (
		username,
		display_name,
		password,
		first_name,
		last_name,
		email,
		gender
		phone_number,
		address,
		country,
		birth_date,
		)
	    VALUES(
	     username_in,
		display_name_in,
		password_in,
		first_name_in,
		last_name_in,
		email_in,
		gender_in
		phone_number_in,
		address_in,
		country_in
		birth_date_in,
	      )
	     ;
  ELSE 
  	userid_out := 0;
  END IF;
END

    LANGUAGE plpgsql;)
;
--
create function update_password(username_in char(15), password_in char(15)) as 
UPDATE Users SET password = password_in WHERE username = username_in;

create function update_info(username_in char(15), phone_number_in char varying, email_in char varying, address_in char varying, location_in char varying) as 
UPDATE Users set phone_number = phone_number_in not null, email = email_in not null, address = address_in not null, location_in not null)
where username = username_in;

--PetOwner related functions
	
create function new_pet(pet_type_in Integer, pet_name_in Integer,oid_in Integer, pid_out integer) Returns integer
As
INSERT into pets(pet_name,pet_type,oid) Values( pet_name_in, pet_type_in, oid_in);
--
create function leave_review( cid_in integer,oid_in integer, review_in character varying)
as
INSERT into Table CareTakerReviews(cid, rid, review) Values (cid_in, oid_in,review_in);
--
create function pet_review( pid_in integer, cid_in integer, review_in character varying)
as
INSERT into Table PetReview(pid, cid, review) Values (pid_in, cid_in,review_in);


--Service related function

create function new_service(oid_in INTEGER, minbid_in INTEGER, fromdate_in DATE,  todate_in DATE) RETURNS integer
AS 
	INSERT into Service(oid, minbid, current_bidder, fromdate, todate, last_update, availability) values (oid_in, minbid_in, null, fromdate_in, 
	todate_in, timestamp, true);

	
create function bid (sid,bid_in, pig)
as
UPDATE Service set s.minbid = bid_in, s.current_doggo = pid where s.sid = sid and bid_in > s.minbid and s.availability = true;

create function current(pid_in)
as
SELECT sid from Service where pid = pid_in;

--			
create function publish(sid)
as 
	update Services
	set s.availability =true
	where s.sid = sid and s.availability = false
	else 
	set s.availability = false
	where s.sid = sid and s.availability = true;


--
create FUNCTION add_history(cid_in INTEGER, sid_in INTEGER, pid_in INTEGER) as 
	INSERT into History(cid, sid, pid) values (cid_in, sid_in, pid_);
--	
create FUNCTION check_histroy(check_id INTEGER) as
select cid, sid, pid
from History
where (sid = check_id or sid = check_id or pid = check_id);
	
create function accepts(cid INTEGER, sid INTEGER)
as update TABLE Service S 
set s.availability = false
where S.sid = sid and S.cid=cid;

create function update_service(sid INTEGER, fromdate_in DATE,  todate_in DATE)
as update Table Service S
set s.fromdate = firstname_in and s.todate = todate_in
where s.sid = sid);


create function toggle (user_type char(1), email_in character varying) 
as (
	if user_type = 'c' then insert into table CareTaker (email) Values (email_in);
	else if  user_type = 'o' then ;
		insert into table CareTaker (email) Values (email_in)
		);
		
