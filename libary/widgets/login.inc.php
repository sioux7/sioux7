<?php
if($_SESSION['user_id'] != "") {
	echo 'Eingeloggt als <b> '.$_SESSION['username'].' </b><br>';
	echo'<a href="http://dev.sioux7.com/" target="_NEW">&raquo; Zur DevZone</a><br>';
	echo'<a href="sioux7management/home.php" target="_NEW">&raquo; Zur Verwaltung</a><br>';
	echo'<a href="home.html?set=logout"> &raquo; Logout</a>';
} else {
	echo ' <form method="POST" action="home.html">
		   Login: <input type="text" name="benutzer" value="" size=15><br>
		   Passwort: <input type="password" name="pw" value="" size=15><br>
		   <input class="button" type="submit" alt="login" value="login" name="login">
		   </form>';
}
?>