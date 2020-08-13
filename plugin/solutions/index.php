<?php
$query1="SELECT * FROM sioux7_solutions WHERE sol_id <> 0 ORDER BY sol_id";
$res1=mysqli_query($GLOBALS['DB'],$query1);
echo '<table><tbody>';
echo '<tr bgcolor="lightgrey"><td width=150>Solution</td><td width=600>Beschreibung</td><td>Lösung</td></tr>';
while($row1=mysqli_fetch_assoc($res1)) {
	echo '<tr><td valign="top">'.$row1['titel'].'</td><td>'.$row1['descr'].'</td><td valign="top">';
	if($row1['isfertig'] == 1) {
		echo '<img src="media/images/workicons/icon_ready.gif">';
	} else {
		echo '<img src="media/images/workicons/icon_ask.gif">';
	}
	echo '</td></tr>';
	echo '<tr><td style="border-bottom:1px solid #000;" colspan=4>&nbsp;</td></tr>';
}
echo '</tbody></table>';
?>