<?php
$query1="SELECT * FROM sioux7_planung WHERE pl_id <> 0 ORDER BY isFertig DESC";
$res1=mysqli_query($GLOBALS['DB'],$query1);
echo '<table><tbody>';
echo '<tr bgcolor="lightgrey"><td>Plugin</td><td>Beschreibung</td><td>fertig</td></tr>';
$k=0;
while($row1=mysqli_fetch_assoc($res1)) {
	if($k%2 == 1){$bg='bgcolor="#ccc"';} else {$bg='';}
	echo '<tr '.$bg.'><td>'.$row1['titel'].'</td><td>'.$row1['descr'].'</td><td>';
	if($row1['isfertig'] == 1) {
		echo '<img src="media/images/workicons/icon_ready.gif">';
	} else {
		echo '<img src="media/images/workicons/icon_ask.gif">';
	}
	echo '</td></tr>';
$k++;
}
echo '</tbody></table>';
?>