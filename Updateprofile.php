<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <title> Profile </title>
        <link rel="stylesheet" type="text/css" href="css/updateprofile.css">
    </head>
    
    <body>
            <div class="topnav">
                <a class="active" href="#home">Home</a>
                <a href="#news">Profile</a>
                <a href="#contact">Pets</a>
                <a href="#about">History</a>
                <form align="right" name="form1" method="post" action="log_out.php">
                    <label class="logoutLblPos">
                        <input name="submit2" type="submit" id="submit2" value="Log Out">
                    </label>
                </form>
        </div>

        <header>Update Profile</header>
        
        <h1>
            <div class="container">
                <form role="form">
                    <!-- Text field -->
                    <div class =" form-group ">
                        <label for=" inputEmail ">Email</ label >
                        <input type ="email" class =" form-control " id=" inputEmail ">
                    </div >
                    
                    <div class="form-group">
                        <label for="inputPhone">Phone Number</label>
                        <input type="text" class="form-control" id="inputPhone">
                    </div>
                    
                    <div class="form-group">
                        <label for="inputAddress">Address</label>
                        <input type="text" class="form-control" id="inputAddress">
                    </div>
                    <div class="form-group">
                        <label for="inputCountry">Country</label>
                        <input type="text" class="form-control" id="inputCountry">
                    </div>
                </form>
            </div>
        </h1>
        
        <h2>
            <div class="clearfix">
                <button type="next" class="Signupbtn">Update</button>
            </div>
        </h2>
    </body>
    
    