<?php
$url=explode('/',$_GET['kategorie']);
$anz=count($url)-1;
if(!$_GET['kategorie']) {$_GET['kategorie'] = 'home';}
$intCurrentKat = parsePageName2Id($_GET['kategorie']);
$sql_query = "SELECT * FROM sioux7_kategorie where kategorie_id=".$intCurrentKat;
$result = mysqli_query($GLOBALS['DB'],$sql_query);
$row = mysqli_fetch_array($result);
echo '<title>'.DOM.' . '.$url[$anz].'</title>'.chr(10);
echo '<meta name="description" content="'.strip_tags(trim($row['description'])).'" />'.chr(10);
echo '<meta NAME="keywords" LANG="'.$_SESSION['LANG'].'" CONTENT="'.strip_tags(trim($row['keywords'])).'">'.chr(10);
if($_GET['kategorie']) {
	echo "<link rel=\"canonical\" href=\"".BASE."/".$_GET['kategorie'].".html\" />".chr(10);
} else {
	echo "<link rel=\"canonical\" href=\"".BASE."\" />".chr(10);
}

?>
