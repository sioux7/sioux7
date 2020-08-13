<?
$file_to_parse = "sioux7cache/update.sql";
if (file_exists($file_to_parse)) {
	include 'sioux7conf/globals.inc.php';
	mysql_connect($server, $user, $passwort) or die (mysql_error());
	mysql_select_db($datenbank) or die (mysql_error());
	mysql_query("SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO'");
	mysql_query("SET NAMES 'utf8'");
			if (!$fp = fopen($file_to_parse, "r")) 
			{
				echo "Read of $file_to_parse failed. Please check permissions.";
				exit;
			}
			
			$input = file_get_contents($file_to_parse);
			$cmds = explode(';', $input);

			foreach($cmds as $cmd){
				if($cmd !="") {
	    			@mysql_query($cmd);
				}
			}  	
	mysql_close();
}
?>