<?php
if (isset($_REQUEST['speichern'])) {
		include 'inc/reg_globals.inc.php';
		$tmp = $_FILES['newpic1']['tmp_name'];
		if($tmp != ""){
			if (file_exists($tmp) == 1) {
				$picture1=$_FILES['newpic1']['name'];
				$foto = "../upload/images/".$picture1;
				move_uploaded_file ($tmp,$foto);
			}
		}
		else { $picture1=$oldpic1; }
		$sql_update = "UPDATE sioux7_firma SET firma='$firma',ansprechpartner='$ansprechpartner',adresse='$adresse', plz='$plz', ort='$ort', telefon='$telefon', telefax='$telefax', email='$email',descr='$descr',  logo='$picture1', agb='$agb', ustid='$ustid', hrb='$hrb'"
		." WHERE firma_id = '$firma_id'";
		$result = mysqli_query($GLOBALS['DB'],$sql_update);
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
		
		$sql_query = "SELECT * FROM sioux7_firma";
		$result = mysqli_query($GLOBALS['DB'],$sql_query);
		$num = mysqli_num_rows($result);
		$page="";
		
		?>       <center>
				<form enctype='multipart/form-data' action='start.php' method='post'>
				<input type="hidden" name="seite" value="grundfirma">
				<table>
				<tr><td colspan=2 align="center">FirmenDaten verwalten:</td></tr>
				<?php
				while ($row = mysqli_fetch_array($result)) {
				echo '<input type="hidden" name="firma_id" value="'.$row['firma_id'].'">';
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
                    
                    <TR>
                        <TD valign='top'>rechtliches</TD>
                        <TD align="left"><textarea NAME='descr' cols=50 rows=5><?php echo $row['descr']?></textarea></TD>
                    </TR>
                    <TR>
                        <TD valign='top'>AGB</TD>
                        <TD align="left"><textarea NAME='agb' cols=50 rows=5><?php echo $row['agb']?></textarea></TD>
                    </TR>
                   
                    <?php } ?>
					   
				<tr>
					<td <?php echo $tb_row ?> align="left" colspan=2><input type='SUBMIT' name='speichern' value='speichern'></td>
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
