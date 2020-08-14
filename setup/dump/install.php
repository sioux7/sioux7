<html>
<head>
	<title>Urbans Installer Setup Routine: Final</title>
	<link rel="stylesheet" href="../style.css">
</head>
<body>
<?
include '../../sioux7conf/globals.inc.php';
@mysqli_connect($server, $user, $passwort, $datenbank); or die
	("<h3>Vor der Installation der Datenbanken muss MySQL betriebsbereit sein und Sie müssen Zugriff auf die Datenbank haben.</h3>");
	@mysqli_set_charset($db_verbindung, "utf8");
	$path = "./sqlfiles/";
	$file_to_parse = "projekt_sioux7.sql";
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
			@mysqli_query($GLOBALS['DB'],$query);
		} 
		
		foreach($create_statements[1] as $query)
		{
			@mysqli_query($GLOBALS['DB'],$query);
		} 

		foreach($insert_statements[1] as $query)
		{
			@mysqli_query($GLOBALS['DB'],$query);
		} 
		
		print ("<center><table><tr><td>Urbans Installer - Die Grundstruktur wurde erfolgreich angelegt. Entfernen Sie bitte das Verzeichnis /setup.<br>Starten Sie nun die Verwaltung.<br><a href='../../verwaltung/index.php'>Die Verwaltung</a></td></tr></table></center>");

unlink("sqlfiles/projekt_sioux7.sql;	
?>
</body>
</html>
