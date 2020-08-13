<?php
if ((int)$_GET['delete']>0) {
	if($_GET['xtable']) {
		mysqli_query($GLOBALS['DB'],"DELETE FROM ".$_GET['xtable']." WHERE level = '".(int)$_GET['delete']."'");
		mysqli_query($GLOBALS['DB'],"DELETE FROM ".$_SESSION['table']." WHERE ".$_REQUEST['name']." = '".(int)$_GET['delete']."'");
	} else {
		mysqli_query($GLOBALS['DB'],"DELETE FROM ".$_SESSION['table']." WHERE ".$_REQUEST['name']." = '".(int)$_GET['delete']."'");
	}
}

if ((int)$_GET['dupli']>0) {
	$q=mysqli_query($GLOBALS['DB'],"SELECT * FROM ".$_SESSION['table']." WHERE ".$_REQUEST['name']." = ".$_GET['dupli']);
	$fields_cnt = mysqli_num_fields($q);
	for($j = 1; $j < $fields_cnt; $j++) {
		$qname .= ",".mysqli_field_name ($q,$j);
		}
	$qname = substr($qname,1);
	$insert=mysqli_fetch_array($q);
	unset ($insert[$_REQUEST['name']]);
	for($j = 1; $j < $fields_cnt; $j++) {
		$qinsert .= ", '".$insert[$j]."'";
		}
	$qinsert = substr($qinsert,1);
	//$insert=implode(",",$insert);
	$duplikate="INSERT INTO ".$_SESSION['table']." (".$qname.") VALUES (".$qinsert.") ";
	mysqli_query($GLOBALS['DB'],$duplikate);
}



if($_SESSION['table'] == 'admin' && $_SESSION['right'] <= 770) {$sq=" WHERE admin_id=".$_SESSION['user_id'];} else if($_SESSION['table'] == 'photo' && $_SESSION['right'] <= 990) {$sq=" WHERE user_id=".$_SESSION['user_id'];} else if($_SESSION['table'] == 'profil') {$sq=" WHERE user_id=".$_SESSION['user_id'];} else {$sq=" Where 1=1";}

include "sitescroll.inc.php";


if($_REQUEST['sort'] == "asc") {
	$sql_query = "SELECT * FROM ".$_SESSION['table']." ".$sq." ORDER BY ".$_REQUEST['sortby']." ASC";}
else if($_REQUEST['sort'] == "desc") {
	$sql_query = "SELECT * FROM ".$_SESSION['table']." ".$sq." ORDER BY ".$_REQUEST['sortby']." DESC";}
else {
	if($_REQUEST['sortfield']){
		$sql_query = "SELECT * FROM ".$_SESSION['table']." ".$sq." ORDER BY ".$_REQUEST['sortfield']." ".$_REQUEST['sortmode'];
	} else {
		$sql_query = "SELECT * FROM ".$_SESSION['table']." ".$sq;
	}
}
if(isset($_REQUEST['sa']) && $_REQUEST['suche'] !="") {
	$sql_query = "SELECT * FROM ".$_SESSION['table'].$sq ." AND ".$_REQUEST['suchname']." LIKE '%".$_REQUEST['suche']."%'";}
$sql_query .=" LIMIT $entry,$entries_to_show";
$result = mysqli_query($GLOBALS['DB'],$sql_query);
$fields_cnt = mysqli_num_fields($result);
for($j = 0; $j < $fields_cnt; $j++) {
	$name = mysqli_field_name ($result,$j);
	if($name=="status") {$hasStat=$j;}
	if($name=="email") {$hasMail=$j;}
	if($name=="gesperrt") {$gesperrt=$j;}
	$enum=enum_select($_SESSION['table'], $name);
	if($enum[0]=="ext") {$hasFields=1;}
}
if($fields_cnt > 6) {$spalten=6;} else {$spalten=$fields_cnt;}
$query_mod="SELECT mode,info FROM sioux7_tables WHERE titel ='".$_REQUEST['table']."'";
$result_mod = mysqli_query($GLOBALS['DB'],$query_mod);
$row_mod = mysqli_fetch_array($result_mod);
?>
<script type="text/javascript">
<!--
function askDelete(url){
	var status;
	status=confirm('Wollen Sie diese Eintrag wirklich loeschen?');
	if(status==true) document.location.href=url;
	else return false;
}
// -->
</script>
<table>
<tr>
	<td colspan=5>
		<b>Info:</b>
		<?php
		 echo $row_mod['info'];
		?>
	</td>
</tr>
<tr>
	<td colspan=5>
		<form name="suche" action="start.php">
		<input name="seite" type="hidden" value="uebersicht">
		Suche: 
		<input name="suche" type="text" value="">
		<select name="suchname">
		<?php
		for($j = 1; $j < $spalten; $j++) {
		$name = mysqli_field_name ($result,$j);
		if(!strstr($name,"_nav") && !strstr($name,"_id") && !strstr($name,"passwort") && !strstr($name,"gesperrt") && !strstr($name,"users") && !strstr($name,"dom_id") && !strstr($name,"lang")) {
		echo "<option value".$name .">".$name ."</option>";
		}}
		?>
		</select>
		<input name="sa" type="submit" value="suchen">
		</form>
	</td>
</tr>
<tr bgcolor="#E6EFFF">
<?php
for($j = 1; $j < $spalten; $j++) {
$name = mysqli_field_name ($result,$j);
if(!strstr($name,"_nav") && !strstr($name,"passwort") && !strstr($name,"gesperrt") && !strstr($name,"users") && !strstr($name,"dom_id") && !strstr($name,"lang")) {
?>
	<td width="0%" align="center"><a href="start.php?seite=<?php echo $_GET['seite']; ?>&sortfield=<?php echo $name; ?>&sortmode=<?php if($_REQUEST['sortmode'] =="desc" && $_REQUEST['sortfield'] == $name) { echo "asc";} else {echo "desc";} ?>"><?php echo strtoupper($name); ?> <?php if($_REQUEST['sortmode'] =="desc" && $_REQUEST['sortfield'] == $name) { echo "&uarr;";} else {echo "&darr;";} ?></a></td>
<?php }} 
if($hasFields==1) { 
	print '<td width="2%" align="right">ANZ</td>';}
?>
	<td width="10%" align="right">&nbsp;</td>
</tr>
<?php
do{
	if($r[0] !="" && $r[0] !=0) {
	if($r[$hasStat] == 1 ) {$bg="bgcolor='lightgreen'";} else if($r[$gesperrt] == 1 ) {$bg="bgcolor='orange'";} else if($hasMail && $r[$hasMail] == '' ) {$bg="bgcolor='yellow'";}else {$bg="";}
	?>
	  <tr <?php echo $bg; ?>>
		<?php
		for($j = 1; $j < $spalten; $j++) {
		$ID = mysqli_field_name ($result,0);
		$name = mysqli_field_name ($result,$j);
		if(!strstr($name,"_nav") && !strstr($name,"passwort") && !strstr($name,"gesperrt") && !strstr($name,"users") && !strstr($name,"dom_id") && !strstr($name,"lang")) {
		$r[$j] = shortText(strip_tags($r[$j]),50);
		
		if($name == 'bild') {
			if (file_exists("../upload/images/".$r[$j]) == 1 && $r[$j] !="") {
				$r[$j]='<img src="../upload/images/'.$r[$j].'" width=50>';
			}
		}
	    ?>
		<td style="max-width: 300px; overflow: hidden;"><?php echo $r[$j]; ?></td>
	    <?php }} 
	    if($hasFields==1) { 
	    	$query="SELECT * FROM ".$enum[1]. " WHERE level=".$r[0];
			$num_q=mysqli_num_rows($query);
	    	print '<td>'.$num_q.'</td>';}
	    if($row_mod['mode'] == 1) {
		    $_SESSION ['mode'] = 1;
		?>
			<td align="right">
			<a href="start.php?seite=bearbeiten&name=<?php echo $ID; ?>&ID=<?php echo $r[0]; ?>&what=html"><img src="images/icon_bearbeiten2.gif" border="0" /></a> 
		<?php } else {
			$_SESSION ['mode'] = '';
		 ?>
			<td align="right">
			<a href="start.php?seite=bearbeiten&name=<?php echo $ID; ?>&ID=<?php echo $r[0]; ?>"><img src="images/icon_bearbeiten2.gif" border="0" /></a> 
		<?php } ?>
		<?php 
			if($_SESSION['table'] == 'admin' && ($r[0] == 3 || $r[0] == 5)) {
			} else {
			if($hasFields==1) { 
		?>
			<a href="#" onclick="askDelete('start.php?seite=uebersicht&name=<?php echo $ID; ?>&delete=<?php echo $r[0]; ?>&xtable=<?php echo $enum[1]; ?>');"><img src="images/icon_loeschen2.gif" border="0" title="l&ouml;schen"/></a>
		<?php
			} else {
		?>
			<a href="#" onclick="askDelete('start.php?seite=uebersicht&name=<?php echo $ID; ?>&delete=<?php echo $r[0]; ?>');"><img src="images/icon_loeschen2.gif" border="0" title="l&ouml;schen"/></a>
		<?php }} ?>
			
			</td>
	  </tr>
	<?php 
	}} while($r = @mysqli_fetch_row($result));
	?>
</table>
<div id="seitenscroller">
<?php 
if($num_entries > 1) {
echo "<div style='float: left'>".$allentries_z."</div>"; 
echo "<div style='float: right'>".$allentries_w."</div>";
echo "<div align='center' style='width: 500px; padding: 0 70px 0 100px;'>[ Seite:".$allentries ." ]</div>";
} 
?>
</div>
