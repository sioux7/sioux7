<?php
$mailtext='
<html>
<head>
<title>'.DOM.' - News</title>
</head>
<body>
<center>
<table style="width: 800px;">
<tbody>
<tr>
<td align="center">
<table style="width: 650px;" border="0" bgcolor="#ffffff">
<tbody>
<tr>
<td colspan="2" align="center"><img src="http://news.uidev.de/images/logo.png" alt="News UIDEV" /></td>
</tr>
<tr>
<td width="216" align="left" valign="top">
<div style="height: 20px; background: url(http://news.uidev.de/images/element-.png) no-repeat scroll 0pt 0pt transparent;">&nbsp;</div>
<div style="background: url("http://news.uidev.de/images/element0.png") repeat-y;">
<div style="font-size:12px; margin-left:10px; padding-bottom:20px;"><strong>UIDEV Newsletter</strong></div>
<div style="font-size:12px; margin:0 10px 0 10px; padding-bottom:20px;"><strong>Neues bei UIDEV</strong> <br />
  <br /> Euer uidev.de Team</div>
</div>
<div style="height: 20px; background: url(http://news.uidev.de/images/element1.png) no-repeat scroll 0% 0% transparent;">&nbsp;</div>
<div class="buttons" style="float: left; width: 100%;">
<div id="box1"><a href="http://twitter.com/" target="_blank"><img style="border: 0pt none;" src="http://news.uidev.de/images/twitter_norm.png" alt="" width="43" height="43" /></a> <a href="http://www.facebook.com/" target="_blank"><img style="border: 0pt none;" src="http://news.uidev.de/images/facebook_norm.png" alt="" /></a></div>
</div>
</td>
<td width="430" align="center" style="margin: 0 10px 0 10px;">
<table style="width: 430px;" border="0" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td align="left">
<div style="font-size:12px; margin-left:10px; padding-bottom:20px;">
<p><strong>Liebe Newsletter Abonennten!</strong></p>';
// read the Newsletter
$basisdatei = fopen("../newsletter/content.html",'r');
while($line = fgets($basisdatei,1000)){ $mailtext.=$line; }
$mailtext.='
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td height="79" align="center">
<div style="background-image: url(http://news.uidev.de/images/footer.png); width: 650px; height: 79px;">
<div style="width: 160px; float: left; height: 61px; padding-top: 18px; font-size: 10px; text-align: left; padding-left: 30px; line-height: 1em;">Telefon +49 89 / 37946587</div>
<div style="width: 280px; float: left; height: 61px; padding-top: 18px; font-size: 10px; text-align: left; padding-left: 45px; line-height: 1em;">UIDEV<br /> Naupliastr. 91 / D - 81545 M&uuml;nchen</div>
<div style="width: 100px; float: left; height: 61px; padding-top: 18px; font-size: 10px; text-align: left; padding-left: 30px; line-height: 1em;"><a href="http://uidev.de" target="_blank"><img src="http://news.uidev.de/images/leer.gif" alt="K&auml;rnten Radreisen" width="11" height="11"  border=0/></a></div>
</div>
</td>
</tr>
</tbody>
</table>
</center>
</body>
</html>';
include '../'.SCLASS.'class.phpmailer.php';
// set default
$mail             = new PHPMailer();
$mail->SMTPDebug  = 2;                   
$mail->SMTPAuth   = true;                  // enable SMTP authentication
$mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
$mail->Host       = MAILHOST;      
$mail->Port       = 465;                   
$mail->Username   = EMAIL;  //username
$mail->Password   = MAILPW;            //password
$datum=strtotime(date("d.m.Y"));
$datum=date("d.m.Y");
// Send it to all User
$mail->SetFrom('noreply@uidev.de', 'UIDEV');
// Send it to all User
$sql_query1 = "SELECT * FROM abonennt WHERE aktiv='1'";
$result1 = mysql_query($sql_query1);
while ($row1 = mysql_fetch_array($result1)) {
	$address = $row1['email'];
	$mail->AddAddress($address, DOM."Newsletter Abonnent");
	$mail->Subject    = "Newsletter vom ".date("d.m.Y");
	$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test
	$mail->MsgHTML($mailtext);
	if(!$mail->Send()) die('could not sed') ;
	$mail->ClearAddresses();
}
echo "<br><font color=red>Alle Daten wurden gesendet!</font>";
?>
