<?php
$datum=date("d.m.Y");
$url=explode('/',$_GET['kategorie']);
$anz=count($url)-1;
$seite=$url[$anz];
$sql_query_stat = "SELECT * FROM sioux7_statistik where seite='".$seite."'";
$result_stat = mysqli_query($GLOBALS['DB'],$sql_query_stat) or die ("fehler:".$sql_query_stat);
$num_stat = mysqli_num_rows($result_stat);
if($num_stat == 1){
	$row_stat = mysqli_fetch_array($result_stat);
	$stat_id = $row_stat['stat_id'];
	$count = $row_stat['counter'];
	$count = $count + 1;
	$sql_update = "UPDATE sioux7_statistik SET counter=$count,create_date='$datum'"
	." WHERE stat_id = '$stat_id'";
	$result = mysqli_query($GLOBALS['DB'],$sql_update) or die ("Fehler:".$sql_update);
} else {
	$sql_insert = "INSERT INTO sioux7_statistik (seite,create_date,counter)"
	." VALUES ('$seite','$datum',1)";
	$result = mysqli_query($GLOBALS['DB'],$sql_insert) or die ("Fehler:".$sql_insert);
	$stat_id = mysqli_insert_id();
}
?>