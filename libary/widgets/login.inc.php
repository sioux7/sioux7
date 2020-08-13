<?php
if($_SESSION['member_id'] != "") {
	echo 'Eingeloggt als <b> '.$_SESSION['username'].' </b><br>';
	$menu=MyDbObject::kat("sioux7_kategorie", 0,'user');
	echo '<div class="membermenu">'.$menu.'</div>';
	echo'<div><a href="/?set=logout"> &raquo; Logout</a></div>';
} else {
	echo ' <form method="POST" action="/">
		   <table>
		   <tr>
		   <td>Login:</td><td><input type="text" name="benutzer" value="" size=10></td>
		   </tr>
		   <tr>
		   <td>Passwort:</td><td><input type="password" name="pw" value="" size=10></td>
		   </tr>
		   <tr>
		   <td colspan=2><input class="button" type="submit" alt="login" value="login" name="login"></td>
		   </tr>
		   </table>
		   </form>';
}
?>