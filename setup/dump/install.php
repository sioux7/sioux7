<html>
<head>
	<title>Urbans Installer Setup Routine: Final</title>
	<link rel="stylesheet" href="../style.css">
</head>
<body>
<?
include "../../include/reg_globals.inc.php";
include '../../include/globals.inc.php';
mysql_connect($server, $user, $passwort) or die
	("<h3>Vor der Installation der Datenbanken muss MySQL betriebsbereit sein und Sie müssen Zugriff auf die Datenbank haben.</h3>");
mysql_query("SET NAMES 'utf8'");
	$path = "./sqlfiles/";
	mysql_select_db($datenbank);
	mysql_query("SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO'");
	$file_to_parse = $path.$datei.".sql";
		if (!file_exists($file_to_parse))
		{
			echo "<h3>Konnte Datei '$file_to_parse' nicht finden. Prüfen Sie bitte, ob die Dateien im richtigen Verzeichnis liegen.<h3>";
			exit;
		}
		if (!$fp = fopen($file_to_parse, "r")) 
		{
			echo "<h3>Konnte $file_to_parse nicht lesen. Bitte rechte pr&uuml;fen.</h3>";
			exit;
		}
		$contents = fread($fp, filesize ($file_to_parse));
		fclose($fp);
		//parse out drop, create, and insert statments
		preg_match_all("/(DROP TABLE.*?);/s", $contents, $drop_statements);
		preg_match_all("/(CREA.*?);/s", $contents, $create_statements);
		preg_match_all("/(INS.*?);[\n\r]/s", $contents, $insert_statements);
		
		foreach($drop_statements[1] as $query)
		{
			@mysql_query($query) or die($query);
		} 
		
		foreach($create_statements[1] as $query)
		{
			@mysql_query($query) or die($query);
		} 

		foreach($insert_statements[1] as $query)
		{
			@mysql_query($query) or die($query);
		} 
		
		print ("<center><table><tr><td>Urbans Installer - Die Grundstruktur wurde erfolgreich angelegt. Entfernen Sie bitte das Verzeichnis /setup.<br>Starten Sie nun die Verwaltung.<br><a href='../../verwaltung/index.php'>Die Verwaltung</a></td></tr></table></center>");

$datei=$datei.".sql";
unlink("sqlfiles/".$datei);	
mysql_close();
?>
</body>
</html>
