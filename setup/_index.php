<html>
<head>
	<title>Urbans Installer Setup Routine: Basis</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
<?php
if(!isset($_REQUEST['op'])) $op="settings";
chmod('../sioux7conf/globals.inc.php',0777);
$basisdatei = fopen('../sioux7conf/globals.inc.php','r');
$i=0;
$bnchange = "&auml;ndern";
$bnreset = "Zur&uuml;cksetzen";

###########	##############	#############	##############	######## Startseite

while($i<12)
{
$line = fgets($basisdatei,1000);
if(eregi('domain_title',$line)) 		{ $zserver = $line; $zeile['domain_title'] = $i; }
if(eregi('domain_descr',$line)) 		{ $zdescr = $line; $zeile['domain_descr'] = $i; }
if(eregi('info',$line)) 		{ $zmail = $line; $zeile['info'] = $i; }
if(eregi('template',$line)) 		{ $ztemp = $line; $zeile['template'] = $i; }
if(eregi('startseite',$line)) 		{ $ztemp = $line; $zeile['startseite'] = $i; }
if(eregi('mu',$line)) 		{ $zmu = $line; $zeile['mu'] = $i; }
if(eregi('mailhost',$line)) 		{ $zmailhost = $line; $zeile['mailhost'] = $i; }
if(eregi('mailuser',$line)) 		{ $zmailuser = $line; $zeile['mailuser'] = $i; }
if(eregi('mailpw',$line)) 		{ $zmailpw = $line; $zeile['mailpw'] = $i; }
$i++;
}

print("<center><table>");

if($_REQUEST['op']=='')
{
print("<tr><td colspan=2><b>Urbans Installer Step 1: Default settings</b><br>Die Datei include/user.inc.php muss schreibbar sein.</td></tr><tr>");
print(" <form method='POST' action='index.php?op=aendern'>");
print("<input type=hidden name=file value='".$file."'>");

$start = strpos($zserver,'"')+1;
$ende = strrpos($zserver,'"');
$lng  = $ende - $start;
$aserver = substr($zserver,$start,$lng);
print(" <td bgcolor='#d3d3d3'><b>Domain Titel : </b></td> ");
print(" <td><input type='text' name='nserver' size='40' value='".$aserver."'><br></td> ");
print("</tr><tr>");
$start = strpos($zdescr,'"')+1;
$ende = strrpos($zdescr,'"');
$lng  = $ende - $start;
$adescr = substr($zdescr,$start,$lng);
print(" <td bgcolor='#d3d3d3'><b>Domain Beschreibung : </b></td> ");
print(" <td><input type='text' name='ndescr' size='40' value='".$adescr."'><br></td> ");
print("</tr><tr>");
$start = strpos($zmail,'"')+1;
$ende = strrpos($zmail,'"');
$lng  = $ende - $start;
$amail = substr($zmail,$start,$lng);
print(" <td bgcolor='#d3d3d3'><b>allgemeine Mail : </b></td> ");
print(" <td><input type='text' name='nmail' size='40' value='".$amail."'><br></td> ");
print("</tr><tr>");
print(" <td bgcolor='#d3d3d3'><b>Template :</b></td>");
print ("<td><select name='ntemp'>");
		$dirname = "../template/";
		if (is_dir($dirname)) {
			$dirhandle = opendir($dirname);
			while ($file = readdir($dirhandle)) {
			if($file != '.' && $file != '..'){
				print "<option value='$file'";
				if($template == $file) print "selected";
				print ">$file</option>";}
			}
			closedir($dirhandle);
		}
print ("</select><br></td>");
print("</tr><tr>");
print ("</select><br></td></tr>");
$start = strpos($zmu,'"')+1;
$ende = strrpos($zmu,'"');
$lng  = $ende - $start;
$amu = substr($zmu,$start,$lng);
print(" <td bgcolor='#d3d3d3'><b>max. Upload : </b></td> ");
print(" <td><input type='text' name='nmu' size='40' value='".$amu."'><br></td> ");
print("</tr><tr>");
$start = strpos($zmailhost,'"')+1;
$ende = strrpos($zmailhost,'"');
$lng  = $ende - $start;
$amailhost = substr($zmailhost,$start,$lng);
print(" <td bgcolor='#d3d3d3'><b>MailHost : </b></td> ");
print(" <td><input type='text' name='nmailhost' size='40' value='".$amailhost."'><br></td> ");
print("</tr><tr>");
$start = strpos($zmailuser,'"')+1;
$ende = strrpos($zmailuser,'"');
$lng  = $ende - $start;
$amailuser = substr($zmailuser,$start,$lng);
print(" <td bgcolor='#d3d3d3'><b>MailUser : </b></td> ");
print(" <td><input type='text' name='nmailuser' size='40' value='".$amailuser."'><br></td> ");
print("</tr><tr>");
$start = strpos($zmailpw,'"')+1;
$ende = strrpos($zmailpw,'"');
$lng  = $ende - $start;
$amailpw = substr($zmailpw,$start,$lng);
print(" <td bgcolor='#d3d3d3'><b>MailPasswort : </b></td> ");
print(" <td><input type='text' name='nmailpw' size='40' value='".$amailpw."'><br></td> ");
print("</tr><tr>");

print("<tr><td colspn=2><p align='right'><input type='submit' value='&auml;ndern' name='speichern'></p></td></tr> ");
print(" </form> ");
print("</table>");
}
if($_REQUEST['op']=='aendern')
{
 $basis2 = file('../include/user.inc.php');
 // Zeilenposition
 $server = $zeile['domain_title'];
 $descr = $zeile['domain_descr'];
 $info = $zeile['info'];
 $template = $zeile['template'];
 $startseite = $zeile['startseite'];
 $mu = $zeile['mu'];
 $mailhost = $zeile['mailhost'];
 $mailuser = $zeile['mailuser'];
 $mailpw = $zeile['mailpw'];
   
 // Inhalt
 $basis2[$server] = '$domain_title="'.$_REQUEST['nserver'].'";'."\n";
 $basis2[$descr] = '$domain_descr="'.$_REQUEST['ndescr'].'";'."\n";
 $basis2[$info] = '$info="'.$_REQUEST['nmail'].'";'."\n";
 if ($_REQUEST['ntemp'] =="") {
 	$basis2[$template] = '$template="default";'."\n";}
 else {
	 $basis2[$template] = '$template="'.$_REQUEST['ntemp'].'";'."\n";}
 $basis2[$startseite] = '$startseite=14;'."\n";
 $basis2[$mu] = '$mu="'.$_REQUEST['nmu'].'";'."\n";
 $basis2[$mailhost] = '$mailhost="'.$_REQUEST['nmailhost'].'";'."\n";
 $basis2[$mailuser] = '$mailuser="'.$_REQUEST['nmailuser'].'";'."\n";
 $basis2[$mailpw] = '$mailpw="'.$_REQUEST['nmailpw'].'";'."\n";

 // schreiben
 $basishandler = fopen('../include/user.inc.php',"w");
 fputs($basishandler, implode("", $basis2));
 
 print("<b> <center><table><tr><td>Die &Auml;nderungen wurden vorgenommen<br><a href='database.php'>.. weiter zum DatenbankSetup</a></tr></td></table></center> </b> ");

 
 
}

fclose($metadatei);
chmod('../include/user.inc.php',0444);
?>
</body>
</html>