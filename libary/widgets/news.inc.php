<?php
$sql_query = "SELECT * FROM sioux7_presse  WHERE dom_id=".$_SESSION['DOM']." AND lang='".$_SESSION['LANG']."' AND p_id <> 0 ORDER BY datum DESC LIMIT 0,3";
$result = @mysqli_query($GLOBALS['DB'],$sql_query);
print "<ul>";
while ($row = mysqli_fetch_array($result)) {
	print "<li><small>".datum($row['datum'])."<br><a href='presse.html?p_id=".$row['p_id']."'> &raquo; ".$row['titel']."</a></small><hr></li>";
}
print "<li><a href='presse.html'><small>&raquo; alle News</small></a></li>";
print "</ul>";
?>
