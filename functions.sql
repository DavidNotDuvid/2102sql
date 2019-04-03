
CREATE FUNCTION new_user(username_in character varying, firstname_in character varying, lastname_in character varying, address_in character varying, location_in character varying, 
email_in character varying, gENDer_in char(1), phone_number_in character varying, display_name_in char(15), password_in char(15),
country_in character varying, birth_date_in date, OUT userid_out integer ) RETURNS integer
    AS '
  DECLARE
    rows_returned INT;
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
		gENDer,
		phone_number,
		address,
		country,
		birth_date)
	    VALUES(
	     username_in,
		display_name_in,
		password_in,
		first_name_in,
		last_name_in,
		email_in,
		gENDer_in,
		phone_number_in,
		address_in,
		country_in,
		birth_date_in)
	     ;
  ELSE 
  	userid_out = 0;
  END IF;
END
'
    LANGUAGE plpgsql;
--	


create function update_password(username_in char(15), password_in char(15)) RETURNS integer as
'BEGIN 
	UPDATE Users SET password = password_in WHERE username = username_in;
END'
LANGUAGE plpgsql;

create function update_info(username_in char(15), phone_number_in char varying, email_in char varying, address_in char varying, location_in char varying) RETURNS void 
as 
'BEGIN
	UPDATE Users 
	set phone_number = phone_number_in, email = email_in, address = address_in , location = location_in 
	where username = username_in;
END'
language plpgsql;

--PetOwner related functions
	
create function new_pet(pet_type_in Integer, pet_name_in Integer,oid_in Integer, pid_out integer) RETURNS integer
as
'BEGIN
	INSERT into pets(pet_name,pet_type,oid) Values( pet_name_in, pet_type_in, oid_in);
END'
language plpgsql;
--
create function leave_review( cid_in integer,oid_in integer, review_in character varying) RETURNS void 
as
'BEGIN
	INSERT into Table CareTakerReviews(cid, rid, review) Values (cid_in, oid_in,review_in);
END'
language plpgsql;
--
create function pet_review( pid_in integer, cid_in integer, review_in character varying) RETURNS void
as
'BEGIN 
	INSERT into Table PetReview(pid, cid, review) Values (pid_in, cid_in,review_in);
END'
language plpgsql;

--Service related function

create function new_service(oid_in INTEGER, minbid_in INTEGER, fromdate_in DATE,  todate_in DATE) RETURNS integer
AS 
'Begin
	INSERT into Service(oid, minbid, current_bidder, fromdate, todate, last_update, availability) values (oid_in, minbid_in, null, fromdate_in, 
	todate_in, timestamp, true);
END'
language plpgsql;
	
create function bid (sid INTEGER,bid_in INTEGER, pig INTEGER) RETURNS void 
as' 
BEGIN 
	UPDATE Service set s.minbid = bid_in, s.current_doggo = pid where s.sid = sid and bid_in > s.minbid and s.availability = true;
END'
language plpgsql;


create function current(pid_in INTEGER) RETURNS void
as'
BEGIN
	SELECT sid from Service where pid = pid_in;
END'
language plpgsql;
--			
create function publish(sid INTEGER) RETURNS void
as 
'BEGIN
	update Services s
	set s.availability =true
	where s.sid = sid and s.availability = false;
END'
language plpgsql;
--
create function unpublish(sid INTEGER) RETURNS void
as 
'BEGIN
	update Services s
	set s.availability =false
	where s.sid = sid and s.availability = true;
END'
language plpgsql;

--
create FUNCTION add_history(cid_in INTEGER, sid_in INTEGER, pid_in INTEGER) RETURNS void as
'BEGIN
	INSERT into History(cid, sid, pid) values (cid_in, sid_in, pid_);
END'
language plpgsql;
--	
create FUNCTION check_histroy(check_id INTEGER) RETURNS void as
'BEGIN
	select cid, sid, pid
	from History
	where (sid = check_id or sid = check_id or pid = check_id);
END'
language plpgsql;
--
create function accepts(cid INTEGER, sid INTEGER) RETURNS void as
'BEGIN
	update Service S 
	set s.availability = false
	where S.sid = sid and S.cid=cid;
END'
language plpgsql;
--
create function update_service(sid INTEGER, fromdate_in DATE,  todate_in DATE) RETURNS void as 
'BEGIN
	Update Service S
	set s.fromdate = firstname_in and s.todate = todate_in
	where s.sid = sid;
END'
language plpgsql;
--
create function toggle (user_type integer, email_in character varying) RETURNS void 
as
'BEGIN	
	IF user_typer = 1  THEN
		INSERT into CareTaker (email) Values (email_in);
	else  
		INSERT into owner (email) Values (email_in);
	END IF;
END'
language plpgsql;
