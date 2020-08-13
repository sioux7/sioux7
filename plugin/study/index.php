<?php
if(!isset($_REQUEST['bereich'])) {$bereich='Internet';} else {$bereich=$_REQUEST['bereich'];}
$sql_query = "SELECT * FROM sioux7_study WHERE seite_id <> 0";
$result = mysqli_query($GLOBALS['DB'],$sql_query) or die (mysql_error());
$enum=enum_select('sioux7_study', 'bereich');
print "<div id='bereich' style='height: 40px;'><ul style='list-style:none;'>";
for($i=0;$i<sizeof($enum);$i++) {
	 print '<li style="float: left;"><a href="'.$_GET['kategorie'].'.html?bereich='.$enum[$i].'">&raquo;&nbsp;';
	 if($enum[$i]==$bereich) {print '<font color="red">'.$enum[$i].'</font>';} else {print $enum[$i];} 
	 print '</a></li>';
}
print "</ul></div>";
if(!isset($bereich)){
?>
<center>
W&auml;hle bitte Deinen Bereich aus.
</center>
<?php
}
else {
$entries_to_show=1;
if(!isset($_REQUEST['entry'])) {$entry=0;} else {$entry=$_REQUEST['entry'];}
$SQLstr = "SELECT * FROM sioux7_study WHERE bereich='$bereich'";
$erg = mysqli_query($GLOBALS['DB'],$SQLstr);
$num_entries = mysqli_num_rows($erg);
// Ende
$all_pages = $num_entries / $entries_to_show;
$num_pages = intval($all_pages);
if(($entry+1) < $all_pages and $entry >0) {
		$i = $entry - 1;
		$w = $entry + 1;
		$allentries = "<td align='left'><a href=\"".$_GET['kategorie'].".html?entry=" .($i * $entries_to_show)."&id=".$id ."&bereich=".urlencode($bereich)."&page=".$i."\">< zur&uuml;ck</a></td><td align='right'><a href=\"".$_GET['kategorie'].".html?entry=" .($w * $entries_to_show)."&id=".$id ."&bereich=".urlencode($bereich)."&page=".$w."\">weiter ></a>";}
		else if (($entry+1) < $all_pages) {
			$i = $entry + 1;
			$allentries = "<td align='right' colspan=2> <a href=\"".$_GET['kategorie'].".html?entry=" .($i * $entries_to_show)."&id=".$id ."&bereich=".urlencode($bereich)."&page=".$i."\">weiter ></a></td>";}
		else if(($entry+1) == $all_pages and $all_pages > 1) {
			$i = $entry - 1;
			$allentries = "<td align='left' colspan=2> <a href=\"".$_GET['kategorie'].".html?entry=" .($i * $entries_to_show)."&id=".$id ."&bereich=".urlencode($bereich)."&page=".$i."\">< zur&uuml;ck</a></td>";}
	else {
		$allentries = "";
	}
$sql_query = "SELECT * FROM sioux7_study WHERE bereich='$bereich' order by seite_id LIMIT $entry, $entries_to_show";
$result = mysqli_query($GLOBALS['DB'],$sql_query);
?>
<table>
<tr bgcolor='lightgrey'>
  <td colspan=2 align="center"><strong><?php echo $bereich; ?></strong></td>
</tr>
<tr bgcolor='lightgrey'>
	<?php echo $allentries ?>
</tr>
</table>
<?php
while ($row = mysqli_fetch_array($result)){
	if($row['titel'] !='neu'){
		$link='study/'.make2url($row['titel']);
		$exist='SELECT * FROM sioux7_link_cache WHERE url="'.$link.'"';
		$num=mysqli_num_rows(mysqli_query($GLOBALS['DB'],$exist));
		if($num==0) {
			$param='kat_id => '.$intCurrentKat.',p_id => '.$row['p_id'];
			$CleanUrl='INSERT INTO sioux7_link_cache (dom_id,url,params) VALUES ("'.$_SESSION['DOM'].'","'.$link.'","'.$param.'")';
			$ins=mysqli_query($GLOBALS['DB'],$CleanUrl)or die(mysql_error());
		}
	}
?>
<table>
<?php
 if($row['bild'] != "" and file_exists ("upload/images/".$row['bild']) == 1){
?>
<tr>
<td VALIGN="TOP"  align="center"><img SRC="upload/images/<?php echo $row['bild'] ?>" BORDER="0" alt="Study"></td>
</tr>
<?php
}
?>
<tr>
    <td>
       <table>
        <tr>
			<td><b><?php echo $row['title'] ?></b></td>
		</tr>
		<tr>
			<td class="normal"><?php echo $row['descr']; ?></td>
		</tr>
		</table>
	</td>
</tr>
</table>
<?php
	}

}
?>