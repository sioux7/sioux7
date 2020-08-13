<?php
echo '<h1>Herzlich Willkommen '.strtoupper($_SESSION['username']).'</h1>';
$sql_dom = mysqli_query($GLOBALS['DB'],"SELECT * FROM sioux7_domain WHERE domain_id=".$_SESSION['DOM']);
$row_dom = mysqli_fetch_array($sql_dom);
echo '<p>'.$row_dom['domdescr'].'</p>';
?>
