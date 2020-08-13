--
-- Tabellenstruktur für Tabelle `abonennt`
--

CREATE TABLE IF NOT EXISTS `abonennt` (
  `abo_id` int(11) NOT NULL AUTO_INCREMENT,
  `titel_de` enum('myselect','Herr','Frau') DEFAULT NULL,
  `aname` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `aktiv` int(1) DEFAULT NULL,
  PRIMARY KEY (`abo_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `abonennt`
--

INSERT INTO `abonennt` (`abo_id`, `titel_de`, `aname`, `email`, `aktiv`) VALUES
(0, '', NULL, NULL, NULL),
(2, 'Herr', 'theo63', 'urban@uidev.de', 1),
(3, 'Herr', 'Olaf Urban', 'o.urban@dealfuchs.de', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titel_de` text NOT NULL,
  `banner` varchar(200) NOT NULL,
  `link` text NOT NULL,
  `aufrufe` int(10) NOT NULL DEFAULT '0',
  `klicks` int(10) NOT NULL DEFAULT '0',
  `alt` text,
  `aktiv` enum('aktiv','passiv') DEFAULT NULL,
  `datum` date DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `banner`
--

INSERT INTO `banner` (`banner_id`, `titel_de`, `banner`, `link`, `aufrufe`, `klicks`, `alt`, `aktiv`, `datum`) VALUES
(0, 'neu', '', '', 0, 0, '', 'passiv', '2012-03-01'),
(1, 'Werbung', 'werbebanner/werbung.gif', 'http://uidev.de', 873, 3, 'uidev.de', 'aktiv', '2012-05-31');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `firma`
--

CREATE TABLE IF NOT EXISTS `firma` (
  `firma_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firma` varchar(200) NOT NULL,
  `ansprechpartner` varchar(200) DEFAULT NULL,
  `adresse` varchar(200) DEFAULT NULL,
  `plz` int(5) DEFAULT NULL,
  `ort` varchar(30) DEFAULT NULL,
  `land` varchar(20) DEFAULT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  `telefax` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `descr` text,
  `logo` varchar(100) NOT NULL,
  `agb` text NOT NULL,
  `ustid` varchar(50) NOT NULL,
  `hrb` varchar(50) NOT NULL,
  PRIMARY KEY (`firma_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `firma`
--

INSERT INTO `firma` (`firma_id`, `firma`, `ansprechpartner`, `adresse`, `plz`, `ort`, `land`, `telefon`, `telefax`, `email`, `descr`, `logo`, `agb`, `ustid`, `hrb`) VALUES
(1, 'Company', 'Max Mustermann 3', 'Musterstrasse 1', 80336, 'München', 'BRD', '+49 89 30 701 01', '', 'info@musterdomain.de', '', 'Ba Gua (Feng-Shui-Mirror).gif', 'Allgemeine Gesch&auml;ftsbedingungen:<br /> Hier kann Ihre AGB stehen', 'DE 19293735', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE IF NOT EXISTS `kategorie` (
  `kategorie_id` int(11) NOT NULL AUTO_INCREMENT,
  `aktiv` int(1) DEFAULT NULL,
  `titel_de` varchar(150) DEFAULT NULL,
  `parent` varchar(200) DEFAULT NULL,
  `parent_nav` enum('table','kategorie','parent','single','kategorie_id') DEFAULT NULL,
  `plugin` varchar(200) DEFAULT NULL,
  `menu` enum('top','menu','footer','user') NOT NULL DEFAULT 'menu',
  `rang` int(11) DEFAULT NULL,
  `bild` varchar(150) DEFAULT NULL COMMENT 'max. 450px Breite',
  `datei` varchar(150) DEFAULT NULL,
  `keywords` text,
  `description` text,
  `ismodul` int(1) NOT NULL,
  `beschreibung_de` text,
  `inhalt_de` text,
  `titel_ru` varchar(200) DEFAULT NULL COMMENT 'Russisch',
  `beschreibung_ru` text COMMENT 'Russisch',
  `inhalt_ru` text COMMENT 'Russisch',
  `titel_en` varchar(200) DEFAULT NULL COMMENT 'Englisch',
  `beschreibung_en` text COMMENT 'Englisch',
  `inhalt_en` text COMMENT 'Englisch',
  PRIMARY KEY (`kategorie_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Daten für Tabelle `kategorie`
--

INSERT INTO `kategorie` (`kategorie_id`, `aktiv`, `titel_de`, `parent`, `parent_nav`, `plugin`, `menu`, `rang`, `bild`, `datei`, `keywords`, `description`, `ismodul`, `beschreibung_de`, `inhalt_de`, `titel_ru`, `beschreibung_ru`, `inhalt_ru`, `titel_en`, `beschreibung_en`, `inhalt_en`) VALUES
(0, 0, 'neu', '0', NULL, NULL, 'menu', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'Impressum', '0', NULL, NULL, 'top', 1, NULL, NULL, '   Impressum					', 'Unser Impressum						', 1, 'Impressum						', '                	$sql_queryfir = "SELECT * FROM firma";\r\n	$resultfir = mysql_query($sql_queryfir);\r\n	$rowfir = mysql_fetch_array($resultfir);\r\n?>\r\n<TABLE BORDER=0 WIDTH=560 CELLSPACING=0 CELLPADDING=0>\r\n<TR>\r\n    <TD VALIGN=top>\r\n        <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>\r\n	<?php if(file_exists("images/logo/".$rowfir[''logo'']) == 1){ ?>\r\n	<tr>\r\n	    <td><img src="images/logo/<?php echo $rowfir[''logo'']; ?>"></td>\r\n	</tr>\r\n	<?php } \r\n         ?>\r\n	<TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P><strong><?php echo $rowfir[''firma'']; ?></strong></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P><?php echo $rowfir[''adresse'']; ?></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P><?php echo $rowfir[''plz'']." ".$rowfir[''ort'']; ?></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top>\r\n                <P>&nbsp;&nbsp;</P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top>\r\n                <P>Ansprechpartner:</P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P><?php echo $rowfir[''ansprechpartner'']; ?></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top>\r\n                <P>&nbsp;&nbsp;&nbsp;</P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top>\r\n                <P> Telefon: <?php echo $rowfir[''telefon'']; ?></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P> Telefax: <?php echo $rowfir[''telefax'']; ?></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P> Mail: <?php echo $rowfir[''email'']; ?></P></TD>\r\n        </TR>\r\n		<TR>\r\n            <TD  VALIGN=top>\r\n                <P>&nbsp;&nbsp;&nbsp;</P></TD>\r\n        </TR>\r\n		<TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P>Umsatzsteur-ID-Nr.: <?php echo $rowfir[''ustid'']; ?></P></TD>\r\n        </TR>\r\n		<TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P>Handelsregister: <?php echo $rowfir[''hrb'']; ?></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top height=10></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top>\r\n                <P>&nbsp;&nbsp;&nbsp;</P></TD>\r\n        </TR>\r\n        \r\n       \r\n        </TABLE>\r\n	</TD>\r\n    \r\n</TR>\r\n<TR>\r\n     <TD  VALIGN=top colspan=2>\r\n     <P><?php echo $rowfir[''descr'']; ?></P>\r\n	 </TD>\r\n</TR>\r\n</TABLE>			', 'отпечаток', 'отпечаток', 'отпечаток', NULL, NULL, NULL),
(3, 1, 'Kontakt', '0', NULL, NULL, 'top', 2, NULL, NULL, '                                    Kontakt                    														', '                                         Nehmen Sie Kontakt mit uns auf               														', 1, '                                        Kontakt                														', 'if(!isset($_POST[''what''])){\r\n?>\r\n<form id="form1"  name="Kontakt" method="post" action="index.php?kategorie=c3_kontakt">\r\n	<input type="hidden" name="what" value="senden">\r\n        <table width="450" border="0" cellspacing="0" cellpadding="0">\r\n            <tr>\r\n              <td colspan="2"><strong>Hier k&ouml;nnen Sie uns eine Nachricht zukommen lassen.</strong></td>\r\n            </tr>\r\n            <tr>\r\n            <td width="160" align="right">&nbsp;</td>\r\n            <th width="364" align="left">&nbsp;</th>\r\n          </tr>\r\n          </table>\r\n          <fieldset>\r\n          <legend>Ihre Daten</legend>\r\n          <table width="450" border="0" cellspacing="0" cellpadding="0">\r\n          \r\n          <tr>\r\n            <td width="160" align="right">Vorname*:&nbsp;</td>\r\n            <th width="364" align="left"><label>\r\n              <input name="Vorname" type="text" id="Vorname" size="50" />\r\n            </label></th>\r\n          </tr>\r\n          <tr>\r\n            <td width="160" align="right">Nachname*:&nbsp;</td>\r\n            <td width="364" align="left"><label>\r\n              <input name="Nachname" type="text" id="Nachname" size="50" />\r\n            </label></td>\r\n          </tr>\r\n          <tr>\r\n            <td width="160" align="right">Telefonnummer:&nbsp;</td>\r\n            <td width="364" align="left"><label>\r\n              <input name="Telefon" type="text" id="Telefon" size="50" />\r\n            </label></td>\r\n          </tr>\r\n          <tr>\r\n            <td width="160" align="right">Fax:&nbsp;</td>\r\n            <td width="364" align="left"><label>\r\n              <input name="Fax" type="text" id="Fax" size="50" />\r\n            </label></td>\r\n          </tr>\r\n          <tr>\r\n            <td width="160" align="right">E-Mail*:&nbsp;</td>\r\n            <td width="364" align="left"><label>\r\n              <input name="EMail" type="text" id="EMail" size="50" />\r\n            </label></td>\r\n          </tr>\r\n          </table>\r\n          </fieldset>\r\n          <br />\r\n          <fieldset>\r\n          <legend>Ihre Nachricht</legend>\r\n          <table width="450" border="0" cellspacing="0" cellpadding="0">\r\n          \r\n          <tr>\r\n            <td width="160" align="right">Betreff*:&nbsp;</td>\r\n            <td width="364" align="left"><label>\r\n              <input name="Betreff" type="text" id="Betreff" size="50" />\r\n            </label></td>\r\n          </tr>\r\n          <tr>\r\n            <td width="160" align="right" valign="top">Nachricht*:&nbsp;</td>\r\n            <td width="364" align="left"><textarea name="Nachricht" id="Nachricht" cols="38" rows="10"></textarea></td>\r\n          </tr>\r\n          <tr>\r\n            <td width="160">&nbsp;</td>\r\n            <td width="364">&nbsp;</td>\r\n          </tr>\r\n          <tr>\r\n            <td width="160">&nbsp;</td>\r\n            <td width="364"><strong>Wie m&ouml;chten Sie von uns kontaktiert werden?</strong></td>\r\n          </tr>\r\n          <tr>\r\n            <td width="160" align="right">&nbsp;</td>\r\n            <td width="364" align="left">Via&nbsp;\r\n             \r\n                <input type="radio" name="RKontakt" id="RKontakt" value="via Telefon" checked/>\r\n                Telefon <strong>&nbsp;oder&nbsp;</strong>\r\n                <input type="radio" name="RKontakt" id="RKontakt" value="via E-Mail" />\r\n              E-Mail</td>\r\n          </tr>\r\n          <tr>\r\n            <td width="160" align="right">&nbsp;</td>\r\n            <td width="364" align="left">&nbsp;</td>\r\n          </tr>\r\n          <tr>\r\n            <td width="160" align="right" valign="top">&nbsp;</td>\r\n            <td width="364" align="left">\r\n            <img src="captcha/CaptchaSecurityImages.php?width=100&height=40&characters=5" />\r\n		    <label for="security_code">Security Code: </label><input id="security_code" name="security_code" type="text" />\r\n            </td>\r\n          </tr>\r\n          <tr>\r\n            <td width="160" align="right">&nbsp;</td>\r\n            <td width="364" align="left">&nbsp;</td>\r\n          </tr>\r\n          <tr>\r\n            <td width="160" align="right">&nbsp;</td>\r\n            <td width="364" align="left">Bitte f&uuml;llen Sie dieses Formular m&ouml;glichst komplett aus. Die mit <strong>*</strong> markierten Felder sind Pflichtfelder, die Sie auf jeden Fall ausf&uuml;llen  m&uuml;ssen. \r\n              Wir k&uuml;mmern uns baldm&ouml;glichst um die Bearbeitung Ihrer Anfrage.</td>\r\n          </tr>\r\n          </table>\r\n          </fieldset>\r\n          <table width="450" border="0" cellspacing="0" cellpadding="0">\r\n          <tr>\r\n            <td width="160" align="right">&nbsp;</td>\r\n            <td width="364" align="left">&nbsp;</td>\r\n          </tr>\r\n          <tr>\r\n            <td width="160" align="right">&nbsp;</td>\r\n            <td width="364" align="left"><label>\r\n              <input type="submit" name="Absenden" id="Absenden" value="Nachricht absenden" />\r\n              \r\n            </label></td>\r\n          </tr>\r\n          \r\n        </table>\r\n        </form>\r\n<?php\r\n}\r\nelse {\r\n if ($_POST) {\r\n if( $_SESSION[''security_code''] == $_POST[''security_code''] && !empty($_SESSION[''security_code''] ) ) {\r\n		include ''include/xmail.inc.php'';\r\n		unset($_SESSION[''security_code'']);\r\n		echo "Ihre Anfrage wurde an uns weitergeleitet. Wir werden Ihre Anfrage schnellstm&ouml;glich bearbeiten.";\r\n   } else {\r\n		// Insert your code for showing an error message here\r\n		echo "Die Sicherheitscode war leider falsch!";\r\n   }\r\n \r\n}\r\n}													', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 'Sitemap', '0', NULL, NULL, 'top', 3, NULL, NULL, '                            Sitemap							', '                            Seitenübersicht							', 1, '                            Seitenübersicht							', '$feld="kategorie_id";\r\n$table="kategorie";\r\n\r\n$menu="top";\r\necho "Topmenu: <ul style=''list-style: none;''>".kat($table,0)."</ul>"; \r\n\r\n$menu="menu";\r\necho "Menu: <ul style=''list-style: none;''>".kat($table,0)."</ul>"; \r\n\r\n$menu="footer";\r\necho "Footermenu: <ul style=''list-style: none;''>".kat($table,0)."</ul>"; \r\n\r\nfunction kat($table, $intStart, $pos=0, $strEinrueckung="&nbsp;"){\r\n	global $wert, $feld, $menu;\r\n	$strSQL = "SELECT * FROM ".$table." WHERE parent=".$intStart." AND aktiv=1 AND menu=''".$menu."'' ORDER BY rang";\r\n	$dbQuery = mysql_query($strSQL) or die(mysql_error());\r\n	while($arrKat = mysql_fetch_assoc($dbQuery)){\r\n	if($arrKat[''kategorie_id''] !=''0'' && $arrKat[''titel_''.$_SESSION[''lang'']]) {\r\n		\r\n			$strReturn.="<li><a href=''c".$arrKat[''kategorie_id'']."_".$arrKat[''titel_''.$_SESSION[''lang'']].".html''";\r\n			$strReturn.=">".str_repeat($strEinrueckung, $pos)."&raquo;&nbsp;".$arrKat[''titel_''.$_SESSION[''lang'']]."&nbsp;";\r\n			$strReturn.="</a><br>".str_repeat($strEinrueckung, $pos)."&nbsp;&nbsp;".strip_tags($arrKat[''beschreibung_''.$_SESSION[''lang'']]);\r\n			$strReturn .="</li>\\n";\r\n\r\n		$strSQL2 = "SELECT * FROM ".$table." WHERE parent=".$arrKat[$feld]." AND menu=''".$menu."''";\r\n		if($arrKat[$feld] != 0) {\r\n			$unter=mysql_query($strSQL2);\r\n			if(mysql_num_rows($unter)>0) $strReturn.= kat($table,$arrKat[$feld],$pos+2,$strEinrueckung);\r\n		}\r\n	}}\r\n	return $strReturn;\r\n}', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, 'Empfehlung', '0', NULL, NULL, 'top', 4, NULL, NULL, 'Empfehlung       								', 'Empfehlen Sie unsere Seite weiter      		', 1, ' Empfehlen Sie unsere Seiten weiter             						', ' $webadresse=$_SERVER[''HTTP_HOST''];		// Internetadresse\r\n $empfehlungname="UIDEV-Team";				// Name des Inhabers\r\n\r\n $adressdaten="\r\nUIDEV \r\nNaupliastr. 91\r\n81545 Muenchen\r\n\r\nE-mail: urban@uidev.de\r\nInternet: www.uidev.de";	// Adressdaten in der Mail\r\n\r\n $absender_name="UIDEV";               	// Absender der eMail\r\n $absender_email="urban@uidev.de";    	// Absendename der eMail\r\n $copy_email="urban@uidev.de";  		// Kopie der Empfehlung senden\r\n $betreff=$_SESSION[''lang'']==de?"Empfehlung von ".$_POST[''absender'']:"Recommendation of ".$_POST[''absender''];\r\n\r\n //*************************************************************************//\r\n\r\n\r\n\r\n $anrede_bez[0]=$_SESSION[''lang'']==de?"Sehr geehrter Herr ".utf8_decode($_POST[''vorname''])." ".utf8_decode($_POST[''nachname'']).",":"Dear Mr. ".utf8_decode($_POST[''vorname''])." ".utf8_decode($_POST[''nachname'']).",";\r\n $anrede_bez[1]=$_SESSION[''lang'']==de?"Sehr geehrte Frau ".utf8_decode($_POST[''vorname''])." ".utf8_decode($_POST[''nachname'']).",":"Dear Mrs. ".utf8_decode($_POST[''vorname''])." ".utf8_decode($_POST[''nachname'']).",";\r\n\r\n $zus_textnachricht="";\r\n\r\n $mailnachricht=\r\n $_SESSION[''lang'']==de?"\\n\\n##absender## hat Ihnen unsere Internetseite empfohlen!\r\nBesuchen Sie uns doch mal unter \r\n".$webadresse."\r\n\r\noder schauen Sie auf http://$webadresse.\r\n \r\nFolgende Nachricht wurde f".chr(252)."r Sie hinterlassen:\r\n##nachricht##\r\n\r\nMit freundlichen Gr".chr(252).chr(223)."en\r\n\r\nIhr $empfehlungname\r\n\r\n_______________________________________________________________________________\r\n$adressdaten\r\n_______________________________________________________________________________"\r\n:"\\n\\n##absender## has recommended our Website to you!\r\nJust visit us at\r\n".$webadresse."\r\n\r\nor look at http://$webadresse.\r\n \r\nThe following message was left for you:\r\n##nachricht##\r\n\r\nSincerly,\r\n\r\nYour $empfehlungname\r\n\r\n_______________________________________________________________________________\r\n$adressdaten\r\n_______________________________________________________________________________";\r\nif(isset($_REQUEST[''test''])) {\r\nif(strlen($_POST[''vorname''])<2||strlen($_POST[''nachname''])<2||$_POST[''vorname'']=="Vorname"||$_POST[''nachname'']=="Nachname") $fehlermeldung=$_SESSION[''lang'']==de?"Bitte geben Sie den Vor- und Nachnamen des Empf&auml;ngers an.<br>":"Please specify the first and last name of the reciever.<br>";\r\n 	if(!ereg(''^[-_0-9a-zA-Z\\.]+@([-_0-9a-zA-Z]+\\.)+[a-zA-Z]+$'', $_POST[''mail''])||$_POST[''mail'']=="mail@domain.de") $fehlermeldung.=$_SESSION[''lang'']==de?"Bitte geben Sie eine korrekte eMail an.<br>":"Please insert a correct email address.<br>";\r\n 	if(strlen($_POST[''absender''])<2||$_POST[''absender'']=="Absender") $fehlermeldung.=$_SESSION[''lang'']==de?"Bitte geben Sie einen Absender an.<br><br>":"Please specify the addresser.<br><br>";\r\n\r\n 	if($fehlermeldung==""){\r\n 		if($_POST[''anrede'']=="Herr") $anrede_form=$anrede_bez[0];\r\n 		else $anrede_form=$anrede_bez[1];\r\n\r\n 		$nachrichtentext=replace_spacer($mailnachricht);\r\n 		$nachrichtentext=$anrede_form.$nachrichtentext;\r\n 		mail($_POST[''vorname'']." ".$_POST[''nachname'']."<".$_POST[''mail''].">", $betreff, $nachrichtentext, "From: $absender_name<$absender_email>\\nContent-type: text/plain");\r\n 		//if(!empty($copy_email)) mail($copy_email, $betreff, $nachrichtentext, "From: $absender_name<$absender_email>");\r\n\r\n 		$emaktiv = mysql_fetch_assoc(mysql_query("SELECT * FROM viocms_newslettersettings WHERE `key` = ''emaktiv''"));\r\n 		$emmail = mysql_fetch_assoc(mysql_query("SELECT * FROM viocms_newslettersettings WHERE `key` = ''emmail''"));\r\n 		$eminhalt = mysql_fetch_assoc(mysql_query("SELECT * FROM viocms_newslettersettings WHERE `key` = ''eminhalt''"));\r\n 		if ($emaktiv[''value'']==1) {\r\n 			function replace_vars($text) {\r\n 				$text = eregi_replace(''##name_abs##'',utf8_decode($_POST[''absender'']),$text);\r\n 				$text = eregi_replace(''##name_empf##'',utf8_decode($_POST[''vorname''])." ".utf8_decode($_POST[''nachname'']),$text);\r\n 				$text = eregi_replace(''##email_empf##'',utf8_decode($_POST[''mail'']),$text);\r\n 				$text = eregi_replace(''##datum##'',date(''d.m.Y - H:i'',time()),$text);\r\n 				return $text;\r\n 			}\r\n 			$eminhalt = replace_vars($eminhalt[''value'']);\r\n 			mail($emmail[''value''], ''Adviice: Recommendation'', $eminhalt, ''FROM: ''.$absender_name.'' <''.$absender_email.''>'');\r\n 		}\r\n }}\r\n\r\n function replace_spacer($text){\r\n 	global $zus_textnachricht;\r\n 	if(!empty($_POST[''nachricht''])) $_POST[''nachricht'']=$zus_textnachricht.$_POST[''nachricht''];\r\n\r\n 	$text=eregi_replace("##vorname##", utf8_decode($_POST[''vorname'']), $text);\r\n 	$text=eregi_replace("##nachname##", utf8_decode($_POST[''nachname'']), $text);\r\n 	$text=eregi_replace("##mail##", utf8_decode($_POST[''mail'']), $text);\r\n 	$text=eregi_replace("##nachricht##", utf8_decode($_POST[''nachricht'']), $text);\r\n 	$text=eregi_replace("##absender##", utf8_decode($_POST[''absender'']), $text);\r\n 	return $text;\r\n }\r\n\r\nif($fehlermeldung=="" && $_REQUEST[''test'']  !=""){\r\n	print "<table cellpadding=\\"10\\"><tr><td style=\\"font-size: 12px;\\">".($_SESSION[''lang'']==de?''Versand erfolgreich.<br>Vielen Dank f&uuml;r Ihre Empfehlung.'':''Transmission suceeded.<br>Thank you for your recommendation.'')."</td></tr></table><br>";\r\n		  } else {  ?>\r\n		 <form action="<?= $_SERVER[''PHP_SELF''] ?>?kategorie=<?=$_GET[''kategorie'']?>" method="post">\r\n  <table width="400" cellpadding="15" cellspacing="0" bgcolor="#FFFFFF">\r\n	<tr>\r\n	  <td colspan="2"><div style="font-size: 12px;"><?=\r\n	  $_SESSION[''lang'']==de?''Sie glauben dass unsere Internetseite <br>\r\n	    auch f&uuml;r Kunden, Kollegen und Bekannten <br>\r\n	    interessant ist? Dann empfehlen Sie uns weiter!\r\n          <br>\r\n	      <br>\r\n	      Empfehlung an:\r\n\r\n'':''You think our website could also be <br />\r\ninteresting for customers, associates <br />\r\nand acquaintances? Just recommend us!<br /><br />\r\nRecommendation to:\r\n\r\n'';?>\r\n		    <?="<span class=\\"fehler\\"><br>$fehlermeldung</span>";	?>\r\n	         <input type="hidden" name="sendkey" value="<?= md5(time()) ?>">\r\n           <input type="radio" name="anrede" value="Herr" <?php if(empty($_POST[''anrede''])||$_POST[''anrede'']=="Herr") print "checked"; ?>>\r\n	      <?=$_SESSION[''lang'']==de?''Herr'':''Mr.''?>\r\n	      <input type="radio" name="anrede" value="Frau" <?php if($_POST[''anrede'']=="Frau") print "checked"; ?>>\r\n	      <?=$_SESSION[''lang'']==de?''Frau'':''Mrs''?><br>\r\n	      <input name="vorname" type="text" class="textfeld" <?php if(!empty($_POST[''vorname''])&&$_POST[''vorname'']!="Vorname") print "value=\\"".$_POST[''vorname'']."\\""; else { print "onClick=\\"MM_setTextOfTextfield(''vorname'','''','''')\\" value=\\"".($_SESSION[''lang'']==de?''Vorname'':''First name'')."\\""; } ?> size="30">\r\n	      <br>\r\n\r\n	      <input name="nachname" type="text" class="textfeld" style="margin-top:3px;" <?php if(!empty($_POST[''nachname''])&&$_POST[''nachname'']!="Nachname") print "value=\\"".$_POST[''nachname'']."\\""; else print "onClick=\\"MM_setTextOfTextfield(''nachname'','''','''')\\" value=\\"".($_SESSION[''lang'']==de?''Nachname'':''Last name'')."\\""; ?> size="30">\r\n	      <br>\r\n\r\n	      <input name="mail" type="text" class="textfeld"  style="margin-top:3px;" <?php if(!empty($mail)&&$mail!="mail@domain.de") print "value=\\"$mail\\""; else print "onClick=\\"MM_setTextOfTextfield(''mail'','''','''')\\" value=\\"mail@domain.de\\""; ?> size="30">\r\n\r\n	      <br>\r\n	      <br>\r\n         	 <?=$_SESSION[''lang'']==de?''Name des Absenders'':''Your name''?>:<br>\r\n	      <input name="absender" type="text" class="textfeld" <?php if(!empty($_POST[''absender''])) print "value=\\"".$_POST[''absender'']."\\""; else print "onClick=\\"MM_setTextOfTextfield(''absender'','''','''')\\" value=\\"".($_SESSION[''lang'']==de?''Absender'':''Adresser'')."\\""; ?> size="10">\r\n	      <br>\r\n	      <br>\r\n	      <?=$_SESSION[''lang'']==de?''Empfohlene Seite'':''Recommended Site''?>:<br>\r\n	      <?\r\n	      echo $webadresse;\r\n	      ?>\r\n	      <br />\r\n	      <br />\r\n	      <?=$_SESSION[''lang'']==de?''Ihre Nachricht an den Empf&auml;nger'':''Your message to the recipient''?>:<br>\r\n	      <textarea name="nachricht" class="kontakttextfeldmultiple" cols=40 rows=10><?= $_POST[''nachricht''] ?></textarea>\r\n	      <br>\r\n	      <br>\r\n	      <input type="submit" name="test" value="<?=$_SESSION[''lang'']==de?''senden'':''send'';?>" class="button" alt="<?=$_SESSION[''lang'']==de?"senden":"send";?>" width="102" height="27">\r\n	      <br>\r\n	      <br>\r\n	      <br>\r\n         <h4><?=$_SESSION[''lang'']==de?''Hinweis: Die eingegeben Daten werden nur zum Versand<br>\r\n	    einer eMail an den Empf&auml;nger verwendet und von uns nicht gespeichert'':\r\n	    ''Information: The given Data is only used for sending<br>\r\n	    the mail to the recipient and will not be saved''?>.</h4></div></td>\r\n  </tr>\r\n</table></form>\r\n<?php } 	', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 0, 'Presse', '0', NULL, NULL, 'menu', 99, NULL, NULL, '                                                                                    Presse																					', '                                                                                    Unsere Presse																					', 1, '                                                                                    Unsre Presse																					', 'if(!isset($_REQUEST[''p_id''])){\r\n$sql_query = "SELECT * FROM presse ORDER BY p_id DESC";\r\n$result = mysql_query($sql_query) or die (mysql_error());\r\n    print "<table border=0 cellspacing=1 cellpadding=0 width=450>\r\n			<tr><td>Unsere eigenen Presseberichte.<br>Wir berichten regelm&auml;ssig &uuml;ber unsre esten Entwicklungen und Trends. Erfahren Sie hier unsre brandaktuellsten Neuheiten.<br></td></tr>";\r\n 	while ($row = mysql_fetch_array($result)) {\r\n               if($row[''titel_de''] !=''''){\r\n		print "<tr><td><a href=''index.php?kategorie=c6_presse&p_id=".$row[''p_id'']."''>&raquo;&nbsp;".$row[''titel_de''].", ".datum($row[''datum''])."</a></td></tr>";}\r\n		}\r\n	print "</table>";\r\n}\r\nelse {\r\n\r\n$sql_query = "SELECT * FROM presse WHERE p_id=".$_REQUEST[''p_id''];\r\n$result = mysql_query($sql_query) or die (mysql_error($db));\r\nwhile ($row = mysql_fetch_array($result)){\r\n\r\n?>\r\n<table border="0" cellpadding="0" cellspacing="0" width=500>\r\n  <?php\r\n	  if($row[''bild''] != "" and file_exists ("upload/images/".$row[''bild'']) == 1){\r\n			?>\r\n			<td VALIGN="TOP"><a href="upload/images/<?php echo $row[''bild''] ?>" rel="cb"><img SRC="upload/images/<?php echo $row[''bild''] ?>" ALT="Objektbild" style="margin: 5px; max-width: 180px;"></a></td>\r\n		<?php\r\n	 }\r\n	 else { ?>\r\n	 <td VALIGN="TOP"></td>\r\n	 <?php\r\n		}\r\n	?>\r\n    <td width="80%" valign="top">\r\n       <table border=0 cellspacing=0 cellpadding=2 wdth="100%">\r\n       	<?php\r\n			$descr=$row[''descr_''.$_SESSION[''lang'']];\r\n		?>\r\n		<tr>\r\n			<td class="normal"><?php echo $descr ?></b></td>\r\n		</tr>\r\n		<tr>\r\n			</td><td align="right"><?php echo datum($row[''datum'']); ?></b></td>\r\n		</tr>\r\n		</table>\r\n		</td>\r\n  </tr>\r\n</table>\r\n</center>\r\n<?php\r\n	}\r\n}																					', 'нажимать', 'нажимать', 'if(!isset($_REQUEST[''p_id''])){\r\n$sql_query = "SELECT * FROM presse ORDER BY p_id DESC";\r\n$result = mysql_query($sql_query) or die (mysql_error());\r\n    print "<table border=0 cellspacing=1 cellpadding=0 width=450>\r\n			<tr><td>Unsere eigenen Presseberichte.<br>Wir berichten regelm&auml;ssig &uuml;ber unsre esten Entwicklungen und Trends. Erfahren Sie hier unsre brandaktuellsten Neuheiten.<br></td></tr>";\r\n 	while ($row = mysql_fetch_array($result)) {\r\n               if($row[''titel_de''] !=''''){\r\n		print "<tr><td><a href=''index.php?kategorie=c6_presse&p_id=".$row[''p_id'']."''>&raquo;&nbsp;".$row[''titel_ru''].", ".datum($row[''datum''])."</a></td></tr>";}\r\n		}\r\n	print "</table>";\r\n}\r\nelse {\r\n\r\n$sql_query = "SELECT * FROM presse WHERE p_id=".$_REQUEST[''p_id''];\r\n$result = mysql_query($sql_query) or die (mysql_error());\r\nwhile ($row = mysql_fetch_array($result)){\r\n\r\n?>\r\n<table border="0" cellpadding="0" cellspacing="0" width=500>\r\n  <?php\r\n	  if($row[''bild''] != "" and file_exists ("upload/images/".$row[''bild'']) == 1){\r\n			?>\r\n			<td VALIGN="TOP"><img SRC="upload/images/<?php echo $row[''bild''] ?>" BORDER="1" ALT="Objektbild"></td>\r\n		<?php\r\n	 }\r\n	 else { ?>\r\n	 <td VALIGN="TOP"></td>\r\n	 <?php\r\n		}\r\n	?>\r\n    <td width="80%" valign="top">\r\n       <table border=0 cellspacing=0 cellpadding=2 wdth="100%">\r\n       	<?php\r\n			$descr=$row[''descr_''.$_SESSION[''lang'']];\r\n		?>\r\n		<tr>\r\n			<td class="normal"><?php echo $descr ?></b></td>\r\n		</tr>\r\n		<tr>\r\n			</td><td align="right"><?php echo datum($row[''datum'']); ?></b></td>\r\n		</tr>\r\n		</table>\r\n		</td>\r\n  </tr>\r\n</table>\r\n</center>\r\n<?php\r\n	}\r\n}																					', NULL, NULL, NULL),
(8, 0, 'Newsletter', '0', NULL, NULL, 'menu', 99, NULL, NULL, 'Nesletter, Neues, Aktuelles', 'Unser eigener Newsletter', 1, 'Unser eigener Newsletter', 'if (isset($_REQUEST[''anmelden''])) {\r\n	   if (trim($_REQUEST[''username'']) == '''' || strlen(trim($_REQUEST[''username''])) < 5) {\r\n			$error = TRUE;\r\n			$errorMsg = 1;\r\n\r\n		}\r\n		if (!eregi("^[a-z0-9]+([-_\\.]?[a-z0-9])+@[a-z0-9]+([-_\\.]?[a-z0-9])+\\.[a-z]{2,4}$", $_REQUEST[''email''])) {\r\n			$error = TRUE;\r\n			$errorMsg = 2;\r\n			\r\n		}\r\n		$result=@mysql_query("SELECT email FROM abonennt WHERE`email` = ''".@mysql_real_escape_string($_POST[''email''])."''") or die(mysql_error());\r\n	$num = mysql_num_rows($result);\r\n	if ($num == 1) {\r\n			$error = TRUE;\r\n			$errorMsg = 3;}\r\n		if ($error == TRUE) {\r\n			if ($errorMsg == 1) { echo "<div class=''error''><div class=''text''>Der Benutzername muss mindestens 5 Zeichen lang sein!</div></div><br />"; }\r\n			if ($errorMsg == 2) { echo "<div class=''error''><div class=''text''>Die E-Mailadresse ist ung&uuml;ltig!</div></div><br />"; }\r\n			if ($errorMsg == 3) { echo "<div class=''error''><div class=''text''>Sie sind bereits angemeldet.</div></div><br />"; }\r\n		}\r\n		else {\r\n			$insertUser = @mysql_query("INSERT INTO abonennt SET `titel_de` = ''".@mysql_real_escape_string($_POST[''ansprache''])."'', `name` = ''".@mysql_real_escape_string($_POST[''username''])."'', `email` = ''".@mysql_real_escape_string($_POST[''email''])."'', `aktiv` = ''passiv''") or die(mysql_error());\r\n			\r\n			$mailHeaders  = "MIME-Version: 1.0\\r\\n";\r\n			$mailHeaders .= "Content-type: text/plain; charset=utf-8\\r\\n";\r\n			$mailHeaders .= "Content-Transfer-encoding: 8bit\\r\\n";\r\n			$mailHeaders .= "From: ".$info;\r\n			$mailTo = $_POST[''email''];\r\n			$mailSubject = "Ihre NewsLetter bei ".$domain_title;\r\n			$mailText = "Hallo ".$_POST[''username'']."\\n\\n";\r\n			$mailText .= "Sie haben sich erfolgreich beim NewsLetter registriert. ";\r\n			$mailText .= "Ihr Account muss jetzt noch aktiviert werden. \\n";\r\n			$mailText .= "http://".$_SERVER[HTTP_HOST]."/index.php?kategorie=c8_newsletter&mail=".$_POST[''email'']."&option=activate\\n";\r\n			$mailText .= "Sollten Sie diese E-Mail unerwuenscht bekommen haben, so senden Sie uns bitte eine Nachricht an urban@uidev.de zu, oder ignorieren Sie diese Nachricht einfach.\\n\\n";\r\n			$mailText .= "Das ".$domain_title." Newsletter - Team";\r\n			\r\n			mail($mailTo,$mailSubject,$mailText,$mailHeaders);\r\n			echo "<div class=''error''>Sie haben sich erfolgreich registriert. Zur Best&auml;tigung wurde Ihnen eine E-Mail geschickt!</div><br />";\r\n		}\r\n}\r\n\r\nif (isset($_REQUEST[''option''])) {\r\n	if($_REQUEST[''option''] == "activate") {\r\n		$update= @mysql_query("UPDATE abonennt SET aktiv=''1'' WHERE email=''".$_REQUEST[''mail'']."''");\r\n		echo "<div class=''error''>Ihre Newsletter Bestellung wurde erfolgreich aktiviert.</div><br />";}\r\n		if($_REQUEST[''option''] == "delete") {\r\n		$del= @mysql_query("DELETE FROM abonennt WHERE email=''".$_REQUEST[''mail'']."''");\r\n		echo "<div class=''error''>Ihre Newsletter Bestellung wurde erfolgrecih abgemeldet.</div><br />";}\r\n}\r\necho "<img src=''images/news/news.png'' alt=''Newsletter'' title=''Presse - Newsletter''><br>\r\n<p><strong>Immer aktuell und ganz pers&ouml;nlich informiert</strong><br>\r\n\r\nMit dem Newsletter informieren wir Sie regelm&auml;&szlig;ig per E-Mail &uuml;ber unsere aktuellen Angebote und Aktionen und eServices. V&ouml;llig kostenlos und unverbindlich. Erfahren Sie als erstes, was ".$domain_title." Neues zu bieten hat. Selbstverst&auml;ndlich garantieren wir die Sicherheit Ihrer Daten nach dem Datenschutzgesetz und werden diese nicht an Dritte weiterleiten.</p>";\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 0, 'Suche', '0', NULL, NULL, 'top', 99, NULL, NULL, 'Suchergebnis', 'Suchergebnis', 1, 'Suche auf Domain', 'echo "<h3>Suchergebnis f&uuml;r ".$_REQUEST[search]."</h2>";\r\n$query="SELECT * FROM kategorie WHERE titel_".$_SESSION[lang]." LIKE ''%".$_REQUEST[search]."%'' OR  inhalt_".$_SESSION[lang]." LIKE ''%".$_REQUEST[search]."%''";\r\n$result=mysql_query($query) or die("fehler");\r\nwhile($row=mysql_fetch_array($result)){\r\n	if($row[kategorie_id] !=0) {\r\n		echo "&raquo; <a href=''".getLink($row[kategorie_id])."''>".$row[titel_.$_SESSION[lang]]."</a><br>"; \r\n	}\r\n}', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 1, 'Home', '0', NULL, '', 'menu', 1, 'Koala.jpg', 'css3-cheat-sheet.pdf', 'test', 'test', 0, 'Ein Test', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.&nbsp; &nbsp;<br /><br />Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.&nbsp; &nbsp;<br /><br />Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.&nbsp; &nbsp;<br /><br />Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 1, 'Praemienabo', '0', NULL, NULL, 'footer', 0, NULL, NULL, 'Entwicklungen', 'Entwicklungen', 0, 'Neue Entwicklungen', 'Neue Entwicklung: ', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `lang_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titel_de` varchar(20) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `xpath` varchar(255) DEFAULT NULL,
  `activ` enum('activ','passiv') DEFAULT NULL,
  PRIMARY KEY (`lang_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `language`
--

INSERT INTO `language` (`lang_id`, `titel_de`, `flag`, `xpath`, `activ`) VALUES
(0, 'neu', '', '', 'passiv'),
(1, 'Deutsch', 'germany.gif', 'de', 'activ'),
(7, 'Russisch', 'Russia.gif', 'ru', 'passiv'),
(8, 'Englisch', 'uk.gif', 'en', 'passiv');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `presse`
--

CREATE TABLE IF NOT EXISTS `presse` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `titel_de` varchar(100) DEFAULT NULL,
  `descr_de` text,
  `bild` varchar(60) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `titel_ru` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Russisch',
  `descr_ru` text CHARACTER SET utf8 COMMENT 'Russisch',
  `titel_en` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Englisch',
  `descr_en` text CHARACTER SET utf8 COMMENT 'Englisch',
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `presse`
--

INSERT INTO `presse` (`p_id`, `titel_de`, `descr_de`, `bild`, `datum`, `titel_ru`, `descr_ru`, `titel_en`, `descr_en`) VALUES
(0, 'neu', 'neu', NULL, NULL, NULL, NULL, NULL, NULL),
(1, 'Wir sind da!', '<p>Wir sind mit <strong>UrbanCMS</strong> Version 2 online.</p>', 'Desert.jpg', '2012-03-21', 'Мы здесь', '<span id="result_box" class="short_text" lang="ru"><span class="hps">Мы здесь</span></span>', NULL, NULL);


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `statistik`
--

CREATE TABLE IF NOT EXISTS `statistik` (
  `stat_id` int(11) NOT NULL AUTO_INCREMENT,
  `seite` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_date` varchar(40) DEFAULT NULL,
  `counter` int(30) DEFAULT NULL,
  PRIMARY KEY (`stat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tables`
--

CREATE TABLE IF NOT EXISTS `tables` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `titel_de` varchar(150) NOT NULL,
  `rights` enum('999','777','555','333') NOT NULL DEFAULT '333',
  `rang` int(10) NOT NULL,
  `mode` int(1) DEFAULT NULL COMMENT 'HTML Mode',
  PRIMARY KEY (`table_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Daten für Tabelle `tables`
--

INSERT INTO `tables` (`table_id`, `titel_de`, `rights`, `rang`, `mode`) VALUES
(0, 'neu', '333', 0, NULL),
(2, 'tables', '999', 1, NULL),
(3, 'admin', '333', 2, NULL),
(4, 'kategorie', '777', 3, NULL),
(9, 'language', '999', 1, NULL),
(10, 'banner', '777', 2, NULL),
(12, 'presse', '555', 6, 1),
(13, 'abonennt', '555', 6, 1);
