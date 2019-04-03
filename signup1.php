<?php
session_start();
?>
<!DOCTYPE html>
<html>
    <head>
        <title> Sign Up </title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <header> Sign Up </header>
        <div class="container">
        <form role="form">
            <!-- Text field -->
            <div class =" form-group ">
                <label for=" inputEmail ">Email</ label >
                <input type ="email" class =" form-control " id=" inputEmail ">
            </div >
            <div class="form-group">
                <label for="inputName">Display Name</label>
                <input type="text" class="form-control" id="inputName">
            </div>
            <div class =" form-group ">
                <label for=" inputPassword ">Password</ label >
                <input type ="password" class =" form-control " id=" inputPassword ">
            </div >
            <div class =" form-group ">
                <label for=" reenterPassword ">Re-enter Password</ label >
                <input type ="password" class =" form-control " id=" reenterPassword ">
            </div >
            <div class="form-group">
                <label for="inputFName">First Name</label>
                <input type="text" class="form-control" id="inputFName">
            </div>
            <div class="form-group">
                <label for="inputLName">Last Name</label>
                <input type="text" class="form-control" id="inputLName">
            </div>
            <div class="form-group">
                <label for="inputPhone">Phone Number</label>
                <input type="text" class="form-control" id="inputPhone">
            </div>
            <div class="form-group">
                <label for="inputGender">Gender (M/F)</label>
                <input type="text" class="form-control" id="inputGender" placeholder="M/F">
            </div>
            <div class="form-group">
                <label for="inputAddress">Address</label>
                <input type="text" class="form-control" id="inputAddress">
            </div>
            <div class="form-group">
                <label for="inputCountry">Country</label>
                <input type="text" class="form-control" id="inputCountry">
            </div>
            <div class="form-group">
                <label for="inputBday">Birthday</label>
                <input type="text" class="form-control" id="inputBday" placeholder="DDMMYY">
            </div>
            
            <div class="clearfix">
                <button type="next" class="nextbtn">Next</button>
            </div>
        </form>
        </div>
    </body>
</html>