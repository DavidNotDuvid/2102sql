<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <title> Profile </title>
        <link rel="stylesheet" type="text/css" href="css/updatepassword.css">
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

        <header>Update Password</header>
        
        <h1>
            <div class="container">
                <form role="form">
                    <!-- Text field -->
                    <div class =" form-group ">
                        <label for=" inputOPassword ">Old Password</ label >
                        <input type ="password" class =" form-control " id=" inputOPassword ">
                    </div >
                    <div class =" form-group ">
                        <label for=" inputNPassword ">New Password</ label >
                        <input type ="password" class =" form-control " id=" inputNPassword ">
                    </div >
                    <div class =" form-group ">
                        <label for=" reenterNPassword ">Re-enter New Password</ label >
                        <input type ="password" class =" form-control " id=" reenterNPassword ">
                    </div >
                </form>
            </div>
        </h1>
        
        <h2>
            <div class="clearfix">
                <button type="next" class="Signupbtn">Update</button>
            </div>
        </h2>
    </body>
</html>