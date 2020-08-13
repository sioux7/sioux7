<?php
if(!$_REQUEST['p_id']){
$sql_query = "SELECT * FROM sioux7_presse WHERE dom_id=".$_SESSION['DOM']." AND lang='".$_SESSION['LANG']."' AND p_id <> 0  ORDER BY datum DESC";
$result = mysqli_query($GLOBALS['DB'],$sql_query);
    print "<table border=0 cellspacing=1 cellpadding=0 width=450>
			<tr><td>Unsere eigenen Presseberichte.<br>Wir berichten regelm&auml;ssig &uuml;ber unsere esten Entwicklungen und Trends. Erfahren Sie hier unsere brandaktuellsten Neuheiten.<br></td></tr><tr><td><hr></td></tr><tr><td><ul>";
 	while ($row = mysqli_fetch_array($result)) {
		print "<li><a href='presse.html?p_id=".$row['p_id']."'>".$row['titel'].", ".datum($row['datum'])."</a></li>";}
	print "</ul></td></tr></table>";
}
else {
$id = intval($_REQUEST['p_id']);
$sql_query = "SELECT * FROM sioux7_presse WHERE p_id=".$id;
$result = mysqli_query($GLOBALS['DB'],$sql_query) or die($sql_query);
while ($row = mysqli_fetch_array($result)){
?>
<table>
<tr>
  <?php
	  if($row['bild'] != "" and file_exists ("upload/images/".$row['bild']) == 1){
			?>
			<td VALIGN="TOP"><a href="upload/images/<?php echo $row['bild'] ?>" rel="cb"><img SRC="upload/images/<?php echo $row['bild'] ?>" ALT="Objektbild" style="margin: 5px; max-width: 180px;"></a></td>
		<?php
	 }
	 else { ?>
	 <td VALIGN="TOP"></td>
	 <?php
		}
	?>
    <td width="80%" valign="top">
       <table>
       	<?php
			$descr=$row['descr'];
		?>
		<tr>
			<td class="normal"><?php echo $descr ?></td>
		</tr>
		<tr>
			<td align="right"><?php echo datum($row['datum']); ?></td>
		</tr>
		</table>
		</td>
  </tr>
</table>
<?php
	}
}	
?>	