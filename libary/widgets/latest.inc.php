<?php
$sql_query1 = "SELECT * FROM sioux7_sysprotokoll ORDER BY sys_id DESC LIMIT 0,3";
$result1 = mysqli_query($GLOBALS['DB'],$sql_query1);
print "<b>Aktuelles</b><br><ul>";
while($row1 = mysqli_fetch_array($result1)){
preg_match('/[0-9]+/is', $row1['syslog'],$id);
preg_match('/([a-zA-Z0-9_\s]+)\s/is', $row1['syslog'],$tab);
$search=explode(' ',$tab[1]);
searchablefields($search[2],$id[0]);
}
print "</ul>";
?>
