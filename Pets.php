<? php
echo '<!DOCTYPE html>';
echo '<html lang="en">';
echo '';
echo '<head>';
echo '<title> Pets </title>';
echo '<link rel="stylesheet" type="text/css" href="css/pets.css">';
echo '</head>';
echo '';
echo '<body>';
echo '<div class="topnav">';
echo '<a class="active" href="#home">Home</a>';
echo '<a href="#news">Profile</a>';
echo '<a href="#contact">Pets</a>';
echo '<a href="#about">History</a>';
echo '<form align="right" name="form1" method="post" action="log_out.php">';
echo '<label class="logoutLblPos">';
echo '<input name="submit2" type="submit" id="submit2" value="Log Out">';
echo '</label>';
echo '</form>';
echo '</div>';
echo '';
echo '<header>Pets</header>';
echo '';
echo '<div class="container row">';
echo '<h2> PetID: </h2>';
echo '<h2> Pet Name: </h2>';
echo '<div class="clearfix">';
echo '<button type="next" class="Seemorebtn">See More</button></div>';
echo '</div>';
echo '';
echo '<p> </p>';
echo '';
echo '<div class="container row">';
echo '<h2> PetID: </h2>';
echo '<h2> Pet Name: </h2>';
echo '<div class="clearfix">';
echo '<button type="next" class="Seemorebtn">See More</button></div>';
echo '</div>';
echo '';
echo '<h1>';
echo '<div class="clearfix">';
echo '<button type="next" class="Addpetbtn">Add Pet</button></div>';
echo '</h1>';
echo '';
echo '</body>';
echo '</html>';
?>
        