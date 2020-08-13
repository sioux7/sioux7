<script src="js/cal/calendar_eu.js" type="text/javascript"></script>
<link rel="stylesheet" href="js/cal/calendar.css" />
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript">
function init() {
	  $('#reload').click(function() {
                $('#xinhalt').fadeOut('slow').load('inc/form_zusatz.inc.php').fadeIn('slow')
            });
	  $("#multi").click(showFormAlert);
      $("#Vorschau").dialog({
         autoOpen: false,
         bgiframe: true,
         resizable: false,
         height: 600,
		 width: 800,
         modal: true,
         overlay: {
            backgroundColor: '#fff',
            opacity: 0.5
         }
      });
   }
 function showFormAlert() {
    $("#Vorschau").dialog("open");
}
$(document).ready(init);
</script>
<script type="text/javascript">
<!--
function askDelete(url){
	var status;
	status=confirm('Wollen Sie diesen Eintrag wirklich loeschen?');
	if(status==true) document.location.href=url;
	else return false;
}
// -->
</script>
<?php
//error_reporting(E_ALL);
//ini_set('display_errors', 1);
if($_REQUEST['what']=="html" && $_REQUEST['ismodul'] !=1){
	echo wysiwyg();
}
if($_POST){
	$id_name = $_REQUEST['id_name'];
	$id = $_REQUEST[$id_name];
	if($id == 0) {
	$fields = "";
	$values = "";
	$tmpname = $_FILES['bild']['tmp_name'];
 	if($tmpname !=""){
	   if (file_exists($tmpname) == 1) {
	    $picture=$_SESSION['user_id']."_".$_SESSION['DOM']."_".$_FILES['bild']['name'];
	    $foto = "../upload/images/".$picture;
	   $foto = "../upload/images/".$picture;
		if(filesize($tmpname) > 500000000) {
			die('File to big.');
		} else {
			move_uploaded_file ($tmpname,$foto);
		}
		}
	$fields .= ",`bild`";
	$values .= ",'".$picture."'";	
	}
	$tmpname = $_FILES['datei']['tmp_name'];
 	if($tmpname !=""){
	   if (file_exists($tmpname) == 1) {
	    $dname=$_SESSION['user_id']."_".$_SESSION['DOM']."_".$_FILES['datei']['name'];
	    $laden = "../upload/files/".$dname;
	    if(filesize($tmpname) > 500000000) {
			die('File to big.');
		} else {
			move_uploaded_file ($tmpname,$laden);
		}
		}
	$fields .= ",`datei`";
	$values .= ",'".$dname."'";	
	}
	
	foreach ($_POST as $key => $val)
	{
				if ($key == "table" || $key == $id_name || $key == "id_name" || $key == "save"){	continue;}
				if($key == "passwort") {
						$prüf=prüfen($table,$key,$val);
						if($prüf != 'OK'){
							$error=true;
							echo '<div class="box_fehler">'.$prüf.'</div>';
							die();
						}
						$fields .= ",`$key`";
						$values .= ",'".md5($val)."'";
				} else {
				if(is_array($val)) {
					$mysel = '';
					for($j=0;$j<sizeof($val);$j++){
						$mysel .= $val[$j].',';
					}
					$fields .= ",`$key`";
					$values .= ",'".$mysel."'";
				} else {
					if($key=="datum") {if($val=="" or $val=="00-00-0000") {$val=date("Y-m-d");} else {$val=usdatum($val);}}
					$prüf=prüfen($table,$key,$val);
					if($key == 'plugin') {$plugin=$val;}
					if($prüf != 'OK'){
						$error=true;
						echo '<div class="box_fehler">'.$prüf.'</div>';
						die();
					}
					$fields .= ",`$key`";
					$values .= ",'".$val."'";}
				}
	}
	$fields = substr($fields,1);
	$values = substr($values,1);
	$fehler = "SELECT * FROM ".$table." WHERE $id_name=".$id;
	$q = mysqli_query($GLOBALS['DB'],$fehler);
	$fields_cnt = mysqli_num_fields($q);
	for($j = 0; $j < $fields_cnt; $j++) {
		$name = mysqli_field_name ($q,$j);
		$flags2 = mysqli_field_flags($q,$j);
		if(xeregi('not_null',$flags2) && $_REQUEST[$name] =="") {
			$error=true;
			echo '<div class="box_fehler">Bitte '.ucfirst($name).' eingeben.</div>';}
	}
	if($error==false) {
	$query = "INSERT INTO `".$_POST['table']."` ($fields) VALUES ($values)";
	mysqli_query($GLOBALS['DB'],$query);
	echo '<div class="box_erfolg">Daten wurden erfolgreich gespeichert!</div>';
	$log=logThem($_REQUEST['ID'],$_POST['table'],$plugin,'ins');
	exit();	
		}
	}
	else {
		$values="";
		$tmpname = $_FILES['bild']['tmp_name'];
 		if($tmpname !=""){
	   		if (file_exists($tmpname) == 1) {
	    	$picture=$_SESSION['user_id']."_".$_FILES['bild']['name'];
	    	$foto = "../upload/images/".$picture;
	    	$foto = "../upload/images/".$picture;
			if(filesize($tmpname) > 500000000) {
				die('File to big.');
			} else {
				move_uploaded_file ($tmpname,$foto);
			}
			}
			$values .= ",`bild`='".$picture."'";
		}
		$tmpname = $_FILES['datei']['tmp_name'];
 		if($tmpname !=""){
	   		if (file_exists($tmpname) == 1) {
	    	$dname=$_FILES['datei']['name'];
	    	$laden = "../upload/files/".$dname;
	    	if(filesize($tmpname) > 500000000) {
				die('File to big.');
			} else {
				move_uploaded_file ($tmpname,$laden);
			}
			}
			$values .= ",`datei`='".$dname."'";
		}
		foreach ($_POST as $key => $val)
		{
		if ($key == "table" || $key == $id_name || $key == "id_name" || $key == "save" ) { continue; }
			if($key == "passwort") {
				if($val != "test") {
					$prüf=prüfen($table,$key,$val);
					if($prüf != 'OK'){
						$error=true;
						echo '<div class="box_fehler">'.$prüf.'</div>';
						die();
					}
					$values .= ",`$key`='".md5($val)."'";
				}
			}
			else {
				if(is_array($val)) {
					$mysel = '';
					for($j=0;$j<sizeof($val);$j++){
						$mysel .= $val[$j].',';
					}
					$values .= ",`$key`='".$mysel."'";
				} else {
					if($key=="datum") {if($val=="" or $val=="00-00-0000") {$val=date("Y-m-d");} else {$val=usdatum($val);}}
					$prüf=prüfen($table,$key,$val);
					if($key == 'plugin') {$plugin=$val;}
					if($table != 'kategorie'){
					if($prüf != 'OK'){
						$error=true;
						echo '<div class="box_fehler">'.$prüf.'</div>';
						die();
					}}
					$values .= ",`$key`='".$val."'";}
			}
		}
	$values = substr($values,1);
	//Fehler abfangen
	$q = mysqli_query($GLOBALS['DB'],"SELECT * FROM ".$table." WHERE $id_name=".$id);
	$fields_cnt = mysqli_num_fields($q);
	for($j = 0; $j < $fields_cnt; $j++) {
		$name = mysqli_field_name ($q,$j);
		$flags2 = mysqli_field_flags($q,$j);
		if(xeregi('not_null',$flags2) && $_REQUEST[$name] =="") {
			$error=true;
			echo '<div class="box_fehler">Bitte '.ucfirst($name).' eingeben.</div>';}
	}
	if($error==false) {
	$query = "UPDATE `".$_POST['table']."` SET $values WHERE $id_name=".$id;
	mysqli_query($GLOBALS['DB'],$query);		
	echo '<div class="box_erfolg">Daten wurden erfolgreich gespeichert!</div>';
	$log=logThem($id,$_POST['table'],$plugin,'update');}
	exit();
	}
	
}
if ((int)$_GET['delete']>0) {
	mysqli_query($GLOBALS['DB'],"DELETE FROM ".$_GET['deltab']." WHERE ".$_GET['xid']."=".(int)$_GET['delete']);
}
if($_REQUEST['ID']) {$title='ID '.$_REQUEST['ID'].' von Tabelle: '.$table.' bearbeiten';} else {$title='Neue ID von Tabelle: '.$table.' anlegen';}
?>
<h1><?php echo ucfirst($title); ?></h1>
<form method="POST" name="form1" enctype="multipart/form-data" name="uedit">
<input type="hidden" name="table" value="<?php echo $table; ?>" />
<table>
<tbody>
<tr>
<?php 
if($abfrage !="") {
	$q = mysqli_query($GLOBALS['DB'],"SELECT * FROM ".$table." WHERE $abfrage");}
else {
	$q = mysqli_query($GLOBALS['DB'],"SELECT * FROM ".$table);}
//Tabellen Kommentar holen
$comment=mysqli_query($GLOBALS['DB'],"show full columns from ".$table);
while($com=mysqli_fetch_array($comment)){
	$sp_com[] = $com['Comment'];
}
	$fields_cnt = mysqli_num_fields($q);
		if($r = @mysqli_fetch_row($q)){
				do {
					$z=0;
                    for($j = 0; $j < $fields_cnt; $j++) {
					$type = mysqli_field_type($q, $j);					
					$name = mysqli_field_name ($q,$j);
					if($_REQUEST['ID'] && $table == 'sioux7_tables' && $name == 'titel'){
						$myq=mysqli_query($GLOBALS['DB'],"SELECT * FROM ".$r[$j]);
						$myfields_cnt = mysqli_num_fields($myq);
						for($k = 0; $k < $myfields_cnt; $k++) {
							$myfields[] = mysqli_field_name ($myq,$k);
						}
					}
					$flags[$j] = mysqli_field_flags($q,$j);
					if(xeregi('not_null',$flags[$j])) {$pflicht[$j]=1;}					
					$len = mysqli_field_len ($q,$j);
					
					$enum=enum_select($table, $name);
					if($_REQUEST[$name]) {if(is_array($_REQUEST[$name])) {$r[$j]=implode(',',$_REQUEST[$name]);} else {$r[$j]=$_REQUEST[$name];}}
					if(array_key_exists($name,$hiddenFields)) {
					echo '<INPUT type="hidden" NAME="'.$name.'" value="'.$hiddenFields[$name].'" />';
   						}
					else if($type=="3" && xeregi('_id', $name)) {
						echo '
						<INPUT type="hidden" NAME="'.$name.'" value="';
						if(!$_REQUEST['ID']) {echo $r[$j];} else { echo $_REQUEST['ID'];};
						echo '" /><INPUT type="hidden" NAME="id_name" value="'.$name.'" />';
						} 
					else if($type=="3" || $type=="5") {
						
						if($len ==1) {$typ="checkbox";} else {$typ="number";}
						?>
						<TD bgcolor="#E6EFFF">
							<b><?php echo ucfirst($name); if($sp_com[$j] !="") echo "<br>".$sp_com[$j]; if($pflicht[$j]==1) echo " * "; ?>:</b></TD>
						 <TD>
                         <?php if($typ=="checkbox") { ?>
                         <input type="hidden" name="<?php echo $name; ?>" value="0" />
                         <?php } ?>
							<INPUT type="<?php echo $typ; ?>" NAME="<?php echo $name; ?>" value="<?php if($typ=="checkbox") { echo "1"; } else {echo $r[$j]; } ?>" <?php if($typ=="checkbox" && $r[$j] == 1) { echo " checked=checked"; } ?><?php if($name=="ismodul" ) { echo " onclick='this.form.submit ();'"; } ?>/>   
                        </TD>
					 <?php 
					
					 print "</tr><tr>"; $z=0;
						} 
						
						else if(sizeof($enum) > 1) {
							if($enum[0] == "table") {
								$qt = "SELECT * FROM ".$enum[1];
								$resultt = mysqli_fetch_assoc(mysqli_query($GLOBALS['DB'],$qt));
								$feld = $enum[4];
								$wert=explode(',',$r[3]);
								?>
                         <TD bgcolor="#E6EFFF">
							<b><?php echo ucfirst($enum[2]); if($sp_com[$j] !="") echo "<br>".$sp_com[$j]; if($pflicht[$j]==1) echo " * "; ?>:</b>
						</TD>
						<?php
						if($enum[3] == "multi") {
						?>
							 <TD>
								<select name="<?php echo $enum[2]; ?>[]" size=3 multiple="multiple" >
								<?php 
								echo mykat($enum[1],0); 
								?>
								</select>
							 </TD>
						<?php } else { ?>
							<TD>
								<select name="<?php echo $enum[2]; ?>" >
								<?php 
								echo mykat($enum[1],0); 
								?>
								</select>
							 </TD>
							<?php }} else if($enum[0]=="myselect"){	
							if($enum[1]=="table"){ ?>
							<TD bgcolor="#E6EFFF">
								<b><?php echo ucfirst($name); if($sp_com[$j] !="") echo "<br>".$sp_com[$j]; if($pflicht[$j]==1) echo " * "; ?>:</b>
						 	</TD>
							<TD>
								<?php if($enum[5]!="multi") { 
								$k=$r[$j-1];
								?>
						
								<select name="<?php echo $enum[3]; ?>" >
								<?php 
								$strSQL = "SELECT * FROM ".$enum[2]." ORDER BY ".$enum[4];
								$dbQuery = mysqli_query($GLOBALS['DB'],$strSQL);
								echo "<option value=''>bitte waehlen</option>";
								while($arrKat = mysqli_fetch_array($dbQuery)){
									if($arrKat[0] != 0) {
										$inhalt=$arrKat[2];
										
										echo "<option value='".$arrKat[$enum[4]]."'";
										if($arrKat[$enum[4]]== $k) {echo " selected style='background-color: #CCDDFF;'";}
										echo ">".$arrKat[3]."</option>\n";	}
										print_r($arrKat);		
								} ?>
								</select>
								<small>Field-Number 3 should by Name</small>								
								<?php
								}  else { ?>
								<select name="<?php echo $enum[3]; ?>[]" size=3 multiple="multiple" >
								<?php 
								$k=$r[$j-1];
								$tr=explode(',',$k);
								if($enum[2] == 'tables') {$qw=" WHERE rights <='".$_SESSION['right']."'";}
								$strSQL = "SELECT * FROM ".$enum[2].$qw." ORDER BY ".$enum[4];
								$dbQuery = mysqli_query($GLOBALS['DB'],$strSQL) or die(mysql_error());
								while($arrKat = mysqli_fetch_array($dbQuery)){
									if($arrKat[0] != 0) {
										echo "<option value='".$arrKat[$enum[4]]."'";
										if(in_array($arrKat[$enum[4]],$tr)) {echo " selected style='background-color: #CCDDFF;'";}
										echo ">".$arrKat[$enum[4]]."</option>\n";	}		
								}
								}
								if(!$tr) {
								?>
								</select>
								<script>
								$("select[name=<?php echo $enum[3]; ?>]").change(function () {
								  var str = "";
								  $("select option:selected").each(function () {
										str += $(this).text() + " ";
									  });
								  $("textarea[name=<?php echo $enum[6]; ?>]").val(str);
								})
								</script>
							 </TD>
							<?php }} else {
							?>
						<TD bgcolor="#E6EFFF">
							<b><?php echo ucfirst($name); if($sp_com[$j] !="") echo "<br>".$sp_com[$j]; if($pflicht[$j]==1) echo " * "; ?>:</b></TD>
						 <TD>
							<?php for($i=1;$i<sizeof($enum);$i++) { ?>
							<input type="radio" value="<?php echo $enum[$i]; ?>" name="<?php echo $name; ?>"<?php if($enum[$i] == $r[$j]) {print " CHECKED";} ?> ><?php echo ucfirst($enum[$i]); ?>
							<?php } ?>
                         </TD>
						 <?php }} else if($enum[0]=="ext"){ 
							if($_REQUEST['ID'] !=0 && $enum[1]!="") {
						 ?>
							 <TD>
								 <h3>Inhalt verwalten</h3>
								<img src="images/icon_add.gif" id="multi" title="neuer Datensatz"> Neu&nbsp;<img src="images/reload.png" id="reload" title="Reload Seite"> Laden
							 </TD>
						 <?php
							$_SESSION['iTab']=$enum[1];
							$_SESSION['xID']=$enum[2];
							$_SESSION['xname']=$_REQUEST['name'];
							$_SESSION['levelID']=$_REQUEST['ID'];
							echo "</tr><tr><td colspan=4><strong>".ucfirst($enum[1]).": </strong><hr><div id='xinhalt'></div></td></tr><tr>";
							
							}} else if(!strstr($name,'_nav')){
						 ?>
							<TD bgcolor="#E6EFFF">
								<b><?php echo ucfirst($name); if($sp_com[$j] !="") echo "<br>".$sp_com[$j];if($pflicht[$j]==1) echo " * "; ?>:</b></TD>
							 <TD>
								<select name="<?php echo $name; ?>" >
								<?php for($i=0;$i<sizeof($enum);$i++) { ?>
								<option value="<?php echo $enum[$i]; ?>" <?php if($enum[$i] == $r[$j]) {print " SELECTED";} ?> ><?php echo ucfirst($enum[$i]); ?></option>
								<?php } ?>
								</select>
								</TD>
						 <?php 
							}
					
					  print "</tr><tr>"; $z=0;
					} 
					
					else if($type=="253" && sizeof($enum) ==0 && $name != "datei" && $name != "plugin" && $name != "sortfield") {
						if(xeregi('passwort', $name)) {$typ="password"; $pw="test";} 
						else if(xeregi('bild', $name)) {$typ="file";$acceppt="accept='image/*'";}
						else if($len ==1) {$typ="checkbox";}
						else {$typ="text";}
						if(xeregi('_'.$_SESSION['lang'],$name) || !xeregi('_',$name)) {
						?>
						
						 <TD bgcolor="#E6EFFF" valign="top">
							<b><?php echo ucfirst($name); if($sp_com[$j] !="") echo "<br>".$sp_com[$j];if($pflicht[$j]==1) echo " * "; ?></b></TD>
						 <TD>
							<INPUT type="<?php echo $typ; ?>" name="<?php echo $name; ?>" value="<?php if($typ =="password"){ echo $pw;} else {echo $r[$j];} ?>" class="ganze_breite" <?php echo $acceppt; ?>/>
                         <?php } if($typ=="file") { 
						 if (file_exists("../upload/images/".$r[$j]) == 1 && $r[$j] !="") {?>
                         	 <br />
							 <a href="../upload/images/<?php echo $r[$j]; ?>" target="_blank"><img src="../upload/images/<?php echo $r[$j]; ?>" alt="Profilbild" width="75" height="75" border="0" style="float: left;" /></a><br />
								<?php
								$size = filesize("../upload/images/".$r[$j]);
								if ($size > 2*1048576) {
									$size = round($size / 1048576)."MiB";
								} else if ($size > 2048) {
									$size = round($size / 1024)."kiB";
								} else if ($size < 2048) {
									$size = $size." Bytes";
								}
								echo $size."<br>";
								$imgsize = getimagesize("../upload/images/".$r[$j]);
								echo $imgsize[0]." x ".$imgsize[1]." ".$imgsize['mime']."<br>";
								$datum = date("d.m.Y", filectime("../upload/images/".$r[$j]));
								echo $datum;
								?>
              			  <?php }
						  else { ?>
                          <br />
							 <img src="../upload/images/test.jpg" alt="Beispielbild" width="75" height="75" border="0" style="float: left;" /><br />
								25KB - 75x75 Original<br />
								  26.06.2010        
              			<?php }} ?>
                          </TD>
						
					  <?php 
					  
					   print "</tr><tr>"; $z=0;
					  } else if($type==10) {
						?>
						<TD VALIGN="top"  bgcolor="#E6EFFF">
							<b><?php echo ucfirst($name); if($sp_com[$j] !="") echo "<br>".$sp_com[$j];if($pflicht[$j]==1) echo " * "; ?></b></TD>
						 <TD>
							<input type="text" name="<?php echo $name; ?>" size=20 value="<?php if($r[$j] == "") {echo date("d-m-Y");} else {echo datum($r[$j]);} ?>" id="von" readonly>&nbsp;
							<script type="text/javascript">// <![CDATA[
								new tcal ({
								// form name
								'formname': 'form1',
								// input name
								'controlname': '<?php echo $name; ?>'
								});
								// ]]>
								</script>
						</td>
					  <?php 
					   
					   print "</tr><tr>";
					   } else if($name=="datei") {
						?>
						<TD VALIGN="top"  bgcolor="#E6EFFF">
							<b><?php echo ucfirst($name); if($sp_com[$j] !="") echo "<br>".$sp_com[$j];if($pflicht[$j]==1) echo " * "; ?></b></TD>
						 <TD valign="top">
							<input type="file" name="<?php echo $name; ?>" size=10 value="" accept="application/*">
							<?php
							if (file_exists("../upload/files/".$r[$j]) == 1 && $r[$j] !="") {
								echo "<br>geladen: ".$r[$j];
							}
							?>
						</td>
					  <?php 
					  } else if($name=="plugin") { ?>
					   <TD VALIGN="top"  bgcolor="#E6EFFF">
							<b><?php echo ucfirst($name); if($sp_com[$j] !="") echo "<br>".$sp_com[$j];?></b></TD>
						<?php 					   	
   						print "<td><select name='".$name."'>";
						$dirname = "../plugin/";
						if (is_dir($dirname)) {
							$dirhandle = opendir($dirname);
							print "<option value=''></option>";
							while ($file = readdir($dirhandle)) {							
							if($file != '.' && $file != '..'){
									print "<option value='$file'";
									if($r[$j] == $file) print "selected";
									print ">$file</option>";
								}
							}
							closedir($dirhandle);
						}
						print "</select></td>";  
					   
					    print "</tr><tr>"; 
					  } else if($type=="252") {
						
						?>
						<tr>
						 <TD VALIGN="top"  bgcolor="#E6EFFF">
							<b><?php echo ucfirst($name); if($sp_com[$j] !="") echo "<br>".$sp_com[$j];if($pflicht[$j]==1) echo " * "; ?></b></TD>
						 <TD colspan=3>
							<textarea name="<?php echo $name; ?>" rows=5 cols=80 class="ganze_breite2"><?php echo  stripslashes($r[$j]); ?></textarea></TD>
						</tr>
					  <?php 
						} else if($name=="sortfield") {
						
						?>
						<tr>
						<TD VALIGN="top"  bgcolor="#E6EFFF">
							<b><?php echo ucfirst($name); if($sp_com[$j] !="") echo "<br>".$sp_com[$j];if($pflicht[$j]==1) echo " * "; ?></b></TD>
						 <TD VALIGN="top"  bgcolor="#E6EFFF">
						 <select name="<?php echo $name; ?>" >
						 <?php for($i=0;$i<sizeof($myfields);$i++) { ?>
						 <option value="<?php echo $myfields[$i]; ?>" <?php if($myfields[$i] == $r[$j]) {print " SELECTED";} ?> ><?php echo ucfirst($myfields[$i]); ?></option>
						 <?php } ?>
						 </select>							
						 </TD>
						</tr>
					  <?php 
					}}
				} while($r = @mysqli_fetch_row($q)); 
		}
?>
<tr>
	<td colspan=3 align="left"><input type="submit" name="save" value="speichern" /></td>
</tr>
</tbody>
</table>
</form>
<?php
function mykat($table, $intStart, $pos=0, $strEinrueckung="&nbsp;"){
	global $wert, $feld;
	$strSQL = "SELECT * FROM ".$table." WHERE parent=".$intStart." ORDER BY rang";
	$dbQuery = mysqli_query($GLOBALS['DB'],$strSQL) or die(mysql_error());
	while($arrKat = mysqli_fetch_assoc($dbQuery)){
		$strReturn.="<option value='".$arrKat[$feld]."'";
		if(in_array($arrKat[$feld],$wert)) {$strReturn.= " selected style='background-color: #CCDDFF;'";}
		$strReturn.=">".str_repeat($strEinrueckung, $pos)."&lfloor;&nbsp;".$arrKat['titel']."</option>\n";
		$strSQL2 = "SELECT * FROM ".$table." WHERE parent=".$arrKat[$feld]." ";
		if($arrKat[$feld] != 0) {
			$unter=mysqli_query($GLOBALS['DB'],$strSQL2);
			if(mysqli_num_rows($unter)>0) $strReturn.= mykat($table,$arrKat[$feld],$pos+2,$strEinrueckung);
		}
	}
	return $strReturn;
}
function usdatum($dat){
	$dat = explode("-", $dat);
	$dat = array_reverse($dat);
	$dat = implode("-", $dat);
	return $dat;
}
function datum($dat){
	$datetime = explode(" ",$dat);
	$dat = explode("-",$datetime[0]);
	$dat = array_reverse($dat);
	$dat = implode("-", $dat);
	return $dat;
}
function prüfen($tab,$nam,$in){
	 if($tab=='kategorie' && $nam=='titel'){
		$pr="SELECT ".$nam." FROM ".$tab." WHERE ".$nam."='".$in."'";
		$mret=mysqli_num_rows(mysql_query($GLOBALS['DB'],$pr));
		if($mret>=1){ $ret='Kategorie ->'.$in.' : Bereits vorhanden.';} else {$ret='OK';}
	 }
	if($tab=='admin' && $nam=='email'){
		if (xeregi("^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+\.([a-zA-Z]{2,3})$",$in)){
			$ret='OK';
		} else {
			$ret='email ->'.$in.' : nicht g&uuml;tig.';
		}
	}
	if($tab=='admin' && $nam=='passwort' && $in!='test'){
		if (!preg_match("#.*^(?=.{5,20})(?=.*[a-z])(?=.*[0-9]).*$#", $in)){
			$ret='passwort ->'.$in.' : nicht g&uuml;tig. Bitte Buchstaben und Zahlen.';
		} else {
			$ret='OK';
		}
	}
 if(!$ret) {$ret='OK';}
 return $ret;
}
function wysiwyg() {
return '<script language="javascript" type="text/javascript" src="editor/jscripts/tiny_mce/tiny_mce.js"></script><script language="javascript" type="text/javascript">tinyMCE.init({
mode : "textareas",
		forced_root_block : "",
		theme : "advanced",
		plugins : "save,emotions,preview,searchreplace",
		theme_advanced_buttons2_add : "preview,forecolor,backcolor,search,replace,emotions",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "center"});</script>';
}
function logThem($id,$tab,$art){
	// SystemProtokoll
	if($art=="ins") {$what=" neu angelegt.";} else {$what=" ge&auml;ndert.";}
	$_syslog=" ID:".$id." von ".$tab." ".$what;
	$heute=date("Y-m-d");
	$insert="INSERT INTO sioux7_sysprotokoll (dom_id,user_id,datum,syslog) VALUES ('".$_SESSION['DOM']."','".$_SESSION['user_id']."','".$heute."','".$_syslog."')";
	$res=mysqli_query($GLOBALS['DB'],$insert);
}
?>
<div id="Vorschau" title="<?php echo $_SESSION['iTab']; ?>>" style="display:none; background: #FFF; border: 1px solid #006; overflow-y: auto; overflow-x: hidden">
	<iframe src="multiinhalt.php?level=<?php echo $_REQUEST['ID']; ?>&iTab=<?php echo $_SESSION['iTab']; ?>&xid=<?php echo $_SESSION['xID']; ?>" width=790 height=600></iframe>
</div>