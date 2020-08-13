<?php
if(isset($_REQUEST['del'])){
	$sql_del = "DELETE FROM sioux7_statistik WHERE stat_id=".$_GET['del'];
	$result = mysqli_query($GLOBALS['DB'],$sql_del);
}
if(isset($_REQUEST['res'])){
	$sql_query = "UPDATE sioux7_statistik SET counter=1";
	$result = mysqli_query($GLOBALS['DB'],$sql_query);
}
if(isset($_REQUEST['delall'])){
	$sql_del = "DELETE FROM sioux7_statistik";
	$result = mysqli_query($GLOBALS['DB'],$sql_del);
}
	
$sql_query = "SELECT * FROM sioux7_statistik ORDER BY counter DESC";
$result = mysqli_query($GLOBALS['DB'],$sql_query);
$num = mysqli_num_rows($result);

if ($num == 0) echo "Die Datenbank enth&auml;lt keine Daten!";
else {
	$sql_query2 = "SELECT SUM(counter) as summe FROM sioux7_statistik WHERE seite <> 'home'";
	$result2 = mysqli_query($GLOBALS['DB'],$sql_query2);
	$row2 = mysqli_fetch_array($result2);
	$pixelmax=300;
	print "<table border=0  width='95%'>";
	print "<tr>
			<td colspan=2><a href='start.php?seite=grundstat&res=ja'>&raquo; Reset</a></td>
			<td colspan=2><a href='start.php?seite=grundstat&delall=ja'>&raquo; Alles l&ouml;schen</a></td>
		  </tr>";
	print "<tr bgcolor='#7087D3'>
			<td>Datum: </td>
			<td>Seite:</td>
			<td>Aufrufe</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		  </tr>";		   
		
	while ($row = mysqli_fetch_array($result)) {
	if($row['seite'] !='home'){	
	$pixel=round($row['counter']/$row2['summe']*$pixelmax);
	$anteil=number_format($row['counter']/$row2['summe']*100,2);
	print "<tr>
			<td>".$row['create_date']."</td>
			<td>".$row['seite']."</td>
			<td>".$row['counter']."</td>
			<td align='left'><img src='images/pixel.gif' style='background-color:#FFCC33; width: ".$pixel."px; height: 10px' alt='Angabe in Prozent'> ".$anteil." %</td>
			<td><a href='start.php?seite=grundstat&del=".$row['stat_id']."'><img src='images/icon_loeschen2.gif' title='loeschen'></a></td>
		   </tr>";
	}}
	print "</table>";
}
?>
