<?php
	error_reporting(E_ALL);
ini_set('display_errors', 1);
	session_start();
	include "globals.inc.php";
	require_once "functions.inc.php";
	connect2db();
	
	$qtl = "SELECT * FROM ".$_SESSION['iTab']." WHERE level=".$_SESSION['levelID'];
	$resulttl = mysqli_query($GLOBALS['DB'],$qtl);
	$fields_multil = mysqli_num_fields($resulttl);
	echo '<table>';
	while($rowlink=mysqli_fetch_array($resulttl)){
	$ename[0] = mysqli_field_name($resulttl,0);
		for($z = 2; $z < $fields_multil; $z++) {
			$xname = mysqli_field_name($resulttl,$z);
			if($rowlink[$z]) {
				echo '<tr><td valign="top"><strong>'.ucfirst($xname)."</strong>: </td><td> ".$rowlink[$z]."</td></tr>";
			}			
		}
	echo "<tr><td>&nbsp;</td><td><a href='#' onclick=\"askDelete('start.php?seite=bearbeiten&name=".$_SESSION['xname']."&ID=".$_SESSION['levelID']."&xid=".$_SESSION['xID']."&delete=".$rowlink[0]."&deltab=".$_SESSION['iTab']."');\"><img src='images/icon_loeschen2.gif' style='float:right;'/></a></td><td>";
	if($_SESSION ['mode']  == 1) {
		echo "<a href='start.php?seite=bearbeiten&table=".$_SESSION['iTab']."&name=".$_SESSION['xID']."&ID=".$rowlink[0]."&what=html'><img src='images/icon_bearbeiten2.gif' style='float:right;'/></a>";
	} else {
		echo "<a href='start.php?seite=bearbeiten&table=".$_SESSION['iTab']."&name=".$_SESSION['xID']."&ID=".$rowlink[0]."'><img src='images/icon_bearbeiten2.gif' style='float:right;'/></a>";
	}
	echo "</td></tr>";
	echo "<tr><td colspan=3><hr></td></tr></table>";
	}
?>
