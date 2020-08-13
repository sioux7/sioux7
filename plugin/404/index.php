<?php
if(!isset($_POST['what'])){
echo '
<p>
<img src="plugin/404/sioux7_404.jpg" style="float:left;margin-right:5px;" width=300>
<form id="form1"  name="Kontakt" method="post">
	<input type="hidden" name="what" value="senden">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="2">Oooops! Suchen Sie etwas bei uns? Teilen Sie uns mit, wenn Sie etwas vermissen......<br>Oder schauen Sie bitte mal hier: <a href="http://www.sioux7.com/Software/Report.html">Report</a><br>Im Formular unten k&ouml;nnen Sie Kontakt mit uns aufnehmen. <br>Bitte beachten Sie: aus SPAM Gr&uuml;nden ist eine Sicherheitscode erforderlich.</td>
            </tr>
            <tr>
            <td align="right">&nbsp;</td>
            <th align="left">&nbsp;</th>
          </tr>
          </table>
          <fieldset>
          <legend>Ihre Daten</legend>
          <table border="0" cellspacing="0" cellpadding="0">
          
          <tr>
            <td align="right">Vorname*:&nbsp;</td>
            <th align="left"><label>
              <input name="Vorname" type="text" id="Vorname" size="50" />
            </label></th>
          </tr>
          <tr>
            <td align="right">Nachname*:&nbsp;</td>
            <td align="left"><label>
              <input name="Nachname" type="text" id="Nachname" size="50" />
            </label></td>
          </tr>
          </table>
          </fieldset>
          <br />
          <fieldset>
          <legend>Ihre Nachricht</legend>
          <table border="0" cellspacing="0" cellpadding="0">
          
          <tr>
            <td align="right">Betreff*:&nbsp;</td>
            <td align="left"><label>
              <input name="Betreff" type="text" id="Betreff" size="50" />
            </label></td>
          </tr>
          <tr>
            <td width="160" align="right" valign="top">Nachricht*:&nbsp;</td>
            <td width="364" align="left"><textarea name="Nachricht" id="Nachricht" cols=38 rows=10></textarea></td>
          </tr>
          <tr>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td align="left">&nbsp;</td>
          </tr>
          <tr>
            <td align="right" valign="top">&nbsp;</td>
            <td align="left">
            <img src="libary/captcha/CaptchaSecurityImages.php?width=100&height=40&characters=5" />
		    <label for="security_code">Security Code: </label><input id="security_code" name="security_code" type="text" />
            </td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td align="left">&nbsp;</td>
          </tr>
          </table>
          </fieldset>
          <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right">&nbsp;</td>
            <td align="left">&nbsp;</td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td align="left"><label>
              <input type="submit" class="button" name="Absenden" id="Absenden" value="Nachricht absenden" />
              
            </label></td>
          </tr>
          
        </table>
        </form>
	</p>';
}
else {
 if ($_POST) {
 if( $_SESSION['security_code'] == $_POST['security_code'] && !empty($_SESSION['security_code'] ) ) {
		$mailtext = "";
		
		foreach ($_POST as $key => $val) {
			$mailtext .= "$key : $val<br>";
		}
		include SCLASS.'class.phpmailer.php';
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
		$address = EMAIL;
		$mail->AddAddress($address, "UIDEV 404 site");
		$mail->Subject    = "404 vom ".date("d.m.Y");
		$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test
		$mail->MsgHTML($mailtext);
		if(!$mail->Send()) die('could not sed') ;
		$mail->ClearAddresses();
		unset($_SESSION['security_code']);
		echo "Ihre Anfrage wurde an uns weitergeleitet. Wir werden Ihre Anfrage schnellstm&ouml;glich bearbeiten.";
   } else {
		// Insert your code for showing an error message here
		echo "Die Sicherheitscode war leider falsch!";
   }
 
}
}													
?>