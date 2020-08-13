<script type="text/javascript">
<!--
function askDelete(url){
	var status;
	status=confirm('Wollen Sie diese Kategorie wirklich loeschen?');
	if(status==true) document.location.href=url;
	else return false;
}
// -->
</script>
<?php
$feld="kategorie_id";
$table="sioux7_kategorie";
if ((int)$_GET['delete']>0) {
	$del=delkat($table,$_GET['delete']);
	echo $del;
}
echo '<h1>Kategorien bearbeiten</h1>';

$menu="top";
echo "Topmenu: <ul style='list-style: none;'>".mykat($table,0)."</ul>"; 

$menu="menu";
echo "Menu: <ul style='list-style: none;'>".mykat($table,0)."</ul>"; 

$menu="footer";
echo "Footermenu: <ul style='list-style: none;'>".mykat($table,0)."</ul>"; 

$menu="user";
echo "Memberbereich: <ul style='list-style: none;'>".mykat($table,0)."</ul>"; 

function mykat($table, $intStart, $pos=0, $strEinrueckung="&nbsp;"){
	global $wert, $feld, $menu;
	$strSQL = "SELECT * FROM ".$table." WHERE kategorie_id <> 0 AND parent=".$intStart." AND menu='".$menu."' and lang ='".$_SESSION['lang']."' and dom_id =".$_SESSION['DOM']." ORDER BY rang";
	$dbQuery = mysqli_query($GLOBALS['DB'],$strSQL) or die(mysql_error());
	$i=0;
	while($arrKat = mysqli_fetch_assoc($dbQuery)){
		if($i%2 ==0 ) {$bg='#E6EFFF';} else {$bg='';}
		if($arrKat['ismodul'] != 1){
			$_SESSION ['mode'] = 1;
			$strReturn.="<li style='background:".$bg.";'><a href='start.php?seite=bearbeiten&table=sioux7_kategorie&name=kategorie_id&ID=".$arrKat[$feld]."&what=html'";
		} else {
			$_SESSION ['mode'] = '';
			$strReturn.="<li style='background:".$bg.";'><a href='start.php?seite=bearbeiten&table=sioux7_kategorie&name=kategorie_id&ID=".$arrKat[$feld]."'";
		}
		$strReturn.=">".str_repeat($strEinrueckung, $pos)."&raquo;&nbsp;".$arrKat['titel']."&nbsp;";
		if($arrKat['aktiv'] == 1) { 
		$strReturn.="<img src='images/icon_ready.gif' title='aktiv'/>";
		} else { 
		$strReturn.="<img src='images/icon_fehler.gif' title='passiv'/>";
		 }
		$strReturn.="</a>";
		if($arrKat['property'] && $arrKat['property'] != 'normal') { 
			 $strReturn.= "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$arrKat['property'];
		 }
		$strReturn .="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=\"askDelete('start.php?seite=kategorien&table=sioux7_kategorie&delete=".$arrKat[$feld]."')\"><img src='images/icon_loeschen2.gif' title='Seite loeschen' style='float:right;'></a>";
		$strReturn .="</li>\n";
		$strSQL2 = "SELECT * FROM ".$table." WHERE parent=".$arrKat[$feld]." AND menu='".$menu."'";
		if($arrKat[$feld] != 0) {
			$unter=mysqli_query($GLOBALS['DB'],$strSQL2);
			if(mysqli_num_rows($unter)>0) $strReturn.= mykat($table,$arrKat[$feld],$pos+2,$strEinrueckung);
		}
		$i++;
	}
	return $strReturn;
}
function delkat($table, $delete){
	global $feld;
	$strSQL = "SELECT * FROM ".$table." WHERE parent=".$delete;
	$dbQuery = mysqli_query($GLOBALS['DB'],$strSQL) or die(mysql_error());
	if(mysqli_num_rows($dbQuery)>0){
	while($arrKat = mysql_fetch_assoc($dbQuery)){
		$strSQL2 = "SELECT * FROM ".$table." WHERE parent=".$arrKat[$feld];
		if($arrKat[$feld] != 0) {
			$unter=mysqli_query($GLOBALS['DB'],$strSQL2);
			if(mysqli_num_rows($unter)>0) {
				$strReturn.= delkat($table,$arrKat[$feld]);
			} else {
				mysqli_query($GLOBALS['DB'],"DELETE FROM ".$table." WHERE ".$feld."=".$arrKat[$feld]);
			}
		}
	}} else {
		mysqli_query($GLOBALS['DB'],"DELETE FROM ".$table." WHERE ".$feld."=".$delete);
	}
	return $strReturn;
}
?>