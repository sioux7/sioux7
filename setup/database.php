<html>
<head>
	<title>Urbans Installer Setup Routine: Database</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
<?php 
	ini_set('display_errors', 1);
if(!isset($op)) $op="settings";
//chmod('../sioux7conf/globals.inc.php',0777);
$i=0;
$basisdatei = fopen('../sioux7conf/globals.inc.php','r');

while($i<6)
{
$line = fgets($basisdatei,1000);
if(eregi('server',$line)) 		{ $zserver = $line; $zeile['server'] = $i; }
if(eregi('user',$line)) 		{ $zuser = $line; $zeile['user'] = $i; }
if(eregi('passwort',$line)) 		{ $zpasswort = $line; $zeile['passwort'] = $i; }
if(eregi('datenbank',$line)) 		{ $zdatenbank = $line; $zeile['datenbank'] = $i; }
$i++;
}

if($op=='settings')
{
print(" <form method='POST' action='database.php?op=aendern'>");
print("<table>");
print("<tr><td colspan=2><b>Urbans Installer Step 2: Datenbankconnection<br></b> ");
print("Dieses Programm installiert Ihnen die gew&uuml;nschte Struktur f&uuml;r Ihre Datenbank automatisch, d.h. Sie erhalten die Grundstruktur. Bitte geben Sie die Daten, welche Sie f&uuml;r die Datenbank erhalten haben ein, bzw. legen Sie eine Datenbank an.</td></tr>");
print("<tr><td colspan=2><b>Bitte beachten:<br></b> ");
print("Die Datei include/globals.inc.php muss schreibbar sein. Setzen Sie diese auf chmod 777. Nach dem Setup bitte auf chmod 644 setzen, damit diese nicht mehr &uuml;berschrieben wird.</td></tr>");

$start = strpos($zserver,'"')+1;
$ende = strrpos($zserver,'"');
$lng  = $ende - $start;
$aserver = substr($zserver,$start,$lng);
print("<tr><td bgcolor='#d3d3d3'><b>Server :</b></td><td>");
print(" <input type='text' name='nserver' size='20' value='".$aserver."'></td></tr>");


$start = strpos($zuser,'"')+1;
$ende = strrpos($zuser,'"');
$lng  = $ende - $start;
$auser = substr($zuser,$start,$lng);
print("<tr><td bgcolor='#d3d3d3'><b>Benutzer :</b></td><td>");
print(" <input type='text' name='nuser' size='20' value='".$auser."'></td></tr>");

$start = strpos($zpasswort,'"')+1;
$ende = strrpos($zpasswort,'"');
$lng  = $ende - $start;
$apasswort = substr($zpasswort,$start,$lng);
print("<tr><td bgcolor='#d3d3d3'><b>Passwort :</b></td><td>");
print(" <input type='password' name='npasswort' size='20' value='".$apasswort."'></td></tr>");

$start = strpos($zdatenbank,'"')+1;
$ende = strrpos($zdatenbank,'"');
$lng  = $ende - $start;
$adatenbank = substr($zdatenbank,$start,$lng);
print("<tr><td bgcolor='#d3d3d3'><b>Datenbank :</b></td><td>");
print(" <input type='text' name='ndatenbank' size='20' value='".$adatenbank."'></td></tr>");

print("<tr><td bgcolor='#d3d3d3' colspan=2 align='right'><input type='submit' value='&auml;ndern' name='speichern'></td></tr>");
print("</table></form></center>");
}


if($_REQUEST['op']=='aendern')
{
 $basis2 = file('../include/globals.inc.php');
 // Zeilenposition
 $server = $zeile['server'];
 $user = $zeile['user'];
 $passwort = $zeile['passwort'];
 $datenbank = $zeile['datenbank'];
  
  
 // Inhalt
 $basis2[$server] = '$server="'.$nserver.'";'."\n";
 $basis2[$user] = '$user="'.$nuser.'";'."\n";
 $basis2[$passwort] = '$passwort="'.$npasswort.'";'."\n";
 $basis2[$datenbank] = '$datenbank="'.$ndatenbank.'";'."\n";
  
 
 // schreiben
 $basishandler = fopen('../sioux7conf/globals.inc.php',"w");
 fputs($basishandler, implode("", $basis2));
 
 
print("<form method='POST' action='database.php?op=create'>");
print("<table>");
print("<tr><td colspan=2><b>Urbans Installer Step 3: Admin Login<br></b> ");
print("Es werden nun die wichtigsten Tabellen installiert. Bitte geben Sie Ihr Login und Passwort ein. Dies ist f&uuml;r die Verwaltung notwendig.</td></tr>");
print("<tr><td bgcolor='#d3d3d3'><b>Name:</b></td><td>");
print(" <input type='text' name='adminname' size='20'></td></tr>");
print("<tr><td bgcolor='#d3d3d3'><b>Login:</b></td><td>");
print(" <input type='text' name='login' size='20'></td></tr>");
print("<tr><td bgcolor='#d3d3d3'><b>Passwort:</b></td><td>");
print(" <input type='password' name='mypasswort' size='20'></td></tr>");
print("<tr><td bgcolor='#d3d3d3'><b>Firma:</b></td><td>");
print(" <input type='text' name='firma' size='20'></td></tr>");
print("<tr><td bgcolor='#d3d3d3'><b>Telefon:</b></td><td>");
print(" <input type='text' name='telefon' size='20'></td></tr>");
print("<tr><td bgcolor='#d3d3d3'><b>Email:</b></td><td>");
print(" <input type='text' name='email' size='20'></td></tr>");
print("<tr><td align='right' colspan=2 bgcolor='#d3d3d3'><input type='submit' value='&auml;ndern' name='speichern'></td></tr>");
print("</table></form></center>");

}
fclose($basisdatei);

if($_REQUEST['op']=="create"){
	require('../sioux7conf/globals.inc.php');	// Datenbank-Settings
	@mysqli_connect($server, $user, $passwort, $datenbank);
	mysqli_set_charset($db_verbindung, "utf8");
	// first ADMIN
	$sql_create1 = "CREATE TABLE IF NOT EXISTS `sioux7_admin` (
	  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	  `adminname` varchar(20) NOT NULL,
	  `login` varchar(30) NOT NULL,
	  `passwort` varchar(50) NOT NULL,
	  `firma` varchar(50) DEFAULT NULL,
	  `telefon` varchar(20) DEFAULT NULL,
	  `email` varchar(50) DEFAULT NULL,
	  `rights` enum('999','777','555','333') NOT NULL,
	  PRIMARY KEY (`admin_id`)
	) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25181 ;";
	
	@mysqli_query($GLOBALS['DB'],$sql_create1));
	
	// set the Sadmin
	$sql_insert1="INSERT INTO `sioux7_admin` (`admin_id`, `adminname`, `login`, `passwort`, `firma`, `telefon`, `email`, `rights`) VALUES (0, 'neu', 'neu', '', '', '', '', '333')";
	
	@mysqli_query($GLOBALS['DB'],$sql_insert1));
	$mypasswort =md5($mypasswort);
	$sql_insert2="INSERT INTO `sioux7_admin` (`admin_id`, `adminname`, `login`, `passwort`, `firma`, `telefon`, `email`, `rights`) VALUES (25180, '$adminname', '$login', '$mypasswort', '$firma', '$telefon', '$email', '999')";
	
	@mysqli_query($GLOBALS['DB'],$sql_insert2));
	$sql_insert1)
	print ("<table><tr><td>Urbans Installer - Die Datenbank wurde erfolgreich angelegt. Es wird nun die Grundstruktur angelegt.<br><a href='dump/install.php?globals=done&datei=cms'>Final Step</a></td></tr><table>");
}
//chmod('../sioux7conf/globals.inc.php',0644);

function eregi($need,$search) {
	if (preg_match("/".$need."/i", $search)) {
	   return TRUE;
	} else {
	   return FALSE;
	}
}
?>
</body>
</html>