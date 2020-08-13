<?php
if(isset($_REQUEST['delall'])){
	$sql_del = "DELETE FROM sioux7_sysprotokoll";
	$result = mysqli_query($GLOBALS['DB'],$sql_del);
}
$sql_query = "SELECT * FROM sioux7_sysprotokoll ORDER BY sys_id DESC LIMIT 0,50";
$result = mysqli_query($GLOBALS['DB'],$sql_query);
print "<table border=0  width='95%'>";
print "<tr>
		<td colspan=3 align='right'><a href='start.php?seite=grundlog&delall=ja'>&raquo; Alles l&ouml;schen</a></td>
	  </tr>";
print "<tr>
		<td>Admin: </td>
		<td>Datum: </td>
		<td>Seite:</td>
	  </tr>";		   
	
while ($row = mysqli_fetch_array($result)) {
$sql_query2 = "SELECT * FROM sioux7_admin WHERE admin_id=".$row['user_id'];
$result2 = mysqli_query($GLOBALS['DB'],$sql_query2);
$row2 = mysqli_fetch_array($result2);
print "<tr>
		<td>".$row2['adminname']."</td>
		<td>".$row['datum']."</td>
		<td>".$row['syslog']."</td>
	   </tr>";
	}
print "</table>";
?>
