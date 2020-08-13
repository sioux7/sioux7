<?
include("../../../sioux7conf/globals.inc.php");
$db = mysqli_connect($server, $user, $passwort, $datenbank);
$abfrage = "SELECT * from sioux7_banner where titel='".$_REQUEST['bname']."'";
$result = mysqli_query($db,$abfrage);
while ($row = mysqli_fetch_array ($result)) 
{
	$name = $row["titel"];
	$link = $row["link"];
	$klicks = $row["klicks"];
	
	$klicks = $klicks +1;
	
	$schreiben = "update sioux7_banner set klicks='$klicks' where titel='".$_REQUEST['bname']."'";
	$test = mysqli_query($db,$schreiben);
	if($test) {
		header("Location: $link");
	} else {
		header("Location: http://sioux7.uidev.de");
	}
	
}
?>