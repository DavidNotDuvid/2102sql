<? php
echo '<!DOCTYPE html>';
echo '<html lang="en">';
echo '<head>';
echo '<title>Highest Bidder</title>';
echo '<link rel="stylesheet" type="text/css" href="/css/login-ed.css">';
echo '</head>';
echo '';
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
echo '<!--INPUT: profile pictures, names, and petID-->';
echo '<body>';
echo '<link rel="stylesheet" type="text/css" href="/css/caretaker-see-highest-bidder.css">';
echo '<center class="highbid"><img src= "/images/happy-dog-owner.jpg" width="200"><br>';
echo '<button class="button1"><p>Clickable Highest Bidder's Name</p></button><br> <!--requires css-->';
echo '<p>petID needs you!</p> <br>';
echo '<button type="button">Accept</button>';
echo '<button type="button">Decline</button></center>';
echo '</body>';
echo '</html>';
?>