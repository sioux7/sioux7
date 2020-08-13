<?php 
error_reporting(E_NONE);
$basisdatei = fopen('../newsletter/newsletter.html','r');
$basisdatei = fopen("../newsletter/newsletter.html",'r') or die("Konnte nicht lesen");
while($line = fgets($basisdatei,1000)){ $body.=$line; }
if($_REQUEST['op']=='')
{	
	print("<center><table border=0 width='100%'>");
	print("<tr>");
	print(" <form method='POST' action='start.php?seite=grundnewsletter&op=aendern'>");
	print("<tr><td><textarea name='ntext' rows=100 cols=80 class='ganze_breite2'>".htmlspecialchars($body)."</textarea></td></tr> ");
	print("<tr><td><p align='right'><input type='submit' value='&auml;ndern' name='speichern'></p></td></tr> ");
	print(" </form> ");
	print("</table>");
}
if($_REQUEST['op']=='aendern')
{
 // schreiben
 $basishandler = fopen('../newsletter/newsletter.html',"w");
 fputs($basishandler, $ntext); 
 //Done
 echo "Changed";
}
fclose($basisdatei);
?>