<?php
$strPageName = str_replace("/", "|", $_SERVER["REQUEST_URI"]);
$strGroupNameTmp = getBreadcrumb(parsePageName2Id($_GET['kategorie']));
$strGroupName = implode("|", array_reverse(explode("|", $strGroupNameTmp)));
if($strGroupName[0] == "|") $strGroupName = substr($strGroupName, 1);
if($strGroupName !=""){
	$text=$_SESSION['LANG']=="de"?"Sie sind hier: ":"You are here: ";
	echo '<small>'.$text.$strGroupName.'</small>';
}
?>