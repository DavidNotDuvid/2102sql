<? php
echo '<!DOCTYPE html>';
echo '<html lang="en">';
echo '';
echo '<head>';
echo '<title> Services </title>';
echo '<link rel="stylesheet" type="text/css" href="css/petinfo.css">';
echo '</head>';
echo '';
echo '<body>';
echo '<div class="topnav">';
echo '<a class="active" href="#home">Home</a>';
echo '<a href="#news">Profile</a>';
echo '<a href="#contact">Services</a>';
echo '<a href="#about">History</a>';
echo '<form align="right" name="form1" method="post" action="log_out.php">';
echo '<label class="logoutLblPos">';
echo '<input name="submit2" type="submit" id="submit2" value="Log Out">';
echo '</label>';
echo '</form>';
echo '</div>';
echo '';
echo '<header>Services</header>';
echo '';
echo '<div class="container row">';
echo '<h2> Service Type: <!-- input php--> </h2>';
echo '<h2> Period: <!-- input php--> </h2>';
echo '<h2> Pet Type Accepted: <!-- input php--> </h2>';
echo '<div class="clearfix">';
echo '<button type="next" class="Editbtn">Edit</button></div>';
echo '</div>';
echo '';
echo '<p> </p>';
echo '';
echo '<div class="container row">';
echo '<h2> Reviews: <!-- input php--> </h2>';
echo '</div>';
echo '';
echo '</body>';
echo '</html>';
?>