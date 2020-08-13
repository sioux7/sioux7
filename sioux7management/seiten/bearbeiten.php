<?php

$table=$_SESSION['table'];
$hiddenFields=array('parent' => 0,'dom_id' => $_SESSION['DOM'],'lang' => $_SESSION['lang']);
if($_SESSION['table'] == 'benutzer') {
if(!$_REQUEST['ID']) {$_REQUEST['ID']=0;}
$abfrage='SELECT * FROM benutzer where benutzer_id='.$_REQUEST['ID'];
$r=mysqli_query($GLOBALS['DB'],$abfrage);
$row=mysqli_fetch_assoc($r);
if($_SESSION['right'] < '990') {
	$hiddenFields=array('gesperrt' =>  $row['gesperrt'],'rights' =>  $row['rights']);
}}

if(isset($_REQUEST['ID'])) {
	$abfrage = $_REQUEST['name']."=".$_REQUEST['ID'];}
else {
	$abfrage = $_REQUEST['name']."= 0";}
include 'inc/form.inc.php';
?>
