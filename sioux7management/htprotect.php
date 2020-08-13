<?php
if(!isset($_REQUEST['schutz'])){
	echo "<div align='center'><form action='htprotect.php' method='post'>
		  Username: <input type='text' name='username'><br>
		  Passwort: <input type='password' name='password'><br>
		  <input type='submit' name='schutz' value='Schutz'>
		  </form></div>";
}
else {

$authname = "Passwortgeschützter Bereich";
$username = $_POST['username'];
$password = $_POST['password'];


$p_path = $_SERVER['SCRIPT_FILENAME'];
$path = eregi_replace("/htprotect.php", "", $p_path);


###
#htaccess schreiben

$htaccess = fopen(".htaccess", "w");
fputs($htaccess,
             "AuthType Basic\n".
             "AuthName \"$authname\"\n".
             "AuthUserFile $path/.htpasswd\n".
             "require valid-user\n"
		);
fclose($htaccess);


###
#htpasswd schreiben

$htpasswd = fopen(".htpasswd", "w");
$password = crypt($password);
fputs ($htpasswd, "$username:$password");
fclose ($htpasswd);


###
#Meldungen ausgeben

if (file_exists(".htaccess")) {
    echo "<br><br><br><div align=center><font face='verdana' size=2><b>Die .htaccess-Datei wurde erfolgreich erzeugt...</b></font>";
} else {
    echo "<br><br><br><div align=center><font face='verdana' size=2><b>Die .htaccess-Datei konnte nicht erstellt werden<br>Bitte überprüfen Sie die Rechte für das Verzeichnis und/oder für dieses Script!!!</b></font>";
}

if (file_exists(".htpasswd")) {
    echo "<br><br><font face='verdana' size=2><b>Die Passwort-Datei wurde erfolgreich erzeugt...</b></font></div>";
} else {
    echo "<br><br><font face='verdana' size=2><b>Die Passwort-Datei konnte nicht erstellt werden<br>Bitte überprüfen Sie die Rechte für das Verzeichnis und/oder für dieses Script!!!</b></font></div>";
}}
?>
