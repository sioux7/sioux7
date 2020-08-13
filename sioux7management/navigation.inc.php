<div id="accordion">
<?php
echo $_SESSION['reiter']; 
$tables=array();
$mode=array();
$sortfield=array();
$sortmode=array();
$sql_query = "SELECT * FROM sioux7_tables WHERE table_id <> 0 and rights <='".$_SESSION['right']."' AND reiter='".$_SESSION['reiter']."' ORDER BY rang";
$result = mysqli_query($GLOBALS['DB'],$sql_query);
while ($row = mysqli_fetch_array($result)) {
	if($row['titel_de'] !="neu") {
		$tables[] = $row['titel'];
		$mode[] = $row['mode'];
		$sortfield[] = $row['sortfield'];
		$sortmode[] = $row['sort_order'];
	}
}
$sql_queryu = "SELECT * FROM sioux7_grouprights WHERE gradmin=".$_SESSION['user_id'];
$resultu = mysqli_query($GLOBALS['DB'],$sql_queryu);
$rowu = mysqli_fetch_array($resultu);
$grouptables=explode(',',$rowu['tables']);
foreach($grouptables AS $zusatz){
	if($zusatz){
		$sql_query2 = "SELECT * FROM tables WHERE titel='".$zusatz."' AND reiter='".$_SESSION['reiter']."' ORDER BY rang";
		$result2 = mysqli_query($GLOBALS['DB'],$sql_query2);
		while ($row2 = mysql_fetch_array($result2)) {
			$tables[] = $row2['titel'];
			$mode[] = $row2['mode'];
			$sortfield[] = $row2['sortfield'];
			$sortmode[] = $row2['sort_order'];
		}
	}
}


if($_SESSION['right'] == '999') {
	echo "<a";
	if(strstr($_REQUEST['seite'], "grund")) echo ' class="selected"';
	echo " href='#'><span class='ui-icon ui-icon-triangle-1-e'></span>Grundeinstellungen</a>";
	echo  "<div>";
	echo "<a href='start.php?seite=grundfirma'>Impressum</a>";
	echo "<a href='start.php?seite=grundxml'>Sitemap XML</a>";
	echo "<a href='start.php?seite=grundupdate'>Update</a>";
	echo "<a href='start.php?seite=grundstat'>Statistik</a>";
	//echo "<a href='editor/editor.php' target='fenster' onClick=\"popup('','fenster',750,750)\">Newsletter bearbeiten</a>";	
	//echo "<a href='start.php?seite=grundsendnow'>Newsletter senden</a>";
	echo "<a href='start.php?seite=grundlog'>LOG</a>";
	echo "</div>";
}
for($tmp=0; $tmp<sizeof($tables); $tmp++) 
{
	$tab=str_replace('sioux7_','',$tables[$tmp]);
	echo "<a";
	if(strstr($_SESSION['table'], $tables[$tmp]) || strstr($_REQUEST['seite'], $tables[$tmp])) echo ' class="selected"';
	echo " href='#'><span class='ui-icon ui-icon-triangle-1-e'></span>".ucfirst(urlencode($tab))."</a>";
	echo  "<div>";
	if($tables[$tmp] =="sioux7_kategorie") {
		echo "<a href='start.php?seite=kategorien'>Kategorien bearbeiten</a>";
	} else {
		echo "<a href='start.php?seite=uebersicht&table=".$tables[$tmp]."&sortfield=".$sortfield[$tmp]."&sortmode=".$sortmode[$tmp]."'>".ucfirst(urlencode($tab))." bearbeiten</a>";
	}
	$sql_query = "SELECT * FROM ".$tables[$tmp];
	$result = mysqli_query($GLOBALS['DB'],$sql_query);
	$ID = mysqli_field_name ($result,0);
	//$ID = mysqli_field_name ($result,0);
	if($tables[$tmp] != "sioux7_admin" || $_SESSION['right'] > 770 ) {
	if($tables[$tmp] == "sioux7_kategorie" || $mode[$tmp] == 1 ) {
		echo "<a href='start.php?seite=bearbeiten&table=".$tables[$tmp]."&name=".$ID."&what=html'>".ucfirst(urlencode($ab))."Kategorie anlegen</a>";
	} else {
		echo "<a href='start.php?seite=bearbeiten&table=".$tables[$tmp]."&name=".$ID."'>".ucfirst(urlencode($tab))."kategorie anlegen</a>";
	}}
	echo "</div>";
}
?>
</div>