<?php
if(!isset($_POST['what'])){
echo '
<form id="form1"  name="Kontakt" method="post" action="kontakt.html">
	<input type="hidden" name="what" value="senden">
    <input type="hidden" name="L" value="0" />
	<input type="text" name="url" class="antispam" />
	<input name="question" type="hidden" value="nobotsallowed" />
	<div class="mail">
	<div class="col-xs-12 col-sm-12 consultatemail">
	<div class="colmail full">
	<div>
			<input id="female" class="contact_gender" name="gender" type="radio" value="frau" checked> 
			<label for="female"><span></span>Frau</label>
			<input id="male" class="contact_gender" name="gender" type="radio" value="herr"> 
			<label for="male"><span></span>Herr</label>
		</div>
	</div>
	<div class="colmail">
	<div>
	<input class="contact_first" name="name" placeholder="Name*" type="text" required>
	</div>
	<div>
	<input class="contact_second" name="vorname" placeholder="Vorname*" type="text" required>
	</div>
	<div>
	<input class="contact_subject" name="betreff" placeholder="Betreff*" type="text" required>
	</div>
	</div>
	<div class="colmail">
	<div>
	<input class="contact_firma" name="firma" placeholder="Firma" type="text">
	</div>
	<div>
	<input class="contact_email" name="email" placeholder="E-Mail*" type="text" required>
	</div>
	<div>
	<input class="contact_telefon" name="telefon" placeholder="Telefon" type="text">
	</div>
	</div>
	<div>
	<textarea class="contact_message" name="message" cols="30" rows="7" placeholder="Nachricht*" required></textarea>
	</div>
	<div>
	<img src="libary/captcha/CaptchaSecurityImages.php?width=100&height=40&characters=5" />
	    <input id="security_code" name="security_code" type="text" placeholder="Code" />		</div>
	<div class="sendmy">
	<input class="senden" name="senden" value="Nachricht senden " type="submit">
	<i class="fa fa-envelope"></i>
	</div>
	</div>
	</div>
    </form>';
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
		$mail->SetFrom('o.urban@uidev.de', 'UIDEV');
		// Send it to all User
		$address = EMAIL;
		$mail->AddAddress($address, "UIDEV Kontakt");
		$mail->Subject    = "Kontaktanfrage vom ".date("d.m.Y");
		$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test
		$mail->MsgHTML($mailtext);
		if(!$mail->Send()) die('could not send') ;
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