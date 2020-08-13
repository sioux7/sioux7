<?php
$tmpname = $_FILES['anlage']['tmp_name'];
if($tmpname !=""){
	if (file_exists($tmpname) == 1) {
	    $zipfile=$_FILES['anlage']['name'];
	    $up = "../sioux7cache/".$zipfile;
	    move_uploaded_file ($tmpname,$up) or die("Fehler");
	}
}

if(!isset($_REQUEST['op'])) $op="settings";


if($op=='settings')
{
print("<center><table width=500><form method='POST' action='start.php?seite=grundupdate&op=aendern' enctype='multipart/form-data'>");
print ("<tr><td class='normal'><b>Wichtig: das Verzeichnis /tmp muss auf chmod 777 stehen!</b>");
print ("<br>Urbans Updater l&auml;d eine ZIP File per FTP in ein Verzeichnis rauf und installiert die gew&uuml;nschte Struktur. Der Gebrauch dieser Anwendung sollte vorsichtig genutzt werden.");
print ("<br><b>Datei mit Update ( ZIP ): </b>");
print ("<input type='file' name='anlage'><br><br>");
print(" <p align='right'><input type='submit' value='laden!' name='speichern'></p>");
print(" </form></table></center> ");
}


if($_REQUEST['op']=='aendern')
{
print("<center><table width=500>");
print ("<tr><td class='normal'>Die Updatedatei wurde geladen.<br>--><a href='../install.php?datei=".$zipfile."'>weiter zum Update</a>");
print(" </form></table></center> ");
 
}
?>