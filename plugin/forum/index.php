<?php
print '<script type="text/javascript" src="plugin/forum/js/bbtag.js"></script>';
$farbengeber=1;
if(!isset($_REQUEST['what'])) {$what="start";} else {$what=$_REQUEST['what'];};
switch($what){
case "start":
$sql_antwort = "select * from sioux7_forum_antwort order by datum desc, uhrzeit desc";
$result_antwort = mysqli_query($GLOBALS['DB'],$sql_antwort);
print "<table>  <tr> 
    <td align='center'> 
    <b>Forum auf ".DOM."</b>
    </td>
  </tr>
  <tr>
  	<td><b>Letzter Eintrag</b></td>
  </tr>";
$row = mysqli_fetch_array($result_antwort);
print "  
        <tr>
          <td> 
             von  ".$row[4]." :            
          </td>
         </tr>
         <tr>
          <td>
            ".BBCode($row[3])."
           </td>
        </tr>";
print "</table>";
$sql_thema = "select * from sioux7_forum_thema WHERE dom_id=".$_SESSION['DOM']." AND forum_id <> 0 order by datum DESC,uhrzeit DESC";
$result_thema = mysqli_query($GLOBALS['DB'],$sql_thema);
$anzahl_thema=mysqli_num_rows($result_thema);
print "
<table border=0 width=500 cellspacing=5 cellpadding=5>
  <tr>
    <td>
    <div style=\"float:right\">
    <form action='".$_GET['kategorie'].".html' method='get'>
    <input type='hidden' name='what' value='suche'>
	Suche: <input name='suche' type='text' value='' size=20>&nbsp;<input type='submit' value='suchen'>
	</form>
	</div>
    </td>
</tr>
  <tr>
    <td>
	<a href='".$_GET['kategorie'].".html?what=new'>&raquo; Neuer Beitrag</a> </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>";
      if($anzahl_thema==1){
      print "Zur Zeit befindet sich ".$anzahl_thema." Beitrag im Forum.";
      } else {
       print "Zur Zeit befinden sich ".$anzahl_thema." Beitr&auml;ge im Forum.";
      } 
  print "</td>
  </tr>
</table>
<table border=0 width=500 cellspacing=0 cellpadding=0>
  <tr> 
    <td> 
      <table width=500 cellspacing=0 cellpadding=0>       
      <tr> 
          <td bgcolor='lightgrey'> 
            <b>Beitrag</b>
          </td>
          <td bgcolor='lightgrey'> 
            <b>Autor</b>
          </td>
          <td bgcolor='lightgrey'> 
            <b>Antworten</b>
          </td>
          <td bgcolor='lightgrey'> 
            <b>&Auml;nderung</b>
          </td>
        </tr>";
$zaehler=0;
while($row = mysqli_fetch_array($result_thema)){
       $farbengeber++;
       $startdatum=make_date($row['datum']);
       $sql_anzahl_antwort="select * from sioux7_forum_antwort where connector='$row[0]'";
       $result_anzahl_antwort = mysqli_query($GLOBALS['DB'],$sql_anzahl_antwort);
       $anzahl_antwort=mysqli_num_rows($result_anzahl_antwort);

       if($farbengeber%2==0){
           $farbe='lightblue';
       }else{
           $farbe='lightgrey';
       }

print "<tr> 
          <td bgcolor=".$farbe.">
		    <a href='".$_GET['kategorie'].".html?fid=". $row[0]."&what=antwort&thema=".$row['thema']."&isClosed=".$row['isClosed']."' title=\"Antwort\"><i class=\"fa fa-angle-right\" aria-hidden=\"true\"></i>
 ".$row['thema']."
            </a></td>
          <td bgcolor=".$farbe.">";
          if(trim($row['email']) !="" and xeregi("@",$row['email'])){
		print "<a href='mailto:".$row['email']."'><i class='fa fa-envelope' aria-hidden='true'></i>
</a>&nbsp;";}
  print $row['membername']."</td>
          <td bgcolor=".$farbe.">".$anzahl_antwort."
          </td>
          <td bgcolor=".$farbe."> 
           ".$startdatum."
          </td>
        </tr>";
        
$zaehler++;
}
print "</table>
    </td>
</tr>
</table>";
break;
case "new":
if(!isset($_REQUEST['submit'])){
print "<table border=0 width=550 cellspacing=5 cellpadding=5>
    <tr> 
    <td align='left'>
      Zum Erstellen eines en 
      Beitrags f&uuml;llen Sie bitte das folgende Formular aus und klicken auf 
      Abschicken. Als Name k&ouml;nnen Sie ein Pseudonym verwenden.<br>
        
      </td>
  </tr>
</table>
<form  action='".$_GET['kategorie'].".html' method='POST' name='form'>
<input type='hidden' name='what' value='new'>
  <table border=0 width=500 cellspacing=2 cellpadding=2>
    <tr> 
      <td align='left'>Name: 
        </td>
      <td align='left'> 
        <input type='text' name='forum_name'>
        </td>
    </tr>
    <tr> 
      <td align='left'>Email: 
        </td>
      <td align='left'> 
        <input type='text' name='email'>
        </td>
    </tr>
    <tr> 
      <td align='left'>&Uuml;berschrift:</td>
      <td align='left'> 
        <input type='text' name='thema'>
      </td>
    </tr>
    <tr> 
      <td valign='top'align='left'>
	  Beitrag
	  </td>
	  <td>
	 <table border=0><tr><td><img src='plugin/forum/images/bbcode/bbcode_bold.gif' alt='Fetter Text' title='Fetter Text' onclick='insertBBTag(\"[b]\",\"[/b]\")' style='cursor:pointer;' /><img src='plugin/forum/images/bbcode/bbcode_italic.gif' alt='Kursiver Text' title='Kursiver Text'  onClick=\"insertBBTag('[i]', '[/i]')\" style='cursor:pointer;' /><img src='plugin/forum/images/bbcode/bbcode_under.gif' alt='Unterstrichener Text' title='Unterstrichener Text'  onClick=\"insertBBTag('[u]', '[/u]')\" style='cursor:pointer;'' />	
<img src='plugin/forum/images/bbcode/bbcode_quote.gif' alt='Quote' title='Quote'  onClick=\"insertBBTag('[quote]', '[/quote]')\" style='cursor:pointer;'' />			
<img src='plugin/forum/images/bbcode/bbcode_url.gif' alt='URL einf&uuml;gen' title='URL einf&uuml;gen' onClick=\"insertBBTag('[a]http://www.domain.de[-a-]', 'Name[/a]')\" style='cursor:pointer;' /><img src='plugin/forum/images/bbcode/bbcode_mail.gif' alt='E-Mail einf&uuml;gen' title='E-Mail einf&uuml;gen' onClick=\"insertBBTag('[e]name@domain.de[-e-]', 'Name[/e]')\" style='cursor:pointer;' /><img src='plugin/forum/images/bbcode/bbcode_img.gif' alt='Bild einf&uuml;gen' title='Bild einf&uuml;gen' onClick=\"insertBBTag('[img]', '[/img]')\" style='cursor:pointer;' /></td></tr>
	  <tr>																																				
      <td align='left'> 
        <textarea cols='45' name='beitrag' rows=10></textarea>
      </td>
	  </tr>
	  <tr>
          <td align='left'>
            <img src='libary/captcha/CaptchaSecurityImages.php?width=100&height=40&characters=5' />
	    <label for='security_code'>Security Code: </label><input id='security_code' name='security_code' type='text' />
          </td>
        </tr>
	  </table>
	  </td>
    </tr>
    <tr> 
       <td colspan=2 align='center'> 
        <input type='submit' value='Abschicken' name='submit'>
         </td>
    </tr>
  </table>
</form>";
	}
else {
if(trim($_REQUEST['forum_name']) =="" or strlen($_REQUEST['forum_name'])<5) {
	$msg_forum.="Neues Thema: Name, Vorname fehlt oder ist zu kurz<br>";}
else if(trim($_REQUEST['thema']) =="" or strlen($_REQUEST['thema'])<3) {
	$msg_forum.="Neues Thema: Kein Thema angegeben<br>";}
else if(trim($_REQUEST['beitrag']) =="" or strlen($_REQUEST['beitrag'])<5) {
	$msg_forum.="Neues Thema: Kein Beitrag angegeben<br>";}
else if( $_SESSION['security_code'] != $_REQUEST['security_code']  ) {
	$msg_forum.="Neues Thema: Sicherheitscode war falsch!<br>";}
else{
	$datum=date("Ymd");
	$uhrzeit=date("H:i:s");

	mysqli_query($GLOBALS['DB'],"INSERT INTO sioux7_forum_thema (dom_id,datum, uhrzeit, thema, beitrag, membername, email, isClosed) VALUES (".$_SESSION['DOM'].",
'".$datum."','".$uhrzeit."','".$_REQUEST['thema']."','".$_REQUEST['beitrag']."','".$_REQUEST['forum_name']."', '".$_REQUEST['email']."', 0)");
}
print"
<table border=0 width=500 cellspacing=0 cellpadding=0>
<tr> 
	<td>";
	if(isset($msg_forum)) {
	print "<font color='red'>".$msg_forum."</font>";}
	else {   
	 print "Der Beitrag wurde erfolgreich hinzugef&uuml;gt.<br>";}
 print "Klicken Sie bitte <a href='".$_GET['kategorie'].".html'>&raquo; hier</a> um auf die Startseite zur&uuml;ck zu gelangen.
</td>
</tr>
</table>";
}
break;
case "antwort":
print "<table border=0 width=500 cellspacing=5 cellpadding=5>";
if($_REQUEST['isClosed']==0){
print "
  <tr> 
    <td><a href='".$_GET['kategorie'].".html?fid=".$_REQUEST['fid']."&what=beitrag&thema=".$_REQUEST['thema']."'>&raquo; Beitrag 
      kommentieren</a></td>
  </tr>";
}
else {
print "
  <tr> 
    <td>Beitrag geschlossen.</td>
  </tr>";
}
print"
</table>";
$sql_thema = "select * from sioux7_forum_thema where forum_id=".$_REQUEST['fid']." order by datum desc, uhrzeit desc";
$result_thema = mysqli_query($GLOBALS['DB'],$sql_thema);
while($row = mysqli_fetch_array($result_thema)) {

$startdatum=make_date($row['datum']);
$thema=$row['thema'];
print "<table border=0 cellspacing=2 cellpadding=2 width=500>
        <tr> 
          <td bgcolor='lightgrey'>
            Datum: ".$startdatum." &nbsp; ".$row['uhrzeit']."
            </td>
          <td bgcolor='lightgrey'> 
            <b>Thema: ".$row['thema']."</b></td>
         </tr>
         <tr>
          <td valign='top' bgcolor='lightgreen'> 
              <b>Author: 
              ".$row['membername']."
              </b>
          </td>
          <td bgcolor='lightgreen'>
            ".BBCode($row['beitrag'])."
           </td>
        </tr>";
$sql_antwort = "select * from sioux7_forum_antwort where connector=".$_REQUEST['fid']." order by datum desc, uhrzeit desc";
$result_antwort = mysqli_query($GLOBALS['DB'],$sql_antwort);
$num=mysqli_num_rows($result_antwort);
if($num>=1){
while($row = mysqli_fetch_array($result_antwort)) {
$datum=make_date2($row['datum']);
print"   <tr> 
          <td bgcolor='lightgrey'>
            ".$datum."
            &nbsp; 
            ".$row[2]."
            </td>
          <td bgcolor='lightgrey'><b> 
            &nbsp; - Re: 
            ".$thema."
            </b></td>
        </tr>
        <tr>
          <td> 
             <b>
              ".$row['name']."
              </b>            
          </td>
          <td>
            ".BBCode($row['antwort'])."
           </td>
        </tr>";
}}
print "</table>";
}
break;
case "beitrag":
if(!isset($_REQUEST['submit'])){
print "<center><table border=0 width=500 cellspacing=5 cellpadding=5>
  <tr> 
    <td> 
      <b>Beitrag  kommentieren</b> 
    </td>
  </tr>
  <tr> 
    <td> 
          Zum 
          Kommentieren eines Beitrags f&uuml;llen Sie bitte das folgende Formular 
          aus und klicken auf &quot;Abschicken&quot;.<br>
          Ich kommentiere den Beitrag: <font color='red'>".$_REQUEST['thema']."</font>
     </td>
  </tr>
</table>
<form action='".$_GET['kategorie'].".html' method='POST' name='form'>
<input type=hidden name='what' value='beitrag'>
<input type=hidden name='fid' value='".$_REQUEST['fid']."'>
  <table border=0 width=500 cellspacing=2 cellpadding=2>
    <tr> 
      <td align='left'>Name: </td>
      <td align='left'><input type='text' name='beitrag_name'>
      </td>
    </tr>
    <tr> 
      <td valign='top'align='left'>Kommentar: </td>
	  <td>
	 <table border=0><tr><td><img src='plugin/forum/images/bbcode/bbcode_bold.gif' alt='Fetter Text' title='Fetter Text' onclick='insertBBTag(\"[b]\",\"[/b]\")' style='cursor:pointer;' /><img src='plugin/forum/images/bbcode/bbcode_italic.gif' alt='Kursiver Text' title='Kursiver Text'  onClick=\"insertBBTag('[i]', '[/i]')\" style='cursor:pointer;' /><img src='plugin/forum/images/bbcode/bbcode_under.gif' alt='Unterstrichener Text' title='Unterstrichener Text'  onClick=\"insertBBTag('[u]', '[/u]')\" style='cursor:pointer;'' /><img src='plugin/forum/images/bbcode/bbcode_quote.gif' alt='Quote' title='Quote'  onClick=\"insertBBTag('[quote]', '[/quote]')\" style='cursor:pointer;'' />	
<img src='plugin/forum/images/bbcode/bbcode_url.gif' alt='URL einf&uuml;gen' title='URL einf&uuml;gen' onClick=\"insertBBTag('[a]http://www.domain.de[-a-]', 'Name[/a]')\" style='cursor:pointer;' /><img src='plugin/forum/images/bbcode/bbcode_mail.gif' alt='E-Mail einf&uuml;gen' title='E-Mail einf&uuml;gen' onClick=\"insertBBTag('[e]name@domain.de[-e-]', 'Name[/e]')\" style='cursor:pointer;' /><img src='plugin/forum/images/bbcode/bbcode_img.gif' alt='Bild einf&uuml;gen' title='Bild einf&uuml;gen' onClick=\"insertBBTag('[img]', '[/img]')\" style='cursor:pointer;' /></td></tr>
	  <tr>																																				
      	   <td align='left'> 
           <textarea cols='45' name='beitrag' rows=10></textarea>
           </td>
	  </tr>
	<tr>
          <td align='left'>
            <img src='libary/captcha/CaptchaSecurityImages.php?width=100&height=40&characters=5' />
	    <label for='security_code'>Security Code: </label><input id='security_code' name='security_code' type='text' />
          </td>
        </tr>
	</table>
	</td>
    </tr>
    <tr>
      <td colspan=2>
        <input type='submit' value='Abschicken' name='submit'>
    </tr>
  </table></center>
</form>";
}
else {
if(trim($_REQUEST['beitrag_name']) =="" or strlen($_REQUEST['beitrag_name'])<2) {
	$msg_forum.="Name, Vorname fehlt oder ist zu kurz<br>";}
else if(trim($_REQUEST['beitrag']) =="" or strlen($_REQUEST['beitrag'])<10) {
	$msg_forum.="Kein Beitrag angegeben<br>";}
else if( $_SESSION['security_code'] != $_REQUEST['security_code']  ) {
	$msg_forum.="Sicherheitscode war falsch!<br>";}
else {
	$datum=date("Ymd");
	$uhrzeit=date("H:i:s");
	mysqli_query($GLOBALS['DB'],"INSERT INTO sioux7_forum_antwort (connector, datum, uhrzeit, antwort, name) VALUES ('".$_REQUEST['fid']."','$datum','$uhrzeit','".$_REQUEST['beitrag']."','".$_REQUEST['beitrag_name']."')");
}
print"
<table border=0 width=500 cellspacing=0 cellpadding=0>
<tr> 
	<td>"; 
	if(isset($msg_forum)) {
	print "<font color='red'>".$msg_forum."</font>";}
	else {   
	 print "Der Beitrag wurde erfolgreich hinzugef&uuml;gt.<br>";}   
   print " Klicken Sie bitte <a href='".$_GET['kategorie'].".html'>&raquo; hier</a> um auf die Startseite zur&uuml;ck zu gelangen.
	</td>
</tr>
</table>";
}
break;
case "suche":
$sql_suche = "select * from sioux7_forum_antwort where antwort LIKE '%".$_REQUEST['suche']."%' order by datum, uhrzeit desc";
$result_suche = mysqli_query($GLOBALS['DB'],$sql_suche);
print "<table border=0 cellspacing=2 cellpadding=2 width=550>
          <tr>
          <td><b>Suchergebnis</b></td>
        </tr>
		</table>";
$num = mysqli_num_rows($result_suche);
if($num == 0) {
	echo "Keine Ergebnis gefunden."; }
else {
print "<table border=0 cellspacing=2 cellpadding=2 width=500>";
while($row = mysqli_fetch_array($result_suche)) {
print "<tr>
          <td valign='top'> 
              <b>Author: 
              ".$row['name']."
              </b>
          </td>
          <td>
            ".BBCode($row['antwort'])."
           </td>
        </tr>
		<tr><td colspan=2><hr></td></tr>";
	}
print "</table>"; }
break;
}


function make_date($datum){
    $tag=substr($datum,6,2);
    $monat=substr($datum,4,2);
    $jahr=substr($datum,0,4);
    $datum=$tag.".".$monat.".".$jahr;
    return $datum;
}
function make_date2($datum){
	$datum=implode('.',array_reverse(explode('-',$datum)));
    return $datum;
}
function BBCode ($string) {
	$string = str_replace('[b]', '<strong>', $string);
	$string = str_replace('[/b]', '</strong>', $string);

	$string = str_replace('[i]', '<i>', $string);
	$string = str_replace('[/i]', '</i>', $string);

	$string = str_replace('[u]', '<u>', $string);
	$string = str_replace('[/u]', '</u>', $string);

	$string = str_replace('[quote]', '<div style=\'border: 1px solid red; background: yellow\'>&quot;&nbsp;', $string);
	$string = str_replace('[/quote]', '&nbsp;&quot;</div>', $string);

	$string = str_replace('[a]', '<a target=_blank href=', $string);
	$string = str_replace('[ahome]', '<a href=', $string);
	$string = str_replace('[/a]', '</a>', $string);
	$string = str_replace('[-a-]', '>', $string);

	$string = str_replace('[e]', '<a href=mailto:', $string);
	$string = str_replace('[/e]', '</a>', $string);
	$string = str_replace('[-e-]', '>', $string);

	$string = str_replace('[img]', '<img src=', $string);
	$string = str_replace('[/img]', ' />', $string);
	
	return $string;
}
?>