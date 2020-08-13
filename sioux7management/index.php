<?php
session_start();
if(!isset($_SESSION['DOM'])) { $_SESSION['DOM'] = "2";}
setcookie("cookie[sioux]", "TMsioux7-6720", time()+3600);
include "../sioux7conf/globals.inc.php";
include "inc/functions.inc.php";
connect2db();
if($_REQUEST['passwortvergessen']) { sendPasswordEmail($_REQUEST['email']); }
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><?php echo DOM; ?> - Verwaltung</title>
<link href="general.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.fancybox-1.3.1.js"></script>
<script type="text/javascript">
	$(document).ready( function () {
		$("a#inline").fancybox({
		'hideOnContentClick': false
		});
	
	});
</script>
</head>
<body><div id="box_login" class="standardbox">
    <div style="display:none; width: 500px;">
    <div id="passwortanfordern">
        	<h1>Passwort vergessen?</h1>
            Um ein neues Passwort anzufordern, geben Sie bitte Ihre Email-Adresse ein.
                        
        	<form action="" method="POST" name="passwort">
            <input type="hidden" name="passwortvergessen" value="sendme" />
        	<table border="0" cellpadding="3" cellspacing="1" width="550">
              <tbody><tr>
                <td width="90%"><input name="email" class="ganze_breite2" type="text"></td>
                <td width="10%"><input type="submit" name="submit" value="Passwort anfordern" type="submit"></td>
              </tr>
            </tbody></table>
            </form>
            <br><br>
        </div>
        </div>
    
    <h1>Login Adminbereich</h1>
    <form name="login" method="post" action="inc/login.php">
    <input type="hidden" name="action" value="login"  />
	<table border="0" cellpadding="2" cellspacing="0" width="100%">
      <tbody>
      <tr>
        <td width="25%"><b>Benutzer:</b></td>
        <td width="75%"><input name="benutzer" class="ganze_breite2" id="benutzer" type="text" value=""></td>
      </tr>
      <tr>
        <td><b>Passwort:</b></td>
        <td><input name="pw" class="ganze_breite2" id="pw" type="password"></td>
      </tr>
      <tr>
        <td colspan="2"><input name="button" class="ganze_breite" id="button" value="login" type="submit"></td>
      </tr>
      <tr>
        <td colspan="2"><a href="#passwortanfordern" id="inline">&raquo; Passwort vergessen?</a></td>
      </tr>
	</tbody></table>
    </form>
</div>
</body></html>
<?php
function sendPasswordEmail($strMail) {
		$ask = "SELECT * FROM `sioux7_admin` WHERE `email` = '".$strMail."'";
		$arrBenutzerask = mysqli_query($GLOBALS['DB'],$ask);
		$arrBenutzer = mysqli_fetch_array($arrBenutzerask);
		if($arrBenutzer){
		$strCode = getRandCode();
		$mailtext = "Name: ".$arrBenutzer['adminname']." <br>";
		$mailtext .= "Login: ".$arrBenutzer['email']." <br>";
		$mailtext .= "Passwort: ".$strCode." <br>";
		include 'inc/class.phpmailer.php';
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
		$address = $arrBenutzer['email'];
		$mail->AddAddress($address, DOM." Support");
		$mail->Subject    = "Ihre Passwort-Anforderung vom ".date("d.m.Y");
		$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test
		$mail->MsgHTML($mailtext);
		if(!$mail->Send()) die('could not sed') ;
		$mail->ClearAddresses();
		$query = "UPDATE admin SET passwort='".md5($strCode)."' WHERE admin_id=".$arrBenutzer['admin_id'];
		mysqli_query($GLOBALS['DB'],$query);		
		}
}

function getRandCode($intLaenge = 6){

	$strZeichen = str_shuffle(str_repeat("ABCDEFGHKMNPQRSWXZ23456789", 3));

	return substr($strZeichen,0,$intLaenge);

}
?>