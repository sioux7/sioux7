<?php
	include 'inc/reg_globals.inc.php';
// Scroller Start
if(isset($_REQUEST['sa'])) {$suche='&sa=1&suche='.$_REQUEST['suche'].'&suchname='.$_REQUEST['suchname'];}
if(!isset($entry)) $entry=0;
if(!isset($page)) $page=1;
if(!isset($entries_to_show)) $entries_to_show=20;

if(isset($_REQUEST['sa']) && $_REQUEST['suche'] !="") {
	$sql_query1 = "SELECT * FROM ".$_SESSION['table']." WHERE ".$_REQUEST['suchname']." LIKE '%".$_REQUEST['suche']."%'";}
else {
	$sql_query1 = "SELECT * FROM ".$_SESSION['table'].$sq;}
	
$erg = mysqli_query($GLOBALS['DB'],$sql_query1) or die(mysql_error().$sql_query1);
$num_entries = mysqli_num_rows($erg);

$all_pages = $num_entries / $entries_to_show;
$num_pages = intval($all_pages);
if($num_pages < $all_pages) $num_pages++;
if ($num_pages > 0) {
if ($page < $num_pages) {
		$i = $page;
		$page_num = $page + 1;
		$allentries_w = " <a href=\"start.php?seite=".$_REQUEST['seite'].$suche."&entry=" .($i * $entries_to_show)."&page=".$page_num."&sort=".$_REQUEST['sort']."&sortby=".$_REQUEST['sortby']."\">weiter &raquo;</a>";}
		if($page > 1 and $num_pages > 1) {
		$i = $page - 2;
		$page_num = $page - 1;
		$allentries_z = " <a href=\"start.php?seite=".$_REQUEST['seite'].$suche."&entry=" .($i * $entries_to_show)."&page=".$page_num."&sort=".$_REQUEST['sort']."&sortby=".$_REQUEST['sortby']."\">&laquo; zur&uuml;ck</a>";}
	
	for ($i=0; $i < $num_pages; $i++) {
	$page_num = $i + 1;
	if(isset($page) and $page_num==$page){
				$allentries.="&nbsp;<font color='red'>".$page."</font>&nbsp;";}
			else{
				$allentries .= " <a href=\"start.php?seite=".$_REQUEST['seite'].$suche."&entry=" .($i * $entries_to_show)."&page=".$page_num."&sort=".$_REQUEST['sort']."&sortby=".$_REQUEST['sortby']."\">$page_num</a>";}
	}
} else {
	$allentries = "";
}
// Scroller End
?>
