<?php
$arrInfo = mysqli_fetch_assoc(mysqli_query($GLOBALS['DB'],"SELECT * FROM sioux7_kategorie WHERE property='presse' AND lang='".$_SESSION['LANG']."' LIMIT 1"));
$sql_query = "SELECT * FROM sioux7_presse  WHERE dom_id=".$_SESSION['DOM']." AND lang='".$_SESSION['LANG']."' AND p_id <> 0 ORDER BY datum DESC LIMIT 0,3";
$result = @mysqli_query($GLOBALS['DB'],$sql_query);
if(mysqli_num_rows($result)) {
	print "<div class='box'><ul>";
	while ($row = mysqli_fetch_array($result)) {
		print "<li><small>".datum($row['datum'])."<br><a href='".strtolower($arrInfo['titel']).".html?p_id=".$row['p_id']."'> &raquo; ".$row['titel']."</a></small><hr></li>";
	}
	print "</ul></div>";
}
?>
