<? php
echo '<!DOCTYPE html>';
echo '<html>';
echo '<head>';
echo '<title> Sign Up </title>';
echo '<link rel="stylesheet" type="text/css" href="css/style.css">';
echo '</head>';
echo '<body>';
echo '<header> Sign Up </header>';
echo '<div class="container">';
echo '<form role="form">';
echo '<!-- Text field -->';
echo '<div class =" form-group ">';
echo '<label for=" inputEmail ">Email</ label >';
echo '<input type ="email" class =" form-control " id=" inputEmail ">';
echo '</div >';
echo '<div class="form-group">';
echo '<label for="inputName">Display Name</label>';
echo '<input type="text" class="form-control" id="inputName">';
echo '</div>';
echo '<div class =" form-group ">';
echo '<label for=" inputPassword ">Password</ label >';
echo '<input type ="password" class =" form-control " id=" inputPassword ">';
echo '</div >';
echo '<div class =" form-group ">';
echo '<label for=" reenterPassword ">Re-enter Password</ label >';
echo '<input type ="password" class =" form-control " id=" reenterPassword ">';
echo '</div >';
echo '<div class="form-group">';
echo '<label for="inputFName">First Name</label>';
echo '<input type="text" class="form-control" id="inputFName">';
echo '</div>';
echo '<div class="form-group">';
echo '<label for="inputLName">Last Name</label>';
echo '<input type="text" class="form-control" id="inputLName">';
echo '</div>';
echo '<div class="form-group">';
echo '<label for="inputPhone">Phone Number</label>';
echo '<input type="text" class="form-control" id="inputPhone">';
echo '</div>';
echo '<div class="form-group">';
echo '<label for="inputGender">Gender (M/F)</label>';
echo '<input type="text" class="form-control" id="inputGender" placeholder="M/F">';
echo '</div>';
echo '<div class="form-group">';
echo '<label for="inputAddress">Address</label>';
echo '<input type="text" class="form-control" id="inputAddress">';
echo '</div>';
echo '<div class="form-group">';
echo '<label for="inputCountry">Country</label>';
echo '<input type="text" class="form-control" id="inputCountry">';
echo '</div>';
echo '<div class="form-group">';
echo '<label for="inputBday">Birthday</label>';
echo '<input type="text" class="form-control" id="inputBday" placeholder="DDMMYY">';
echo '</div>';
echo '';
echo '<div class="clearfix">';
echo '<button type="next" class="nextbtn">Next</button>';
echo '</div>';
echo '</form>';
echo '</div>';
echo '</body>';
echo '</html>';
?>