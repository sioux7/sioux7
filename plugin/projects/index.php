<?php
if(!isset($_REQUEST['bereich']) and !isset($_REQUEST['pro_id'])) {
?>
<table>
	<tr>
	    <td valign="top">
	    <?php
	    $sql_query = "SELECT * FROM sioux7_projekte";
		$result = mysqli_query($GLOBALS['DB'],$sql_query);
		$enum=enum_select('sioux7_projekte', 'bereich');
		print "<div id='bereich' style='height: 40px;'><ul style='list-style:none;'>";
		for($i=0;$i<sizeof($enum);$i++) {
			 print '<li style="float: left;"><a href="'.$_GET['kategorie'].'.html?bereich='.$enum[$i].'">&raquo;&nbsp;';
			 if($enum[$i]==$bereich) {print '<font color="red">'.$enum[$i].'</font>';} else {print $enum[$i];} 
			 print '</a></li>';
		}
		print "</ul></div>";
		?>
	    </td>
	</tr>
	<tr>
		<td>
		<small>
		Ein kleiner Auszug, was wir sonst noch alles entwickeln.
		</small>
		</td>
	</tr>	
	</table>
<?php }
else if(isset($_REQUEST['pro_id'])) {
$pro_id=$_REQUEST['pro_id'];
$bereich=$_REQUEST['bereich']
 ?>
<table>
	  <tr>
	    <td valign="top">
	    <?php
	    $i=1;
		$sql_query = "SELECT * FROM sioux7_projekte where pro_id='$pro_id'";
		$result = mysqli_query($GLOBALS['DB'],$sql_query);
		while($row = mysqli_fetch_array($result)){
		?>
	    <table>
	    <tr>
			<td colspan=2 align="center"><?php echo "<b>".$bereich."</b> : ".$row['name'] ?></td>
		</tr>
		<tr>
			<td valign="top" width=120><b>Version: </b></td>
			<td><?php echo $row['version'] ?></td>
		</tr>
		<tr>
			<td valign="top"><b>Inhalt: </b></td>
			<td><?php echo $row['inhalt'] ?></td>
		</tr>
		<tr>
			<td valign="top"><b>Konzept: </b></td>
			<td><?php echo $row['konzept'] ?></td>
		</tr>
		<tr>
			<td valign="top"><b>Fehler: </b></td>
			<td><?php echo $row['fehler'] ?></td>
		</tr>
		<tr>
			<td valign="top"><b>Author: </b></td>
			<td><?php echo $row['authors'] ?></td>
		</tr>
		<?php 
		if($row['beispiel'] !="") { ?>
		<tr>
			<td valign="top"><b>Demo: </b></td>
			<td><a href="<?php echo $row['beispiel'] ?>" target="_NEW"> &raquo; Beispiel </a></td>
		</tr>
		<?php
		}
		?>
		</table>
	    <?php
	    }
	    ?>
	    </td>
	</tr>
	</table>
<?php
} 
else {
$bereich=$_REQUEST['bereich']
?>
<table>
	  <tr>
			<td class="big" colspan=2 align="center"><?php echo $bereich; ?></td>
		</tr>
	  <tr>
	    <td valign="top">
	    <?php
	    $i=1;
		$sql_query = "SELECT * FROM sioux7_projekte where bereich='$bereich'";
		$result = mysqli_query($GLOBALS['DB'],$sql_query);
		while($row = mysqli_fetch_array($result)){
		print '<a href="'.$_GET['kategorie'].'.html?bereich='.$bereich.'&pro_id='.$row['pro_id'].'&fname='.$row['projektname'].'">&raquo;&nbsp;'.$row['projektname'].'</a><br><br>';
	    }
	    ?>
	    </td>
	</tr>
	</table>
<?php } ?>