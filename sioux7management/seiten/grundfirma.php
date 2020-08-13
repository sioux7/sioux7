<?php
if (isset($_REQUEST['speichern'])) {
		include 'inc/reg_globals.inc.php';
		$tmp = $_FILES['newpic1']['tmp_name'];
		if($tmp != ""){
			if (file_exists($tmp) == 1) {
				$picture1=$_SESSION['user_id']."_".$_SESSION['DOM']."_".$_FILES['newpic1']['name'];
				$foto = "../upload/images/".$picture1;
				move_uploaded_file ($tmp,$foto);
			}
		}
		else { $picture1=$oldpic1; }
		if($firma_id != 'neu') {
			$sql_update = "UPDATE sioux7_firma SET firma='$firma',ansprechpartner='$ansprechpartner',adresse='$adresse', plz='$plz', ort='$ort', telefon='$telefon', telefax='$telefax', email='$email', logo='$picture1', ustid='$ustid', hrb='$hrb'"
			." WHERE firma_id = '$firma_id'";
			$result = mysqli_query($GLOBALS['DB'],$sql_update);
		} else {
			$sql_insert ="INSERT INTO sioux7_firma (dom_id,firma,ansprechpartner,adresse,plz,ort,telefon,telefax,email,logo,ustid,hrb) VALUES ($dom_id,'$firma','$ansprechpartner','$adresse','$plz','$ort','$telefon','$telefax','$email','$picture1','$ustid','$hrb')";
			$result = mysqli_query($GLOBALS['DB'],$sql_insert);
		}
		if($ficon_id != 'neu') {
			$sql_update2 = "UPDATE sioux7_firma_content SET descr='$descr', agb='$agb',datenschutz='$datenschutz'"
		." WHERE ficon_id = '$ficon_id'";
			$result = mysqli_query($GLOBALS['DB'],$sql_update2);
		} else {
			$sql_insert2 ="INSERT INTO sioux7_firma_content (firma_id,lang,descr,agb,datenschutz) VALUES ('$firma_id','".$_SESSION['lang']."','$descr','$agb','$datenschutz')";
			$result = mysqli_query($GLOBALS['DB'],$sql_insert2);
		}
		$page = "<center>Impressum wurde aktualisiert.</center>";
}
else{
		echo '<script language="javascript" type="text/javascript" src="editor/jscripts/tiny_mce/tiny_mce.js"></script><script language="javascript" type="text/javascript">tinyMCE.init({
		mode : "textareas",
		forced_root_block : "",
		theme : "advanced",
		plugins : "save,emotions,preview,searchreplace",
		theme_advanced_buttons2_add : "preview,forecolor,backcolor,search,replace,emotions",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "center"});</script>';
		
		$sql_query = "SELECT * FROM sioux7_firma WHERE dom_id=".$_SESSION['DOM'];
		$result = mysqli_query($GLOBALS['DB'],$sql_query);
		$num = mysqli_num_rows($result);
		$row = mysqli_fetch_array($result);
		if($num) {$fid=$row['firma_id'];} else {$fid='neu';}
		$page="";
		
		?>       <center>
				<form enctype='multipart/form-data' action='start.php' method='post'>
				<input type="hidden" name="seite" value="grundfirma">
				<table>
				<tr><td colspan=2 align="center">FirmenDaten verwalten:</td></tr>
				<?php
				echo '<input type="hidden" name="firma_id" value="'.$fid.'">';
				echo '<input type="hidden" name="dom_id" value="'.$_SESSION['DOM'].'">';
				?>
				
					<tr>
				   <?php
					if($row['logo'] != "" && file_exists ("../upload/images/".$row['logo']) == 1){?>
						  <td VALIGN='TOP'  align='center' class='normal' colspan=2><img SRC='../upload/images/<?php echo $row['logo'] ?>' BORDER=1 ALT='LOGO'>
									<input type='hidden' name='oldpic1' value='<?php echo $row['logo'] ?>'>
									<br>Neues Logo:<br><input name='newpic1' type='file' size=4>
									</td>
					<?php
					}
					else { ?>
						 <td VALIGN='TOP'  colspan=2 align='center'>Kein Logo vorhanden!
									<input type='hidden' name='oldpic1' value='<?php echo $row['logo'] ?>'>
									<br>Neues Logo:<br><input name='newpic1' type='file' size=4>
									</td>
					<?php } ?>
								
						</tr>
					<TR>
                        <TD>Firma</TD>
                        <TD align="left"><INPUT TYPE=TEXT NAME='firma' value='<?php echo $row['firma']?>' size=40></TD>
                    </TR>	
					<TR>
                        <TD>Ansprechpartner</TD>
                        <TD align="left"><INPUT TYPE=TEXT NAME='ansprechpartner' value='<?php echo $row['ansprechpartner']?>' size=40></TD>
                    </TR>
                    <TR>
                        <TD>Strasse / Nr.</TD>
                        <TD align="left"><INPUT TYPE=TEXT NAME='adresse' value='<?php echo $row['adresse']?>' size=40></TD>
                    </TR>
                    <TR>
                        <TD>PLZ</TD>
                        <TD align="left"><INPUT TYPE='NUMBER' NAME='plz' SIZE='5' value='<?php echo $row['plz']?>' size=5></TD>
                    </TR>
                    <TR>
                        <TD>Ort</TD>
                        <TD align="left"><INPUT TYPE=TEXT NAME='ort' value='<?php echo $row['ort']?>' size=40></TD>
                    </TR>
                    <TR>
                        <TD>Telefon</TD>
                        <TD align="left"><INPUT TYPE=TEXT NAME='telefon' value='<?php echo $row['telefon']?>' size=40></TD>
                    </TR>
                    <TR>
                        <TD>Telefax</TD>
                        <TD align="left"><INPUT TYPE=TEXT NAME='telefax' value='<?php echo $row['telefax']?>' size=40></TD>
                    </TR>
                    <TR>
                        <TD>Email</TD>
                        <TD align="left"><INPUT TYPE=TEXT NAME='email' value='<?php echo $row['email']?>' size=40></TD>
                    </TR>
                    <TR>
                        <TD>Umsatzsteur-ID-Nr.</TD>
                        <TD align="left"><INPUT TYPE=TEXT NAME='ustid' value='<?php echo $row['ustid']?>' size=40></TD>
                    </TR>
                    <TR>
                        <TD>Handelsregister</TD>
                        <TD align="left"><INPUT TYPE=TEXT NAME='hrb' value='<?php echo $row['hrb']?>' size=40></TD>
                    </TR>
                    <?php
	                    if($num) {
	                    $sql_query2 = "SELECT * FROM sioux7_firma_content WHERE firma_id =".$row['firma_id']." AND lang='".$_SESSION['lang']."'";
						$result2 = mysqli_query($GLOBALS['DB'],$sql_query2);
						$num2 = mysqli_num_rows($result2);
						$row2 = mysqli_fetch_array($result2);
						if($num2) {$id=$row2['ficon_id'];} else {$id='neu';}
						echo '<input type="hidden" name="ficon_id" value="'.$id.'">';
					?>
                    <TR>
                        <TD valign='top'>rechtliches</TD>
                        <TD align="left"><textarea NAME='descr' cols=50 rows=5><?php echo $row2['descr']?></textarea></TD>
                    </TR>
                    
                    <TR>
                        <TD valign='top'>AGB</TD>
                        <TD align="left"><textarea NAME='agb' cols=50 rows=5><?php echo $row2['agb']?></textarea></TD>
                    </TR>
                   <TR>
                        <TD valign='top'>Datenschutz</TD>
                        <TD align="left"><textarea NAME='datenschutz' cols=50 rows=5><?php echo $row2['datenschutz']?></textarea></TD>
                    </TR>
				<?php } ?>	   
				<tr>
					<td align="left" colspan=2><input type='SUBMIT' name='speichern' value='speichern'></td>
				</tr>
				</table>
				</form>
				</center>
				<?php
				
			}
				
if(isset($page)) echo $page;
?>
</body>
</html>
