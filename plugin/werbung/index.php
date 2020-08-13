<?php
if(!isset($_REQUEST['art'])){
?>
	<table width="600">
		<tr>
		<td>
		<?php echo DOM ?> bietet Ihnen die M&ouml;glichkeit der Bannerwerbung auf allen Seiten, das bedeutet, Ihr Banner wird auf ( fast ) JEDER Seite von <?php echo DOM ?> angezeigt.<br><br>
		Ein Zwang zur Einblendung besteht jedoch nicht! Wir behalten uns vor, die Banner nach unseren Richtlinien einzublenden<br><br />
		<U>Und so geht es:</U><BR>
		Schicken Sie uns die URL zu Ihren Banner.<BR>
		Sagen Sie uns, was geschehen soll, wenn der Banner aktiviert wird, z.B. URL zu Ihrer Domain.<BR>
		Welcher alternative Text soll angezeigt werden?<BR>
		Wir nehmen Ihre Anfragen gerne per Email unter <a HREF="<?php echo $_GET['kategorie'] ?>.html?art=Anfrage">&raquo;&nbsp;BannerForm</a> entgegen.
	    </td>
	 </tr>
	 </table>
<?php }
else if($_REQUEST['art'] == "Anfrage"){
?>
<script type="text/javascript">
<!-- 

function validEmail(email) 
{

  var strReg = "^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z]{2,4})+$";

  var regex = new RegExp(strReg);

  return(regex.test(email)); 

}

function chkFormular()
{
  if(document.werbung.Name.value == "")
  {
   alert("Bitte geben Sie Ihren Namen ein!");
   document.werbung.Name.focus();
   return false;
  }
  if(document.werbung.Strasse.value == "")
  {
   alert("Bitte geben Sie die Strasse ein!");
   document.werbung.Strasse.focus();
   return false;
  }
  if(document.werbung.Ort.value == "")
  {
   alert("Bitte geben Sie Ihre PLZ und Ort ein!");
   document.werbung.Ort.focus();
   return false;
  }
   
  if(document.werbung.Email.value.indexOf('@') == -1)
  {
   alert("Keine gueltige E-Mail-Adresse!");
   document.werbung.Email.focus();
   return false;
  }
  if (!validEmail(document.werbung.Email.value))
   {

   alert("Keine gueltige E-Mail-Adresse!");
   document.werbung.Email.focus();
   return false;

  }
  if(document.werbung.HomePage.value == "")
  {
   alert("Bitte geben Sie eine HomePage ein!");
   document.werbung.HomePage.focus();
   return false;
  }
  
  if(document.werbung.akzeptiert.checked== "")
  {
   alert("Bitte akzeptieren Sie die Nutzungsbedingungen.");
   return false;
  }

}
-->
</script>
<TABLE>
<TR>
    <TD VALIGN=TOP width="30%">
      <b>Werbung auf <?php echo DOM ?></b><br>
      Alle Banner sind limentiert! Eine K&uuml;ndigung Ihres Banners bedarf es aus diesem Grund nicht. W&uuml;nschen Sie eine &Auml;nderung, so schreiben Sie uns eine kurze Email mit Ihrem Wunsch.<br />
	  Wir behalten uns das Recht vor, Werbungen nach unseren Richtlinien einzubauen. Ein Zwang zur Einblendung fremder Werbungen auf unseren Seiten besteht nicht!
    </TD> 	  
    <TD VALIGN=TOP>
    <FORM name="werbung" ACTION="<?php echo $_GET['kategorie'] ?>.html" METHOD=POST enctype="multipart/form-data" onSubmit="return chkFormular()">
    <input type="hidden" name="art" value="senden">
            <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 width=300>
            <TR>
                <TD>Name:</TD>
                <TD><INPUT TYPE=TEXT NAME="Name" VALUE="">&nbsp;*</TD>
            </TR>
            <TR>
                <TD>Strasse:</TD>
                <TD><INPUT TYPE=TEXT NAME="Strasse" VALUE="">&nbsp;*</TD>
            </TR>
            <TR>
                <TD>PLZ/Ort:</TD>
                <TD><INPUT TYPE=TEXT NAME="Ort" VALUE="">&nbsp;*</TD>
            </TR>
            <TR>
                <TD VALIGN=MIDDLE CLASS="normal">Telefon:</TD>
                <TD VALIGN=MIDDLE><INPUT TYPE=TEXT NAME="Tel" VALUE=""></TD>
            </TR>
            <TR>
                <TD VALIGN=MIDDLE CLASS="normal">Telefax:</TD>
                <TD VALIGN=MIDDLE><INPUT TYPE=TEXT NAME="Fax" value=""></TD>
            </TR>
            <TR>
                <TD VALIGN=MIDDLE CLASS="normal">EMail:</TD>
                <TD VALIGN=MIDDLE><INPUT TYPE=TEXT NAME="Email" VALUE="">&nbsp;*</TD>
            </TR>
            <TR>
                <TD VALIGN=MIDDLE CLASS="normal">HomePage:</TD>
                <TD VALIGN=MIDDLE><INPUT TYPE=TEXT NAME="HomePage" VALUE="">&nbsp;*</TD>
            </TR>
            
            <TR>
                <TD COLSPAN=2 VALIGN=TOP CLASS="normal"><strong>Angabe zum Werbebanner</strong></TD>
            </TR>
            <TR>
                <TD VALIGN=TOP CLASS="normal">Bereich:</TD>
                <TD VALIGN=TOP>
                <SELECT NAME="Bereich">
                <OPTION VALUE="Header">Header</OPTION>
                <OPTION VALUE="Seite">Seite</OPTION>
                </SELECT>
                </TD>
            </TR>
            <TR>
                <TD VALIGN=TOP CLASS="normal">Link:</TD>
                <TD VALIGN=TOP><INPUT TYPE=TEXT NAME="Link" VALUE=""></TD>
            </TR>
            <TR>
                <TD VALIGN=TOP CLASS="normal">Text:</TD>
                <TD VALIGN=TOP><INPUT TYPE=TEXT NAME="alternativ" VALUE=""></TD>
            </TR>
            <TR>
                <TD VALIGN=TOP CLASS="normal">Laufzeit:</TD>
                <TD VALIGN=TOP>
                <SELECT NAME="Laufzeit">
                <OPTION VALUE="6 Monate">6 Monate</OPTION>
                <OPTION VALUE="12 Monate">12 Monate</OPTION>
                </SELECT>
                </TD>
            </TR>
            <TR>
                <TD COLSPAN=2>
					Ich / Wir habe(n) die nebenstehenden Bedingungen gelesen und akzeptiert.
					&nbsp;&nbsp;<INPUT TYPE="CHECKBOX" NAME="akzeptiert" VALUE="ja" CHECKED>
                </TD>
            </TR>
            
            <TR>
                <TD VALIGN=TOP CLASS="normal">Ihre Nachricht:</TD>
                <TD VALIGN=TOP><TEXTAREA NAME="Nachricht" ROWS=3 COLS=20></TEXTAREA></TD>
            </TR>
			<tr>
            <td align="right" valign="top">&nbsp;</td>
            <td align="left">
            <img src="libary/captcha/CaptchaSecurityImages.php?width=100&height=40&characters=5" />
		    <label for="security_code">Security Code: </label><input id="security_code" name="security_code" type="text" />
            </td>
          </tr>
            <TR>
                <TD COLSPAN=2 VALIGN=TOP><INPUT TYPE=SUBMIT VALUE="Senden" Name="senden"></TD>
            </TR>
            </TABLE>
        </FORM></TD>
</TR>
</TABLE>
<?php } 
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