<?php
if(!isset($entry)) $entry=0;
if(!isset($_REQUEST['page'])) {
	$_REQUEST['page']=1;
}
if(isset($down_id)) {
	$leiste .=" Seite:".$page;
}
if(!isset($allentries)) $allentries="";
$entries_to_show = 3;
if(!isset($_REQUEST['what'])) {
	?>
<center>
<table>
<tr>
	<td class="text" colspan=2><b>Module f&uuml;r SIOUX7: </b> Hier k&ouml;nnen Sie unsere aktuellen Angebote laden. Bitte beachten Sie, dass wir
	keine Haftung f&uuml;r eventuelle Fehler oder mangelnde Informationen &uuml;bernehmen. Wir entwickeln derzeit viele weitere Module.<br>
Die Installation ist denkbar einfach: laden Sie das Zip. Gehen Sie in die Verwaltung von SIOUX7 und installieren Sie das Modul &uuml;ber das integrierte Update.
	</td>
</tr>
</table>	
<?php
// Anzahl der Eintr�ge ermitteln
	$SQLstr = "SELECT * FROM update_files";
	$erg = mysql_query($SQLstr);
	$num_entries = mysql_num_rows($erg);
	mysql_freeresult($erg);
	// Ende
	$all_pages = $num_entries / $entries_to_show;
	$num_pages = intval($all_pages);
	if($num_pages < $all_pages) $num_pages++;
	if ($num_pages > 0) {
		if ($_REQUEST['page'] < $num_pages) {
		$i = $_REQUEST['page'];
		$page_num = $_REQUEST['page'] + 1;
		$allentries_w = ' <a href="'.$_GET['kategorie'].'.html?entry=" .($i * $entries_to_show)."&page='.$page_num.'">weiter �</a>';}
		if($_REQUEST['page'] > 1 and $num_pages > 1) {
		$i = $page - 2;
		$page_num = $_REQUEST['page'] - 1;
		$allentries_z = ' <a href="'.$_GET['kategorie'].'.html?entry=" .($i * $entries_to_show)."&page='.$page_num.'">� zur�ck</a>';}
		for ($i=0; $i < $num_pages; $i++) {
		$page_num = $i + 1;
		if($page_num == $_REQUEST['page']){
			$allentries.=" <font color='red'>".$_REQUEST['page']."</font> ";}
		else {
			$allentries .=' <a href="'.$_GET['kategorie'].'.html?entry=" .($i * $entries_to_show)."&page='.$page_num.'">$page_num</a>';}
		}
	} else {
		$allentries = ($num_pages=1);
	}
	?>
	<table>
	<tr>
	<td class="text" align="center">
		<div align="center"><?php echo $allentries_z ?> [ Seite: <?php echo $allentries ?> ] <?php echo $allentries_w ?></div>
	</td>
	</tr>
	</table>
	</center>
	<?php
	$sql_query = "SELECT * FROM update_files LIMIT $entry, $entries_to_show";
	$result2 = mysql_query($sql_query) or die (mysql_error());
	$num = mysql_num_rows($result2);
	if ($num == 0) echo "<center><table border='0' width=350>
						<tr>
							<td class='normal'>Die Datenbank enth�lt keine Daten!</td>
						</tr>
						</table></center>";
	else {
		print "<center><table border=0 cellspacing=0 cellpadding=0 width=360>";
		while ($row = mysql_fetch_array($result2)) {
                if($row['file_id'] !=0) {
		$spende=$row['spende'];
		$count=$row['counter']+1;
			  print "<tr>
						<td class='text' width=150>Titel: </td>
						<td class='normal'>".$row['titel_de']."</td>
					</tr>
					<tr>
						<td class='text' valign='top'>Inhalt: </td>
						<td class='normal'>".nl2br($row['descr'])."</td>
					</tr>
					<tr>
						<td class='normal'><b>geladen: ".$row['counter']."</b><br>Gr&ouml;&szlig;e: ".format_size(filesize('upload/files/'.$row['datei']))."</td>
						<td align='right'><a href='".$_GET['kategorie'].".html?what=laden&ID=".$row['file_id']."&fname=".$row['name']."&dfile=".urlencode($row['datei'])."&dcount=".$count."' class='text'><img src='images/rechts.gif' border=0> laden!</a></td>
					</tr>
					<tr><td colspan=2><hr></td></tr>";
				}}
				print "</table></center>";
			}
	}
else {
if(isset($_REQUEST['senden']) and $_REQUEST['senden'] !="nein") {
	if(isset($_REQUEST['done']) and $_REQUEST['done'] == "bezahlt") {
		$update="UPDATE update_files SET counter='".$_REQUEST['dcount']."' WHERE file_id='".$REQUEST['ID']."'";
		$result = mysql_query($update);
		echo "<center>Vielen Dank f�r Ihre Spende.<br>Hier k&ouml;nnen Sie die gew&uuml;nschte ".$dfile." Datei laden.<br><a href='upload/files/".$dfile."'>&raquo; DOWNLOAD</a></center>"; }
	else {
		if( $_SESSION['security_code'] == $_POST['security_code'] && !empty($_SESSION['security_code'] ) ) {
		unset($_SESSION['security_code']);
		$update="UPDATE update_files SET counter='".$_REQUEST['dcount']."' WHERE file_id='".$_REQUEST['ID']."'";
		$result = mysql_query($update)	or die (mysql_error());
		echo "<center>Hier k&ouml;nnen Sie die gew&uuml;nschte ".$dfile." Datei laden.<br><a href='upload/files/".$_REQUEST['dfile']."'>&raquo; DOWNLOAD</a></center>"; 
	   } else {
			// Insert your code for showing an error message here
			echo "<center>Die Sicherheitscode war leider falsch!</center>";
	   }}
}
else {
	$sql_abfrage = "SELECT * FROM update_files WHERE file_id='$ID'";
	$result2 = mysql_query($sql_abfrage) or die (mysql_error());
	$row = mysql_fetch_array($result2);
	if( $row['spende'] == 1) {?>
	<center>
	<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
	<input type="hidden" name="cmd" value="_s-xclick">
	<input type="hidden" name="hosted_button_id" value="WYUFXWNSAZFTG">
	<input type="hidden" name="rm" value="2">
   	<input type="hidden" name="return" value="http://sioux7.com/<?php echo $_GET['kategorie']; ?>.html?what=laden&dfile=<?php echo $_REQUEST['dfile']; ?>&dcount=<?php echo $_REQUEST['dcount']; ?>&done=bezahlt&senden=JA">
	<TABLE>
	<tr>
		<td class="normal" colspan=2>
		Sie wollen diese Datei laden. Es handelt sich um eine kompressierte Datei als tgz, zip, etc.
		Alle Files sind Virenfrei.
		
		</td>
	</tr>	
	<TR>
  	 <TD  class="normal">Datei: </TD>
  	 <TD  class="box"><INPUT TYPE=HIDDEN NAME="dfile" value="<?php echo $_REQUEST['dfile'] ?>"><?php echo $_REQUEST['dfile'] ?></TD>
	</TR>
	<tr>
		<td colspan=2 align="right"><input type="image" src="https://www.paypalobjects.com/WEBSCR-640-20110306-1/de_DE/DE/i/btn/btn_donate_SM.gif" name="submit" alt="Sicher bezahlen mit PayPal." title="Jetzt einfach, schnell und sicher online bezahlen � mit PayPal.">
		<img alt="" border="0" src="https://www.paypalobjects.com/WEBSCR-640-20110306-1/de_DE/i/scr/pixel.gif" width="1" height="1"></td>
	</tr>
	</table>
	</form>
	</center>
	<?php }
	else { ?>
	<FORM ACTION="<?php echo $_GET['kategorie']; ?>.html" METHOD=post name="LADEN">
	<input name="what" type="HIDDEN" value="laden">
	<input name="dcount" type="HIDDEN" value="<?php echo $_REQUEST['dcount'] ?>">
	<input name="ID" type="HIDDEN" value="<?php echo $_REQUEST['ID'] ?>">
	<TABLE>
	<tr>
		<td class="normal" colspan=2>
		Sie wollen diese Datei laden. Es handelt sich um eine kompressierte Datei als tgz, zip, etc.
		Alle Files sind Virenfrei.
		
		</td>
	</tr>	
	<TR>
  	 <TD  class="normal">Datei: </TD>
  	 <TD  class="normal"><INPUT TYPE=HIDDEN NAME="dfile" value="<?php echo $_REQUEST['dfile'] ?>"><?php echo $_REQUEST['dfile'] ?></TD>
	</TR>
	<tr>
            <td width="160" align="right" valign="top"> </td>
            <td width="364" align="left">
            <img src="libary/captcha/CaptchaSecurityImages.php?width=100&height=40&characters=5" />
		    <label for="security_code">Security Code: </label><input id="security_code" name="security_code" type="text" />
            </td>
          </tr>
	<TR>
	<TR>
 	 <TD COLSPAN=2 >
  	 <P align="right"><input type="submit" value="GO!" name="senden"></P></TD>
	</TR>
	</TABLE>
	</FORM>
<?php	
	}
    }
}
function format_size($size) {
      $sizes = array(" Bytes", " KB", " MB", " GB", " TB", " PB", " EB", " ZB", " YB");
      if ($size == 0) { return('n/a'); } else {
      return (round($size/pow(1024, ($i = floor(log($size, 1024)))), 2) . $sizes[$i]); }
}
?>