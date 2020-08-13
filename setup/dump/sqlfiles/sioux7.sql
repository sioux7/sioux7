-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 11. Aug 2013 um 17:29
-- Server Version: 5.5.16
-- PHP-Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `sioux7`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `abonennt`
--

DROP TABLE IF EXISTS `abonennt`;
CREATE TABLE IF NOT EXISTS `abonennt` (
  `abo_id` int(11) NOT NULL AUTO_INCREMENT,
  `titel_de` enum('myselect','Herr','Frau') DEFAULT NULL,
  `aname` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `aktiv` int(1) DEFAULT NULL,
  PRIMARY KEY (`abo_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Daten für Tabelle `abonennt`
--

INSERT INTO `abonennt` (`abo_id`, `titel_de`, `aname`, `email`, `aktiv`) VALUES
(0, '', NULL, NULL, NULL),
(9, 'Herr', 'Urban', 'urban@uidev.de', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `banner`
--

DROP TABLE IF EXISTS `banner`;
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
  `egal` int(1) DEFAULT NULL COMMENT 'ohne Ablauf',
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `banner`
--

INSERT INTO `banner` (`banner_id`, `titel_de`, `banner`, `link`, `aufrufe`, `klicks`, `alt`, `aktiv`, `datum`, `egal`) VALUES
(0, 'neu', '', '', 0, 0, '', 'passiv', '2012-03-01', NULL),
(1, 'Werbung', 'werbebanner/werbung.gif', 'http://uidev.de', 39, 4, 'uidev.de', 'aktiv', '2015-08-23', 1),
(2, 'DomainFaktory', 'https://admin.df.eu/pics/banner_01.gif', 'https://df.eu/kwk/312122', 38, 1, 'Domainfaktory', 'aktiv', '2013-08-31', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `firma`
--

DROP TABLE IF EXISTS `firma`;
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
-- Tabellenstruktur für Tabelle `grouprights`
--

DROP TABLE IF EXISTS `grouprights`;
CREATE TABLE IF NOT EXISTS `grouprights` (
  `gr_id` int(11) NOT NULL AUTO_INCREMENT,
  `gradmin` int(10) DEFAULT NULL,
  `group_nav` enum('myselect','table','admin','gradmin','admin_id','single') DEFAULT NULL,
  `tables` varchar(255) DEFAULT NULL,
  `table_nav` enum('myselect','table','tables','tables','titel_de','multi') DEFAULT NULL,
  PRIMARY KEY (`gr_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `grouprights`
--

INSERT INTO `grouprights` (`gr_id`, `gradmin`, `group_nav`, `tables`, `table_nav`) VALUES
(0, NULL, '', NULL, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

DROP TABLE IF EXISTS `kategorie`;
CREATE TABLE IF NOT EXISTS `kategorie` (
  `kategorie_id` int(11) NOT NULL AUTO_INCREMENT,
  `aktiv` int(1) DEFAULT NULL,
  `titel_de` varchar(150) DEFAULT NULL,
  `parent` varchar(200) DEFAULT NULL,
  `parent_nav` enum('table','kategorie','parent','single','kategorie_id') DEFAULT NULL,
  `plugin` varchar(200) DEFAULT NULL,
  `menu` enum('top','menu','footer','user') NOT NULL DEFAULT 'menu',
  `rang` int(11) DEFAULT NULL,
  `intern` int(1) DEFAULT NULL,
  `media_nav` enum('ext','media','media_id') DEFAULT NULL COMMENT 'max. 450px Breite',
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

INSERT INTO `kategorie` (`kategorie_id`, `aktiv`, `titel_de`, `parent`, `parent_nav`, `plugin`, `menu`, `rang`, `intern`, `media_nav`, `keywords`, `description`, `ismodul`, `beschreibung_de`, `inhalt_de`, `titel_ru`, `beschreibung_ru`, `inhalt_ru`, `titel_en`, `beschreibung_en`, `inhalt_en`) VALUES
(0, 0, 'neu', '0', NULL, NULL, 'menu', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'Impressum', '0', NULL, NULL, 'top', 1, 0, NULL, '   Impressum					', 'Unser Impressum						', 1, 'Impressum						', '                	$sql_queryfir = "SELECT * FROM firma";\r\n	$resultfir = mysql_query($sql_queryfir);\r\n	$rowfir = mysql_fetch_array($resultfir);\r\n?>\r\n<TABLE BORDER=0 WIDTH=560 CELLSPACING=0 CELLPADDING=0>\r\n<TR>\r\n    <TD VALIGN=top>\r\n        <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>\r\n	<?php if(file_exists("images/logo/".$rowfir[''logo'']) == 1){ ?>\r\n	<tr>\r\n	    <td><img src="images/logo/<?php echo $rowfir[''logo'']; ?>"></td>\r\n	</tr>\r\n	<?php } \r\n         ?>\r\n	<TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P><strong><?php echo $rowfir[''firma'']; ?></strong></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P><?php echo $rowfir[''adresse'']; ?></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P><?php echo $rowfir[''plz'']." ".$rowfir[''ort'']; ?></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top>\r\n                <P>&nbsp;&nbsp;</P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top>\r\n                <P>Ansprechpartner:</P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P><?php echo $rowfir[''ansprechpartner'']; ?></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top>\r\n                <P>&nbsp;&nbsp;&nbsp;</P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top>\r\n                <P> Telefon: <?php echo $rowfir[''telefon'']; ?></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P> Telefax: <?php echo $rowfir[''telefax'']; ?></P></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top WIDTH=250>\r\n                <P> Mail: <?php echo $rowfir[''email'']; ?></P></TD>\r\n        </TR>\r\n		<TR>\r\n            <TD  VALIGN=top>\r\n                <P>&nbsp;&nbsp;&nbsp;</P></TD>\r\n        \r\n        <TR>\r\n            <TD  VALIGN=top height=10></TD>\r\n        </TR>\r\n        <TR>\r\n            <TD  VALIGN=top>\r\n                <P>&nbsp;&nbsp;&nbsp;</P></TD>\r\n        </TR>\r\n        \r\n       \r\n        </TABLE>\r\n	</TD>\r\n    \r\n</TR>\r\n<TR>\r\n     <TD  VALIGN=top colspan=2>\r\n     <P><?php echo $rowfir[''descr'']; ?></P>\r\n	 </TD>\r\n</TR>\r\n</TABLE>			', 'отпечаток', 'отпечаток', 'echo ''отпечаток'';', NULL, NULL, NULL),
(3, 1, 'Kontakt', '0', NULL, 'kontakt', 'top', 2, 0, NULL, '                                    Kontakt                    														', '                                         Nehmen Sie Kontakt mit uns auf               														', 1, '                                        Kontakt                														', '', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 'Sitemap', '0', NULL, NULL, 'top', 3, NULL, NULL, '                            Sitemap							', '                            Seitenübersicht							', 1, '                            Seitenübersicht							', '$feld="kategorie_id";\r\n$table="kategorie";\r\n\r\n$menu="top";\r\necho "Topmenu: <ul style=''list-style: none;''>".kat($table,0)."</ul>"; \r\n\r\n$menu="menu";\r\necho "Menu: <ul style=''list-style: none;''>".kat($table,0)."</ul>"; \r\n\r\n$menu="footer";\r\necho "Footermenu: <ul style=''list-style: none;''>".kat($table,0)."</ul>"; \r\n\r\nfunction kat($table, $intStart, $pos=0, $strEinrueckung="&nbsp;"){\r\n	global $wert, $feld, $menu;\r\n	$strSQL = "SELECT * FROM ".$table." WHERE parent=".$intStart." AND aktiv=1 AND menu=''".$menu."'' ORDER BY rang";\r\n	$dbQuery = mysql_query($strSQL) or die(mysql_error());\r\n	while($arrKat = mysql_fetch_assoc($dbQuery)){\r\n	if($arrKat[''kategorie_id''] !=''0'' && $arrKat[''titel_''.$_SESSION[''lang'']]) {\r\n		\r\n			$strReturn.="<li><a href=''c".$arrKat[''kategorie_id'']."_".$arrKat[''titel_''.$_SESSION[''lang'']].".html''";\r\n			$strReturn.=">".str_repeat($strEinrueckung, $pos)."&raquo;&nbsp;".$arrKat[''titel_''.$_SESSION[''lang'']]."&nbsp;";\r\n			$strReturn.="</a><br>".str_repeat($strEinrueckung, $pos)."&nbsp;&nbsp;".strip_tags($arrKat[''beschreibung_''.$_SESSION[''lang'']]);\r\n			$strReturn .="</li>\\n";\r\n\r\n		$strSQL2 = "SELECT * FROM ".$table." WHERE parent=".$arrKat[$feld]." AND menu=''".$menu."''";\r\n		if($arrKat[$feld] != 0) {\r\n			$unter=mysql_query($strSQL2);\r\n			if(mysql_num_rows($unter)>0) $strReturn.= kat($table,$arrKat[$feld],$pos+2,$strEinrueckung);\r\n		}\r\n	}}\r\n	return $strReturn;\r\n}', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, 'Empfehlung', '0', NULL, 'empfehlung', 'top', 4, 0, NULL, 'Empfehlung       								', 'Empfehlen Sie unsere Seite weiter      		', 1, ' Empfehlen Sie unsere Seiten weiter             						', '', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 0, 'Presse', '0', NULL, '', 'menu', 99, 0, NULL, '                                                                                    Presse																					', '                                                                                    Unsere Presse																					', 1, '                                                                                    Unsre Presse																					', 'if(!isset($_REQUEST[''p_id''])){\r\n$sql_query = "SELECT * FROM presse ORDER BY p_id DESC";\r\n$result = mysql_query($sql_query) or die (mysql_error());\r\n    print "<table border=0 cellspacing=1 cellpadding=0 width=450>\r\n			<tr><td>Unsere eigenen Presseberichte.<br>Wir berichten regelmässig über unsre esten Entwicklungen und Trends. Erfahren Sie hier unsre brandaktuellsten Neuheiten.<br></td></tr>";\r\n 	while ($row = mysql_fetch_array($result)) {\r\n               if($row[''p_id''] !=0){\r\n		print "<tr><td><a href=''c6_presse.html?p_id=".$row[''p_id'']."''>» ".$row[''titel_de''].", ".datum($row[''datum''])."</a></td></tr>";}\r\n		}\r\n	print "</table>";\r\n}\r\nelse {\r\n\r\n$sql_query = "SELECT * FROM presse WHERE p_id=".$_REQUEST[''p_id''];\r\n$result = mysql_query($sql_query) or die (mysql_error($db));\r\nwhile ($row = mysql_fetch_array($result)){\r\n\r\n?>\r\n<table border="0" cellpadding="0" cellspacing="0" width=500>\r\n  <?php\r\n	  if($row[''bild''] != "" and file_exists ("upload/images/".$row[''bild'']) == 1){\r\n			?>\r\n			<td VALIGN="TOP"><a href="upload/images/<?php echo $row[''bild''] ?>" rel="cb"><img SRC="upload/images/<?php echo $row[''bild''] ?>" ALT="Objektbild" style="margin: 5px; max-width: 180px;"></a></td>\r\n		<?php\r\n	 }\r\n	 else { ?>\r\n	 <td VALIGN="TOP"></td>\r\n	 <?php\r\n		}\r\n	?>\r\n    <td width="80%" valign="top">\r\n       <table border=0 cellspacing=0 cellpadding=2 wdth="100%">\r\n       	<?php\r\n			$descr=$row[''descr_''.$_SESSION[''lang'']];\r\n		?>\r\n		<tr>\r\n			<td class="normal"><?php echo $descr ?></b></td>\r\n		</tr>\r\n		<tr>\r\n			</td><td align="right"><?php echo datum($row[''datum'']); ?></b></td>\r\n		</tr>\r\n		</table>\r\n		</td>\r\n  </tr>\r\n</table>\r\n</center>\r\n<?php\r\n	}\r\n}																					', 'нажимать', 'нажимать', 'if(!isset($_REQUEST[''p_id''])){\r\n$sql_query = "SELECT * FROM presse ORDER BY p_id DESC";\r\n$result = mysql_query($sql_query) or die (mysql_error());\r\n    print "<table border=0 cellspacing=1 cellpadding=0 width=450>\r\n			<tr><td>Unsere eigenen Presseberichte.<br>Wir berichten regelm&auml;ssig &uuml;ber unsre esten Entwicklungen und Trends. Erfahren Sie hier unsre brandaktuellsten Neuheiten.<br></td></tr>";\r\n 	while ($row = mysql_fetch_array($result)) {\r\n               if($row[''titel_de''] !=''''){\r\n		print "<tr><td><a href=''index.php?kategorie=c6_presse&p_id=".$row[''p_id'']."''>&raquo;&nbsp;".$row[''titel_ru''].", ".datum($row[''datum''])."</a></td></tr>";}\r\n		}\r\n	print "</table>";\r\n}\r\nelse {\r\n\r\n$sql_query = "SELECT * FROM presse WHERE p_id=".$_REQUEST[''p_id''];\r\n$result = mysql_query($sql_query) or die (mysql_error());\r\nwhile ($row = mysql_fetch_array($result)){\r\n\r\n?>\r\n<table border="0" cellpadding="0" cellspacing="0" width=500>\r\n  <?php\r\n	  if($row[''bild''] != "" and file_exists ("upload/images/".$row[''bild'']) == 1){\r\n			?>\r\n			<td VALIGN="TOP"><img SRC="upload/images/<?php echo $row[''bild''] ?>" BORDER="1" ALT="Objektbild"></td>\r\n		<?php\r\n	 }\r\n	 else { ?>\r\n	 <td VALIGN="TOP"></td>\r\n	 <?php\r\n		}\r\n	?>\r\n    <td width="80%" valign="top">\r\n       <table border=0 cellspacing=0 cellpadding=2 wdth="100%">\r\n       	<?php\r\n			$descr=$row[''descr_''.$_SESSION[''lang'']];\r\n		?>\r\n		<tr>\r\n			<td class="normal"><?php echo $descr ?></b></td>\r\n		</tr>\r\n		<tr>\r\n			</td><td align="right"><?php echo datum($row[''datum'']); ?></b></td>\r\n		</tr>\r\n		</table>\r\n		</td>\r\n  </tr>\r\n</table>\r\n</center>\r\n<?php\r\n	}\r\n}																					', NULL, NULL, NULL),
(8, 0, 'Newsletter', '0', NULL, '', 'menu', 99, 0, NULL, 'Nesletter, Neues, Aktuelles', 'Unser eigener Newsletter', 1, 'Unser eigener Newsletter', 'if (isset($_REQUEST[''anmelden''])) {\r\n	   if (trim($_REQUEST[''username'']) == '''' || strlen(trim($_REQUEST[''username''])) < 5) {\r\n			$error = TRUE;\r\n			$errorMsg = 1;\r\n\r\n		}\r\n		if (!eregi("^[a-z0-9]+([-_.]?[a-z0-9])+@[a-z0-9]+([-_.]?[a-z0-9])+.[a-z]{2,4}$", $_REQUEST[''email''])) {\r\n			$error = TRUE;\r\n			$errorMsg = 2;\r\n			\r\n		}\r\n		$result=@mysql_query("SELECT email FROM abonennt WHERE`email` = ''".@mysql_real_escape_string($_POST[''email''])."''") or die(mysql_error());\r\n	$num = mysql_num_rows($result);\r\n	if ($num == 1) {\r\n			$error = TRUE;\r\n			$errorMsg = 3;}\r\n		if ($error == TRUE) {\r\n			if ($errorMsg == 1) { echo "<div class=''error''><div class=''text''>Der Benutzername muss mindestens 5 Zeichen lang sein!</div></div><br />"; }\r\n			if ($errorMsg == 2) { echo "<div class=''error''><div class=''text''>Die E-Mailadresse ist ungültig!</div></div><br />"; }\r\n			if ($errorMsg == 3) { echo "<div class=''error''><div class=''text''>Sie sind bereits angemeldet.</div></div><br />"; }\r\n		}\r\n		else {\r\n			$insertUser = @mysql_query("INSERT INTO abonennt SET `titel_de` = ''".@mysql_real_escape_string($_POST[''ansprache''])."'', `aname` = ''".@mysql_real_escape_string($_POST[''username''])."'', `email` = ''".@mysql_real_escape_string($_POST[''email''])."'', `aktiv` = ''passiv''") or die(mysql_error());\r\n			\r\n			$mailHeaders  = "MIME-Version: 1.0";\r\n			$mailHeaders .= "Content-type: text/html; charset=utf-8";\r\n			$mailHeaders .= "Content-Transfer-encoding: 8bit";\r\n			$mailHeaders .= "From: ".$info;\r\n			$mailTo = $_POST[''email''];\r\n			$mailSubject = "Ihre NewsLetter bei ".$domain_title;\r\n			$mailText = "Hallo ".$_POST[''username'']."\\n ";\r\n			$mailText .= "Sie haben sich erfolgreich beim NewsLetter registriert.\\n ";\r\n			$mailText .= "Ihr Account muss jetzt noch aktiviert werden.\\n";\r\n			$mailText .= "http://".$_SERVER[HTTP_HOST]."/c8_newsletter.html?mail=".$_POST[''email'']."&option=activate  \\n";\r\n			$mailText .= "Sollten Sie diese E-Mail unerwuenscht bekommen haben, so senden Sie uns bitte eine Nachricht an urban@uidev.de zu, oder ignorieren Sie diese Nachricht einfach.\\n";\r\n			$mailText .= "Das ".$domain_title." Newsletter - Team";\r\n			include ''include/umail.inc.php'';\r\n			$m= new Mail; \r\n$m->From("$info");\r\n$m->To( "$mailTo" );\r\n$m->Subject( "Newsletteranmeldung" );\r\n$m->Body( $mailText );\r\n$m->Priority(3) ;\r\n$m->Send();	\r\n			echo "<div class=''error''>Sie haben sich erfolgreich registriert. Zur Bestätigung wurde Ihnen eine E-Mail geschickt!</div><br />";\r\n		}\r\n}\r\n\r\nif (isset($_REQUEST[''option''])) {\r\n	if($_REQUEST[''option''] == "activate") {\r\n		$update= @mysql_query("UPDATE abonennt SET aktiv=''1'' WHERE email=''".$_REQUEST[''mail'']."''");\r\n		echo "<div class=''error''>Ihre Newsletter Bestellung wurde erfolgreich aktiviert.</div><br />";}\r\n		if($_REQUEST[''option''] == "delete") {\r\n		$del= @mysql_query("DELETE FROM abonennt WHERE email=''".$_REQUEST[''mail'']."''");\r\n		echo "<div class=''error''>Ihre Newsletter Bestellung wurde erfolgrecih abgemeldet.</div><br />";}\r\n}\r\necho "<img src=''images/news/news.png'' alt=''Newsletter'' title=''Presse - Newsletter''><br>\r\n<p><strong>Immer aktuell und ganz persönlich informiert</strong><br>\r\n\r\nMit dem Newsletter informieren wir Sie regelmäßig per E-Mail über unsere aktuellen Angebote und Aktionen und eServices. Völlig kostenlos und unverbindlich. Erfahren Sie als erstes, was ".$domain_title." Neues zu bieten hat. Selbstverständlich garantieren wir die Sicherheit Ihrer Daten nach dem Datenschutzgesetz und werden diese nicht an Dritte weiterleiten.</p>";\r\n', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 0, 'Suche', '0', NULL, NULL, 'top', 99, NULL, NULL, 'Suchergebnis', 'Suchergebnis', 1, 'Suche auf Domain', 'echo "<h3>Suchergebnis f&uuml;r ".$_REQUEST[search]."</h2>";\r\n$query="SELECT * FROM kategorie WHERE titel_".$_SESSION[lang]." LIKE ''%".$_REQUEST[search]."%'' OR  inhalt_".$_SESSION[lang]." LIKE ''%".$_REQUEST[search]."%''";\r\n$result=mysql_query($query) or die("fehler");\r\nwhile($row=mysql_fetch_array($result)){\r\n	if($row[kategorie_id] !=0) {\r\n		echo "&raquo; <a href=''".getLink($row[kategorie_id])."''>".$row[titel_.$_SESSION[lang]]."</a><br>"; \r\n	}\r\n}', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 1, 'Home', '0', NULL, '', 'menu', 1, 0, '', 'test', 'test', 0, 'Ein Test', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.&nbsp; &nbsp;<br /><br />Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.&nbsp; &nbsp;<br /><br />Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.&nbsp; &nbsp;<br /><br />Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer', 'дома', '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', NULL, NULL, NULL),
(15, 1, 'Entwicklungen', '0', NULL, '', 'footer', 0, 0, NULL, 'Entwicklungen', 'Entwicklungen', 0, 'Neue Entwicklungen', 'Neue Entwicklung:', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `language`
--

DROP TABLE IF EXISTS `language`;
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
(7, 'Russisch', 'russia.gif', 'ru', 'passiv'),
(8, 'Englisch', 'uk.gif', 'en', 'passiv');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `media_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `art` enum('bild','datei') DEFAULT NULL,
  `datei` varchar(255) DEFAULT NULL,
  `descr` text,
  `pos` enum('left','center','right') DEFAULT NULL,
  PRIMARY KEY (`media_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `media`
--

INSERT INTO `media` (`media_id`, `level`, `art`, `datei`, `descr`, `pos`) VALUES
(0, 0, NULL, 'neu', NULL, NULL),
(5, 14, 'bild', 'ioux.png', '<p>test</p>', 'right');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `presse`
--

DROP TABLE IF EXISTS `presse`;
CREATE TABLE IF NOT EXISTS `presse` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `titel_de` varchar(100) DEFAULT NULL,
  `descr_de` text,
  `bild` varchar(60) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `titel_ru` varchar(200) DEFAULT NULL COMMENT 'Russisch',
  `descr_ru` text COMMENT 'Russisch',
  `titel_en` varchar(200) DEFAULT NULL COMMENT 'Englisch',
  `descr_en` text COMMENT 'Englisch',
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `presse`
--

INSERT INTO `presse` (`p_id`, `titel_de`, `descr_de`, `bild`, `datum`, `titel_ru`, `descr_ru`, `titel_en`, `descr_en`) VALUES
(0, 'neu', 'neu', NULL, NULL, NULL, NULL, NULL, NULL),
(1, 'Wir sind da!', '<p>Wir sind mit <strong>SIOUX7</strong> Version 3 online.</p>', '25180_ioux.png', '2013-08-11', 'Мы здесь', '<span id="result_box" class="short_text" lang="ru"><span class="hps">Мы здесь</span></span>', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `statistik`
--

DROP TABLE IF EXISTS `statistik`;
CREATE TABLE IF NOT EXISTS `statistik` (
  `stat_id` int(11) NOT NULL AUTO_INCREMENT,
  `seite` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_date` varchar(40) DEFAULT NULL,
  `counter` int(30) DEFAULT NULL,
  PRIMARY KEY (`stat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sysprotokoll`
--

DROP TABLE IF EXISTS `sysprotokoll`;
CREATE TABLE IF NOT EXISTS `sysprotokoll` (
  `sys_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `datum` date DEFAULT NULL,
  `syslog` text,
  PRIMARY KEY (`sys_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tables`
--

DROP TABLE IF EXISTS `tables`;
CREATE TABLE IF NOT EXISTS `tables` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `titel_de` varchar(150) NOT NULL,
  `rights` enum('999','777','555','333') NOT NULL DEFAULT '333',
  `rang` int(10) NOT NULL,
  `mode` int(1) DEFAULT NULL COMMENT 'HTML Mode',
  PRIMARY KEY (`table_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Daten für Tabelle `tables`
--

INSERT INTO `tables` (`table_id`, `titel_de`, `rights`, `rang`, `mode`) VALUES
(0, 'neu', '333', 0, NULL),
(2, 'tables', '999', 1, NULL),
(3, 'admin', '333', 2, NULL),
(4, 'kategorie', '777', 3, NULL),
(9, 'language', '999', 1, NULL),
(10, 'banner', '777', 3, 0),
(12, 'presse', '555', 6, 1),
(13, 'abonennt', '555', 6, 1),
(15, 'grouprights', '999', 2, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
