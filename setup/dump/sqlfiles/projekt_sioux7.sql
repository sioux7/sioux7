
DROP TABLE IF EXISTS `sioux7_abonennt`;
CREATE TABLE `sioux7_abonennt` (
  `abo_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `titel` enum('myselect','Herr','Frau') DEFAULT NULL,
  `aname` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `aktiv` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_abonennt`
--

INSERT INTO `sioux7_abonennt` (`abo_id`, `dom_id`, `lang`, `titel`, `aname`, `email`, `aktiv`) VALUES
(0, NULL, '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_admin`
--

DROP TABLE IF EXISTS `sioux7_admin`;
CREATE TABLE `sioux7_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `adminname` varchar(20) CHARACTER SET latin1 NOT NULL,
  `login` varchar(30) CHARACTER SET latin1 NOT NULL,
  `passwort` varchar(50) CHARACTER SET latin1 NOT NULL,
  `firma` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `telefon` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `rights` enum('999','777','555','333') CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_admin`
--

INSERT INTO `sioux7_admin` (`admin_id`, `dom_id`, `lang`, `adminname`, `login`, `passwort`, `firma`, `telefon`, `email`, `rights`) VALUES
(0, NULL, NULL, 'neu', 'neu', '', '', '', '', '333'),
(25180, NULL, NULL, 'Olaf Urban', 'urban', '487f13a635c78916ddc5a70bafc2f775', 'UIDEV', '089736455', 'o.urban@uidev.de', '999');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_banner`
--

DROP TABLE IF EXISTS `sioux7_banner`;
CREATE TABLE `sioux7_banner` (
  `banner_id` int(10) UNSIGNED NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `titel` text NOT NULL,
  `banner` varchar(200) NOT NULL,
  `link` text NOT NULL,
  `aufrufe` int(10) NOT NULL DEFAULT '0',
  `klicks` int(10) NOT NULL DEFAULT '0',
  `alt` text,
  `aktiv` enum('aktiv','passiv') DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `egal` int(1) DEFAULT NULL COMMENT 'ohne Ablauf'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_banner`
--

INSERT INTO `sioux7_banner` (`banner_id`, `dom_id`, `titel`, `banner`, `link`, `aufrufe`, `klicks`, `alt`, `aktiv`, `datum`, `egal`) VALUES
(0, NULL, 'neu', '', '', 0, 0, '', 'passiv', '2012-03-01', NULL),
(2, 0, 'DomainFaktory', 'https://admin.df.eu/pics/banner_01.gif', 'https://df.eu/kwk/312122', 35435, 1, 'Domainfaktory', 'aktiv', '2013-08-31', 0),
(3, 0, 'Amazon', 'https://images-na.ssl-images-amazon.com/images/G/03/associates/maitri/banner/de-books-728x90._V192564663_.gif', 'http://www.amazon.de/l/186606?_encoding=UTF8&adid=08ZFBZEEFD0K0C5FAGP3&camp=1578&creative=5726&linkCode=ur1&tag=httpuidevde-21', 35435, 0, 'Amazon Bücher', 'aktiv', '2012-03-01', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_blog`
--

DROP TABLE IF EXISTS `sioux7_blog`;
CREATE TABLE `sioux7_blog` (
  `blog_id` int(10) UNSIGNED NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `bereich` enum('myselect','Server','Client','Datenbank','PHP') DEFAULT NULL COMMENT 'Blogs',
  `title` varchar(255) NOT NULL,
  `short` text,
  `descr` text,
  `bild` varchar(200) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `datei` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_blog`
--

INSERT INTO `sioux7_blog` (`blog_id`, `dom_id`, `lang`, `bereich`, `title`, `short`, `descr`, `bild`, `datum`, `datei`) VALUES
(0, NULL, NULL, NULL, 'neu', NULL, NULL, NULL, NULL, NULL),
(54, NULL, NULL, 'Server', 'vHost', 'Problem bei vHosts.', 'Wenn die Sessions bei vHosts nicht gespeichert werden, kann es an der Einstellung der php.ini liegen. <br />&Auml;ndern Sie ie Zeile mit session.cookie_domain = <strong>localhost =&gt; </strong>session.cookie_domain = <strong>none</strong>', NULL, '2013-11-15', NULL),
(55, NULL, NULL, 'Datenbank', 'SQL', 'Alternative zu LIKE', 'Die Suche mit <strong>LIKE %$suche%</strong> erzielt zwar ein gutes Ergebnis, jedoch ist die Abfrage mit <strong>REGEXP "[[:&lt;:]]''.$suche.''[[:&gt;:]]"</strong> nicht nur schneller, sondern es wird exakt gesucht.<br />Dies ist sinnvoll, wenn z.b. nach 56 gesucht wird, aber nicht nach 156.', NULL, '2013-11-15', NULL),
(57, 0, 'de', 'PHP', 'Kompression', '<strong>Zuviele Files verursachen lange Ladezeit. Es gibt sehr viele M&ouml;glichkeiten, dies zu optimieren. Zum Beispiel &uuml;ber das CDN. Jedoch kostenpflichtig. Die einfachste L&ouml;sung ist gzip.</strong>', 'PHP bietet neben vielen Eigenschaften und immer st&auml;ndig verbesserter Perfomance auch die M&ouml;glichkeit mit gzip zu arbeiten. Jedoch muss dies der Server unterst&uuml;tzen. Ob dies m&ouml;glich ist, kann man mit phpinfo(); ermitteln.<br />Wenn der Server dies unterst&uuml;tzt, k&ouml;nnen Sie gzip anwenden.<br />Einfach alles komprimieren und eine Code im header/footer einbauen, die gzip startet/beendet. Dies bewirkt, dass die Files im Cache gespeichert werden und nur einmalig geladen werden m&uuml;ssen.', NULL, '2014-09-01', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_boxes`
--

DROP TABLE IF EXISTS `sioux7_boxes`;
CREATE TABLE `sioux7_boxes` (
  `box_id` int(11) NOT NULL,
  `dom_id` int(11) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `aktiv` int(1) NOT NULL DEFAULT '0',
  `pos` enum('left','right') DEFAULT NULL,
  `plugin` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='widget';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_codesnippets`
--

DROP TABLE IF EXISTS `sioux7_codesnippets`;
CREATE TABLE `sioux7_codesnippets` (
  `cs_id` int(10) NOT NULL COMMENT 'codeschnippsel',
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `bereich` enum('jQuery','PHP') DEFAULT NULL,
  `titel` varchar(200) NOT NULL,
  `descr` text,
  `code` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_codesnippets`
--

INSERT INTO `sioux7_codesnippets` (`cs_id`, `dom_id`, `lang`, `bereich`, `titel`, `descr`, `code`) VALUES
(0, NULL, NULL, NULL, 'neu', NULL, NULL),
(2, NULL, NULL, 'PHP', 'object2array', 'Gibt das Ojekt als Array aus', '<?php\r\nfunction object2array($obj) {\r\n    $_arr = is_object($obj) ? get_object_vars($obj) : $obj;\r\n    foreach ($_arr as $key => $val) {\r\n        $val = (is_array($val) || is_object($val)) ? object2array($val) : $val;\r\n        $arr[$key] = $val;\r\n    }\r\n    return $arr;\r\n} \r\n\r\n$ausgabe=object2array($obj);\r\n?>'),
(3, NULL, NULL, 'PHP', 'Array Suche', 'Sucht in den Arrays nach Werten. ', '<?php\r\nfunction GetArrKey( $findArr, $key_arr, $depth=0 )\r\n{\r\n        if( count($key_arr) <= $depth || !array_key_exists($key_arr[$depth], $findArr) )\r\n                return NULL;\r\n        else if( count($key_arr) == $depth+1 )\r\n                return $findArr[$key_arr[$depth]];\r\n       \r\n        return GetArrKey( $findArr[$key_arr[$depth]], $key_arr, $depth+1 );\r\n} \r\n\r\n$ausgabe=GetArrKey( $array, array( "anfang","suche" ) ) ;\r\n\r\n// Ausgabe\r\nwhile(list($arr, $val) = each($ausgabe)) {\r\n    # erste Dimension auslesen\r\n     echo "1. Dimension: ";\r\n    echo $arr . ": " . $val . "<br>";\r\n \r\n    while (list($key, $values) = each($val))\r\n     {\r\n        echo "2. Dimension: ";\r\n         echo $key, ": ".$values."<br>";\r\n    }\r\n }\r\n?>'),
(4, NULL, NULL, 'PHP', 'WordWrap', 'WordWrap', '<?php\r\n\r\n$str ="Das ist ein einfacher Test, der auf wenige Wörter gekürzt werden soll";\r\n$maxlen = 5;\r\n\r\n$words = preg_split("/s/", $str);\r\n$short = implode(array_slice($words, 0, $maxlen),"");\r\nif (count($words) > $maxwords) $short .=" ...";\r\necho $short;\r\n\r\n?>'),
(7, NULL, NULL, 'jQuery', 'dynamisches Style', 'Wenn ein Styleset dynamisch gebraucht wird, jedoch nur einmalig.', 'var css = document.createElement("style");\r\nif(!$("style[title=\\''jsAlert2_popupBody\\'']")[0]) {\r\n$("head").append("<style type=\\"text/css\\" title=\\"jsAlert2_popupBody\\">#jsAlert2_popupBody ul { margin:0;padding:0; }</style>");}'),
(8, NULL, NULL, 'PHP', 'zeitlicher Abbruch', 'Wenn ein Script zu lange läuft, sollte dies abgebrochen werden.', '<?php\r\n$opts = array(''http'' =>\r\n    array(\r\n        ''method''  => ''POST'',\r\n        ''timeout'' => 30\r\n    )\r\n);\r\n$context  = stream_context_create($opts);\r\n$result = file_get_contents(''http://example.com/submit.php'', false, $context);\r\n?>'),
(11, NULL, NULL, 'PHP', 'RandomCode', 'Erzeugt eine zufällige Code. ', '<?php\r\n$strCode = getRandCode();\r\nfunction getRandCode($intLaenge = 6){\r\n$strZeichen = str_shuffle(str_repeat("ABCDEFGHKMNPQRSWXZ23456789", 3));\r\nreturn substr($strZeichen,0,$intLaenge);\r\n}\r\n?>'),
(12, NULL, NULL, 'PHP', 'E-Mail prüfen', 'Prüft die E-Mail auf Gültigkeit.', '<?php\r\n$email = $_REQUEST[''email''];\r\nif(preg_match("~([a-zA-Z0-9!#$%&''*+-/=?^_`{|}~])@([a-zA-Z0-9-]).([a-zA-Z0-9]{2,4})~",$email)) {\r\necho ''gültig'';\r\n} else{\r\necho ''ungültig'';\r\n}\r\n?>'),
(13, 0, 'de', 'jQuery', 'leere divs entfernen', 'Wie man leere divs entfernen kann', 'jQuery(document).ready(function() {\r\n	$(''.div'').each(function() {\r\n        if ($(this).text() == "") {\r\n        	$(this).hide();\r\n        }\r\n	});	\r\n});'),
(14, 0, 'de', 'jQuery', 'Pagescroll', 'Scrollt zur ID der Page und setzt das menu aktiv', 'var bodyEl = $("body");\r\n		if(bodyEl.scrollTop() == 0){\r\n	            $(''#nav li'').first().addClass(''active'');\r\n		}\r\n		$(window).on("scroll", function() {\r\n		    var scrollTop = $(this).scrollTop();\r\n		    $("section").each(function() {\r\n		        var el = $(this),\r\n		         className = el.attr("id");	        \r\n		        if (el.offset().top-180 < scrollTop) {\r\n		        	$("#nav li").each(function(){\r\n		        		var currLink = $(this)[0].getElementsByTagName(''a'');\r\n	        			var refElement = $(currLink).attr("title");\r\n	        			if(refElement==className){\r\n		        		    	$(this).siblings().removeClass(''active'');\r\n		        		        $(this).addClass(''active'');\r\n	        			}\r\n		        	});\r\n		            bodyEl.addClass(className);          \r\n		        } else {\r\n		            bodyEl.removeClass(className);\r\n		        }\r\n		    })\r\n		});'),
(15, 0, 'de', 'jQuery', 'Random', 'Ordnet die ul/li Elemente nach Zufall neu an. Zu beachten ist, das ul id=myParent hat und alle li class=item haben. Funktioniert auch mit div', 'var max = $(''#myParent li.item'').length;\r\n    $(''#myParent'').children(''li.item'').sort(function(){\r\n      return Math.random()*max > (max/2) ? 1 : -1;\r\n    }).each(function(){\r\n        $(this).appendTo($(this).parent());\r\n    });');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_content`
--

DROP TABLE IF EXISTS `sioux7_content`;
CREATE TABLE `sioux7_content` (
  `con_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `ismod` int(1) DEFAULT NULL,
  `inhalt` text,
  `layout` enum('normal','spezial') DEFAULT NULL,
  `plugin` varchar(200) DEFAULT NULL,
  `bild` varchar(200) DEFAULT NULL,
  `pos` enum('right','left','center') DEFAULT NULL,
  `datei` varchar(200) DEFAULT NULL,
  `info` text COMMENT 'für InfoBox'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_content`
--

INSERT INTO `sioux7_content` (`con_id`, `level`, `ismod`, `inhalt`, `layout`, `plugin`, `bild`, `pos`, `datei`, `info`) VALUES
(0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 17, 0, 'Hier berichten wir über unsere Aktionen zur Verbesserung von SIOUX7.', 'normal', '', '25180_Bildschirmfoto 2013-08-02 um 13.44.13.png', 'right', NULL, ''),
(7, 18, 0, '', '', 'planung', NULL, 'right', NULL, NULL),
(5, 6, 0, '', '', 'Presse', NULL, 'right', NULL, NULL),
(6, 17, 0, '', '', 'report', NULL, 'right', NULL, NULL),
(8, 14, 0, '<b>Unser KnowHow für Sie!</b><br>\r\n<p>Langjährige Erfahrung in Datenbankentwicklung und Internet haben uns gelehrt, auf was bei Entwicklungen von Datenbankanwendungen für das Internet und auch für das Intranet zu achten ist. Zu den wichtigsten Bestandteile der Entwicklung gehört vor allem logisches Denken. Speziell in Sachen Internetenwicklungen mit datenbankgestützten Anwendungen mit Verwaltung für Online und Offline Anwendung sind die wichtigsten Schwerpunkte bei der Entwicklung.Nach langjähriger Entwicklung ist es uns gelungen ein eigenes CMS System auf zu bauen. Angefangen hat es mit dem versuch UrbansCMS. Nunmehr hat unser Projekt einen Namen bekommen.</p>\r\n<b>Open Source SIOUX7</b><br>\r\n<p>SIOUX7 ist die Neuentwicklung eines eigenem CMS Projekts. Durch die vollständige Auslegung des Systems sowie dem SIOUX7-Framework können von der Community selbst Erweiterungen geschrieben und eingesetzt werden.<br /> <br />Basierend auf den Standards PHP 5 und MySQL geht die Installation leicht von der Hand. Sollte es dennoch Probleme dabei geben, stehen wir Ihnen gerne zur Verfügung.<br /> <br />Durch Fachwissen ist es auch zu verdanken, dass es mittlerweile eine Vielzahl an Erweiterungen für das Open Source CMS gibt und SIOUX7 somit einer breiten Nutzergruppe gerecht werden kann. </p>\r\n<p><strong>Warum SIOUX7?</strong><br />Wir haben an alles gedacht: SEO, Suche, Plugins, struktuierte Datenbank, MultiLanguage, MultiDomain, schnelle Ladezeit und vieles mehr<br />Und es kommt noch vieles mehr dazu.<br /><br /></p>', 'normal', '', '25180_5180_ioux.png', 'right', NULL, ''),
(28, 38, 0, '<p><strong>Aufbau von SIOUX7:</strong><br />- PHP FrameWork (eigenes)<br />&nbsp; z.B. DBObjects, TemplateEngine, ClassLoader, GetParams, ErrorCatcher<br />- PHP 00P/00A Klassen<br />- Design Patterns<br />- optimiere SQL<br />&nbsp; derzeit MySQL<br />- jQuery<br />- teilweise auch JavaScipt<br />- CSS FrameWork<br />&nbsp; f&uuml;r Desktop, iPad, Mobile<br />&nbsp; spezial CSS f&uuml;r Inhalt<br />- HTML5 Architektur<br />- Widgets (Boxen rechts/links)<br /><br /><strong>Funktionsweise:</strong><br />Seite<br />StartUserEnviroment (lang,dom) -&gt; DBConnect -&gt; getParam -&gt; checkParam -&gt; catchError -&gt; buildSite from intro,media,plugin,strored cache -&gt; clearCache if changes<br />Management<br />StartUserEnviroment -&gt; Dbconnect -&gt; checkValidUser -&gt; setUserRights -&gt; displaySite (only his rights) -&gt; showOverview (with search,sort ) -&gt; editContent -&gt; checkBySave<br /><strong>important:</strong> security! check all files for settings. set password protect if need.<br />Developer<br />buildPlugin -&gt; registerAndCheck -&gt;aktivatePlugin<br /><br />Eine sehr ausf&uuml;hrliche genaue Beschreibung wird derzeit mit aufgebaut. Diese ist dann Online zu erreichen.<br /><br /></p>', 'normal', '', NULL, 'right', NULL, ''),
(23, 27, 0, '<p>Hier dann mal einige Tipps f&uuml;r einen guten Entwickler:<br />SQL<br />- in phpmyadmin die SQL unbedingt auf die Ergebnisse pr&uuml;fen. Wenn zuviele Ergebnisse ist die SQL nicht exakt.<br />- keine subquery. Das f&uuml;hrt zu doppelt und dreifachem Durchlauf und kann zu Endlos Schleifen ausarten. Besser: JOIN, UNIQUE<br />- nur ausgew&auml;hle Felder selectieren. Nicht *<br />PHP<br />- Funktionen und Klassen nutzen f&uuml;r sich wiederholende Prozesse. Am Besten: nur Klassen<br />immer ErrorCatch, d.h. Fehler immer abfangen. beste methode: try{code,fehler} catch { get errors and do somthig}<br />Unterschied: Klassen sind eine Sammlung von Funktionen innerhalb der Klasse. Nur wenn Die Klasse auch in einer anderen Klasse eingebunden wird, sind diese Funktionen auch dort vorhanden. F&uuml;r globale Funktionen, die immer mal wieder gebraucht werden ist eine Funktionslibary dann besser geeignet, da diese Funktionen dann &uuml;berall eingesetzt werden k&ouml;nnen.<br />- &uuml;bersichtliche Struktur, damit jeder es wiederfinden kann. Am besten mit Kommentar<br />HTML<br />- HTML5/CSS3 ist nun fast Standard. Auf jeden Fall: Keine Tabellen mehr.<br />- W3C konform. Pr&uuml;fen lassen und HTML Code verbessern. Sichtbarkeit, Lesefreundlich, Barierefreiheit. Eventuell mit tidy nachkorrigieren lassen. Besonders oft: SpagettiCode - Leerzeilen im HTML<br /><br />Cross Over<br />- verschieden Browser pr&uuml;fen auf Darstellung. Eventuell noch CSS Hacks einbauen. &auml;ltere IE brauchen derzeit bei HTML5 noch die HTML5.js<br />- Iphone,iPad,Smartphone und so weiter mal mit kostenlosen online Simulatoren pr&uuml;fen.</p>', 'normal', '', NULL, 'right', NULL, ''),
(9, 25, 0, '', '', 'code', NULL, 'right', NULL, NULL),
(10, 29, 0, '<p>Hier wird Ihnen geholfen</p>\r\n<p>Wenn Sie Hilfe zu SIOUX7 brauchen können Sie uns per Mail (sioux7.uidev(at)uidev.de) oder per Kontaktformular erreichen.</p>\r\n<p>Eventuelle Bugs und Fehler mit kostenlosem Patch werden hier veröffentlicht.</p>', 'normal', '', '25180_3_hilfe.jpg', 'left', NULL, ''),
(11, 30, 0, '<p>Teste feste alles</p>', 'spezial', '', '25180_Hollowbody 6.gif', 'center', 'odies.mp4', ''),
(12, 3, 0, '', '', 'kontakt', NULL, 'right', NULL, NULL),
(13, 33, 0, '<p>good net war?</p>', '', '', '25180_Earth (Clouds).gif', 'right', NULL, NULL),
(14, 34, 0, '', 'normal', '404', NULL, 'right', NULL, ''),
(15, 35, 0, '', 'normal', 'study', NULL, 'right', NULL, ''),
(16, 0, 1, '', 'normal', '', NULL, 'right', NULL, ''),
(17, 0, 0, '', 'normal', '', NULL, 'right', NULL, ''),
(19, 4, 0, '', 'normal', 'sitemap', NULL, 'right', NULL, ''),
(21, 2, 0, '', 'normal', 'imprint', NULL, 'right', NULL, ''),
(22, 21, 0, '', 'normal', 'links', NULL, 'right', NULL, ''),
(24, 36, 0, 'UIDEV ist KEINE Firma, sondern entwickelt ein eigenes kleines CMS Projekt mit Namen "SIOUX7". UIDEV steht für Urban Internetdeveloping und ist eine rein private Entwicklung ohne Profit. SIOUX7 ist kostenlos.\r\n', 'normal', '', NULL, 'right', NULL, ''),
(25, 22, 0, '<p>SIOUX7 ist eine freie Entwicklung von O. Urban.<br /> Das System ist denkbar einfach aufgebaut und kann von jeden leicht verstanden werden. In der Dokumentation wird erklärt, wie das CMS aufgebaut ist, welche Updates es gibt und wie man selbst Module / Plugins oder Templates für dieses System entwickeln kann.<br /> Die Instalation ist denkbar einfach:<br /> Entpaken Sie das ZIP in ein beliebiges Verzeichnis auf Ihren PC. Am besten in einen Verzeichnis auf Ihren lokalen WebServer, damit Sie es dort testen können.<br /> Wenn Sie keinen WebServer haben, übertragen Sie alle Dateien in das ROOT Verzeichnis Ihrer Domain.<br /> Sie sehen jetzt nur einen Hinweis, dass SIOUX7 startklar ist.<br /> Sie brauchen nun noch die Zugangsdaten zu Ihrer Datenbank.<br /> Wechseln Sie nun in das Verzeichnis /setup und starten Sie die Installation.<br /> Es werden Schritt für Schritt einige Daten abgrfragt.<br /> Folgen Sie den Anweisungen im Setup Programm.<br /> Innerhalb von wenigen Minuten ist Ihre Domain installiert.<br /> Wenn das Setup erfolgreich beendet ist, können Sie nun alle weiteren Einstellungen in der Verwaltung vornehmen.<br /> Entfernen Sie noch das komplette Verzeichnis /setup.<br /> Mitlerweile gibt es bereits weitere Update Module bei uidev.de<br /> Sie können diese Module bei uns laden und installieren.<br /> Die Installation von Updates und Module ist sehr einfach:<br /> Loggen Sie sich in die Verwaltung ein und wählen Sie in der Grundeinstellung Option das Menu Update.<br /> Laden Sie das ZIP Fille mit dem Programm.<br /> Es wird angezeigt, ob die Datei erfolgreich geladen wurde.<br /> Installieren Sie nun das ZIP<br /> Wenn Sie fertig sind, müssen Sie nur noch aktualisieren und das Neue Menu ist vorhanden.</p>\r\n<p>Sie können auch Plugins sehr leicht installieren. Laden Sie das ZIP, entpacken Sie es und laden es in das Verzeichnis /plugins. Das war es schon. Das neue Plugin ist nunmehr vorhanden und kann in jede beliebige Seite eingebaut werden.<br /><br /> Es wird im Menu Module erklärt, wie man Updates, Module / Plugins und Templates für SIOUX7 entwickeln kann.<br /> Wir wünschen viel Erfolg mit unser CMS.<br /> <span style="text-decoration: underline;">Hinweis:</span><br /> SIOUX7 ist FreeSoftware und kann frei eingesetzt werden.<br /> Wir übernehmen jedoch keine Haftung für die Anwendung des CMS Systems.<br /> Bei Problemen beraten wir Sie gerne.</p>\r\n<p>Bei Fragen können Sie sich an sioux7.uidev@gmail.com wenden.</p>', 'normal', '', NULL, 'right', NULL, ''),
(38, 41, 0, '<p>integrierte MultiMedia Anwendungen in SIOUX7:</p>\r\n<p>- Slider: Bilderwechsler</p>\r\n<p>- Accordion</p>\r\n<p>- Isotope</p>\r\n<p>- Flex Scroller</p>\r\n<p>- Site Opener (&ouml;ffnet Site in Box)</p>\r\n<p>- Bildergalerie</p>\r\n<p>- Modal Popup</p>\r\n<p>- Infobox (Popup bei Mouseover)</p>', 'normal', '', NULL, 'right', NULL, ''),
(26, 23, 0, '<p><strong>integrierte Module:</strong></p>\r\n<p>- Topnavigation: Menupunkte f&uuml;r die Topnavigation</p>\r\n<p>- Firma: Anzeige der Firmendaten in Box</p>\r\n<p>- Breadcrumb: aktuelle Anzeige der Seite</p>\r\n<p>- Menu: Das eigentliche Menu. Responsive</p>\r\n<p>- Content: Kann bausteinweise aufgebaut werden</p>\r\n<p>- Footernav: Das Footermenu</p>', 'normal', '', NULL, 'right', NULL, ''),
(27, 37, 0, '<p>integrierte Widgets:</p>\r\n<p>- Presse: aktuelle Presseberichte kurz in Box</p>\r\n<p>- Latest: Neue &Auml;nderungen in Aktuelles</p>\r\n<p>- Events: kommende Ereignisse</p>\r\n<p>- Login: Loginbox f&uuml;r Members</p>', 'normal', '', NULL, 'right', NULL, ''),
(29, 28, 0, '<p>Ein Projekt anlegen und pflegen:<br />Gehe zu github.com und lege dort ein kostenloses ACC an.<br />Voraussetzung ist, das Entwicklerprogramm unterst&uuml;tzt Github.<br />Wenn nicht, dann gibt es dies ebenfalls kostenlos bei Github.com.<br />Wir haben Eclipse mit EGit.<br />Lege dann dort ein neues Projekt an.<br />Wenn der ACC auf github.com eingerichtet ist, kann nunmehr im Programm eine Verbindung hergestellt werden. Den link zum Projekt steht anbei. Diesen Link (bevorzugt https) in der Option "Clone from Resporisitory" eingeben mit username und passwort. Das Projekt wird dann lokal gespeichert und eine Verbindung mit GitHub erstellt.<br />Kopiere nun dein Projekt in diesen lokalen Ordner. <br />Nach einem Refresh des Projektes im DeveloperProgramm sind alle Dateien da.<br />Nun kann alles &uuml;bertragen werden.<br />Als erstes einen Commit starten, dann einen Push to Upstream.<br />Ist alles korrekt eingestellt, werden alle Dateinen auf GitHub &uuml;bertragen.<br />Zur Kontrolle Online mal nachsehen.<br />Am besten ist es. alles ist auf der Dropbox.<br />Dann kann von jedem beliebigen PC zugegriffen werden, wenn der DropboxOrdner entweder freigegeben ist, oder Eigentum ist.</p>', 'normal', '', NULL, 'right', NULL, ''),
(30, 20, 0, '<p><span style="text-decoration: underline;">Am Beispiel einer Shopanwendung stellen wir unser Konzept vor:</span><br /> Um einen Shop im Internet aufbauen zu k&ouml;nnen, muss zuerst ermittelt werden, welche Daten im Internet erfasst werden sollen und d&uuml;rfen. Zugleich m&uuml;ssen die Vorschriften bei Onlinegesch&auml;ften beachtet werden, denn sonst droht Ihnen gleich von Anfang an eine Strafe. Was alles zu beachten ist, wissen wir und ist als Grundbestand bei allen Entwicklungen bereits vorhanden.<br /> Beispiel:<br /><br /></p>\r\n<ul>\r\n<li>Ihre AGB, auch mit Kundenrechten</li>\r\n<li>Ihr Impressum mit allen notwendigen Angaben</li>\r\n<li>Satzungen, die sich aus den Gesetzm&auml;ssigkeiten ergeben</li>\r\n</ul>\r\n<p><br /><br /> Als Grundbestand des Onlineshops ist die Bestellabwicklung. Dabei fallen sehr viele Daten an, die erfasst werden sollen. Die zweite wichtige Erfassung sind die Artikel, welche Sie online anbieten wollen. Dabei ist es sehr wichtig, dass diese Daten stets aktuell sind, da die Preis- und Mengenangabe verbindlich sind. Sie brauchen deshalb eine vollkommen verwaltbare Onlineanwendung. Dabei sollte die Verwaltung der Daten f&uuml;r den Shop hoch sicher sein, damit kein dritter die Daten einsehen kann, d.h. nur Sie oder Personen, denen Sie das Recht geben, k&ouml;nnen den Shop verwalten! <br /> Welche Daten Sie bei der Bestellabwicklung und Artikelerfassung brauchen kann anhand Ihreres bereits bestehenden Vertriebes ermittelt werden. Grundlage sind:<br /><br /></p>\r\n<ul>\r\n<li>Artikel</li>\r\n<li>Lager</li>\r\n<li>Kunden</li>\r\n<li>Bestellung(en)</li>\r\n<li>Optionen, d.h. Versandkosten, MwSt usw.</li>\r\n</ul>\r\n<p><br /><br /> Mit diesen Daten werden zuerst die Hintergrundverwaltungen aufgebaut, welche durch .httpaccess und LoginSessions doppelt gesch&uuml;tzt sind, eben so, wie es auch die Bank nutzt: PIN und TAN. dabei k&ouml;nnen Sie zwei verschiedene Passw&ouml;rter nutzen. In der Verwaltung haben Sie eine komplette &Uuml;bersicht:<br /><br /></p>\r\n<ul>\r\n<li>Administration: Administratoren mit den Zugriffsrechten</li>\r\n<li>Logfile: Logins der Verwaltungsbenutzer</li>\r\n<li>Sprache: Sprachen freischalten</li>\r\n<li>Artikelstamm: Verwaltung der Artikelhauptbereiche</li>\r\n<li>Artikel: Erfassung oder Pflege der Artikeldaten</li>\r\n<li>Kunden: Kundendaten und Bestelldaten</li>\r\n</ul>\r\n<p><br /><br /> Grundversion der Anwendungen ist Deutsch und Englisch. Sie k&ouml;nnen jedoch auch weitere Sprachen einbauen lassen.<br /> Die Onlinedarstellung ist recht einfach:<br /><br /></p>\r\n<ul>\r\n<li>Warengruppen - Artikel - Artikeldetails mit Bestellung</li>\r\n<li>Warenkorb mit &Uuml;bersicht der bestellten Artikel und L&ouml;schfunktion</li>\r\n<li>Hilfe f&uuml;r den Benutzer</li>\r\n<li>Ihre AGB und Bestimmungen</li>\r\n<li>Impressum</li>\r\n<li>Bestellung Online ( Payment, Email ) oder per FAX / Post</li>\r\n</ul>\r\n<p><br /><br /> Diese Seiten werden vollkommen an Ihr bereits bestehendes Layout angepasst. Bei der Bestellung werden die Daten des Kunden und Bestellmenge erfasst. Sie erhalten die Bestellung per Email und der Kunde eine Best&auml;tigung. Die &Uuml;bermittlung der Daten sind SSL verschl&uuml;sselt, d.h. sicher. Der Kunde kann noch ausw&auml;hlen, wie er zahlen m&ouml;chte.<br /> Hier kann dann noch auf Wunsch Kreditkartenzahlung eigebaut werden.<br /> Ihr Shop ist nun aufgebaut und eingerichtet. Sie haben damit eine<br /><br /></p>\r\n<ul>\r\n<li>multilinguale -</li>\r\n<li>browserorentierte -</li>\r\n<li>bildschirmangepasste -</li>\r\n<li>genormte -</li>\r\n</ul>\r\n<p><br /><br /> Anwendung, die alle Richtlinien beeinh&auml;lt. Der kr&ouml;nende Abschluss bei der kompletten Anwendung ist die Offlineanwendung. Bei dieser Anwendung brauchen Sie nicht st&auml;ndig online zu sein. Sie k&ouml;nnen die Daten wie bisher verwalten und bearbeiten. Wenn Sie alles erfasst haben, brauchen Sie nur noch kurz online gehen und die Daten abgleichen und schon sind alle Daten aktuell. Dieses verfahren nennt man auch JIT - Just in Time.<br /><br /> <span style="text-decoration: underline;">Zusatz:</span><br /> Bereits registrierte Kunden brauchen die Daten nicht nochmals eingeben, wenn eine Kundennummer existiert. Diese k&ouml;nnen Sie in der Verwaltung zuteilen. Bei einer weiteren Bestellung braucht der Kunde nur noch diese Nummer eingeben. Zur allgemeinen Sicherheit wird bei der ersten Lieferung eine Liste mit extra f&uuml;r den Kunden erstellte TANs mitgeliefert. Nur mit einer g&uuml;ltigen TAN ist eine weitere Bestellung g&uuml;ltig.</p>', 'normal', '', NULL, 'right', NULL, ''),
(31, 39, 0, '', 'normal', 'solutions', NULL, 'right', NULL, ''),
(32, 40, 0, '<p><strong>integrierte Plugins bei SIOUX7:</strong></p>\r\n<p>- Blog: ein eigenes Blogsystem</p>\r\n<p>- Code: hier k&ouml;nnen Sie Codes anbieten</p>\r\n<p>- Empfehlung: lassen Sie Ihre Seite empfehlen</p>\r\n<p>- Galerie: eine eigene Bildershow</p>\r\n<p>- Imprint: Ihr Impressum</p>\r\n<p>- Kleinanzeigen: Kleinanzeigenmarkt</p>\r\n<p>- Kontakt. Hier kann Kontakt aufgenommen werden</p>\r\n<p>- Links: Links zu externen Anbieter mit &Uuml;bergang</p>\r\n<p>- Newsletter: Ihr eigener Newsletter</p>\r\n<p>- Partnerprogramm: ein Bannertauschsystem</p>\r\n<p>- Presse: Ihre eigene Prese</p>\r\n<p>- Sitemap: darf nicht fehlen</p>\r\n<p>- und viele weitere kleine Plugins individuell erstellt</p>', 'normal', '', NULL, 'right', NULL, ''),
(33, 26, 0, '<p><strong>&Uuml;ber den Entwickler und das Team</strong></p>', 'normal', '', NULL, 'right', NULL, ''),
(40, 15, 0, '', 'normal', 'developing', NULL, 'right', NULL, ''),
(35, 6, 0, '', 'normal', 'presse', NULL, 'right', NULL, ''),
(36, 16, 0, '<p>SIOUX7 Software ist in Kürze bei uns zu haben.</p>\r\n<p>Sobald alle Fehler und Bugs behoben sind stellen wir die Software online.</p>\r\n<p>Sie können dann SIOUX7 downloaden und ausprobieren.</p>\r\n<p>Voraussichtliche Fertigstellung mit Setup:</p>\r\n<p>01. Oktober 2014</p>\r\n<p><b>Warum SIOUX7 ?</b></p>\r\n<p>- minimaler Speicherverbrauch</p>\r\n<p>- kleines aber feines Programm</p>\r\n<p>- viele Standards schon eingebaut</p>\r\n<p>- 7 Framework</p>\r\n<p>  - HTML5 / CSS3 Responsive</p>\r\n<p>  - JQuery Framework</p>\r\n<p>  - PHP Framework</p>\r\n<p>  - uvm.</p>\r\n', 'normal', '', NULL, 'right', NULL, ''),
(37, 26, 0, '<p>Entwickler</p>\r\n<p>O. Urban</p>\r\n<p>Typo3 Professional / PHP Certificate / Magento Integrator / Wordpress Developer</p>\r\n<p><a class="headleiste" title="Facebook" href="https://www.facebook.com/olaf.urban" target="_blank"> <img src="media/images/icons/facebook_klein.gif" alt="" border="0/" /> </a> <a title="Xing" href="https://www.xing.com/profile/Olaf_Urban2" target="_blank"> <img src="media/images/icons/xing_klein.gif" alt="" border="0/" /> </a></p>\r\n<script type="text/javascript" src="http://www.skypeassets.com/i/scom/js/skype-uri.js"></script>\r\n<div id="SkypeButton_Call_olaf.urban2000_1">\r\n  <script type="text/javascript">\r\n    Skype.ui({\r\n      "name": "chat",\r\n      "element": "SkypeButton_Call_olaf.urban2000_1",\r\n      "participants": ["olaf.urban2000"]\r\n    });\r\n  </script>\r\n</div>', 'normal', '', NULL, 'right', NULL, ''),
(39, 42, 0, '<p>SIOUX7 hat standardmäßig bereits ein responsives Layout integriert.</p>\r\n<p>Norm ist HTML5/CSS3</p>\r\n<p>Als Grundlage wird Bootstrab genommen, das bereits ein jQuery und CSS framework beeinhält.</p>\r\n', 'normal', '', NULL, 'right', NULL, ''),
(41, 43, 0, '', 'normal', 'lexikon', NULL, 'right', NULL, ''),
(42, 14, 0, '<p><strong>U . Utopie</strong></p>\r\n<p>Wir haben eine klare Vorstellung, wie SIOUX7 werden soll. Es ist keine übertriebene Utopie, sondern realisierbar. Der Wunsch, alles in einem zu vereinen ist real.</p>\r\n<p><strong>I . Intelligent</strong></p>\r\n<p>Wir nehmen nicht einfach alles, was es so gibt, sondern wählen sehr sorgfältig das aus, was auch wirklich brauchbar ist und passen es unserem System an.</p>\r\n<p><strong>D . Dimension</strong></p>\r\n<p>Das Internet bewegt sich bald in neuen Dimensionen. Bald wird es Standard sein, das Lösungen mitgeliefert werden. Wir fangen damit an.</p>\r\n<p><strong>E . Exelent</strong></p>\r\n<p>Noch lange ist nicht alles abgeschlossen. Vieles wird immer weiter erweitert und verbessert. </p>\r\n<p><strong>V . Visonär</strong></p>\r\n<p>Viele Ideen, viele neue Entwicklungen. Alles basierend auf eigene Ideen. Zugegeben, wir schauen uns auch anderes an, aber wir "klauen" nicht.</p>\r\n<p> </p>\r\n<p><strong>SIOUX7</strong></p>\r\n<p>Wofür steht dies?</p>\r\n<p>Ganz einfach: Für ein System mit allem. 7 Frameworks vereint.</p>', 'normal', '', NULL, 'right', NULL, ''),
(43, 44, 0, '<p><span id="result_box" lang="fr"><span class="hps">Arriv&eacute;e &agrave; Paris</span><span>.</span> <span class="hps">apr&egrave;s 8</span> <span class="hps">heures de conduite</span><span>.</span> <span class="hps">Enfin</span> <span class="hps">arriv&eacute;</span><span>.</span> <span class="hps">Un accueil chaleureux de</span> <span class="hps">mon ami</span></span></p>', 'normal', '', '25180_paris_ostbahnhof.jpg', 'right', NULL, ''),
(44, 44, 0, '<div id="gt-src-tools"> </div>\r\n<div id="gt-res-content" class="almost_half_cell">\r\n<div style="zoom: 1;" dir="ltr"><span id="result_box" lang="fr"><span class="hps">Le Signe</span> <span class="hps">internationale de la langue</span><span>,</span> <span class="hps">nous nous entendons</span> <span class="hps">très bien</span></span></div>\r\n</div>', 'normal', '', '25180_gebaerdensprache.jpg', 'left', NULL, ''),
(45, 44, 0, '<div id="gt-src-tools">&nbsp;</div>\r\n<div id="gt-res-content" class="almost_half_cell">\r\n<div style="zoom: 1;" dir="ltr"><span id="result_box" lang="fr"><span class="hps">Toute une</span> <span class="hps">&eacute;quipe a voulu</span> <span class="hps">apprendre &agrave; me conna&icirc;tre</span> <span class="hps">fois</span><span>.</span> <span class="hps">C''est juste</span> <span class="hps">Paris</span></span></div>\r\n</div>', 'normal', '', '25180_gl-team.jpg', 'right', NULL, ''),
(46, 44, 0, '<p><span id="result_box" class="short_text" lang="fr"><span class="hps">Toujours</span> <span class="hps">un bon repas</span> <span class="hps">au restaurant Chez</span> <span class="hps">Pierrot</span></span></p>', 'normal', '', '25180_essen.jpg', 'left', NULL, ''),
(47, 44, 0, '<p><span id="result_box" lang="fr"><span class="hps">DC</span> <span class="hps">le jour</span> <span class="hps">primal</span> <span class="hps">il ya</span> <span class="hps">quelque chose de tr&egrave;s</span> <span class="hps">sp&eacute;cial</span><span>.</span> <span class="hps">Je dois</span> <span class="hps">faire</span> <span class="hps">le</span> <span class="hps">pas du tout,</span> <span class="hps">mais mon ami</span> <span class="hps">a insist&eacute;</span><span>.</span> <span class="hps">Merci</span></span></p>', 'normal', '', '25180_moulin-rouge.jpg', 'right', NULL, ''),
(48, 44, 0, '<p><span id="result_box" lang="fr"><span class="hps">Tous les soirs à</span> <span class="hps">19 heures</span><span>,</span> <span class="hps">le</span> <span class="hps">Moulin Rouge</span> <span class="hps">propose</span> <span class="hps">un</span> <span class="hps atn">"</span><span>Dîner</span> <span class="hps">-</span> <span class="hps">Show"</span> <span class="hps">option à partir de</span> <span class="hps">€ 180</span><span>,</span> <span class="hps">suivi du spectacle</span> <span class="hps">"Féerie"</span><span>.</span> <span class="hps">Les</span> <span class="hps">menus</span> <span class="hps">sont élaborés par</span> <span class="hps">Dalloyau</span><span>.</span> <span class="hps atn">Une demi-</span><span>bouteille de champagne</span> <span class="hps">est servi</span> <span class="hps">pour chaque</span> <span class="hps">option.</span> <span class="hps">"Féerie"</span> <span class="hps">est une expérience</span> <span class="hps">de 2</span> <span class="hps">hours''dazzling</span> <span class="hps">avec les</span> <span class="hps">60 Doriss Girls</span><span>,</span> <span class="hps">les mille</span> <span class="hps">costumes</span> <span class="hps">de plumes, de</span> <span class="hps">strass et de paillettes</span><span>,</span> <span class="hps">de décors somptueux aux</span> <span class="hps">couleurs chatoyantes</span><span>,</span> <span class="hps">l''aquarium</span> <span class="hps">géant</span> <span class="hps">et</span> <span class="hps">...</span> <span class="hps">le célèbre</span> <span class="hps">French Cancan</span> <span class="hps">français</span><span>.</span></span></p>', 'normal', '', '25180_Paris-Select.jpg', 'left', NULL, ''),
(49, 44, 0, '<p><span id="result_box" lang="fr"><span class="hps">Traditionnellement, dans</span> <span class="hps">la matin&eacute;e, un</span> <span class="hps">crossiant</span> <span class="hps">parisien</span><span>.</span> <span class="hps">La m&eacute;t&eacute;o</span> <span class="hps">n''est pas exactement</span> <span class="hps">agr&eacute;able</span><span>,</span> <span class="hps">mais</span> <span class="hps">&ccedil;a ne fait rien</span></span></p>', 'normal', '', '25180_Paris_croissant.jpg', 'right', NULL, ''),
(51, 44, 0, '<p><span id="result_box" lang="fr"><span class="hps">Une belle journée</span> <span class="hps">à Paris</span> <span class="hps">Disneyland</span><span>.</span> <span class="hps">Qu''est-ce que</span> <span class="hps">ce n''est pas tout</span> <span class="hps">déjà</span><span>.</span> <span class="hps">Même si</span> <span class="hps">la météo</span> <span class="hps">n''est pas exactement</span> <span class="hps">bon</span><span>.</span></span></p>', 'normal', '', '25180_disney.jpg', 'left', NULL, ''),
(52, 44, 0, '<div id="gt-src-tools">&nbsp;</div>\r\n<div id="gt-res-content" class="almost_half_cell">\r\n<div style="zoom: 1;" dir="ltr"><span id="result_box" lang="fr"><span class="hps">Un</span> <span class="hps">bon</span> <span class="hps">spectacle inoubliable</span> <span class="hps">&agrave; Disneyland</span><span>.</span> <span class="hps">C''&eacute;tait tr&egrave;s int&eacute;ressant</span></span></div>\r\n</div>', 'normal', '', '25180_show.jpg', 'right', NULL, ''),
(53, 44, 0, '<p><span id="result_box" class="short_text" lang="fr"><span class="hps">Enfin</span><span>,</span> <span class="hps">un</span> <span class="hps">sanglier</span> <span class="hps">traditionnelle Menu</span></span></p>', 'normal', '', '25180_sanglier.jpg', 'left', NULL, ''),
(54, 44, 0, '<p><span id="result_box" lang="fr"><span class="hps">Demain, il</span> <span class="hps">va &agrave;</span> <span class="hps">Ast&eacute;rix</span><span>.</span> <span class="hps">M&ecirc;me enfant,</span> <span class="hps">j''&eacute;tais ravie</span><span>.</span> <span class="hps">Enfin</span> <span class="hps">un</span> <span class="hps">souhait</span> <span class="hps">sinc&egrave;res</span> <span class="hps">se r&eacute;alisent</span></span></p>', 'normal', '', '25180_asterix.jpg', 'right', NULL, ''),
(55, 44, 0, '<p><span id="result_box" lang="fr"><span class="hps">Ast&eacute;rix</span> <span class="hps">signifie</span> <span class="hps">tant de savoir comment</span> <span class="hps">intelligente</span> <span class="hps atn">(</span><span>aster</span> <span class="hps">=</span> <span class="hps">intelligent</span><span>)</span> <span class="hps">et Ob&eacute;lix</span> <span class="hps">est une abr&eacute;viation de</span> <span class="hps">dodu</span><span>, dr&ocirc;le</span> <span class="hps atn">(</span><span>Obel</span> <span class="hps">= assez</span> <span class="hps">trapu</span><span>)</span><span>.</span> <span class="hps">M&ecirc;me enfant,</span> <span class="hps">j''ai ces</span> <span class="hps">chiffres</span> <span class="hps">beaucoup.</span> <span class="hps">Nous avons</span> <span class="hps">beaucoup de plaisir</span><span>.</span></span></p>', 'normal', '', '25180_asterix-et-obelix.jpg', 'left', NULL, ''),
(56, 44, 0, '<p><span id="result_box" lang="fr"><span class="hps">Mon</span> <span class="hps">ami a besoin</span> <span class="hps">de</span> <span class="hps">se remettre au travail</span><span>, il</span> <span class="hps">est maintenant de retour</span> <span class="hps">&agrave; la maison.</span> <span class="hps">Mais</span> <span class="hps">les</span> <span class="hps">jours &agrave; Paris</span> <span class="hps">&eacute;taient</span> <span class="hps">vraiment merveilleux</span><span>.</span></span></p>', 'normal', '', '25180_dmmc-06-moulin-rouge-final.jpg', 'right', NULL, ''),
(57, 44, 0, '<div id="gt-src-tools">&nbsp;</div>\r\n<div id="gt-res-content" class="almost_half_cell">\r\n<div style="zoom: 1;" dir="ltr"><span id="result_box" lang="fr"><span class="hps">Pour</span> <span class="hps">tirer sa r&eacute;v&eacute;rence</span> <span class="hps">d''un</span> <span class="hps">champagne</span> <span class="hps">&agrave; la</span> <span class="hps">fran&ccedil;aise</span><span>.</span> <span class="hps">Ce sont</span> <span class="hps">des jours merveilleux</span> <span class="hps">&agrave; Paris</span><span>.</span> <span class="hps">Rien n''est plus beau</span> <span class="hps">que quand</span> <span class="hps">vous avez des amis</span> <span class="hps">partout dans le monde</span><span>.</span> <span class="hps">Qui a dit que</span> <span class="hps">c''est la langue</span> <span class="hps">des signes</span> <span class="hps">mal</span><span>,</span> <span class="hps">sont</span> <span class="hps">tout &agrave; fait tort</span><span>.</span> <span class="hps">Un grand merci</span> <span class="hps">&agrave; mon ami</span> <span class="hps atn">(</span><span>architecte</span><span>)</span><span>,</span> <span class="hps">dont il</span> <span class="hps">a fait don de</span> <span class="hps">plus.</span></span></div>\r\n</div>', 'normal', '', '25180_abschied.jpg', 'right', NULL, ''),
(58, 45, 0, '', 'normal', 'developing', NULL, 'right', NULL, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_developing`
--

DROP TABLE IF EXISTS `sioux7_developing`;
CREATE TABLE `sioux7_developing` (
  `dev_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `titel` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `descr` text CHARACTER SET latin1,
  `isfertig` int(1) DEFAULT '0',
  `bug` text CHARACTER SET latin1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_developing`
--

INSERT INTO `sioux7_developing` (`dev_id`, `dom_id`, `lang`, `titel`, `descr`, `isfertig`, `bug`) VALUES
(0, NULL, NULL, NULL, NULL, 0, NULL),
(30, 0, 'de', 'dealfuchs: Gutscheine', 'Typo3 statisch mit Cronjob', 1, ''),
(31, 0, 'de', 'konto-test: Kontovergleichssystem', 'Typo3 statisch On the Fly', 1, ''),
(33, 0, 'de', 'hoboards: Surfshop', 'Magento Template/Plugin', 1, ''),
(34, 0, 'de', 'alfareinigung: Reinigungsdienst', 'Typo3 Fluid/DCE', 1, ''),
(35, 0, 'de', ' oryx: medizinische Seite', 'Typo3 Fluid/DCE', 1, ''),
(36, 0, 'de', 'perazzo: Ristorante', 'Typo3 Fluid/DCE/Plugin', 1, ''),
(37, 0, 'de', 'Agentur 22: Agentur Präsentation', 'Typo3 Fluid/DCE/Plugin', 1, ''),
(38, 0, 'de', 'dywipox: Baustoff', 'Typo3 Fluid/Plugin', 1, ''),
(39, 0, 'de', 'BvanB: Werbemittel', 'Wordpress', 1, ''),
(40, 0, 'de', 'test-top10: artikel test top 10', 'Typo3 statisch/Plugin', 1, ''),
(42, 0, 'de', 'ellabee: Magento', 'Neuer Magento Shop der feinen Art', 1, ''),
(43, 0, 'de', 'Alpenbauer', 'Typo3 Fluid/DCE/Plugin', 1, ''),
(44, 0, 'de', 'paion.de', 'Typo3 Fluid/DCE/Plugin', 1, ''),
(45, 0, 'de', 'Motorrad Wimmer und Merkel', 'Typo3 Fluid / DCE', 1, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_domain`
--

DROP TABLE IF EXISTS `sioux7_domain`;
CREATE TABLE `sioux7_domain` (
  `dom_id` int(11) NOT NULL,
  `Domainname` varchar(100) DEFAULT NULL,
  `domdescr` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_domain`
--

INSERT INTO `sioux7_domain` (`dom_id`, `Domainname`, `domdescr`) VALUES
(0, 'neu', NULL),
(2, 'sioux7.local', 'TestZone auf Mac');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_firma`
--

DROP TABLE IF EXISTS `sioux7_firma`;
CREATE TABLE `sioux7_firma` (
  `firma_id` int(10) UNSIGNED NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
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
  `hrb` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `sioux7_firma`
--

INSERT INTO `sioux7_firma` (`firma_id`, `dom_id`, `firma`, `ansprechpartner`, `adresse`, `plz`, `ort`, `land`, `telefon`, `telefax`, `email`, `descr`, `logo`, `agb`, `ustid`, `hrb`) VALUES
(1, NULL, 'UIDEV', 'O. Urban (privater Entwickler)', 'Naupliastr. 91', 81545, 'MÃ¼nchen', 'BRD', '', '', 'urban.uidev@uidev.de', '<p><strong>allgemeiner Hinweis<br /></strong>UIDEV ist KEINE Firma! UIDEV steht f&uuml;r die Bezeichnung Urban Internet Developing und ist privat. <strong><br /><br /><br />Rechtlicher Hinweis<br /></strong><br /> Wir sind bem&uuml;ht, auf unserer Website zutreffende Informationen, Daten und Dateien zur Verf&uuml;gung zu stellen.<br /> <br /> Wir behalten uns vor, ohne vorherige Ank&uuml;ndigung, &Auml;nderungen oder Erg&auml;nzungen der bereitgestellten Informationen, Daten oder Dateien jederzeit vorzunehmen.<br /> <br /> Der Inhalt dieser Website, insbesondere alle Texte, Bilder, Graphiken, Logos, Dateien, Webcam-Bilder, Ton-, Video- und Animationsdateien sowie auch ihre Arrangements, unterliegen dem Urheberrecht und anderen Gesetzen zum Schutz geistigen Eigentums. Die Verwendung, Speicherung sowie Vervielf&auml;ltigung der auf dieser Website verwendeten Logos, Dateien, Webcam-Bilder, Ton-, Video- und Animationsdateien und deren Arrangements bedarf dagegen der vorherigen Zustimmung durch uns.<br /> <br /> Die auf unserer Website bereitgestellten Texte, Dateien, Bilder, Graphiken, Logos etc. d&uuml;rfen weder ver&auml;ndert, noch f&uuml;r Handelszwecke kopiert und auf anderen Websites verwendet werden. Wir gew&auml;hren auch keinerlei Lizenzrechte an dem geistigen Eigentum dieser Website.<br /> <br /> Die auf unserer Website genannten Marken und Logos sind teilweise gesetzlich gesch&auml;tzte Warenzeichen, hier gilt das jeweilige Inhaberrecht.<br /> <br /> S&auml;mtliche Informationen, Daten oder Dateien, ihre Nutzung sowie s&auml;mtliches mit unserer Website zusammenh&auml;ngendes Tun, Dulden oder Unterlassen unterliegen ausschliesslich deutschem Recht.<br /><strong><br /></strong>Mit Urteil vom 12. Mai 1998 - 312 O 85/98 - Haftung f&uuml;r Links: Hiermit distanzieren wir uns ausdr&uuml;cklich vom Inhalt der verlinkten Seiten auf allen unseren Seiten und weisen darauf hin, dass wir keinerlei Haftung &uuml;bernehmen. Auf Wunsch des verlinkten Domaininhabers entfernen wir den Link mit sofortiger Wirkung aus unseren Seiten.</p>\r\n<br /> Erf&uuml;llungsort und ausschliesslicher Gerichtsstand ist M&uuml;nchen.<br /> Stand: August 2014', 'logo.png', 'Allgemeine Gesch&auml;ftsbedingungen:<br /> Hier kann Ihre AGB stehen', '', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_grouprights`
--

DROP TABLE IF EXISTS `sioux7_grouprights`;
CREATE TABLE `sioux7_grouprights` (
  `gr_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `gradmin` int(10) DEFAULT NULL,
  `group_nav` enum('myselect','table','sioux7_admin','gradmin','admin_id','single') DEFAULT NULL,
  `tables` varchar(255) DEFAULT NULL,
  `table_nav` enum('myselect','table','sioux7_tables','siuox7_tables','titel','multi') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_grouprights`
--

INSERT INTO `sioux7_grouprights` (`gr_id`, `dom_id`, `lang`, `gradmin`, `group_nav`, `tables`, `table_nav`) VALUES
(0, NULL, NULL, NULL, '', NULL, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_kategorie`
--

DROP TABLE IF EXISTS `sioux7_kategorie`;
CREATE TABLE `sioux7_kategorie` (
  `kategorie_id` int(11) NOT NULL,
  `aktiv` int(1) DEFAULT NULL,
  `titel` varchar(150) DEFAULT NULL,
  `parent` varchar(200) DEFAULT NULL,
  `parent_nav` enum('table','sioux7_kategorie','parent','single','kategorie_id') DEFAULT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `menu` enum('top','menu','footer','user') NOT NULL DEFAULT 'menu',
  `rang` int(11) DEFAULT NULL,
  `intern` int(1) DEFAULT NULL,
  `cache` int(1) DEFAULT NULL COMMENT 'Seite speichern',
  `keywords` text,
  `description` text,
  `beschreibung` text,
  `content` enum('ext','sioux7_content','con_id') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_kategorie`
--

INSERT INTO `sioux7_kategorie` (`kategorie_id`, `aktiv`, `titel`, `parent`, `parent_nav`, `dom_id`, `lang`, `menu`, `rang`, `intern`, `cache`, `keywords`, `description`, `beschreibung`, `content`) VALUES
(0, 0, 'neu', '0', NULL, 2, 'de', 'menu', NULL, 0, 0, NULL, NULL, NULL, NULL),
(2, 1, 'Impressum', '0', NULL, 2, 'de', 'top', 1, 0, 0, '   Impressum					', 'Unser Impressum						', 'Impressum						', NULL),
(3, 1, 'Kontakt', '0', NULL, 2, 'de', 'top', 2, 0, NULL, '                                    Kontakt                    														', '                                         Nehmen Sie Kontakt mit uns auf               														', '                                        Kontakt                														', NULL),
(20, 1, 'Service', '0', NULL, 0, 'de', 'menu', 3, 0, 0, 'Service,Links', 'Unsere Service f&uuml;r Sie', 'Unsere Service f&uuml;r Sie', NULL),
(4, 1, 'Sitemap', '0', NULL, 0, 'de', 'footer', 0, 0, 0, 'Sitemap', 'Seiten&uuml;bersicht', 'Seiten&uuml;bersicht', NULL),
(5, 0, 'Empfehlung', '0', NULL, 0, '<de', 'top', 4, 0, 0, 'Empfehlung', 'Empfehlen Sie unsere Seite weiter', 'Empfehlen Sie unsere Seiten weiter', NULL),
(16, 1, 'Software', '0', NULL, 0, 'de', 'menu', 2, 0, 0, 'sioux7, cms', 'Die Software Sioux7', 'Die Software SIOUX7', NULL),
(17, 1, 'Report', '16', NULL, 2, 'de', 'menu', 1, 0, 0, 'Report', 'Allgemiene Reportage von Erweiterungen', 'Allgemiene Reportage von Erweiterungen', NULL),
(18, 1, 'Planung', '16', NULL, 2, 'de', 'menu', 2, 0, 0, 'Planung, Realisierung, Projekte', 'Unsere neuesten Entwicklungen f&uuml;r SIOUX7', 'Unsere neuesten Entwicklungen f&uuml;r SIOUX7', NULL),
(25, 1, 'CodeSchnippsel', '20', NULL, 0, 'de', 'menu', 3, 0, 0, 'Code, PHP, jQuery, HTML', 'gesammelte Codeschnippsel', 'gesammelte Codeschnippsel', NULL),
(6, 1, 'Presse', '14', NULL, 0, 'de', 'menu', 99, 0, 0, 'Presse', 'Unsere Presse', 'Unsre Presse', NULL),
(8, 0, 'Newsletter', '0', NULL, 2, 'de', 'menu', 99, 0, NULL, 'Nesletter, Neues, Aktuelles', 'Unser eigener Newsletter', 'Unser eigener Newsletter', NULL),
(9, 0, 'Suche', '0', NULL, 2, 'de', 'top', 99, NULL, NULL, 'Suchergebnis', 'Suchergebnis', 'Suche auf Domain', NULL),
(14, 1, 'Home', '0', NULL, 0, 'de', 'menu', 1, 0, 0, 'SIOUX7, CMS', '<h3>Unser KnowHow f&uuml;r Sie!</h3>\r\n<p>Langj&auml;hrige Erfahrung in Datenbankentwicklung und Internet haben uns gelehrt, auf was bei Entwicklungen von Datenbankanwendungen f&uuml;r das Internet und auch f&uuml;r das Intranet zu achten ist. Zu den wichtigsten Bestandteile der Entwicklung geh&ouml;rt vor allem logisches Denken. Speziell in Sachen Internetenwicklungen mit datenbankgest&uuml;tzten Anwendungen mit Verwaltung f&uuml;r Online und Offline Anwendung sind die wichtigsten Schwerpunkte bei der Entwicklung. <br />Nach langj&auml;hriger Entwicklung ist es uns gelungen ein eigenes CMS System auf zu bauen. Angefangen hat es mit dem versuch UrbansCMS. Nunmehr hat unser Projekt einen Namen bekommen.</p>', 'UIDEV - ein neues superlative CMS', NULL),
(21, 1, 'Links', '20', NULL, 0, 'de', 'menu', 1, 0, 0, 'Links', 'Externe Links', 'Externe Links zu wichtigen Anbieter', NULL),
(22, 1, 'Dokumentation', '16', NULL, 0, 'de', 'menu', 4, 0, 0, 'dokumentation', 'Dokumentation zu SIOUX7', 'Dokumentation zu SIOUX7', NULL),
(23, 1, 'Module', '22', NULL, 2, 'de', 'menu', 1, 0, NULL, 'Module', 'Integriertes Modul f&uuml;r SIOUX7', 'Integriertes Modul f&uuml;r SIOUX7', NULL),
(26, 1, 'Entwickler', '0', NULL, 0, 'de', 'menu', 4, 0, 0, 'Entwickler, Tools, Design Patterns, jQuery, SQL, Framework', '&Uuml;ber die Entwickler und SIOUX7', '&Uuml;ber die Entwickler und SIOUX7', NULL),
(27, 1, 'Ratgeber', '20', NULL, 0, '<de', 'menu', 1, 0, 0, 'vhost, php.ini, server', 'Unser eigener Ratgeber. Gesameltes Wissen rund um Internet, Programmierung, Computer.', 'Unser eigener Ratgeber. Gesameltes Wissen rund um Internet, Programmierung, Computer.', NULL),
(28, 1, 'GitHub', '26', NULL, 0, 'de', 'menu', 0, 0, 0, 'Projekte, Github', 'Projekte verwalten einfach gemacht.', 'Projekte verwalten einfach gemacht.', NULL),
(29, 1, 'Hilfe', '14', NULL, 2, 'de', 'menu', 1, 0, 0, 'Sioux7, Hilfe, CMS', 'Hilfe f&uuml;r SIOUX7', 'Hilfe f&uuml;r SIOUX7', NULL),
(36, 1, 'About', '14', NULL, 0, 'de', 'menu', 0, 0, 0, 'Team, Teamwork', '&Uuml;ber uns und wer wir sind', '&Uuml;ber uns und wer wir sind', NULL),
(34, 0, '404', '14', NULL, 2, 'de', 'menu', 0, 0, 0, '', '', '', NULL),
(35, 1, 'Study', '20', NULL, 0, 'de', 'menu', 0, 0, 0, 'Wissen, Nachschlagen, lernen', 'Unser Wissen f&uuml;r Sie', 'Unser Wissen f&uuml;r Sie', NULL),
(37, 1, 'Widgets', '22', NULL, 0, 'de', 'menu', 0, 0, 0, 'Widtgets', 'Widgets f&uuml;r die Seite', 'Widgets f&uuml;r die Seite', NULL),
(38, 1, 'Struktur', '22', NULL, 0, 'de', 'menu', 0, 0, 0, 'Struktur, Aufbau', 'Aufbau von SIOUX7', 'Aufbau von SIOUX7', NULL),
(39, 1, 'Solutions', '26', NULL, 0, 'de', 'menu', 0, 0, 0, 'L&ouml;sungen, Projekte, Aufgaben', 'L&ouml;sungen f&uuml;r kniffelige Aufgaben', 'L&ouml;sungen f&uuml;r kniffelige Aufgaben', NULL),
(40, 1, 'Plugins', '22', NULL, 0, 'de', 'menu', 1, 0, 0, 'Plugins, Anwendungen, L&ouml;sungen', 'Integrierte Plugins f&uuml;r SIOUX7', 'Integrierte Plugins f&uuml;r SIOUX7', NULL),
(41, 1, 'MultiMedia', '22', NULL, 0, 'de', 'menu', 2, 0, 0, 'Multimedia, Plugins, Widgets', 'Integrierte Multimedia in SIOUX7', 'Integrierte Multimedia in SIOUX7', NULL),
(42, 1, 'Responsive Layout', '22', NULL, 0, 'de', 'menu', 0, 0, 0, 'Responsive, Layout, HTML, CSS', 'Das reposnsive Layout von SIOUX7', 'Das reposnsive Layout von SIOUX7', NULL),
(43, 1, 'Lexikon', '20', NULL, 0, 'de', 'menu', 100, 0, 0, 'Lexikon, Erkl&auml;rung, Begriffe', 'Kleines Lexikon zum nachschlagen', 'Kleines Lexikon zum nachschlagen', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_konfiguration`
--

DROP TABLE IF EXISTS `sioux7_konfiguration`;
CREATE TABLE `sioux7_konfiguration` (
  `cof_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `schluessel` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `wert` varchar(250) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_konfiguration`
--

INSERT INTO `sioux7_konfiguration` (`cof_id`, `dom_id`, `schluessel`, `wert`) VALUES
(0, NULL, 'neu', NULL),
(2, NULL, 'TPL', 'uidev'),
(3, NULL, 'DOM', 'UIDEV'),
(8, NULL, 'INC', 'libary/include/'),
(9, NULL, 'IMG', 'media/images/'),
(10, NULL, 'SCLASS', 'libary/class/'),
(11, NULL, 'BASE', '/sioux7'),
(12, 0, 'EMAIL', 'urban.uidev@uidev.de'),
(13, NULL, 'MAILHOST', 'smtprelaypool.ispgateway.de'),
(14, 0, 'MAILPW', 'UID7529zx!110'),
(15, NULL, 'START', 'home'),
(16, 0, 'WG', 'libary/widgets/');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_language`
--

DROP TABLE IF EXISTS `sioux7_language`;
CREATE TABLE `sioux7_language` (
  `lang_id` int(10) UNSIGNED NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `titel` varchar(20) DEFAULT NULL,
  `bild` varchar(255) DEFAULT NULL,
  `vat` varchar(3) DEFAULT NULL,
  `activ` enum('activ','passiv') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_language`
--

INSERT INTO `sioux7_language` (`lang_id`, `dom_id`, `titel`, `bild`, `vat`, `activ`) VALUES
(0, NULL, 'neu', '', '', 'passiv'),
(1, NULL, 'Deutsch', 'germany.gif', 'de', 'activ'),
(7, NULL, 'Russisch', 'russia.gif', 'ru', 'passiv'),
(8, NULL, 'Englisch', 'uk.gif', 'en', 'passiv');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_lexika`
--

DROP TABLE IF EXISTS `sioux7_lexika`;
CREATE TABLE `sioux7_lexika` (
  `lex_id` int(11) NOT NULL,
  `bild` varchar(200) DEFAULT NULL,
  `befehl` varchar(200) DEFAULT NULL,
  `aufbau` varchar(200) DEFAULT NULL,
  `text` text,
  `bereich` enum('PHP','Glosar') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_lexika`
--

INSERT INTO `sioux7_lexika` (`lex_id`, `bild`, `befehl`, `aufbau`, `text`, `bereich`) VALUES
(416, '', 'Hacker', '', 'Die "sportlichen" Hacker geben sich nach ihren Aktionen zumeist zu erkennen, indem sie etwa auf gehackten Internetseiten Gr&uuml;&szlig;e hinterlassen oder in der Szene &uuml;ber ihre Taten berichten. Auch der legend&auml;re Chaos Computer Club (CCC), Hamburg, oder die Bayerische Hackerpost, M&uuml;nchen, betreiben "social hacking" - und tun dieses, um M&auml;ngel beim Datenschutz von Firmen und Beh&ouml;rden aufzuzeigen  (manchmal sogar auch im Auftrag der attakierten Firmen). Das Vorurteil, Hacker seien pickelige J&uuml;nglinge, die sich st&auml;ndig mit Cola und Kartoffelchips vollstopfen, stimmt also nicht (mehr). Viele sind inzwischen recht erfolgreich als Berater ins professionelle EDV-Gesch&auml;ft eingestiegen.', 'Glosar'),
(11, '', 'Account', '', 'Elektronisches Konto: Zugangsberechtigung zu den Diensten eines Providers oder Online-Dienstes (Web, E-Mail, News, IRC) ', 'Glosar'),
(12, '', 'Active X', '', 'Software-Paket von Microsoft, mit dem Anwendungen aus dem Internet auf dem Computer des Benutzers gestartet werden k&ouml;nnen ', 'Glosar'),
(13, '', 'Active X-Control', '', 'Auf Active X aufbauende Komponenten, die in eine Website eingef&uuml;gt werden k&ouml;nnen, um auf dem Rechner des Benutzers externe Programme zu starten. Sicherheitsrisiko! ', 'Glosar'),
(14, '', 'ADSL', '', 'Asymmetric Digital Subscriber Line', 'Glosar'),
(15, '', 'Applet', '', 'Java-Programm, das in einen Browser geladen und dort ausgef&uuml;hrt wird ', 'Glosar'),
(16, '', 'Archie', '', 'Suchsystem, mit dem man nach Programmen auf FTP-Servern suchen kann ', 'Glosar'),
(17, '', 'Assistent', '', 'Auch Wizard: Programm, das dem Anwender bei der Erstellung von Dokumenten wie Faxen und Web-Seiten hilft. Es fragt Schritt f&uuml;r Schritt die erforderlichen Daten ab ', 'Glosar'),
(18, '', 'Attachment', '', 'Datei-Anhang einer E-Mail ', 'Glosar'),
(19, '', 'Avatar', '', 'Grafische Gestalt, die den Teilnehmer einer virtuellen Welt (Chat-Benutzer) darstellt ', 'Glosar'),
(20, '', 'AVI', '', 'Microsoft hat f&uuml;r digitale Videos vor einigen Jahren das Dateiformat AVI eingef&uuml;hrt. Es komprimiert Videos sehr stark, je nach dem verwendeten Codec ', 'Glosar'),
(21, '', 'Backbone', '', 'Hauptstrang eines Netzwerks mit besonders hoher &uuml;bertragungsrate (mindestens zwei MBit/s) ', 'Glosar'),
(22, '', 'Bandbreite', '', '&uuml;bertragungs-Leistung einer Internet-Anbindung ', 'Glosar'),
(23, '', 'Banner', '', 'Web-Werbung, meist mit einem Hyperlink zur beworbenen Site ', 'Glosar'),
(24, '', 'Baud', '', 'Ma&szlig;einheit f&uuml;r die Geschwindigkeit der Daten&uuml;bertragung mit ModemsSiehe Bit/s', 'Glosar'),
(25, '', 'BBS', '', 'Bulletin Board System: elektronische schwarze Bretter zu bestimmten Themen', 'Glosar'),
(26, '', 'BCC', '', 'Blind Carbon Copy (blinder Durchschlag): Kopie einer E-Mail, die an weitere Empf&auml;nger geht, ohne dass der Empf&auml;nger dies sieht ', 'Glosar'),
(27, '', 'Zip', '', 'Format f&uuml;r komprimierte Dateien ', 'Glosar'),
(28, '', 'Wysiwyg', '', 'Das K&uuml;rzel Wysiwyg steht f&uuml;r What You See Is What You Get, also etwa: Das Ergebnis sieht so aus wie das, was Sie gerade sehen. Urspr&uuml;nglich machten vor allem Textprogramme mit diesem Schlagwort Werbung. Denn es war in der Anfangszeit von Windows nicht selbstverst&auml;ndlich, dass unterstrichener Text auch am Bildschirm unterstrichen erschien. Heutzutage machen vor allem HTML- Editoren mit Wysiwyg Werbung. ', 'Glosar'),
(29, '', 'World Wide Web', '', 'Auch Web/WWW/W3: Multimedialer Teil des Internets. Der zur Zeit am schnellsten wachsende Dienst des Internets ', 'Glosar'),
(30, '', 'Whois', '', 'Service, mit dem der Onliner Namen und Adressen von Domain-Besitzern herausfinden kann ', 'Glosar'),
(82, '', 'Benutzerkennung', '', 'Auch: Benutzername, Loginname: Name oder Zahlenfolge, die in Verbindung mit einem Passwort verwendet wird, um sich als berechtigter User eines Internet-Rechners zu identifizieren ', 'Glosar'),
(83, '', 'Beta-Version', '', 'Lauff&auml;hige, aber noch nicht endg&uuml;ltige Version eines Programms, oft mit kleinen Fehlern ', 'Glosar'),
(84, '', 'Bookmark', '', 'Lesezeichen, mit dem die Adresse einer favorisierten Web-Seite gespeichert wird ', 'Glosar'),
(85, '', 'Browser', '', 'Programm zum Ansteuern und Betrachten von Web-Seiten ', 'Glosar'),
(86, '', 'Bug Fix', '', 'Auch Fix oder Patch: kleines Programm, das fehlerhafte Software repariert. Die meisten Patches werden von den Software-Herstellern auf ihrer Website zum Gratis-Download angeboten ', 'Glosar'),
(87, '', 'Byte', '', 'Ma&szlig;einheit f&uuml;r Informationseinheiten. Ein Byte besteht aus 8 Bits. Ein Byte erm&ouml;glicht die Darstellung von 256 verschiedenen Zeichen ', 'Glosar'),
(88, '', 'Cache', '', 'Zwischenspeicher, der &ouml;fters ben&ouml;tigte Daten griffbereit h&auml;lt. K&uuml;rzlich besuchte Web-Seiten bauen sich so schneller wieder auf ', 'Glosar'),
(89, '', 'CSS', '', 'Cascading Style Sheets: HTML-Erweiterung, mit der Homepage-Bastler HTML-Seiten besser layouten k&ouml;nnen. H&auml;ufig benutzte Formatvorgaben und Schrifttypen m&uuml;ssen nur einmal definiert werden ', 'Glosar'),
(90, '', 'CD-R(W)', '', 'Compact Disc Recordable, mit W=wiederbeschreibar', 'Glosar'),
(91, '', 'CGI/ CGI-Script', '', 'Common Gateway Interface ist ein Script zur &uuml;bertragung von Formularen, bzw. ausf&uuml;hren von Befehlen', 'Glosar'),
(92, '', 'Client', '', '"Kunde": 1. Rechner in einem Netzwerk, der die Dienste eines Servers in Anspruch nimmt. 2. Software, die f&uuml;r die Nutzung von Internet-Diensten (Web, FTP, IRC) ben&ouml;tigt wird ', 'Glosar'),
(93, '', 'Code', '', 'Steht f&uuml;r Codieren-Decodieren. Ein Codec ist ein Modul, das ein Video- oder Tonsignal komprimiert und dekomprimiert. Neben Microsofts AVI sind bekannte Codecs beispielsweise Indeo von Intel. Eine weitere Konkurrenz zu AVI stammt von Apple: Quicktime  ', 'Glosar'),
(94, '', 'Cookie', '', 'Kleine Textdatei, die von einem Web-Server via Internet an den Browser des Benutzers &uuml;bertragen und auf seinem Computer gespeichert wird ', 'Glosar'),
(95, '', 'Digitale Signatur', '', 'Digitale Unterschrift unter eine E-Mail, die garantiert, da&szlig; der Versender einer E-Mail wirklich der ist, als der er sich ausgibt ', 'Glosar'),
(96, '', 'DNS', '', ' Im Internet hat jeder angeschlossene Computer einen vierteiligen Zahlencode als Anschrift (die IP-Adresse), beispielsweise 178.33.92.212. Weil sich keiner derartige Zahlenunget&uuml;me merken kann, gibt es den Domain Name Service, kurz DNS. Viele Internet-Computer haben dort zu ihrem Zahlencode einen Eintrag, etwa www.home.page.de. Wenn Sie im Browser diese Adresse eintippen, holt sich der Browser zun&auml;chst bei einem DNS-Server die zugeh&ouml;rige IP-Adresse. Erst mit dem Zahlencode kann der Browser Verbindung zum Web-Server aufnehmen. Sie k&ouml;nnten auch statt der Domain direkt den Zahlencode eintippen  ', 'Glosar'),
(97, '', 'Domain', '', 'Bestandteil einer Internet-Adresse: Jeder ans Internet angeschlossene Computer wird mit einer Domain-Bezeichnung (engl. "domain" = Gebiet) angesprochen ', 'Glosar'),
(98, '', 'DSL', '', 'Digital Subscriber Line: Daten&uuml;bertragungstechnik , bei der Daten in digitaler Form per Kupferkabel &uuml;bermittelt werden. Neben ADSL gibt es noch andere Standards in der Familie von DSL-Techniken (Digital Subscriber Line). Dazu z&auml;hlen etwa HDSL (Highspeed DSL), VDSL (Very Highspeed DSL) oder SDSL (Symmetric DSL) ', 'Glosar'),
(99, '', 'DVD', '', 'Digital Versatile Disc (= vielseitige digitale Scheibe): neues Speichermedium, das Videokassetten, CD-ROMs und Floppy Disks abl&ouml;sen soll. Mit mindestens 4,7 GB hat die DVD eine siebenmal gr&ouml;&szlig;ere Speicherkapazit&auml;t als eine CD ', 'Glosar'),
(100, '', 'E-Commerce', '', 'Electronic Commerce: &uuml;ber Datennetze abgewickelte Gesch&auml;fte ', 'Glosar'),
(101, '', 'E-Mail', '', 'Versand und Empfang elektronischer Post', 'Glosar'),
(102, '', 'Einwahlknoten', '', 'Schnittstelle zwischen dem Onliner und dem Netzwerk seines Providers.', 'Glosar'),
(103, '', 'Electronic Banking', '', 'M&ouml;glichkeit, Bankgesch&auml;fte wie &uuml;berweisungen und Dauerauftr&auml;ge per PC und Modem/ISDN zu erledigen ', 'Glosar'),
(104, '', 'FAQ', '', 'Frequently Asked Questions (= h&auml;ufig gestellte Fragen): Frage-Antwort-Liste im Internet ', 'Glosar'),
(105, '', 'File Transfer', '', 'Datei&uuml;bertragung von einem Rechner zu einem anderen ', 'Glosar'),
(106, '', 'Finger', '', 'Unix-Befehl, mit dem sich eventuell vorhandene Daten &uuml;ber andere User abfragen lassen. Mit dem Kommando lassen sich Name oder Adresse in Erfahrung bringen und &uuml;berpr&uuml;fen, ob der Anwender online ist ', 'Glosar'),
(107, '', 'Firewall', '', '"Brandmauer". Schutzwall aus Hard- und/oder Software, der einen an das Internet angeschlossenen Rechner vor Hackerangriffen sch&uuml;tzt ', 'Glosar'),
(108, '', 'Firewire', '', 'Engl. f&uuml;r Feuerdraht. Highspeed-Schnittstelle f&uuml;r Computer und Zusatzger&auml;te, die Daten mit bis zu 400 MBit/s &uuml;bertr&auml;gt. Die Geschwindigkeit soll bald auf 3200 MBit/s heraufgeschraubt werden ', 'Glosar'),
(109, '', 'Flatrate', '', 'Internet-Zugang zum monatlichen Pauschaltarif. Telefonkosten sind inklusive ', 'Glosar'),
(110, '', 'Freeware', '', 'Software, die kostenlos aus dem Internet heruntergeladen und unbegrenzt genutzt werden darf ', 'Glosar'),
(111, '', 'GAN', '', 'Global Area Network: globales Netzwerk, das &uuml;ber Satellit aufgebaut wird ', 'Glosar'),
(112, '', 'Gopher', '', 'Suchprogramm und Informationsdienst, der im Internet Daten sammelt, ordnet und wieder zur Verf&uuml;gung stellt', 'Glosar'),
(113, '', 'HBCI', '', 'Home Banking Computer Interface: Datenaustausch-Standard beim Home-Banking mit hochsicherer Verschl&uuml;sselung, auf den sich alle deutschen Banken verpflichtet haben. HBCI soll das Pin/Tan-Verfahren abl&ouml;sen ', 'Glosar'),
(114, '', 'Hoax', '', 'Schlechter Scherz :(', 'Glosar'),
(116, '', 'Home-Banking', '', 'Auch Online-Banking: Bankgesch&auml;fte, die mit PC und Modem/ISDN erledigt werden ', 'Glosar'),
(117, '', 'Homepage', '', 'Start- beziehungsweise Begr&uuml;&szlig;ungsseite einer Website', 'Glosar'),
(118, '', 'Host', '', 'Rechner/Server, dessen Dienste der Onliner via Internet in Anspruch nimmt ', 'Glosar'),
(119, '', 'HTML', '', 'Hypertext Markup Language: standardisierte Seitenbeschreibungssprache f&uuml;r Web-Seiten ', 'Glosar'),
(120, '', 'HTTP', '', 'Hypertext Transfer Protocol: standardisiertes Verfahren zur &uuml;bertragung von Dateien im World Wide Web ', 'Glosar'),
(121, '', 'XML', '', 'Extensible Markup Language: neue dynamische Seitenbeschreibungssprache von Tim Berners-Lee. Von XML leitet sich XHTML ab, das HTML als Standard irgendwann ersetzen soll ', 'Glosar'),
(122, '', 'ACAP', '', 'Abk&uuml;rzung f&uuml;r "Application Control Access Protocol". ', 'Glosar'),
(123, '', 'ACC', '', 'Abk&uuml;rzung f&uuml;r "Automatic Contur Control" ', 'Glosar'),
(125, '', 'Icon', '', 'Bildelement, &uuml;ber das sich per Mausklick Texte, Programme oder Bilder aufrufen lassen ', 'Glosar'),
(126, '', 'Image Map', '', 'Grafik auf einer Web-Seite, die aus anklickbaren Teilen besteht, die per Hyperlink zu weiterf&uuml;hrenden Informationen f&uuml;hren ', 'Glosar'),
(127, '', 'Interaktivit', '', 'Informationsaustausch zwischen Anwender und Computer ', 'Glosar'),
(128, '', 'Intercast', '', 'Kombination von Internet und TV: von Intel entwickelte Technologie, die Web-Surfen ohne Modem, Telefonleitung und Provider erm&ouml;glicht. HTML-Dokumente werden wie Videotext in die Austastl&uuml;cke (freibleibender Teil der Bandbreite im TV-Kabelnetz) des analogen Fernsehsignals eingespeist. Um Internet-Daten darzustellen, ben&ouml;tigt man einen Decoder beziehungsweise eine Intercast-TV-Karte ', 'Glosar'),
(129, '', 'Internet-Telefonie', '', 'Telefonate von PC zu PC oder vom PC ins Festnetz via Internet oder von Telefon zu Telefon &uuml;ber das Internet ', 'Glosar'),
(130, '', 'Intranet', '', 'Firmeninternes Netzwerk ', 'Glosar'),
(131, '', 'IP', '', 'Internet Protocol: erm&ouml;glicht den Datenaustausch &uuml;ber das Internet zwischen Rechnern mit verschiedenen Betriebssystemen ', 'Glosar'),
(132, '', 'IP-Adresse', '', 'Jeder Computer, der ans Internet angeschlossen ist, bekommt eine eigene Nummer, die aus vier Bytes (Zahlen zwischen 0 und 255) besteht, die durch Punkte getrennt sind, zum Beispiel 178.93.82.17 ', 'Glosar'),
(133, '', 'ISDN', '', 'Integrated Services Digital Network: Netz, das Sprache und Computerdaten digital &uuml;bermittelt. ISDN bietet h&ouml;here &uuml;bertragungsgeschwindigkeit als das analoge Netz. Eine ISDN-Karte kann Daten mit einer Geschwindigkeit von bis zu 128.000 Bits pro Sekunde (bei Kanal-B&uuml;ndelung) &uuml;bermitteln ', 'Glosar'),
(134, '', 'Java', '', 'Programmiersprache von Sun Microsystems: Zur Ausf&uuml;hrung von Java-Programmen wird eine Java Virtual Machine ben&ouml;tigt, die in das Betriebssystem oder den Browsern eingebaut ist. Java-Programme lassen sich betriebssystemunabh&auml;ngig auf jedem Computer ausf&uuml;hren ', 'Glosar'),
(135, '', 'Javascript', '', 'Script-Sprache von Netscape, mit der sich interaktive Web-Seiten gestalten lassen. Javascript eignet sich besonders zur &uuml;berpr&uuml;fung von Formulareingaben, kann Berechnungen durchf&uuml;hren und Laufschriften anzeigen ', 'Glosar'),
(136, '', 'JPEG', '', 'Joint Photografic Expert Group: 1. Kommission, die das Verfahren zum Komprimieren und Speichern von Bild- und Videodaten festlegt. 2. digitales Bildformat, das sich f&uuml;rs Web eignet ', 'Glosar'),
(137, '', 'KB', '', 'Auch Kbyte, Abk&uuml;rzung f&uuml;r Kilobyte.1 Kilobyte = 1024 Byte ', 'Glosar'),
(138, '', 'Klammeraffe', '', 'At-Zeichen (@)', 'Glosar'),
(139, '', 'Kryptographie', '', 'Datenverschl&uuml;sselung zum Schutz vertraulicher Informationen, insbesondere beim Datenaustausch &uuml;bers Internet ', 'Glosar'),
(140, '', 'LAN', '', 'Local Area Network: lokales Computernetzwerk, beispielsweise in einem Firmengel&auml;nde oder Raum ', 'Glosar'),
(141, '', 'LDAP', '', 'Lightweight Directory Access Protocol (einfaches Protokoll f&uuml;r den Zugriff auf Verzeichnisse): Standard f&uuml;r die Kommunikation mit Datenbanken im Internet. Ist die Mail-Adresse eines Empf&auml;ngers unbekannt, greifen Mail-Programme mit diesem Protokoll automatisch auf E-Mail-Adressb&uuml;cher im Web zu ', 'Glosar'),
(142, '', 'Link', '', 'Auch Hyperlink: Verweis zu einem anderen Web-Dokument auf derselben Website oder auf ein anderes Web-Angebot ', 'Glosar'),
(143, '', 'Mail-Server', '', 'Rechner, auf denen E-Mails zwischengelagert werden. E-Mails k&ouml;nnen vom Mail-Server heruntergeladen oder zum Weiterversand an diesen geschickt werden ', 'Glosar'),
(144, '', 'Mailbox', '', 'Elektronisches Postfach, das ankommende E-Mails speichert, bis der Empf&auml;nger sie abruft ', 'Glosar'),
(145, '', 'Makro', '', 'Gespeicherte Folge von Tastenanschl&auml;gen und/oder Mausklicks, die dazu dient, h&auml;ufig ben&ouml;tigte Arbeitsschritte automatisch ablaufen zu lassen ', 'Glosar'),
(146, '', 'MB', '', 'Auch MByte, Abk&uuml;rzung f&uuml;r Megabyte1 MByte = 1024 KByte = 1.048.576 Byte ', 'Glosar'),
(147, '', 'Meta-Tag', '', 'Die meisten HTML-Tags beeinflussen das Aussehen der Web-Seite im Browser. Eine Web-Seite kann aber auch andere Informationen enthalten, zum Beispiel den Autor, wann sie erzeugt, Stichworte f&uuml;r Suchmaschinen etc. F&uuml;r solche Informationen gibt es das spezielle Tag <>. Um die verschiedenen Informationen auseinander zu halten, gibt es das Attribut name=. Die Information selbst steckt im Attribut content=. Stichworte f&uuml;r eine Suchmaschine sehen zum Beispiel so aus: <br><meta name="keywords" content="Stichwort1, Stichwort2, ..."> ', 'Glosar'),
(148, '', 'MIDI', '', 'MIDI ist ein sehr platzsparendes Format f&uuml;r Sound-Dateien. Im Gegensatz zum WAV-Format speichert MIDI n&auml;mlich wie auf einem Notenblatt nur die Noten und welches Instrument den Ton spielen soll. Es ist dann die Aufgabe des Computers, der die MIDI-Datei abspielt, die Noten in passende T&ouml;ne umzusetzen. Je nach Soundkarte ist die Qualit&auml;t exzellent oder erinnert mehr an eine Blockfl&ouml;te ', 'Glosar'),
(149, '', 'MIME', '', 'Multipurpose Internet Mail Extensions (Mehrzweck-Erweiterung f&uuml;r E-Mails): Kodierungsverfahren, mit dem sich Multimedia-Inhalte versenden und empfangen lassen: Bilder, Videos und Sound-Dateien werden als Attachment verschickt ', 'Glosar'),
(150, '', 'Modem', '', 'MOdulator/DEModulator: Ger&auml;t zur &uuml;bertragung von Daten &uuml;ber das Telefonnetz. Vor der &uuml;bertragung werden die Computersignale in analoge Impulse umgewandelt (moduliert) und auf der Empf&auml;ngerseite wieder in digitale Signale zur&uuml;ckverwandelt (demoduliert) ', 'Glosar'),
(151, '', 'MP3', '', 'MPEG Layer 3. Technik zur Komprimierung von Sound-Dateien. Audiodaten werden ohne h&ouml;rbaren Klangverlust auf ein Zw&ouml;lftel ihrer urspr&uuml;nglichen Gr&ouml;&szlig;e zusammengepresst ', 'Glosar'),
(152, '', 'Multimedia', '', 'Interaktives Zusammenwirken von Text, Grafik, Animationen, Sound und Video ', 'Glosar'),
(153, '', 'Node', '', 'Knoten: 1. Rechner, der Zugang zum Internet hat. 2. Kreuzungspunkt von &uuml;bertragungswegen in einem Netz ', 'Glosar'),
(154, '', 'NTBA', '', 'Network Terminator Base Access. Die ISDN-Netzabschlussbox stellt ISDN-Endger&auml;ten eine digitale Telefonschnittstelle namens S0-Schnittstelle zur Verf&uuml;gung ', 'Glosar'),
(155, '', 'NTBBA', '', 'Network Terminator Broadband Access. ADSL-Modem, das bei ADSL-Teilnehmern installiert werden muss ', 'Glosar'),
(156, '', 'Offline', '', 'Nicht mit dem Internet verbunden ', 'Glosar'),
(157, '', 'Online', '', 'Offene Verbindung zum Internet ', 'Glosar'),
(158, '', 'Pager', '', 'Ger&auml;te, die kleine Text-Meldungen anzeigen (Skyper, Scall). Die Kurznachrichten lassen sich per Telefon oder Internet an den Pager &uuml;bermitteln ', 'Glosar'),
(159, '', 'Perl', '', 'Eine einfache Programmiersprache, die auf die Verarbeitung von Texten spezialisiert ist. Au&szlig;erdem sind Perl-Interpreter (die Perl-Programme abarbeiten) im Internet kostenlos zu haben. Deshalb erfreut sich Perl gro&szlig;er Beliebtheit f&uuml;r den Einsatz auf Web-Server zum Verfassen von CGI-Scripts ', 'Glosar'),
(160, '', 'PIN', '', 'Pers&ouml;nliche Identifikationsnummer: Geheimzahl, mit der sich der Online-Banker beim Kreditinstitut ausweist ', 'Glosar'),
(161, '', 'Pixel', '', 'Computer bauen Bilder immer aus einzelnen Farbpunkten auf. Am Computermonitor sehen Sie typischerweise 800 x 600 oder 1024 x 768 Farbpunkte. Jeder Farbpunkt ist ein Pixel. Auch Bilder setzen sich am Computer aus Pixeln (Bildpunkten) zusammen ', 'Glosar'),
(174, '', 'Abrechnungstakt', '', '... bestimmt die kleinste Telefoneinheit in Sekunden, nach der die Abrechnung von Telefonverbindungen (Festnetz oder Funk bzw. Sprache oder Daten) erfolgt. So werden z.B. im Ein-Sekunden-Takt Gespr&auml;che sekundengenau abgerechnet. Allgemein gilt, je k&uuml;rzer der Takt, desto genauer die Abrechnung.', 'Glosar'),
(176, '', 'Active Directory', '', '... ist ein skalierbarer, hierarchischer Verzeichnisdienst zur zentralen Verwaltung aller f&uuml;r das Netzwerk relevanten Ressourcen. Dieses leistungsf&auml;hige Instrument versteht den Umgang mit Netzen unterschiedlichster Arten und Gr&ouml;&szlig;en.', 'Glosar'),
(177, '', 'ActiveMovie', '', '... ist nicht nur die 32-Bit-Nachfolgetechnologie von Video f&uuml;r Windows, sondern laut Microsoft auch die neue Multimedia-Architektur, die f&uuml;r Spiele, Internet und CD-ROM optimiert wurde. ActiveMovie basiert auf Filtern', 'Glosar'),
(178, '', 'AD/DA-Wandler', '', 'Abk&uuml;rzung f&uuml;r "Analog/Digital-/Digital/Analog-Wandler" ', 'Glosar'),
(179, '', 'Address Spoofing', '', 'Adressenschwindel! ', 'Glosar'),
(181, '', 'Administrator', '', 'Bezeichnung f&uuml;r den Systemverwalter in einem Netzwerk ', 'Glosar'),
(182, '', 'Backslash', '', 'R&uuml;ckw&auml;rts-Schr&auml;gstrich auf der Tastatur ("").', 'Glosar'),
(183, '', 'Gameport', '', 'Spezielle Schnittstelle f&uuml;r den Anschu&szlig; eines Joysticks. ', 'Glosar'),
(364, '', 'Ablagemappe', '', 'Erweiterte Variante der Zwischenablage in WINDOWS f&uuml;r Workgroups 3.11, bei der der Inhalt der Zwischenablage abgelegt werden kann. Diese Seiten k&ouml;nnen sp&auml;ter wieder in die Zwischenablage &uuml;bernommen oder im Netzwerk anderen Benutzern verf&uuml;gbar gemacht werden. Unter WINDOWS 95 oder WINDOWS NT l&auml;&szlig;t sich die Ablagemappe nur mit Shareware-Software wie ClipMate realisieren.', 'Glosar'),
(366, '', 'ACPI', '', 'Abk&uuml;rzung von "Advanced Configuration and Power Interface" ', 'Glosar'),
(367, '', 'ACR', '', 'Abk&uuml;rzung f&uuml;r "Advanced Communication Riser" ', 'Glosar'),
(369, '', 'ActiveMovie', '', '... ist nicht nur die 32-Bit-Nachfolgetechnologie von Video f&uuml;r Windows, sondern laut Microsoft auch die neue Multimedia-Architektur, die f&uuml;r Spiele, Internet und CD-ROM optimiert wurde. ActiveMovie basiert auf Filtern.', 'Glosar'),
(370, '', 'ADA', '', 'Programmiersprache milit&auml;rischen Ursprungs. Benannt nach Augusta Ada Byron, der ersten "Programmiererin" (um 1850). ', 'Glosar'),
(371, '', 'ADC', '', 'Abk&uuml;rzung f&uuml;r "Analog Digital Converter" ', 'Glosar'),
(372, '', 'AD/DA-Wandler', '', 'Abk&uuml;rzung f&uuml;r "Analog/Digital-/Digital/Analog-Wandler" #Ger&auml;t, das analoge Signale in digitale umwandelt (AD) und wieder zur&uuml;ck (DA).', 'Glosar'),
(373, '', 'Akronym', '', 'Akronyme sind Kurzw&ouml;rter. die aus den Anfangsbuchstaben (oder anderen wichtigen Buchstaben) mehrerer W&ouml;rter gebildete werden. ', 'Glosar'),
(374, '', 'Algorithmus', '', 'Die Beschreibung eines methodischen Weges zur L&ouml;sung eines (mathematischen) Problems. ', 'Glosar'),
(375, '', 'Alias-Name', '', '... bedeutet soviel wie "auch ... genannt" ', 'Glosar'),
(376, '', 'Alphanumerisch', '', 'Eine Zeichenfolge, die neben Ziffern auch Buchstaben und Sonderzeichen enth&auml;lt.', 'Glosar'),
(377, '', 'AMD', '', 'Abk&uuml;rzung f&uuml;r "Advanced Micro Devices" aus Sunnyvale (Kalifornien)  AMD ist einer der gro&szlig;en Konkurrenten des Chip-Herstellers INTEL', 'Glosar'),
(379, '', 'ANSI', '', 'Abk&uuml;rzung f&uuml;r "American National Standards Institute" - www.ansi.org', 'Glosar'),
(380, '', 'Antiqua', '', 'Bezeichnung f&uuml;r alle Schriften, die sich von der alten (so die w&ouml;rtliche &uuml;bersetzung aus dem Lateinischen) r&ouml;mischen Buchstabenschrift her ableiten. Au&szlig;er Fraktur- und Handschriften werden fast alle unsere Schriften - auch die serifenlose sogenannte Linear-Antiqua - mit diesem Begriff bezeichnet. ', 'Glosar'),
(381, '', 'Apache', '', 'Open-Source-Web-Server ', 'Glosar'),
(382, '', 'API', '', 'Abk&uuml;rzung f&uuml;r "Application Programmer''s Interface" oder "Application Programming Interface" ', 'Glosar'),
(383, '', 'APM', '', 'Abk&uuml;rzung von "Advanced Power Management"', 'Glosar'),
(384, '', 'APOP', '', 'Abk&uuml;rzung f&uuml;r "Authenticated Post Office Protocol" ', 'Glosar'),
(385, '', 'Appearance', '', 'Das Aussehen (Appearance) von geometrischen Knoten/K&ouml;rpern wird durch Materialeigenschaften und Texturen bestimmt. ', 'Glosar'),
(386, '', 'Array', '', 'Bezeichnet eine Liste von zusammengeh&ouml;renden Daten. Es wird zwischen ein-, zwei- und mehrdimensionalen Arrays unterschieden.', 'Glosar'),
(387, '', 'Assembler', '', 'Maschinenspezifische / computerabh&auml;ngige Programmiersprache ', 'Glosar'),
(388, '', 'AT ( @ )', '', 'Der "Klammeraffe" kommt aus der kaufm&auml;nnischen Welt und wurde bereits im 19. Jahrhundert benutzt. Heute ist er ein pr&auml;gnanter Bestandteil jeder E-Mail-Adresse. ', 'Glosar'),
(389, '', 'ATTS', '', 'Abk&uuml;rzung f&uuml;r "Automatic Tape Tuning System" von Grundig ', 'Glosar'),
(390, '', 'ATX', '', 'Abk&uuml;rzung f&uuml;r "Advanced Technology (eXtended)" ', 'Glosar'),
(391, '', 'AVI', '', 'Abk&uuml;rzung f&uuml;r "Audio Video Interleave" ', 'Glosar'),
(392, '', 'Backup', '', 'Sicherheitskopie eines Datenbestandes ', 'Glosar'),
(393, '', 'Barcode', '', '1973 stellte IBM den ersten Barcode, UPC (Universal Product Code), f&uuml;r Kassensysteme vor ', 'Glosar'),
(394, '', 'BASIC', '', 'Abk&uuml;rzung f&uuml;r "Beginners All purpose Symbolic Instruction Code" - Programmiersprache ', 'Glosar'),
(395, '', 'BDSG', '', 'Abk&uuml;rzung f&uuml;r "Bundesdatenschutzgesetz" - Sammlung der gesetzlichen Regelungen zum Datenschutz, von enormer Bedeutung im EDV-Bereich. ', 'Glosar'),
(396, '', 'BIOS', '', 'Abk&uuml;rzung f&uuml;r "Basic Input Output System" ', 'Glosar'),
(397, '', 'Bit/s', '', 'bilineares FilternFunktion bei entsprechenden 3D-optimierten Grafikarten: Dadurch werden schachbrettartige Texturen (Oberfl&auml;chen) bei Objekten im Vordergrund und Flimmereffekte bei Dingen im Hintergrund vermieden. Wie beim Anti-Aliasing wird das durch Interpolation benachbarter Bildpunkte erreicht.BillboardImmer zum Betrachter gewandte Textur. Eignet sich beim Rendern f&uuml;r Mitteilungen oder f&uuml;r rotationssymmetrische Objekte. bin&auml;rEin Zahlensystem, das mit der Basis 2 und der Ziffernanzahl 2 (0 und 1) arbeitet. In dem bin&auml;ren (auch "dualen") Zahlensystem k&ouml;nnen die Zust&auml;nde von Schaltkreisen, auf denen Prozessoren basieren, gut dargestellt werden (0=ausgeschaltet, 1=eingeschaltet). Bin&auml;rdatei / BinariesProgramm, Grafik- oder Archivdateien, die nicht nur druckbare Zeichen enthalten wie z.B. eine ASCII-Textdatei. Der Versand von Bin&auml;rdateien in eigentlich textorientierten Bereichen des Internet (Newsgroups, E-Mail) erfordert einige technische Finessen, etwa eine "UUE"-Kodierung (siehe Ben&auml;r&uuml;bertragung).Bin&auml;r&uuml;bertragungTechnik zur &uuml;bertragung von Programmen und beliebigen Attachments per E-Mail BinderyIn Novell-Netware-Servern bis Version 3.12 verwendete Datenbank, in der Informationen &uuml;ber Benutzer, Pa&szlig;w&ouml;rter und Zugriffsrechte gespeichert werden. siehe Novell Directory Services  BiometrieBiometrie ersetzt Code-Nummern und Pa&szlig;w&ouml;rter BIOSAbk&uuml;rzung f&uuml;r "Basic Input Output System" BirdEye / BirdViewDer Name ist Programm: Distanzierte Betrachtung eines Vogels (Vogelperspektive), der ein ganzes Projekt &uuml;bersehen kann. Auf CAD- oder Grafikprogramme &uuml;bertragen hei&szlig;t das: auf dem Bildschirm wird eine verkleinerte Gesamtansicht der Zeichnung in einem eigenen Fenster dargestellt. Abh&auml;ngig von der jeweiligen Software reiht sich die BirdEye-Funktion in die normale Bildschirmsteuerung ein und erlaubt beispielsweise auch die Auswahl eines Bildausschnittes, der dann im "normalen" Fenster zur weiteren Bearbeitung angezeigt wird.bitAbk&uuml;rzung f&uuml;r "Binary Digit" ', 'Glosar'),
(398, '', 'Bluetooth', '', 'Technologie f&uuml;r die drahtlose &uuml;bermittlung von Sprache und Daten ', 'Glosar'),
(399, '', 'Booten', '', 'Bezeichnet das Laden des BIOS und des Betriebssystems nach einem Kalt- oder Warmstart.', 'Glosar'),
(400, '', 'BPI', '', 'Abk&uuml;rzung f&uuml;r "Bits per Inch". Ma&szlig;einheit f&uuml;r die Aufzeichnungsdichte bei magnetischen Datenb&auml;ndern an. ', 'Glosar'),
(401, '', 'Braille-Schrift', '', 'Blinde Menschen lesen seit 1825 mit ihren H&auml;nden - und zwar mit Hilfe der aus sechs Punkten bestehenden Braille-Schrift. ', 'Glosar'),
(402, '', 'Buffer', '', 'Englische Bezeichnung f&uuml;r Puffer ', 'Glosar'),
(403, '', 'Bus', '', 'Ein System von parallelen Leitungen zur &uuml;bertragung von Daten zwischen einzelnen Systemkomponenten - also zwischen Mikroprozessoren, Hauptspeicher, Schnittstellen und Erweiterungskarten. ', 'Glosar'),
(378, '', 'Animation', '', 'Darstellung von Bewegungsabl&auml;ufen ', 'Glosar'),
(417, '', 'Handshake', '', 'Ein Kommunikationsprotokoll, das den Datenflu&szlig; &uuml;ber die serielle Schnittstelle, also beispielsweise zwischen Computer und Modem oder auch zwischen zwei Modems, kontrolliert. Man unterscheidet dabei zwischen einem Hardware- und einem Software-Handshake. Ersteres schaltet eine bestimmte Leitung (RTS/CTS) am seriellen Anschlu&szlig;, um den Datenflu&szlig; anzuhalten oder zu starten. Zweiteres benutzt in den Datenstrom eingef&uuml;gte Steuerzeichen (XON/XOFF), beziehungsweise Hayes- und AT-Befehle.', 'Glosar'),
(418, '', 'Hardcopy', '', 'Kopie des Bildschirminhaltes durch dr&uuml;cken deer Drucktaste rechts. Das kopierte Bild kann in Bildprogrammen eingef&uuml;hgt werden.', 'Glosar'),
(419, '', 'Harddisk', '', 'Festplatte, bzw. Partition auf der Festblatte', 'Glosar'),
(420, '', 'Hardware', '', 'Alle harten Bestandteile des Computers und seiner Peripherie, d.h. alle Ger&auml;te und Ger&auml;teteile vom Prozessor &uuml;ber Speicher und Datentr&auml;ger bis zum Drucker oder Modem. ', 'Glosar'),
(421, '', 'Hashing', '', 'Besondere Speichermethode bei gro&szlig;en Datenbanken, die das Wiederfinden von Datens&auml;tzen beschleunigt. ', 'Glosar'),
(422, '', 'Headcrash', '', 'Englische Bezeichnung f&uuml;r den Aufprall des Schreib-/Lesekopfes einer Festplatte auf die Oberfl&auml;che des Datentr&auml;gers', 'Glosar'),
(423, '', 'Hertz', '', 'Ma&szlig;einheit f&uuml;r die Frequenz, d. h. die Anzahl des Eintretens eines Ereignisses pro Sekunde mit\r\n1 Hz = 1 Schwingung pro Sekunde\r\n', 'Glosar'),
(424, '', 'Hexadezimal', '', 'Methode zur Darstellung von alphanumerischen Zeichen auf der Basis 16 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F), w&auml;hrend im Dezimalsystem die Zahl 10 die Basis ist. ', 'Glosar'),
(425, '', 'JIT', '', 'Abk&uuml;rzung f&uuml;r Just in time, d.h. immer aktuell sein.', 'Glosar'),
(426, '', 'Joystick', '', 'Steuerkn&uuml;ppel, der als Eingabeger&auml;t fungiert. Viele Computerspiele und Virtual Reality-Programme erfordern einen Joystick zur Steuerung des Spielablaufs. ', 'Glosar'),
(427, '', 'Jumper', '', 'Spezieller Schalter auf Erweiterungskarten und elektronischen Platinen. Jumper werden zur Konfiguration von Hardware im Rahmen eines bestehenden (Computer-)Systems benutzt. ', 'Glosar'),
(428, '', 'Kalibrierung', '', 'Mit einer Kalibrierung lassen sich Geometrie-Fehler (Verzug, Schlupf, Verzerrung) oder Farbfehler korrigieren (oder zumindest verringern), die beim Scannen einer Vorlage (Luftbilder, Bebauungspl&auml;ne bzw. Farbfotos,...) entstehen k&ouml;nnen. ', 'Glosar'),
(429, '', 'Kaltstart', '', 'Startvorgang des Computers durch Einschalten oder kurze Unterbrechnung der Stromzufuhr.', 'Glosar'),
(430, '', 'Kennwort', '', 'Individuelle Zeichenfolge zur Identifizierung eines Benutzers, der sich Zugang zu einem Computersystem oder Netzwerk verschaffen m&ouml;chten. ', 'Glosar'),
(431, '', 'Kerberos', '', 'Sicherheitssystem f&uuml;r Netze, welches durch Verschl&uuml;sselung Passw&ouml;rter und sensible Daten sch&uuml;tzt. ', 'Glosar'),
(432, '', 'Kermit', '', 'Spezielles Datenfern&uuml;bertragungs Programm. 1981 an der Columbia Universit&auml;t entwickelt. Die dort eingesetzte Methode wird auch als &uuml;bertragungsprotokoll von anderen Programmen verwendet. ', 'Glosar'),
(433, '', 'Keyboard', '', 'Englische Bezeichnung f&uuml;r "Tastatur". ', 'Glosar'),
(434, '', 'KK-Antrag / -Update', '', 'Abk&uuml;rzung f&uuml;r Konnektivit&auml;ts-Koordinations-Antrag /-Update, wodurch die (m&ouml;glicherweise erzwungene) Umstellung einer Domain  auf einen anderen Provider erfolgt.', 'Glosar'),
(435, '', 'Kompatibilit', '', 'Vertr&auml;glichkeit von unterschiedlicher Hardware- und Softwarekomponenten.', 'Glosar'),
(436, '', 'Kopierschutz', '', 'Vorrichtung, die das unbefugte Kopieren von Programmen oder Daten unterbindet. Ein Kopierschutz kann durch spezielle Software oder Hardware (Dongle) realisiert werden. ', 'Glosar'),
(437, '', 'Kybernetik', '', 'Wissenschaft der Steuer- und Regelungsvorg&auml;nge.', 'Glosar'),
(438, '', 'Laser', '', 'Abk&uuml;rzung f&uuml;r "Light Amplification by Stimulated Emission of Radiation" ', 'Glosar'),
(439, '', 'Laserdrucker', '', 'Drucker, der auf dem Prinzip eines Kopierger&auml;tes basiert ', 'Glosar'),
(440, '', 'Laufwerk', '', 'Ger&auml;t, das Speichermedien wie Disketten oder Festplatten beschreiben und lesen kann.', 'Glosar'),
(441, '', 'Kinematik', '', 'Bewegungslehre. Teilgebiet der Mechanik. Die Kinematik befa&szlig;t sich mit der geometrischen Beschreibung von Bewegungsverh&auml;ltnissen. Die Kr&auml;fte, die diese Bewegungen verursachen, bleiben dabei unber&uuml;cksichtigt.', 'Glosar'),
(442, '', 'Knowbots', '', 'Automatisiertes Werkzeug, mit dem es z.B. m&ouml;glich ist, Informationen aus verschiedenen Rechnersystemen &uuml;ber das Internet zu sammeln.', 'Glosar'),
(443, '', 'Koaxialkabel', '', 'Elektrische Leitung mit speziellem physikalischem Aufbau. Dabei verlaufen zwei Leiter ineinander, die beide voneinander elektrisch isoliert sind (Antennenkabel sind so aufgebaut). ', 'Glosar'),
(444, '', 'Konvertierung', '', 'Umformung / Umwandlung zwischen unterschiedlichen Dateiformaten, damit diese von anderen Programmen gelesen oder bearbeitet werden k&ouml;nnen.', 'Glosar'),
(445, '', 'LCD', '', 'Abk&uuml;rzung f&uuml;r "Liquid Cristal Display" oder "Liquid Crystal Display". Fl&uuml;ssigkristall-Anzeige. Technisches Prinzip zur Realisierung flacher Bildschirme, wie es etwa bei Notebooks oder Laptops eingesetzt wird. Zwischen zwei Folien wird eine Schicht mit Fl&uuml;ssigkristallen eingef&uuml;gt, die bei angelegter Spannung den Lichtbrechungsindex &auml;ndern.\r\n\r\n', 'Glosar'),
(446, '', 'Light Pen', '', 'Englische Bezeichnung f&uuml;r "Lichtstift", spezielles Eingabeger&auml;t, das wie ein Stift auf dem Bildschirm gef&uuml;hrt wird. Der Light Pen wird nur von entsprechenden Programmen unterst&uuml;tzt. ', 'Glosar'),
(447, '', 'LINUX', '', 'UNIX-Variante, die an Universit&auml;ten entstanden ist und in einem als GPL (General Public License) vertrieben wird.', 'Glosar'),
(448, '', 'LISP', '', 'Abk&uuml;rzung f&uuml;r "List Processing Language", symbolische Programmiersprache aus den 50er Jahren, um k&uuml;nstliche Intelligenz zu erzeugen. ', 'Glosar'),
(449, '', 'Lizenz', '', 'Berechtigung zur Nutzung von Software. In der Regel wird die Lizenz mit dem rechtm&auml;&szlig;igem Kauf von Software erworben.\r\n\r\n', 'Glosar'),
(450, '', 'Login', '', 'Das Anmelden und das Authentisieren eines Anwenders in einem Netzwerk oder einem anderen Kommunikationssystem wie einem Online-Dienst: Die Login-Prozedur umfa&szlig;t dabei den gesamten Vorgang vom W&auml;hlen der Telefonnummer des OnlineDienstes oder Internet-Providers &uuml;ber diverse Pa&szlig;wort-Abfragen bis hin zum geschlossenen Verbindungsaufbau.\r\n', 'Glosar'),
(451, '', 'Logistik', '', 'Bei der Herstellung von Produkten eingesetztes System zum Transport und Zusammenf&uuml;gen der einzelnen Komponenten. ', 'Glosar'),
(452, '', 'Low Level Formatierung', '', 'Erste Formatierung (Grundformatierung) eines Datentraegers auf niedrigster Ebene (auch "Vorformatierung" genannt) mit speziellen Routinen des BIOS, bei der die Festplatte in logische Spuren und Sektoren eingeteilt wird. In der Regel wird die Low Level-Formatierung bereits vom Hersteller vorgenommen. Erst nach dieser Formatierung kann eine Einteilung in Partitionen und die &uuml;bliche Formatierung durchgef&uuml;hrt werden.\r\n', 'Glosar'),
(453, '', 'Matrixdrucker', '', 'Drucker, die die zu druckenden Zeichen aus Punkten zusammensetzt - beispielsweise Nadel- und Tintenstrahldrucker. ', 'Glosar'),
(454, '', 'Memory', '', 'Englische Bezeichnung f&uuml;r "Speicher". ', 'Glosar'),
(455, '', 'Meta-Suchmaschine', '', 'Eine Meta-Suchmaschine leitet einen Suchbegriff an mehrere &uuml;bliche Suchmaschinen weiter (Hotbot, Infoseek, Lycos, Yahoo, Altavista etc.)  und zeigt die gesammelten Resultate auf einer Seite an.', 'Glosar'),
(456, '', 'Modul', '', 'Bestandteil eines zusammengesetzten Systems oder Programms. ', 'Glosar'),
(457, '', 'Motherboard', '', 'Englische Bezeichnung f&uuml;r die Hauptplatine im Computer. Sie ist quasi die zentrale B&uuml;hne, auf der die weitere Hardware aufgebaut wird: die Speicherbausteine, die Grafikkarte, die CPU usw. \r\n\r\n', 'Glosar'),
(458, '', 'Multimedia', '', 'Bezeichnung f&uuml;r die Aufzeichnung, Wiedergabe und Integration von digitalisierter Musik und bewegten Bildern.', 'Glosar'),
(459, '', 'Name Server / Nameserver', '', 'Computer, welcher einen Domain-Namen in die eigentliche Zahlenadresse von TCP/IP &uuml;bersetzen. ', 'Glosar'),
(460, '', 'NetBEUI', '', 'Abk&uuml;rzung f&uuml;r "NetBIOS Extended User Interface", bezeichnet von IBM 1985 entwickeltes Netzwerkprotokoll. Es ist zu allen derzeit aktuellen Microsoft Betriebssystemen (angefangen von Windows 3.X bis Windows NT) kompatibel.\r\nIm Unterschied zu TCP/IP kann es nicht &uuml;ber Router weitergeleitet werden. Es eignet sich daher nur zum Aufbau kleiner Netze. Um ein LAN an das Internet anzubinden, ist auf jeden Fall TCP/IP notwendig\r\n\r\n', 'Glosar'),
(461, '', 'NETWARE', '', 'Andere Bezeichnung f&uuml;r Novell Netware. Von dem US-Hersteller Novell entwickeltes und weit verbreitetes Netzwerk Betriebssystem, das in der zweiten H&auml;lfte der 90er Jahre starke Konkurrenz durch Windows NT bekommen hat. Novell Netware unterst&uuml;tzt alle g&auml;ngigen &uuml;bertragungsprotokolle und Betriebssysteme wie DOS, Windows und OS/2.\r\n\r\n', 'Glosar'),
(462, '', 'Netz / Netzwerk', '', 'Verbund von Computern, die &uuml;ber verschiedene Leitungen verbunden sind und sich gemeinsame Ressourcen wie Daten und Peripherieger&auml;ten teilen. H&auml;ufig steht in einem Netzwerk ein spezieller Rechner (Server) nur zur Datenverwaltung zur Verf&uuml;gung, auf den alle anderen Arbeitsstation Zugriff haben.\r\n', 'Glosar'),
(463, '', 'Netzwerkdrucker', '', 'Drucker, der an einen Server im Netzwerk angeschlossen ist und von den Arbeitsstation &uuml;ber das Netzwerk verwendet werden kann. Manche Netzwerkbetriebssysteme erlauben auch den Anschlu&szlig; eines Netzwerkdrucker an einer Arbeitsstation.\r\n\r\n', 'Glosar'),
(464, '', 'Netzwerkkarte', '', 'Erweiterungskarte, &uuml;ber die der Anschlu&szlig; an ein Netzwerk hergestellt werden kann oder &uuml;ber die verschiedene Arbeitsstationen miteinander verbunden werden k&ouml;nnen, um Daten auszutauschen oder Ressourcen gemeinsam benutzen zu k&ouml;nnen. Da verwundert es nicht, da&szlig; manchmal Hersteller von ISDN-Karten diese wie Netzwerkkarten behandeln und konfigurieren.', 'Glosar'),
(465, '', 'NFS', '', 'Abk&uuml;rzung f&uuml;r "Network File System", englische Bezeichnung f&uuml;r das Dateisystem eines Netzwerkes. ', 'Glosar'),
(466, '', 'Node', '', 'Rechner, der Zugang zum Internet hat.', 'Glosar'),
(467, '', 'Notebook', '', 'Tragbarer Computer mit fast der Leistungsf&auml;higkeit eines PCs. Notebooks haben eine Grundfl&auml;che von etwa einer DIN A4-Seite, einen flachen LCD-Monitor, ein Gewicht von weniger als 3 kg und k&ouml;nnen bei Bedarf auch &uuml;ber einen Akku betrieben werden. Das Notebook ist der Nachfolger des Laptops - und m&ouml;glicherweise der Vorl&auml;ufer der Handhelds.\r\n\r\n', 'Glosar'),
(468, '', 'OCR', '', 'Abk&uuml;rzung f&uuml;r "Optical Character Recognition" optische Zeichen- bzw. Buchstabenerkennung: papierene Text-Vorlagen, die mit einem Scanner in den Computer eingelesen wurden (NCI), werden in editierbare Text-Dokumente (CI) umgewandelt. Aktuelle OCR-Software wie Omnipage oder Rekognita sind nicht mehr auf spezielle OCR-Schriften angewiesen, sondern k&ouml;nnen auch Fonts erkennen, wie sie beim Buchdruck oder f&uuml;r Zeitungen eingesetzt werden. Mit Handschriften gibt es aber immer noch Probleme.\r\n\r\n', 'Glosar'),
(469, '', 'OCX', '', 'OCX-Controls sind Software-Komponenten, die ihre Dienste &uuml;ber die in COM definierte Software-Schnittstelle zur Verf&uuml;gung stellen. Durch den Einsatz von OCX-Controls k&ouml;nnen Software-Module anderer Hersteller auf effiziente Weise in Progamme integriert werden. OCX-Controls kennt man im Internet als Active X-Controls.\r\n\r\n', 'Glosar'),
(470, '', 'ODBC', '', 'Abk&uuml;rzung f&uuml;r "Open DataBase Connectivity" &#8226; offene Datenbankverbindung. Standardisierte Methode, die den Zugriff auf Datenbanken erlaubt, ohne dabei zu ber&uuml;cksichtigen, aus welchem Programm oder von welchem Betriebssystem aus der Zugriff erfolgt.\r\n\r\n', 'Glosar'),
(471, '', 'OEM', '', 'Abk&uuml;rzung f&uuml;r "Original Equipment Manufacturer"  damit sind Hersteller gemeint, die f&uuml;r ihre Produkte Original-Einzelteile von anderen Herstellern in Absprache mit diesen (!) verwenden, und die fertigen Produkte unter eigenem Namen auf den Markt bringen. \r\n\r\n', 'Glosar'),
(472, '', 'OOB', '', 'Bezeichnung f&uuml;r ein INTERNET-Sicherheitsleck. OOB-Attacken senden ung&uuml;ltige Datenpakete und h&auml;ngen damit den angegriffenen Rechner vom Netz ab oder lassen ihn im ung&uuml;nstigsten Fall ganz abst&uuml;rzen.', 'Glosar'),
(473, '', 'Open-Source-Software', '', 'Software, deren Quellcode ver&ouml;ffentlicht wurde und an dem freie Programmierer (Studenten,...) arbeiten k&ouml;nnen. LINUX und IntelliCAD sind typische Open-Source-Projekte. ', 'Glosar'),
(474, '', 'Operation', '', 'Englische Bezeichnung f&uuml;r "Anweisung" oder "Befehl". ', 'Glosar'),
(475, '', 'Option', '', 'Andere Bezeichnung f&uuml;r Auswahlm&ouml;glichkeit. ', 'Glosar'),
(476, '', 'ORACLE', '', 'Relationales Datenbanksystem der Oracle Deutschland GmbH bzw. Oracle Corporation, das die Abfragesprache SQL PLUS nutzt und &uuml;ber eine Programmierschnittstelle mit der M&ouml;glichkeit zum Aufbau verteilter Datenbanken verf&uuml;gt.\r\n', 'Glosar'),
(477, '', 'Output', '', 'Englische Bezeichnung f&uuml;r "Ausgabe". ', 'Glosar'),
(478, '', 'Paket-Filter', '', 'Ein Paket-Filter entscheidet anhand der im Header von IP-Paketen enthaltenen Adressen, was mit dem Paket zu geschehen hat (verwerfen, weiterleiten, zur&uuml;ckweisen etc.). Ein Paket-Filter bietet einen Basisschutz gegen Hacker-Angriffe und verhindert, da&szlig; bestimmte Websites aufgerufen werden.\r\n\r\n', 'Glosar'),
(479, '', 'Parallele Schnittstelle', '', 'Schnittstelle am Computer, die im Gegensatz zur seriellen Schnittstelle die Daten&uuml;bertragung auf acht Leitungen (also mit einer &uuml;bertragung von 8 Bits gleichzeitig) unterst&uuml;tzt. Parallele Schnittstellen werden auch als "Centronics Schnittstelle" bezeichnet. An die parallele Schnittstelle wird in der Regel der Drucker angeschlossen ', 'Glosar'),
(480, '', 'Parser', '', 'Parser sind Software-Module, die Dokumente oder Quelltexte nach vorgegebenen Kriterien syntaktisch analysieren und f&uuml;r die Weiterverarbeitung aufbereiten.\r\n\r\n', 'Glosar'),
(481, '', 'Partition', '', 'Einheit eines definierten Speicherbereichs einer Festplatte, die als eigenst&auml;ndiges Laufwerk angesprochen und behandelt werden kann . ', 'Glosar'),
(482, '', 'Partitionstabelle', '', 'Spezieller Bereich auf der Festplatte, der die Informationen &uuml;ber die Einteilung in verschiedene Partitionen enth&auml;lt.', 'Glosar'),
(483, '', 'Pascal', '', '1642 erfand Blaise Pascal (1623 - 1662) eine mechanische Rechenmaschine, die addieren und subtrahieren konnte. Das Ger&auml;t war allerdings ein kommerzieller Reinfall. Als kleine Entsch&auml;digung wurde ein paar hundert Jahre sp&auml;ter eine h&ouml;here Programmiersprache nach ihm benannt, die von Nikolaus Wirth entwickelte wurde. ', 'Glosar'),
(484, '', 'Pa?wort', '', 'Andere Bezeichnung f&uuml;r Kennwort oder Identifikation.', 'Glosar'),
(485, '', 'Patch', '', 'Ein Patch (englische Bezeichnung f&uuml;r "Flicken", manchmal auch "Bug fix" genannt) ist ein kleines Programm, das z.B. Bugs (Fehler) von in der Regel gro&szlig;en Anwendungsprogrammen repariert. Die meisten Patches werden von den Software- Herstellern auf ihren Web-Sites kostenlos zum Download angeboten. Da Patch-Programme nur in einen kleinen Teil des fehlerhaften Programmcodes eingreifen und kein komplettes Update sind, sind sie in der Regel nicht sehr umfangreich und somit auch in sehr kurzer Zeit downzuloaden. Oftmals werden Patches aber auch in die n&auml;chsten Versionen eines Programmes eingebaut, damit fehlerhafte Programme, die nicht gepatcht wurden auch repariert werden.', 'Glosar'),
(486, '', 'PATH', '', 'Englische Bezeichnung f&uuml;r Pfadangabe oder Verzeichnispfad.', 'Glosar'),
(487, '', 'PCMCIA / PCMCIA-Karte (PC-Card)', '', 'Abk&uuml;rzung f&uuml;r "Personal Computer Memory Card International Association" &#8226; internationale Vereinigung zum Festlegen von Normen f&uuml;r Speicherkarten. Daraus resultierten die Standards (TYP I, TYP II und TYP III) f&uuml;r Erweiterungskarten im Scheckkartenformat. Diese Speicherkarten unterst&uuml;tzen Plug and Play und arbeiten stromsparend. Zwischenzeitlich setzt sich statt "PCMCIA-Karte" der Begriff "PC-Karte" durch.\r\n\r\n', 'Glosar'),
(488, '', 'Peer-to-Peer Netzwerk', '', 'Netzwerkvariante, bei der im Gegensatz zu einem Server-Netzwerk keine starre Einteilung in Server und Arbeitsstationen erfolgt. Jeder PC im Netzwerk kann Dienste und Daten bereitstellen oder verwenden. ', 'Glosar'),
(489, '', 'Performance', '', 'Englische Bezeichnung f&uuml;r Leistung.', 'Glosar'),
(490, '', 'Peripherie', '', 'Englische Bezeichnung f&uuml;r Umgebung. Komponenten des Computers wie Bildschirm, Tastatur, Datentr&auml;ger, Drucker u.a. -gemeint sind also an einen Computer angeschlossenen Ger&auml;te', 'Glosar'),
(491, '', 'PHP / PHP3', '', 'Abk&uuml;rzung f&uuml;r "Professionell Homepages". PHP ist eine kostenlose serverseitige Scriptsprache.', 'Glosar'),
(492, '', 'PIN', '', 'Abk&uuml;rzung f&uuml;r "Personal Identification Number" &#8226; andere Bezeichnung f&uuml;r Identifikationsnummer, pers&ouml;nlicher Code.\r\nEine PIN ist beispielsweise eine Geheimnummer, mit der ein Handy-Besitzer die Mobilfunkkarte in seinem Ger&auml;t aktiviert. Erst danach sind Gespr&auml;che mit dem Handy m&ouml;glich. ', 'Glosar'),
(493, '', 'Ping', '', 'Abk&uuml;rzung f&uuml;r "Packet Internet Groper" (to grope = tasten, herumtappen), kleines (TCP/IP-)Programm, um die Erreichbarkeit von Computern im Internet oder anderen Netzwerken zu testen. Es schickt dazu ein Signal an den Zielrechner und zeigt an, wie lange es dauert, bis das erhoffte "Echo" zur&uuml;ckkommt - &auml;hnlich wie beim Sonar eines U-Bootes. Das hat dem Programm letztlich auch seinen Namen gegeben.\r\n\r\n', 'Glosar'),
(494, '', 'Plotter', '', 'Peripherieger&auml;t zum Zeichnen, drucker&auml;hnliches Ger&auml;t, das urspr&uuml;nglich mit einem Stift Punkte oder Linien auf das Papier &uuml;bertr&auml;gt. Inzwischen hat sich auch bei Plottern die Tintenstrahltechnologie durchgesetzt. \r\n\r\n', 'Glosar'),
(495, '', 'Plug and Play', '', '... hei&szlig;t soviel wie "einsetzen und los geht', 'Glosar'),
(496, '', 'PPP', '', 'Abk&uuml;rzung f&uuml;r "Point to Point Protocol", was w&ouml;rtlich "Protokoll f&uuml;r die &uuml;bertragung von Punkt zu Punkt" bedeutet und 1991 von der IETF (Internet Engineering Task Force) definiert wurde.\r\n&uuml;bertragungsprotokoll, das wie SLIP die Daten&uuml;bertragung per serieller Leitung regelt und sich als Standard durchgesetzt hat. PPP erlaubt, Daten mehrerer Netzwerkprotokolle wie IP, Novells IPX und IBMs / Microsofts NetBEUI gleichzeitig zu &uuml;bermitteln. Dazu kommen Erweiterungen zur Authentifizierung des Kommunikationspartners und zur &uuml;berwachung der Qualit&auml;t des &uuml;bertragungskanals. PPP d&uuml;rfte SLIP mehr und mehr verdr&auml;ngen.\r\n\r\n', 'Glosar'),
(497, '', 'Programm', '', 'Zielorientierte Ansammlung von Befehlen, die in einer bestimmten Programmiersprache geschrieben wurden. Ein Programm dient der Ausf&uuml;hrung von Befehlen, aufeinanderfolgenden Arbeitsschritte, speziellen Diensten oder der Erstellung von Dokumenten.\r\n\r\n', 'Glosar'),
(498, '', 'Programmiersprachen', '', 'Einer Fremdsprache &auml;hnelndes System, das aus Zeichen und Regeln besteht, der Kommunikation mit dem Computer dient und die Erstellung von Programmen erm&ouml;glicht.', 'Glosar'),
(499, '', 'Prompt', '', 'Bereitschaftszeichen, mit dem MS-DOS signalisiert, da&szlig; eine Eingabe erfolgen kann. Normalerweise besteht das Prompt-Zeichen aus der Laufwerksangabe und dem "Gr&ouml;&szlig;er-als"-Zeichen: ">". ', 'Glosar'),
(500, '', 'Protokoll', '', '... bezeichnet die Sammlung von Regeln f&uuml;r Formate und Arten der Daten&uuml;bermittlung zwischen unterschiedlichen Rechnersystemen. ', 'Glosar'),
(501, '', 'Provider', '', 'eine Firma, die den Zugang zum Internet &uuml;ber einen eigenen Internet-Server zur Verf&uuml;gung stellt.\r\n', 'Glosar'),
(502, '', 'Quad', '', 'Eine Internet-Adresse (IP) besteht aus vier Quads, die mit einem Punkt voneinander getrennt sind (etwa 194.211.111.123).\r\n\r\n', 'Glosar'),
(503, '', 'Quell-Code', '', 'Origin&auml;rer ASCII-Text, der ein Programm in einer h&ouml;heren Programmiersprache darstellt.', 'Glosar'),
(504, '', 'Query', '', 'Englische Bezeichnung f&uuml;r "Frage". Abfrage in einer Datenbank\r\n\r\n', 'Glosar'),
(505, '', 'Quick Format', '', '... eine M&ouml;glichkeit, Disketten oder Festplatten in wenigen Sekunden zu formatieren. Dabei wird die Diskette allerdings nicht auf Sch&auml;den &uuml;berpr&uuml;ft, und der alte Inhalt wird nicht gel&ouml;scht (entspricht auch einer Schnellformatierung).', 'Glosar'),
(506, '', 'Quicktime', '', 'Systemerweiterung f&uuml;r das Windows-, Windows NT-, Macintosh- und Silicon Graphics-Betriebssystem zum Aufnehmen, Bearbeiten und Wiedergeben von Videos auf dem PC.', 'Glosar'),
(507, '', 'Quote', '', 'Ein Zitat - meistens als ein Bezug auf einen bestimmten Textteil einer Original-E-Mail oder eines Beitrags in einem Diskussionsforum (Newsgroup), auf den man antwortet. Ein solches Zitat erkennt man sehr oft an einem ">" am Anfang der Zeile. Manche E-Mail-Programme verf&uuml;gen &uuml;ber eine Quote-Funktion, die dieses Zeichen automatisch in eine Antwortmail einbindet.\r\n\r\n', 'Glosar'),
(508, '', 'RAID-System', '', 'Abk&uuml;rzung f&uuml;r "Redundant Array of Independent Disks" oder "Redundant Array of Inexpensive Disks". Bei RAID-Systemen steht die Sicherheit von Festplatten-Daten im Vordergrund. Ein RAID-System ist in der Lage, Daten redundant zu speichern, also auf mindestens einer weiteren Festplatte nochmals abzulegen. ', 'Glosar'),
(509, '', 'Raubkopie', '', 'Gesetzlich nicht genehmigte Kopie eines Programms oder einer Datei. Die Erstellung von Raubkopien wird strafrechtlich verfolgt. \r\n\r\n', 'Glosar');
INSERT INTO `sioux7_lexika` (`lex_id`, `bild`, `befehl`, `aufbau`, `text`, `bereich`) VALUES
(510, '', 'Read Only', '', 'Englische Bezeichnung f&uuml;r "Nur Lesen". ', 'Glosar'),
(511, '', 'Readme-Datei', '', 'W&ouml;rtlich &uuml;bersetzt Lies-mich-Datei. Spezielle Textdateien mit wichtigen, letzten Informationen. Um leichte Lesbarkeit zu gew&auml;hrleisten, sind sie entweder als ASCII-Datei erstellt worden (README.TXT) oder aber als WINDOWS-Write-Dokument (README.WRI).\r\n\r\n', 'Glosar'),
(512, '', 'Real Time', '', 'Englische Bezeichnung f&uuml;r Echtzeit. \r\n\r\n', 'Glosar'),
(513, '', 'Record', '', 'Englische Bezeichnung f&uuml;r Datensatz. ', 'Glosar'),
(514, '', 'Redundanz', '', 'Mehrfach vorhandene Informationen l&ouml;schen oder vermeiden.\r\n', 'Glosar'),
(515, '', 'Register', '', 'Speicherbereich eines Prozessors. Es gibt Register f&uuml;r Daten, Adressen, Befehle u.a.', 'Glosar'),
(516, '', 'Relais', '', 'Englische Bezeichnung f&uuml;r elektromechanische Schalter.', 'Glosar'),
(517, '', 'Remote Access', '', 'Englische Bezeichnung f&uuml;r entfernter Zugriff. Fernsteuerung eines Rechners (z.B. auch Servers) &uuml;ber das Netzwerk oder per DF&uuml;.', 'Glosar'),
(518, '', 'Repeater', '', 'Ger&auml;t, das den Signalverlust in l&auml;ngeren Datenleitungen wie ein Verst&auml;rker ausgleicht. ', 'Glosar'),
(519, '', 'Reset', '', 'Englische Bezeichnung f&uuml;r Zur&uuml;ckstellen, im EDV-Bereich ist damit der Neustart eines Computers gemeint.\r\n\r\n', 'Glosar'),
(520, '', 'RGB', '', 'Abk&uuml;rzung f&uuml;r "Rot, Gr&uuml;n, Blau", die Grundfarben.', 'Glosar'),
(521, '', 'RJ-11', '', 'International genormter Anschluss-Typ f&uuml;r analoge Telefone - auch "Westernstecker" genannt. Der Westernstecker dient zum Anschlu&szlig; von Telekommunikationsger&auml;ten. Diese Steckernorm kommt aus den USA. Da die Steckverbinder relativ preiswert sind, wird diese Steckernorm inzwischen auch bei deutschen Telekommunikationsger&auml;ten gerne verwendet. \r\n', 'Glosar'),
(522, '', 'RJ-45', '', 'International genormter AnschlussTyp f&uuml;r ISDN- und LAN-Kabel. \r\n\r\n', 'Glosar'),
(523, '', 'ROM', '', 'Abk&uuml;rzung f&uuml;r "Read Only Memory", englische Bezeichnung f&uuml;r Nur-Lese-Speicher. \r\n\r\n', 'Glosar'),
(524, '', 'Root Directory', '', 'Englische Bezeichnung f&uuml;r Hauptverzeichnis. \r\n\r\n', 'Glosar'),
(525, '', 'Router', '', 'Ein Router hat die Funktion, zwei r&auml;umlich getrennte Netzwerke &uuml;ber eine Telekommunikations- Leitung miteinander zu verbinden. ', 'Glosar'),
(526, '', 'RTF', '', 'Abk&uuml;rzung f&uuml;r "Rich Text Format", auf Deutsch "erweitertes Textformat".', 'Glosar'),
(527, '', 'Run', '', 'Kommando zum Aktivieren eines Programmstarts.', 'Glosar'),
(528, '', 'Samples', '', 'Ein Sample ist das digitale Abbild eines akustischen Ereignisses. ', 'Glosar'),
(529, '', 'SATAN', '', 'Security Administrator Tool for Analyzing Networks (Werkzeug f&uuml;r Systemverwalter zur Analyse von Netzwerken): Programm, das Sicherheitsl&uuml;cken in Netzen feststellt, mitteilt und L&ouml;sungen vorschl&auml;gt. \r\n\r\n', 'Glosar'),
(530, '', 'Scanner', '', 'Ger&auml;t zur Digitalisierung / zum Einlesen von gedruckten Vorlagen (Texte, Bilder etc.), die dann mit einem Bildbearbeitungsprogramm im Computer weiterbearbeitet werden k&ouml;nnen. In Verbindung mit OCR-Software k&ouml;nnen gescannte Texte auch wieder in editierbare Textdokumente umgewandelt werden.\r\n', 'Glosar'),
(531, '', 'Schnittstellen', '', 'Verbindung zwischen Computern oder zwischen Computern und Peripherieger&auml;ten &#8226; Es wird zwischen parallelen und seriellen Schnittstellen unterschieden. ', 'Glosar'),
(532, '', 'Screen', '', 'Englische Bezeichnung f&uuml;r Bildschirm oder Monitor. \r\n\r\n', 'Glosar'),
(533, '', 'SCSI', '', 'Abk&uuml;rzung f&uuml;r "Small Computer System Interface".', 'Glosar'),
(534, '', 'Sendmail', '', 'Message Transfer Agent (MTA), der auf &uuml;ber 80 Prozent der Mail-Server im Internet genutzt wird.', 'Glosar'),
(535, '', 'Serielle Schnittstelle', '', 'Schnittstelle, die die Daten bitweise &uuml;bertr&auml;gt. F&uuml;r den PC gibt es als serielle Schnittstelle den RS-232-Standard. \r\n\r\n', 'Glosar'),
(536, '', 'Server', '', 'von "to serve" (dienen, jemanden versorgen) abgeleitet: zentraler Rechner in einem Netzwerk, der den Arbeitsstationen / Clients Daten, Speicher und Ressourcen zur Verf&uuml;gung stellt. Auf dem Server ist das Netzwerk-Betriebssystem installiert, und vom Server wird das Netzwerk verwaltet. Im WWW sind Server Knotenpunkte des Netzes. ', 'Glosar'),
(537, '', 'Servlet', '', 'In Anlehnung an die Namensgebung f&uuml;r Java-Applets, die im Browser des Clients zur Ausf&uuml;hrung kommen, handelt es sich bei Servlets um Applets auf der Web-Server-Seite.', 'Glosar'),
(538, '', 'Session', '', 'Englische Bezeichnung f&uuml;r Arbeitssitzung.', 'Glosar'),
(539, '', 'Sniffer', '', 'W&ouml;rtlich &uuml;bersetzt: Schn&uuml;ffler. Person oder Programm, das den Datenverkehr abh&ouml;rt. ', 'Glosar'),
(540, '', 'Software', '', 'Sammelbegriff f&uuml;r alle Arten von Computerprogramme - also f&uuml;r Betriebssysteme, Utilities und Anwendungsprogramme.\r\n\r\n', 'Glosar'),
(541, '', 'Spider', '', 'Suchprogramm, das das Internet automatisch nach neuen Adressen absucht. \r\n\r\n', 'Glosar'),
(542, '', 'Spoofing', '', 'T&auml;uscht einer lokalen Station vor, da&szlig; eine Gegenstation existiert (physikalisch angebunden), indem die Verbindung nur logisch gehalten wird. Physikalisch ist die Verbindung aber abgebaut, was die Verbindungsgeb&uuml;hren reduziert.\r\n', 'Glosar'),
(543, '', 'SSL', '', 'Abk&uuml;rzung f&uuml;r "Secure Socket Layer". Technik, mittels der ein Web-Client den Server authentifizieren kann und der Datenverkehr zwischen beiden verschl&uuml;sselt wird. Entwickelt von Netscape und RSA Data Security. ', 'Glosar'),
(544, '', 'Standleitung', '', 'Eine st&auml;ndige Verbindung per Telefon zwischen zwei Orten, die zum Beispiel f&uuml;r einen dezidierten Internet-Anschlu&szlig; verwendet wird. \r\n\r\n', 'Glosar'),
(545, '', 'Streamer', '', 'Andere Bezeichnung f&uuml;r Magnetband-Laufwerk.', 'Glosar'),
(546, '', 'Strichcode', '', 'Auch Bar Code. Informationen, die &uuml;ber eine bestimmte Folge und Breite von Strichen codiert ist. Wird besonders bei Verpackungen verwendet und beinhaltet spezielle Informationen &uuml;ber das Produkt. Der Strichcode wird mit einem Scanner eingelesen. \r\n\r\n', 'Glosar'),
(547, '', 'Supervisor', '', 'Englische Bezeichnung f&uuml;r den Systemverwalter eines Netzwerks. ', 'Glosar'),
(548, '', 'Switch', '', 'Englische Bezeichnung f&uuml;r Schalter. In der Netzwerktechnik versteht man unter einem Switch einen aktiven Hub, der wie eine Telefonvermittlungsstelle den Netzwerkverkehr zwischen Clients und Server(n) regelt, in dem er selbstt&auml;tig die Zieladressen der IP-Pakete auswertet und diese dann den entsprechenden Adressaten zustellt.\r\n\r\n', 'Glosar'),
(549, '', 'Syntax', '', 'Schreib- oder Befehlsvorschrift in Programmiersprachen und Programmen. ', 'Glosar'),
(550, '', 'Systemdatei', '', 'Besonders wichtige Dateien bei Betriebssystemen, in denen wichtige Informationen und Einstellungen enthalten sind. Im Falle von DOS sind das beispielsweise die Dateien CONFIG.SYS, AUTOEXEC.BAT, COMMAND.COM, IO.SYS und MSDOS.SYS.\r\n\r\n', 'Glosar'),
(551, '', 'Tablett', '', 'Eingabeger&auml;t zum Digitalisieren von Zeichnungen, die Ergebnisse k&ouml;nnen mit entsprechenden Programmen wie beispielsweise CAD bearbeitet werden.', 'Glosar'),
(552, '', 'Tapi', '', 'Abk&uuml;rzung f&uuml;r "Telephone Application Programming Interface" oder "Telephony Application Programmers Interface".', 'Glosar'),
(553, '', 'Telearbeit', '', 'Zu Hause arbeiten, per DF&uuml; oder INTERNET/INTRANET mit der Firma verbunden.', 'Glosar'),
(554, '', 'Telnet', '', '&uuml;ber das Telnet k&ouml;nnen Internet-User direkten Zugriff auf andere Computer im Netzwerk erhalten. Der Begriff Telnet steht au&szlig;erdem f&uuml;r die standardisierte Terminal-Emulation und das dazugeh&ouml;rige &uuml;bertragungsprotokoll.\r\n\r\n', 'Glosar'),
(555, '', 'TFT', '', 'Abk&uuml;rzung f&uuml;r "Thin Film Transistor". Technik bei Flachbildschirmen; liefert gegen&uuml;ber DSTN-Displays einen h&ouml;heren Kontrast und ein besseres Bild. ', 'Glosar'),
(556, '', 'Timeout', '', 'Zeitspanne, die ein Computer oder Programm auf eine Eingabe wartet, bevor eine Abschaltung der entsprechenden Funktion oder Peripherie erfolgt. Ein "Timeout-Fehler" tritt vor allem dann auf, wenn der Versuch, sich mit einem bestimmten Internet-Rechner zu verbinden, f&uuml;r die Dauer der definierten Zeitspanne ohne eine Antwort blieb. \r\n\r\n', 'Glosar'),
(557, '', 'Tintenstrahldrucker', '', 'Drucker, der das Papier durch eine Spr&uuml;htechnik mit mikrofeinen Fl&uuml;ssigtonerpartikeln einf&auml;rbt. Tintenstrahldrucker produzieren eine gute Druckqualit&auml;t und sind auch als Farb-Drucker und gro&szlig;formatige Plotter erh&auml;ltlich.\r\n\r\n', 'Glosar'),
(558, '', 'Tool', '', 'Englische Bezeichnung f&uuml;r Dienstprogramm. ', 'Glosar'),
(559, '', 'Top-Level-Domain', '', 'Die oberste Hierarchie-Stufe bei den Domains.', 'Glosar'),
(560, '', 'Topologie', '', 'Die Lehre von der Lage und Anordnung geometrischer Gebilde im Raum. Unter der Netzwerk-Topologie wird die Art der Verbindung zwischen den Computern verstanden. ', 'Glosar'),
(561, '', 'Traffic', '', 'Menge an Daten (meistens in Megabyte oder Gigabyte angegeben), die von und zu einer Internet-Ressource, wie einem (Web-)Server oder dem heimischen Internet-Rechner, flie&szlig;en. ', 'Glosar'),
(562, '', 'Transfer', '', 'Englische Bezeichnung f&uuml;r Daten&uuml;bertragung. ', 'Glosar'),
(563, '', 'Treiber', '', 'Programm, das Peripherieger&auml;te in das Betriebssystem einbindet, damit diese ordnungsgem&auml;&szlig; arbeiten k&ouml;nnen.', 'Glosar'),
(564, '', 'Ultra-DMA-Modus', '', 'Das Nachfolgeprotokoll des PIO-Modes ist Ultra-DMA (Direct Memory Access).', 'Glosar'),
(565, '', 'Umgebungsspeicher', '', 'Spezieller Speicherbereich in MS-DOS f&uuml;r Umgebungsvariablen (auch environment). ', 'Glosar'),
(566, '', 'UNIX', '', 'Betriebssystem, das auf verschiedenen Computern eingesetzt werden kann (auch PCs). Speziell f&uuml;r Netzwerke.', 'Glosar'),
(567, '', 'Update', '', 'Englische Bezeichnung f&uuml;r Aktualisierung, neuere Version eines Programmes / einer Software.\r\n\r\n', 'Glosar'),
(568, '', 'Upgrade', '', 'Ausbau eines Computersystems. Zun&auml;chst wurde der Begriff "Upgrade" nur f&uuml;r den Hardware-seitigen Ausbau verwendet; inzwischen ist er (fast) gleichbedeutend mit Update. Manche Softwarehersteller unterscheiden zwischen einem kostenfreien Update und einem kostenpflichtigen Upgrade.\r\n\r\n', 'Glosar'),
(569, '', 'Upload', '', 'Englische Bezeichnung f&uuml;r Hinaufladen. Damit ist das Senden von Daten zu einem Host oder einer Mailbox gemeint.\r\n', 'Glosar'),
(570, '', 'UPS', '', 'Abk&uuml;rzung f&uuml;r "Uninterruptable Power Supply". Englische Bezeichnung f&uuml;r die Unterbrechungsfreie Stromversorgung.\r\n\r\n', 'Glosar'),
(571, '', 'User', '', 'Englische Bezeichnung f&uuml;r Nutzer / Anwender. Anwender eines PCs und seiner Programme bzw. Benutzer einer Datenbank oder eines Online-Dienstes.', 'Glosar'),
(572, '', 'V.90', '', 'Ein Hochgeschwindigkeits-Standard (56.000 bit/s) in der Modemtechnologie, bei dem die Daten lediglich zwischen Modem und der Vermittlungsstelle der Telekom noch analog &uuml;bertragen werden. Zwischen den einzelnen Vermittlungsstellen verl&auml;uft die Daten&uuml;bertragung digital. Die Geschwindigkeit von 56.000 bit/s ist allerdings nur in Download Richtung bei geeigneter Gegenstelle m&ouml;glich. ', 'Glosar'),
(573, '', 'Variable', '', 'Platzhalter f&uuml;r einen ver&auml;nderlichen Wert.', 'Glosar'),
(574, '', 'VB (Visual Basic)', '', '... ist eine objektbasierte Programmiersprache.', 'Glosar'),
(575, '', 'VBScript', '', 'Untermenge des Visual-Basic Programmiersystems von Microsoft. VBScript-Programme, die in HTML-Seiten eingebettet sind, k&ouml;nnen vom Microsoft Internet Explorer ab der Version 3.0 und auch von anderen Browsern gelesen werden. VBScript-Programme k&ouml;nnen entweder auf dem Computer, auf dem der Browser installiert ist, oder auf dem World-Wide-Web-Server ausgef&uuml;hrt werden.\r\n\r\n', 'Glosar'),
(576, '', 'VPN', '', 'Abk&uuml;rzung f&uuml;r "Virtual Privat Network".', 'Glosar'),
(577, '', 'WAN', '', 'Abk&uuml;rzung f&uuml;r "Wide Area Network". Netzwerk, das weltumspannend angelegt sein kann (zumindest aber die eigenen vier W&auml;nde verl&auml;&szlig;t), im Gegensatz zum LAN-Netzwerk. \r\n\r\n', 'Glosar'),
(578, '', 'WAP', '', 'Abk&uuml;rzung f&uuml;r "Wireless Application Protocol". Spezielles Protokoll zur &uuml;bertragung der Daten an Handys.', 'Glosar'),
(579, '', 'Warmstart', '', 'Neustart des Computers, bei dem dieser nicht vorher komplett ausgeschaltet wurde, sondern nur das Betriebssystem erneut geladen wird. Ein Warmstart kann unter DOS durch die Tastenkombination Strg + Alt + Del oder ansonsten durch einen Reset-Schalter aktiviert werden.', 'Glosar'),
(580, '', 'WebCam', '', 'Video-Kamera, die Ihre Aufnahme ins Internet &uuml;bertr&auml;gt.', 'Glosar'),
(581, '', 'Webserver', '', 'Server, der HTML-Dokumente und andere Internet / Intranet-Ressourcen speichert und &uuml;ber HTTP versendet bzw. entgegennimmt (auch HTTP-Server genannt). ', 'Glosar'),
(582, '', 'Webspace', '', 'Zusammenfassung von Internet-Diensten und Serviceleistungen, die ben&ouml;tigt werden, um eine eigene Internet-Pr&auml;senz aufbauen zu k&ouml;nnen.', 'Glosar'),
(583, '', 'WOW', '', 'Abk&uuml;rzung f&uuml;r "Web, Objekts, Windows". Manchmal auch als "World of waste" bezeichnet.', 'Glosar'),
(584, '', 'XBase', '', 'Bezeichnung f&uuml;r Datenbankprogramme, die kompatibel zu dBase sind und auch dessen Programmiersprache benutzen.', 'Glosar'),
(585, '', 'XP', '', 'Abk&uuml;rzung f&uuml;r "EXperience", was soviel hei&szlig;t wie "Erfahrung" oder "Erleben".', 'Glosar'),
(586, '', 'XT', '', 'Abk&uuml;rzung f&uuml;r "eXtended Technology". Bezeichnung f&uuml;r PCs mit 8088- und 8086-Prozessoren, die erstmalig mit einer Festplatte ausgestattet wurden.', 'Glosar'),
(587, '', 'Yellow Book', '', '1985 festgelegter Standard f&uuml;r CD-ROMs, in dem alle Parameter f&uuml;r CD-ROMs beschrieben sind. Dieser Standard garantieren, da&szlig; CD-ROMs auf allen Laufwerken verwendet werden k&ouml;nnen.', 'Glosar'),
(588, '', 'Yahoo', '', 'Ma&szlig;st&auml;be setzender und erfolgreichster Web-Katalog - und auch einer der ersten (www.yahoo.de). Trotz vieler Klagen &uuml;ber nicht aufgenommene Websites (seitens der Webmaster) bietet Yahoo immer noch eine &uuml;berdurchschnittliche Qualit&auml;t und einen sehr vielf&auml;ltigen Webkatalog. ', 'Glosar'),
(589, '', 'Zeichencode', '', 'Zuordnung von Zahlen zu Zeichen. In der EDV ist der ASCII-Code weit verbreitet.', 'Glosar'),
(590, '', 'Zeitlimit', '', 'Beim Einloggen in einer Mailbox erh&auml;lt jeder Benutzer ein Zeitlimit, welches die maximale Aufenthaltszeit in der Mailbox festlegt. Das Zeitlimit kann vom Level / der Bedeutung des Benutzers (Gast, Kunde, Vertriebspartner, Mitarbeiter) abh&auml;ngig sein.', 'Glosar'),
(591, '', 'Zugriffsrecht', '', 'Die gezielte Vergabe von Rechten f&uuml;r Benutzer, damit diese die freigegebenen Daten und Ressourcen im Netzwerk benutzen k&ouml;nnen. Die Verwaltung der Zugriffsrechte wird von der Netzwerk-Software vorgenommen.', 'Glosar'),
(592, '', 'Zwischenablage', '', 'Besonderer Bereich des Arbeitsspeichers, der von Programmen und Betriebssystemen wie Windows zur zwischenzeitlichen Ablage von Daten benutzt wird, die dann in andere Dokumente kopiert oder verschoben werden sollen (auch Clipboard genannt).\r\n', 'Glosar'),
(593, '', 'Zylinder', '', 'Genau &uuml;bereinanderliegende Spuren der verschiedenen Teilplatten einer Festplatte. ', 'Glosar'),
(0, NULL, 'neu', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_links`
--

DROP TABLE IF EXISTS `sioux7_links`;
CREATE TABLE `sioux7_links` (
  `links_id` int(5) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `bereich` enum('Online','Grafiken','Sounds','Software','Sonstiges') DEFAULT NULL,
  `descr` text,
  `link` varchar(250) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_links`
--

INSERT INTO `sioux7_links` (`links_id`, `dom_id`, `lang`, `bereich`, `descr`, `link`, `name`) VALUES
(0, NULL, NULL, '', NULL, NULL, NULL),
(1, NULL, NULL, 'Software', 'Ein gutes Archiv f&uuml;r Entwickler. FreeScripts und Entwicklungen. Ebenfalls Projektangebote dabei!', 'http://sourceforge.net/', 'SourceForge.net'),
(7, NULL, NULL, 'Online', 'Eines der schnellst wachsenden Job-Portale Deutschlands Aktuell bietet die Seite die wohl vielfältigste Liste für Jobs in Deutschland, Tipps für Arbeitssuchende auf unserem Blog, generelle Empfehlungen zur Jobsuche und interessante Inhalte aus dem Web zum Thema Jobs.', 'http://www.adzuna.de/', 'Adzuna.de'),
(5, NULL, NULL, 'Grafiken', 'Lizenzfreie Bilder, Vektoren und Videos ab 0,75 €\r\nAlle Bilder bei Fotolia sind lizenzfrei und können zeitlich uneingeschränkt und unabhängig von geplanten Auflagen für alle Medien verwendet werden.', 'http://de.fotolia.com/', 'fotolia'),
(6, NULL, NULL, 'Sounds', 'Kostenlose Musik für jedermann. Hören Sie Musik, kostenlos und legal.', 'http://www.jamendo.com/de', 'Jamendo');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_link_cache`
--

DROP TABLE IF EXISTS `sioux7_link_cache`;
CREATE TABLE `sioux7_link_cache` (
  `link_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `url` text,
  `params` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_link_cache`
--

INSERT INTO `sioux7_link_cache` (`link_id`, `dom_id`, `url`, `params`) VALUES
(1, 2, 'impressum.html', 'kat_id => 2'),
(2, 2, 'kontakt.html', 'kat_id => 3'),
(3, 2, 'sitemap.html', 'kat_id => 4'),
(4, 2, 'empfehlung.html', 'kat_id => 5'),
(5, 2, 'home.html', 'kat_id => 14'),
(6, 2, 'home/hilfe.html', 'kat_id => 29'),
(7, 2, 'home/test.html', 'kat_id => 30'),
(8, 2, 'software.html', 'kat_id => 16'),
(9, 2, 'software/report.html', 'kat_id => 17'),
(10, 2, 'software/planung.html', 'kat_id => 18'),
(11, 2, 'software/dokumentation.html', 'kat_id => 22'),
(12, 2, 'software/dokumentation/module.html', 'kat_id => 23'),
(13, 2, 'service.html', 'kat_id => 20'),
(14, 2, 'service/links.html', 'kat_id => 21'),
(15, 2, 'service/ratgerber.html', 'kat_id => 27'),
(16, 2, 'service/codeschnippsel.html', 'kat_id => 25'),
(17, 2, 'entwickler.html', 'kat_id => 26'),
(18, 2, 'entwickler/github.html', 'kat_id => 28'),
(19, 2, 'Presse/dealfuchs.html', 'kat_id => 6,p_id => 3'),
(20, 2, 'Presse/wir-sind-da.html', 'kat_id => 6,p_id => 1'),
(30, 2, 'home/tass-oh-tues-doe-me-so-mer-home.html', 'kat_id => 33'),
(31, 2, 'Presse/.html', 'kat_id => 29,p_id => 3'),
(32, 2, 'presse.html', 'kat_id => 6'),
(33, 2, 'home/404.html', 'kat_id => 34'),
(34, 2, 'service/study.html', 'kat_id => 35'),
(36, 2, 'study/einfuehrung.html', 'kat_id => 35,p_id => '),
(37, 2, 'study/suchmaschinen.html', 'kat_id => 35,p_id => '),
(38, 0, 'entwicklungen.html', 'kat_id => 15'),
(39, 0, 'study/links.html', 'kat_id => 35,p_id => '),
(40, 0, 'study/einuehrung.html', 'kat_id => 35,p_id => '),
(41, 0, 'study/hacker.html', 'kat_id => 35,p_id => '),
(42, 0, 'study/cracker.html', 'kat_id => 35,p_id => '),
(43, 0, 'study/sites.html', 'kat_id => 35,p_id => '),
(44, 0, 'study/darstellungen.html', 'kat_id => 35,p_id => '),
(45, 0, 'study/dienste.html', 'kat_id => 35,p_id => '),
(46, 0, 'study/emailservice.html', 'kat_id => 35,p_id => '),
(47, 0, 'study/domains.html', 'kat_id => 35,p_id => '),
(48, 0, 'study/inhalt.html', 'kat_id => 35,p_id => '),
(49, 0, 'study/sicherheit.html', 'kat_id => 35,p_id => '),
(50, 0, 'study/viren-trojaner-und-co.html', 'kat_id => 35,p_id => '),
(51, 0, 'study/speed.html', 'kat_id => 35,p_id => '),
(52, 0, 'study/einfunduuml;hrung.html', 'kat_id => 35,p_id => '),
(53, 0, 'service/ratgeber.html', 'kat_id => 27'),
(54, 0, 'home/about.html', 'kat_id => 36'),
(55, 0, 'software/dokumentation/widgets.html', 'kat_id => 37'),
(56, 0, 'software/dokumentation/struktur.html', 'kat_id => 38'),
(57, 0, 'entwickler/solutions.html', 'kat_id => 39'),
(58, 0, 'software/dokumentation/plugins.html', 'kat_id => 40'),
(59, 0, 'home/presse.html', 'kat_id => 6'),
(60, 0, 'study/server.html', 'kat_id => 35,p_id => '),
(61, 0, 'study/daten.html', 'kat_id => 35,p_id => '),
(62, 0, 'study/datenbankmodelle.html', 'kat_id => 35,p_id => '),
(63, 0, 'study/erstellen-einer-datenbank.html', 'kat_id => 35,p_id => '),
(64, 0, 'study/datenmanipulation.html', 'kat_id => 35,p_id => '),
(65, 0, 'study/tabellenmanipulation.html', 'kat_id => 35,p_id => '),
(66, 0, 'study/datensicherung-und-datenschutz.html', 'kat_id => 35,p_id => '),
(67, 0, 'study/arten-von-datenbanksystemen.html', 'kat_id => 35,p_id => '),
(68, 0, 'study/zusammenfassung.html', 'kat_id => 35,p_id => '),
(69, 0, 'study/clients.html', 'kat_id => 35,p_id => '),
(70, 0, 'study/verbindungen.html', 'kat_id => 35,p_id => '),
(71, 0, 'study/ip-adressen.html', 'kat_id => 35,p_id => '),
(72, 0, 'study/protokolle.html', 'kat_id => 35,p_id => '),
(73, 0, 'study/druckserver.html', 'kat_id => 35,p_id => '),
(74, 0, 'study/gateway.html', 'kat_id => 35,p_id => '),
(75, 0, 'study/vertiefung.html', 'kat_id => 35,p_id => '),
(76, 0, 'study/dbs-und-webs.html', 'kat_id => 35,p_id => '),
(77, 0, 'study/standleitung.html', 'kat_id => 35,p_id => '),
(78, 0, 'study/nic-dienste.html', 'kat_id => 35,p_id => '),
(79, 0, 'study/systemadministrator.html', 'kat_id => 35,p_id => '),
(80, 0, 'study/ausbau.html', 'kat_id => 35,p_id => '),
(81, 0, 'study/arten-der-angriffe.html', 'kat_id => 35,p_id => '),
(82, 0, 'study/einwahl.html', 'kat_id => 35,p_id => '),
(83, 0, 'study/phreaking.html', 'kat_id => 35,p_id => '),
(84, 0, 'study/dos---denial-of-service.html', 'kat_id => 35,p_id => '),
(85, 0, 'study/computerviren.html', 'kat_id => 35,p_id => '),
(86, 0, 'study/scanner-/-sniffer.html', 'kat_id => 35,p_id => '),
(87, 0, 'study/passwortcracker.html', 'kat_id => 35,p_id => '),
(88, 0, 'study/trojaner.html', 'kat_id => 35,p_id => '),
(89, 0, 'study/tools-zum-schutz.html', 'kat_id => 35,p_id => '),
(90, 0, 'study/firewall.html', 'kat_id => 35,p_id => '),
(91, 0, 'study/arbeitsplatz-/-software.html', 'kat_id => 35,p_id => '),
(92, 0, 'study/schulungen.html', 'kat_id => 35,p_id => '),
(93, 0, 'software/dokumentation/multimedia.html', 'kat_id => 41'),
(94, 0, 'software/dokumentation/responsive-layout.html', 'kat_id => 42'),
(95, 0, 'service/lexikon.html', 'kat_id => 43'),
(96, 0, 'entwickler/reise.html', 'kat_id => 44'),
(97, 0, 'entwickler/entwicklungen.html', 'kat_id => 45');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_planung`
--

DROP TABLE IF EXISTS `sioux7_planung`;
CREATE TABLE `sioux7_planung` (
  `pl_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `titel` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `descr` text CHARACTER SET latin1,
  `isfertig` int(1) DEFAULT '0',
  `bug` text CHARACTER SET latin1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_planung`
--

INSERT INTO `sioux7_planung` (`pl_id`, `dom_id`, `lang`, `titel`, `descr`, `isfertig`, `bug`) VALUES
(0, NULL, NULL, NULL, NULL, 0, NULL),
(2, NULL, NULL, 'Abstimmung', 'Hier k&ouml;nnen alle abstimmen, ob eine Frage OK ist.', 1, ''),
(3, NULL, NULL, 'Blog', 'Neues rund um unsere Themen', 0, ''),
(4, NULL, NULL, 'CodeSnippets', 'gesammelte Codes', 0, ''),
(5, NULL, NULL, 'Empfehlung', 'Empfehlen Sie unsere Seiten an andere weiter', 1, ''),
(6, NULL, NULL, 'Events', 'Neue Events bei uns', 0, ''),
(7, NULL, NULL, 'Feiertage', 'Wann sind Feiertage?', 0, 'Erst mal nur f&uuml;r Bayern'),
(8, NULL, NULL, 'Forum', 'Ein kleinees aber feines Forum', 0, ''),
(9, NULL, NULL, 'Galery', 'Bilder von Mitgliedern', 0, ''),
(10, NULL, NULL, 'GuestBook', 'Ihr eigenes kleines G&auml;stebuch', 1, ''),
(11, NULL, NULL, 'HandelsRechner', 'Umrechnung von Waren in andere Ware', 0, ''),
(12, NULL, NULL, 'Kontakt', 'Kontaktformular mit Captcha. Hier kann angefragt werden', 1, ''),
(13, NULL, NULL, 'Lexikon', 'Legen Sie Ihr eigenes Lexikon an. Alphabetisch sortiert', 0, ''),
(14, NULL, NULL, 'Links', 'Externe Links zu anderen Anbieter mit Sicherheitsabfrage', 1, ''),
(15, NULL, NULL, 'Members', 'Mitglieder auf Ihren Seiten', 0, ''),
(16, NULL, NULL, 'Passwort', 'Passwortabfrage sicher bekommen', 0, ''),
(17, NULL, NULL, 'Presse', 'Hier k&ouml;nnen Sie &uuml;ber Neues berichten', 1, ''),
(18, NULL, NULL, 'Report', 'Ihre eigenen Notizen', 1, ''),
(19, NULL, NULL, 'Vote', 'Lassen Sie Internetg&auml;ste abstimmen', 0, ''),
(20, 2, 'de', 'Download', 'Wenn Sie eigene Plugins/Programme anbieten möchten', 0, ''),
(21, NULL, NULL, 'Gewerbe', 'Hier k&ouml;nnen sich Firmen bei Ihnen eintragen', 0, ''),
(22, NULL, NULL, 'Kleinanzeigen', 'Ein kleiner aber feiner Marktplatz', 0, ''),
(23, NULL, NULL, 'Quest', 'Wenn Sie eine z.b. ein Quiz anbieten wollen', 0, ''),
(24, NULL, NULL, 'Study', 'Hier k&ouml;nnen Sie gezielt Informationen anbieten. Funktioniert wie ein Buch', 0, ''),
(25, NULL, NULL, 'TopTen', 'Lassen Sie abstimmen, was die besten Anbieter sind mit Benotung', 0, ''),
(26, NULL, NULL, 'Community', 'Memberbereich only! Hier k&ouml;nnen Sie Mitgliern ein eigenes Portal anbieten', 0, ''),
(27, NULL, NULL, 'Immobilien', 'Sind Sie immobilienh&auml;ndler? Hier k&ouml;nnen Sie Ihre Immobilien anbieten', 0, ''),
(28, NULL, NULL, 'Partnerprogramm', 'Banneraustausch pur. ohne harte Bedingungen', 0, ''),
(29, NULL, NULL, 'Shop', 'Kleiner, aber feiner Shop', 0, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_presse`
--

DROP TABLE IF EXISTS `sioux7_presse`;
CREATE TABLE `sioux7_presse` (
  `p_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `titel` varchar(100) DEFAULT NULL,
  `descr` text,
  `bild` varchar(60) DEFAULT NULL,
  `datum` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_presse`
--

INSERT INTO `sioux7_presse` (`p_id`, `dom_id`, `lang`, `titel`, `descr`, `bild`, `datum`) VALUES
(0, NULL, NULL, 'neu', 'neu', NULL, NULL),
(8, 0, 'de', 'Sioux7Management', 'Update auf PHP Version 7 mit MySQLi', '25180_logo.png', NULL),
(7, 0, 'de', 'SIOUX7 Version 7 Final', 'SIOUX7 Version 7 ist fertiggestellt und l&auml;uft nun mit den Neuesten Versionen. Die neue Version ist speziell auf Bootstrap ausgerichtet und hat nun alle wichtigen Plugins. Wir befinden uns in Phase III der Entwicklung. Die Testversionen sind fertig und online erprobt.', '25180_logo.png', '2015-07-26');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_report`
--

DROP TABLE IF EXISTS `sioux7_report`;
CREATE TABLE `sioux7_report` (
  `m_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `titel1` varchar(150) NOT NULL,
  `report` text,
  `datum` date DEFAULT NULL,
  `multi_nav` enum('ext','sioux7_reportinhalt','mi_id') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_report`
--

INSERT INTO `sioux7_report` (`m_id`, `dom_id`, `lang`, `titel1`, `report`, `datum`, `multi_nav`) VALUES
(0, NULL, NULL, '', NULL, NULL, NULL),
(3, NULL, NULL, 'Version 3', 'Updates und Erweiterung', '2012-08-21', NULL),
(5, 0, 'de', 'Fehlerbehebung', 'Fehler und Bugs in SIOUX7', '2013-11-13', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_reportinhalt`
--

DROP TABLE IF EXISTS `sioux7_reportinhalt`;
CREATE TABLE `sioux7_reportinhalt` (
  `mi_id` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `titel` varchar(150) NOT NULL,
  `text` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_reportinhalt`
--

INSERT INTO `sioux7_reportinhalt` (`mi_id`, `level`, `titel`, `text`) VALUES
(0, 0, 'neu', NULL),
(6, 3, 'Neue Struktur', '<p>Sioux7 hat eine komplett neue Struktur</p>'),
(7, 3, 'FrameWork', 'FrameWork eingebunden und verbessert.'),
(8, 5, 'JavaScript', '<p>JS Editor funktioniert nicht immer</p>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_solutions`
--

DROP TABLE IF EXISTS `sioux7_solutions`;
CREATE TABLE `sioux7_solutions` (
  `sol_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `titel` varchar(200) DEFAULT NULL,
  `descr` text,
  `isfertig` int(1) DEFAULT '0',
  `bug` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_solutions`
--

INSERT INTO `sioux7_solutions` (`sol_id`, `dom_id`, `lang`, `titel`, `descr`, `isfertig`, `bug`) VALUES
(0, NULL, NULL, 'neu', NULL, 0, NULL),
(4, NULL, 'de', 'Mail Versand', 'Typisches Server Problem: Wenn die Laufzeit überschritten wird, bricht das Script ab. Lösung: Shell starten. Über ein Link wird ein PHP Prozess ausgelöst und der Shell gestartet. Dies läuft solange keine Fehler entstehen bis zum Ende. Eventuelle Fehler werden abgefangen. Es wird zusätzlich ein Protokoll angelegt. Bei einem Fehler wird der Webadministrator per Mail benachrichtigt.', 1, ''),
(3, NULL, '', 'ErrorCatch', 'Fehler in Scripten passieren immer mal. Ärgerlich nur, das diese dann angezeigt werden. Lösung: Fehler abfangen! Setzen Sie display errors auf no/0. Fangen Sie diese im Script ab und lassen Sie sich diese zukommen. Dem User teilen Sie nur mit, das es ein Problem gibt und der Webadministrator informiert wurde. Wichtig: ErrorCode, ErrorString, ErrorZeile, Script. ', 1, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_statistik`
--

DROP TABLE IF EXISTS `sioux7_statistik`;
CREATE TABLE `sioux7_statistik` (
  `stat_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `seite` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_date` varchar(40) DEFAULT NULL,
  `counter` int(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_study`
--

DROP TABLE IF EXISTS `sioux7_study`;
CREATE TABLE `sioux7_study` (
  `seite_id` int(11) NOT NULL,
  `bereich` enum('SQL','Netzwerk','Sicherheit','PHP','Internet') DEFAULT NULL,
  `bild` varchar(250) DEFAULT NULL,
  `titel` varchar(200) DEFAULT NULL,
  `descr` blob
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_study`
--

INSERT INTO `sioux7_study` (`seite_id`, `bereich`, `bild`, `titel`, `descr`) VALUES
(8, 'SQL', '', 'Datenmanipulation', 0x3c503e4a65747a742065727374206765687420657320646172616e2c20696e206469652065727374656c6c746520546162656c6c6520446174656e2065696e207a7520676562656e2e204d69742064656d2042656665686c3c2f503e0d0a3c503e2667743b2667743b20494e5345525420494e544f204b554e44454e202820274d75737465726d616e6e272c27204d65696e65205374726173736520504850272c20273839303020497267656e64776f272c2754656c3a20303830302f383036373437272c2765696e20426569737069656c27293b3c2f503e0d0a3c503e662675756d6c3b6867656e2077697220696e2064696520546162656c6c65204b756e64656e2065696e656e205361747a2065696e2e2044657220494e4445582077697264206461626569206175746f6d6174697363682067656e6572696572742c20686965723a2053514c3c2f503e0d0a3c503e57656e6e207769722064656e20446174656e73747a20776965646572206265617262656974656e20776f6c6c656e20756e64207a2e20422e2064656e204e616d656e202661756d6c3b6e6465726e20776f6c6c656e2c20736f20627261756368656e207769722064656e2042656665686c3a3c2f503e0d0a3c503e2667743b2667743b20555044415445204b554e44454e2053455420286e616d653d274d75737465726672617527292057484552452069645f6b756e64653d53514c3b3c2f503e0d0a3c503e4265616368746520626974746520646965205748455245204b6c617573656c2e204f686e65206469657365204b6c617573656c20772675756d6c3b72646520646965206b6f6d706c6574746520546162656c6c6520616c6c6520617566266e6273703b20274d757374657266726175272067657365747a742e3c2f503e0d0a3c503e2667743b2667743b2053454c454354205b202a202f205370616c7465205d2046524f4d204b554e44454e2028205748455245202667743b426564696e67756e67266c743b20284f524445522f47524f5550204259202667743b5370616c7465266c743b29203b3c2f503e0d0a3c503e4d69742064696573656d2042656665686c2073656c656b74696572656e2077697220446174656e206175732064657220546162656c6c65204b756e64656e2e20576972206b266f756d6c3b6e6e656e20646965736520446174656e2061756368207665726665696e65726e20756e642067657a69656c7420617573772661756d6c3b686c656e2e204461732045726765626e6973207769726420626569207269636874696765722053796e74617820616e67657a656967742c20642e682e20657320776972642065696e20564945572065727374656c6c742c2077656c6368652064757263682064656e2042656665686c204f52444552206f6465722047524f5550204259206e6163682064656e20426564696e67756e67656e20736f72746965727420776972642e3c2f503e0d0a3c503e2667743b2667743b2044454c455445205b202a202f205370616c7465205d2046524f4d204b554e44454e2028205748455245202667743b426564696e67756e67266c743b20293b3c2f503e0d0a3c503e4d69742064696573656d2042656665686c206c266f756d6c3b736368656e207769722065696e656e20446174656e7361747a2067657a69656c74206175732064657220546162656c6c652e204461626569207769726420656e74776564657220616c6c65732067656c266f756d6c3b736368742c206f6465722061626572206e75722064696520646174656e2064657220426564696e67756e672e3c2f503e),
(7, 'SQL', '', 'Erstellen einer Datenbank', 0x3c503e5a756d2065727374656e2053636872697474206465722065727374656e20446174656e62616e6b2065727374656c6c656e2077697220646965204442206d69742048696c6665206465732053514c2042656665686c65733a3c2f503e0d0a3c503e2667743b2667743b20435245415445204441544142415345202667743b4e414d45266c743b203b202820776f62656920646572204e616d652062656c69656269672069737420293c2f503e0d0a3c503e556d206e756e20646965206572666f726465726c696368656e20546162656c6c656e20696e2064657220446174656e62616e6b2065727374656c6c656e207a75206b266f756d6c3b6e6e656e2c206d2675756d6c3b7373656e20776972206e6f6368202675756d6c3b6265726c6567656e2c2077656c6368656e205765727420646965205370616c74656e20686162656e20736f6c6c656e2e2048616e64656c74206573207369636820756d2065696e65205a61686c2c206b616e6e203c2f503e0d0a3c554c3e0d0a3c4c493e494e54266e6273703b20282067616e7a65205a61686c293c2f4c493e0d0a3c4c493e444543494d414c28782c7929202820466573746b6f6d6d617a61686c206d6974207820566f727374656c6c656e20756e642079204e6163686b6f6d6d617374656c6c656e20293c2f4c493e0d0a3c4c493e464c4f4154266e6273703b202820466c696573736b6f6d6d617a61686c20293c2f4c493e3c2f554c3e0d0a3c503e62656e75747a742077657264656e2e20446162656920736f6c6c74656e20662675756d6c3b722064656e20494e444558206e757220494e542062656e75747a742077657264656e2e20462675756d6c3b7220536f6e7374696765205765727465206b266f756d6c3b6e6e656e20776972266e6273703b203c2f503e0d0a3c554c3e0d0a3c4c493e56415243484152266e6273703b282062697320323535205a65696368656e20293c2f4c493e0d0a3c4c493e54455854203c2f4c493e0d0a3c4c493e424c4f42203c2f4c493e3c2f554c3e0d0a3c503e6e75747a656e2e20446566696e696572656e2077697220646965205370616c74656e206d69742064656e2057657274656e20646162656920736f2c2064617373207769722067656e6175657374656e732077697373656e2c207769657669656c65205a65696368656e2070726f205370616c746520657266617373742077657264656e20736f6c6c656e2c2064616d697420646572205370656963686572206e6963687420746f74616c202675756d6c3b626572666f726465727420776972642e20416c7320426569737069656c206e65686d656e2077697220646965204b756e64656e746162656c6c653a3c2f503e0d0a3c503e2667743b2667743b20435245415445205441424c45204b554e44454e20282069645f6b756e646520494e5428313029204155544f5f494e4352454d454e542c266e6273703b204e414d45205641524348415228313030292c266e6273703b204144524553534531205641524348415228313030292c204144524553534532205641524348415228313030292c266e6273703b204b4f4e54414b54205641524348415228313030292c204e4f54495a20424c4f422c205052494d415259204b4559202869645f6b756e646529293b3c2f503e0d0a3c503e576f626569204155544f5f494e4352454d454e542062657769726b742c206461732064657220494e444558206175746f6d61746973636820626569206a6564656e206e6575656e20446174656e7361747a206572666f6c67742e3c2f503e),
(2, 'SQL', '', 'Einf&uuml;hrung', 0x3c503e496e2064657220576972747363686166742c2056657277616c74756e672c2057697373656e73636861667420756e6420546563686e696b2c20736f67617220696d20707269766174656e20426572656963682073696e6420496e666f726d6174696f6e656e20756e6420446174656e20616c6c742661756d6c3b676c69636820756e64206d65697374656e73207365687220776963687469672e205363686f6e20616c6c65696e652064696520457266617373756e6720766f6e20416472657373656e206973742065696e20776573656e746c69636865722042657374616e647465696c2064657220496e666f726d6174696f6e73676577696e6e756e672e204f6220416472657373656e20766f6e20467265756e64656e2c20426568266f756d6c3b7264656e206f6465722045696e7269636874756e67656e2c20742661756d6c3b676c69636820657266617373656e20536965206e65756520646174656e20617566204e6f74697a626c266f756d6c3b636b656e2c20416472657373622675756d6c3b636865726e206f6465722052656769737465726b617274656e2e2042656920676572696e67656e20416472657373656e207374656c6c656e20736963682068696572206b65696e652050726f626c656d652065696e2c206265692068756e64657274656e206f6465722074617573656e64656e20416472657373656e20776972642064696520c39c6265727369636874207369636865726c6963682065787472656d20736368776572207365696e2c20617563682077656e6e205369652064696520416472657373656e206e616368204275636873746162656e20736f7274696572656e2e3c2f503e0d0a3c503e4175732064696573656d204772756e642077657264656e205369652073696368207761687273636865696e6c6963682065696e65206469676974616c652041647265737376657277616c74756e6720616e736368616666656e20776f6c6c656e2e204f622050616c6d206f64657220536f66747761726520662675756d6c3b7220496872656e2050432c2053696520686162656e2064616d697420496872205a69656c207a75722056657277616c74756e672064657220446174656e20657272656963687420756e6420686162656e20736f6d69742065696e65206b6f6d706c6574746520756e64207363686e656c6c6520c39c62657273696368742e20416e64657273206a65646f6368206265696d2050726f6772616d6d69657265722c2064656e6e20646f727420662661756d6c3b6e6774206461732050726f626c656d206572737420616e2e3c2f503e0d0a3c503e462675756d6c3b722064656e2050726f6772616d6d6965726572207374656c6c742073696368206469652046726167652c20696e2077656c6368657220466f726d2064696520446174656e2067657370656963686572742077657264656e20736f6c6c656e20756e64206562656e66616c6c732c20776965206d616e20646965736520446174656e207472616e73706f72746162656c206d616368656e206b616e6e2e20457320676962742073656872207669656c65204d266f756d6c3b676c6963686b656974656e2064657220446174656e7370656963686572756e672c20616e676566616e67656e2062656920434f424f4c44206269732068696e207a75207842617369632c2077656c6368652064696520446174656e20696e20466f726d20766f6e2054616273746f70732067657472656e6e74656e2046696c6573207370656963686572742e204461732050726f626c656d20697374206a65646f63682c20646173732064696520446174656e206562656e66616c6c73202675756d6c3b62657274726167626172207365696e20736f6c6c656e2e20416c7320426569737069656c206e656e6e656e20776972206469652042657374656c6c61627769636b6c756e672065696e6572204f6e6c696e6562657374656c6c756e672c20776f6265692064696520446174656e206465722042657374656c6c756e67207a7565727374206175662065696e656e204f7261636c6520446174656e62616e6b736572766572206765737065696368657274207769726420756e6420696e20456368747a656974206175662064656e2047726f7373726563686e657220646572204669726d61202675756d6c3b62657274726167656e20776972642e20536f6d697420776972642076657268696e646572742c2064617373204f6e6c696e65206e69636874206d6568722062657374656c6c742077657264656e206b616e6e2c20616c7320766f7268616e64656e2069737420756e64206562656e66616c6c73206469652042657374656c6c756e6720736f666f727420626561726265697465742077657264656e206b616e6e2e3c2f503e0d0a3c503e566f72206d65687220616c73203330204a616872656e2077757264652064657368616c622064696520446174656e62616e6b737072616368652053516c20656e747769636b656c742c2077656c636865206d69742064657220414e534920756e642049534f2067656e6f726d742077757264652e204f686e65206469657365204e6f726d20772661756d6c3b72656e2064696520446174656e206e69636874207472616e73706f72746162656c2e3c2f503e),
(5, 'SQL', '', 'Daten', 0x3c503e57656e6e20536965204f6e6c696e652073696e642c206973742049687220526563686e657220662675756d6c3b72206a6564656e206175732064656d20496e7465726e65742065696e206f6666656e657320506f7274616c20662675756d6c3b722065696e656e2067657a69656c74656e20416e67726966662e20476573636877656967652064656e6e2c20536965207363682675756d6c3b747a656e20496872656e20526563686e65722067657a69656c74206d69742053636875747a736f6674776172652e266e6273703b204162657220617563682077656e6e20536965206e6f636820736f7669656c652050726f6772616d6d65207a756d2053636875747a6520496872657320526563686e65727320696e7374616c6c696572656e206b6f6d6d74206d616e2064757263682c2077657474656e2064617373202e2e2e2e2e2e2e2e20446572204368616f732043756d707574657220436c756220696e2048616d627572672068617420646173207363686f6e207a75206f667420626577696573656e21204461206b616e6e206d616e2065636874207365687220756e7369636865722077657264656e2c20776173205369652061626572206e6963687420627261756368656e2c2077656e6e2053696520736963682072696368746967207363682675756d6c3b747a656e3a3c2f503e0d0a3c554c3e0d0a3c4c493e616b7475656c6c6520416e7469766972656e736f667477617265206d697420456d61696c7363616e6e65723c2f4c493e0d0a3c4c493e64656b746976696572656e205369652064656e205761726e6469656e73742c204e65747a7765726b6e61636872696368746469656e737420756e6420626569204e657473636170652064656e20414f4c204d657373656e6765723c2f4c493e0d0a3c4c493e4e5420686174206e6f63682064656e204d51204d657373656e6765722c206175636820646572206d757373206465616b746976696572742077657264656e3c2f4c493e0d0a3c4c493e6576656e7475656c6c206e6f63682065696e656e204669726577616c6c20696e7374616c6c696572656e2c205a6f6e65416c61726d2069737420662675756d6c3b722070726976617465205a7765636b65206b6f7374656e6c6f733c2f4c493e0d0a3c4c493e656e746665726e656e20536965206d69742048696c666520766f6e2046726565746f6f6c732064656e204469656e737420416c657861202820696d20494520756e64204e53206472696e2c206465722073656e64657420446174656e21293c2f4c493e0d0a3c4c493e62656920585020656d706665686c656e207769722065696e65206b6f6d706c6574746520496e7374616c6c6174696f6e2064657320616b7475656c6c656e20536572766963657061636b733c2f4c493e3c2f554c3e0d0a3c503e45732067696274206e6f6368207669656c652077656974657265204d6574686f64656e2c206469652065696e20437261636b6572206e75747a742c20756d2061756620496872656e20526563686e6572207a75207370696f6e696572656e2e20446f6368207363686f6e20616c6c65696e652c2077656e6e20536965206f62656e20766f72676568656e2c2077697264206465726a656e69676520657320736568722073636877657220686162656e2e20536965206d2675756d6c3b7373656e20616c736f206e69636874207a7520766572756e73696368657274207365696e2c2064656e6e206f6674206973742065732061756368206e757220426c7566662e20426569737069656c3a204d616e207a656967742049686e656e2065696e204672616d652c20776f2073636865696e62617220496872652046657374706c6174746520616e67657a6569677420776972642e20446173207761722065636874206b2675756d6c3b6e73746c69636820756e642069737420656865722065696e2064756d6d6572206b6c65696e657220537472656963682e203c2f503e0d0a3c503e45726e737468616674657220736f6c6c74656e20536965204163746976655820506c7567696e7320756e6420536574757070726f6772616d6d65206175732064656d20496e7465726e6574206e65686d656e2e266e6273703b204265736f6e6465727320616d6572696b616e69736368652053656974656e2073696e64206f667420766f6e20736f6c6368656e2053707977617265202675756d6c3b626572682661756d6c3b7566742e20496e204575726f7061206973742064696520536963686572686569742064657368616c62206265737365722e2045696e20646f776e6c6f616420766f6e20536372697074656e20756e642050726f6772616d6d656e2069737420696d6d65722065696e65204765666168722c206162657220736f67617220766f6e20536861726577617265204344732069737420646173206e69636874206265737365722c20646175657274206562656e206e7572206574776173206c2661756d6c3b6e6765722e3c2f503e),
(6, 'SQL', '', 'Datenbankmodelle', 0x3c503e57697220686162656e206d69746c65727765696c652064696520776963687469677374656e20446174656e206175732064696573656d20426569737069656c20657266617373742e2045732067656874206e756e20646172756d2c206469652042657a696568756e67656e2064657220446174656e207a7565696e616e6465722067656e6175657374656e732066657374207a75206c6567656e2e20576972202675756d6c3b6265726c6567656e3a3c2f503e0d0a3c503e446572204b756e6465206b616e6e2062656c6965626967207669656c6520417274696b656c2062657374656c6c656e2c206861742061626572206d69742064656e20417274696b656c6e206b65696e656e205a7573616d6d656e68616e672c20616c736f2053514c204b756e6465206b616e6e20787820417274696b656c2062657374656c6c656e2e20566f6e206a6564656e20417274696b656c20676962742065732065696e65206578616b746520416e7a61686c20696d204c616765722c20616c736f206562656e66616c6c732053514c207a75206e2e266e6273703b205a7769736368656e2064656d204c6167657220756e64204b756e64652062657374656874206b65696e652042657a696568756e672e2057656e6e206a65646f636820696d204c61676572206b65696e20417274696b656c206d65687220766f7268616e64656e206973742c206b616e6e20646572204b756e6465206469657365206e69636874206265737465686c656e2e266e6273703b20496e206465722042657374656c6c756e672068617420646572204b756e646520766f6e206e20417274696b656c6e206a657765696c732065696e652062656c696562696765204d656e67652062657374656c6c742e204175732064656e204d656e67656e206d756c7469706c697a696572742064656d205665726b6175667370726569732065726769627420736963682064657220476573616d74776572742e3c2f503e0d0a3c503e416c6c6573207a7573616d6d656e206b6c696e6774206574776173206162737472616b742c20697374206a65646f636820662675756d6c3b72206469652042657a696568756e672064657220446174656e20756e74657265696e616e646572207365687220776963687469672e204f686e6520646965736520426575696568756e67206b616e6e206465722041626c6175662065696e65722042657374656c6c756e672073702661756d6c3b746572206e69636874206d656872206e616368766f6c6c7a6f67656e2077657264656e2e3c2f503e0d0a3c503e536f20697374206573206d616e63686d616c20776963687469672c2064617373206d616e204b656e6e746e6973202675756d6c3b62657220646965204b756e64656e2062656b6f6d6d742c206469652065696e20646566656b746573204765722661756d6c3b742062657374656c6c7420756e6420657268616c74656e2068617474656e2c20646965204865727374656c6c65726669726d61206a65646f636820616c6c652050726f64756b7465207769656465722065696e7a696568656e2077696c6c20756e6420616c732045727361747a2065696e6520616e64657265204d61726b6520616e6269657465742e3c2f503e0d0a3c503e4265692065696e656d20736f6c6368656e2046616c6c20736f6c6c7465206d616e20696e6e657268616c62206b75727a6572205a6569742065696e65202675756d6c3b626572736963687420616c6c6572204b756e64656e2065727374656c6c656e206b266f756d6c3b6e6e656e2c206469652064696573656e20417274696b656c20657268616c74656e20686162656e2e3c2f503e),
(9, 'SQL', '', 'Tabellenmanipulation', 0x3c503e42697368657220686162656e20776972206e7572206765736568656e2c207769652077697220446174656e732661756d6c3b747a65206d616e6970756c696572656e206b266f756d6c3b6e6e656e2e204a65747a74206d616e6970756c696572656e2077697220617563682064696520546162656c6c652e20416e67656e6f6d6d656e2c2077697220627261756368656e20696e2064657220546162656c6c65204b756e64656e206e6f636820646965205370616c74652054454c20756e6420464158207374617474204b6f6e74616b2e3c2f503e0d0a3c503e2667743b2667743b20414c544552205441424c45204b554e44454e204d4f4449465920286b6f6e74616b205641524341485228313030292c2054454c205641524341485228353029293b3c2f503e0d0a3c503e446965205370616c7465206b6f6e74616b74207769726420696e2054454c20756d62656e616e6e7420756e64206175662064656e20576572742056415243484152283530292067657365747a742e3c2f503e0d0a3c503e2667743b2667743b20414c544552205441424c45204b554e44454e20414444202846415820564152434841522835302929204245464f5245206e6f74697a3b3c2f503e0d0a3c503e446965205370616c746520464158206d6974205641524348415228353029207769726420766f7220646572205370616c7465206e6f74697a2065696e6765662675756d6c3b6867742e20576972206b266f756d6c3b6e6e656e206162657220617563682062656920426564617266205370616c74656e20656e746665726e656e206d6974202667743b2667743b20414c544552205441424c452044524f5020282667743b205350414c5445266c743b293b3c2f503e0d0a3c503e2667743b2667743b2044524f50205441424c45202667743b4e414d45266c743b3b3c2f503e0d0a3c503e44616d6974206c266f756d6c3b736368656e2077697220646965206b6f6d706c6574746520546162656c6c652e3c2f503e),
(10, 'SQL', '', 'Datensicherung und Datenschutz', 0x3c503e44696520696e2064657220446174656e62616e6b206765737065696368657274656e20446174656e2073746568656e20756e74657220446174656e73636875747a2e204573206973742064657368616c62207365687220616e67656272616368742c2064617320556e6265667568677465206b65696e656e206f646572206e7572206265736368722661756d6c3b6e6b74656e205a7567616e67207a752064656e20446174656e2062656b6f6d6d742e204573206769627420646965204d266f756d6c3b676c6963686b6569742c20546162656c6c656e20662675756d6c3b7220616e646572652064656e205a7567616e6720746f74616c207a75207665727765696765726e206f646572206e7572206265736368722661756d6c3b6e6b74656e205a756772696666207a752065726c617562656e2e3c2f503e0d0a3c503e2667743b2667743b204752414e542028434f4e4e4543542f5245534f555243452f4442412920544f20285055424c49432f42656e75747a6572293b3c2f503e0d0a3c503e4265736368722661756d6c3b6e6b7420646965205a756772696666737265636874652061756620646965206b6f6d706c6574746520446174656e62616e6b2e3c2f503e0d0a3c503e2667743b2667743b204752414e542028414c4c2f50726976696c656729204f4e2028546162656c6c652c205370616c74652920544f20285055424c49432f42656e75747a657229205b204f4e204752414e54204f5054494f4e53205d3b3c2f503e0d0a3c503e44616d69742077657264656e20646965205a75677269666673726563687465206175662065696e6520546162656c6c65206f646572205370616c746520662675756d6c3b7220616c6c65206f6465722042656e75747a6572206e6163682064656e2067657365747a74656e2045696e736368722661756d6c3b6e6b756e67656e206265736368722661756d6c3b6e6b742e20536f206b616e6e206d616e206461732072656368742065696e7465696c656e2c20646173206465722062656e75747a6572207a776172206c6573656e206472662c2061626572206e6963687473207665722661756d6c3b6e6465726e2e266e6273703b204d69743c2f503e0d0a3c503e2667743b2667743b205245564f4b452028414c4c2f50726976696c656729204f4e20285461656c6c652f5370616c7465292046524f4d20285055424c49432f42656e75747a657229205b2057495448204752414e54204f5054494f4e53205d3b3c2f503e0d0a3c503e6b616e6e206d616e2064696573652045696e736368722661756d6c3b6e6b756e67656e2077696564657220656e746665726e656e2e203c2f503e0d0a3c503e457320697374206562656e66616c6c73207365687220616e67656272616368742c2064617373205369652064696520696e2064657220446174656e62616e6b206765737065696368657274656e20446174656e2073742661756d6c3b6e646967207369636865726e2e204265692046696c657320627261756368656e20536965206e7572206469657365204461746569656e207369636865726e2c20616e736f6e7374656e206d7573732065696e207370657a69656c6c65732050726f6772616d6d2064696520446174656e206175736c6573656e20756e6420696e2065696e6520616e6465726520446174656e62616e6b202675756d6c3b62657274726167656e2e2042656920646965736572202675756d6c3b62657274726167756e67206973742068266f756d6c3b636873746520566f72736963687420616e67656272616368742e20536f20736f6c6c74656e205369652064696520446174656e206e69656d616c73202675756d6c3b6265722064617320496e7465726e657420742661756d6c3b746967656e2c20736f6e6465726e20646972656b7420766f72204f7274206175662065696e656e204261636b7570205365727665722e3c2f503e),
(11, 'SQL', '', 'Arten von Datenbanksystemen', 0x3c503e4d53204163636573732069737420646965206d65697374206765627261756368746520446174656e62616e6b61727420696e20536368756c656e20756e642065696e666163686520556d676562756e67207a75722056657277616c74756e672065696e66616368657220446174656e2e204469657365732053797374656d206569676e657420736963682061757367657a656963686e6574207a756d2065726c65726e656e20646572204772756e646c6167656e20766f6e2053514c2e266e6273703b204e6562656e2064696573656d2027536368756c73797374656d272067696274206573206e6f6368204f7261636c652c204d532053514c205365727665722c204d7953514c202e2e2e20756e64207669656c6520776569746572652c20776f626569204d7953514c266e6273703b6265766f727a75677420776972642e20416c6c652053797374656d652073696e64206175662064657220446174656e62616e6b737072616368652053514c206175666765626175742e2045732067696274207a756d20426569737069656c20626569204d7953514c2065696e6967652050726f626c656d652c206a65646f63682077757264656e20646965206d65697374656e2062657265697473206265736569746967742e203c2f503e0d0a3c503e576172756d204d7953514c3f2044696520416e74776f7274206973742072656368742065696e666163682c2064656e6e204d7953514c20697374266e6273703b736f776f686c206b6f7374656e6c6f7320616c73206175636820666c65786962656c2e266e6273703b45696e7a6967206d6974204d532050726f64756b746520766572737465687420736963682064696573657320537974656d206e6963687420736f206775742e20497374206162657220736568722076657273742661756d6c3b6e646c63692c206f646572206e696368743f3c2f503e0d0a3c503e266e6273703b3c2f503e),
(12, 'SQL', '', 'Zusammenfassung', 0x3c503e462675756d6c3b72206e6f726d616c6520416e77656e646572206265726569747320626573746568656e6465722050726f6772616d6d65206973742053514c206e6963687420776963687469672e20486175707473616368652c2064696520536f6674776172652066756e6b74696f6e69657274206665686c6572667265692e20462675756d6c3b722064656e2050726f6772616d6d69657265722c206265736f6e6465727320662675756d6c3b7220736f6c6368652c2064696520662675756d6c3b722064617320496e7465726e657420416e77656e64756e67656e2070726f6772616d6d696572656e2c206973742053514c2065696e652050666c696368742e3c2f503e0d0a3c503e3c553e42756368746970703a3c2f553e3c2f503e0d0a3c503e48757363682c204265726e686172643a205072616b7469736368652053514c20416e776564756e67202f205665726c616720546563686e696b2c204265726c696e202f204953424e20536963686572686569742d3334312d3030313130342d496e7465726e65743c2f503e0d0a3c503e4a617920477265656e7370616e2c20427261642042756c676572203a266e6273703b204d7953514c2c2050485020446174656e62616e6b616e77656e64756e67202f206d6974702d5665726c61672c20426f6e6e2f204953424e20536963686572686569742d383236362d303830352d5048503c2f503e),
(13, 'Sicherheit', '', 'Einührung', 0x49636820686162652064696573656e205465696c206e6963687420676573636872696562656e2c2064616d6974206d616e206c65726e656e206b616e6e2c20776965206d616e2065696e204861636b657220776972642c20736f6e6465726e20696d20476567656e7465696c2c20776965206d616e2067657a69656c746520416e67726966666520766f6e206175c39f656e20756e64206175636820766f6e20696e6e656e206572666f6c67726569636820616277656872656e206b616e6e20756e64206175636820736f6c6c74652e20446965736572205465696c20726963687465742073696368207669656c206d65687220616e20666f7274676573636872697474656e652053797374656d61646d696e6973747261746f72656e206f64657220736f6c6368652c20646965206573206765726e652077657264656e20776f6c6c656e2e20416c6c652045696e7a656c68656974656e20616e7a75737072656368656e2077c3a47265207a75207669656c2066c3bc722064696573656e205465696c2c2077657368616c6220696368206d696368206b75727a20756d66617373656e642061756620646965205468656d656e206f686e652067726fc39f6520416273636877656966756e67656e206b6f6e7a656e7472696572652e204469657365722042656974726167206b616e6e206e6963687420736167656e2c2064617320646965206465727a6569746967656e204d6574686f64656e20646572204861636b657220756e6420437261636b657220616b7475656c6c206973742c2064656e6e206175636820646f72742077697264206e696368742067657363686c6166656e2e2047656e617520776965207669656c6520496e7465726e65746469656e73746c65697374657220756e6420536f6674776172656865727374656c6c6572207369636820676567656e20416e677269666665206175732064656d20496e7465726e657420776170706e656e2c2072c3bc7374656e2061756368204861636b657220756e6420437261636b6572206175662e20416e676573706f726e742064757263682064696520726173616e746520456e747769636b6c756e672064657320496e7465726e65747320756e64206562656e66616c6c7320646572206e6575656e2047657365747a676562756e67656e20696d20756e642066c3bc722064617320496e7465726e657420686162652069636820646965736573204275636820616e676566616e67656e207a752073636872656962656e2e204562656e66616c6c73206475726368204d656469656e2c204e6577736c657474657220756e642074c3a4676c696368656e2042657269636874656e207a75666f6c676520686162652069636820686965722064696520776963687469677374656e20496e68616c74652061756667656e6f6d6d656e20756e64206d6974206d65696e657220656967656e656e20457266616872756e67206175736765626175742e20274573206769627420646f6368206d6974746c65727765696c652067656e75672042c3bc6368657220c3bc62657220646965736573205468656d6127207374696d6d742e2044616e6e206c6573656e20536965206e69636874207765697465722c2064656e6e20616e736f6e7374656e206c617566656e2053696520646572204765666168722c2064696573656e205465696c20646f6368206e6f63682064757263687a756c6573656e2e20),
(14, 'Sicherheit', '', 'Hacker', 0x3c503e45696e6520c3a46c74657265204672617520737465687420696e2065696e6572204d65747a676572656920766f7220646572205468656b6520756e642062656f626163687465742064656e204d65747a6765722c2077696520646965736572204861636b666c6569736368207a7562657265697465742e204461207361677420646965204672617520706cc3b6747a6c696368207a756d204d65747a6765723a20274d65696e20536f686e206973742061756368204861636b6572272027536965206d65696e74656e204d65747a6765723f2720274e65696e2c20657220736167742065722069737420496e7465726e65746861636b657227203c2f503e0d0a3c503e5a77656920576f6368656e207370c3a47465722073746568742064696520424b4120766f72206465722054c3bc72206d69742065696e656e20447572636873756368756e67732d20756e64204861667462656665686c2e2045696e205769747a20204e65696e2c20736f20776173206f646572206175636820736f20c3a4686e6c696368206b6f6d6d7420686575747a757461676520696d6d657220776965646572206d616c20766f722e20416e676566616e67656e2068617474652065732064616d69742c20646173732049687220536f686e2073696368206c616e677765696c746520756e64206175732064696573656d204772756e6420696d6d657220c3b6667465727320696d20496e7465726e6574207375726674652e2057616e6e2065732067656e61752064616d697420616e66696e672c2064617373206572207369636820617563682066c3bc722027637261636b696e672720766f6e2057656273656974656e20756e6420446174656e62616e6b73657276657220696e74657265737369657274652c20776569c39f206b65696e6572206d6568722e203c2f503e0d0a3c503e5461747361636865206973742c2064617320646572206a756e6765204d616e6e20616c73202750696e6b2050616e7468657227206d6568726d616c7320696e2064617320446174656e62616e6b73797374656d206465722054656c656b6f6d2065696e676562726f6368656e2077617220756e6420646f727420616e20776963687469676520446174656e206b6f6d6d656e206b6f6e6e74652e2052696368746967656e205363686164656e206a65646f6368207775726465206175662064656d20536572766572206e696368742068696e7465726c617373656e2e2054726f747a64656d20777572646520646572206a756e6765204d616e6e207a75203138204d6f6e6174652061756620426577c3a46872756e672076657275727465696c742e2044696520507265737365206e656e6e7420696e207363686c696368742065696e656e20437261636b65722e204469657320697374206772756e646c6567656e642066616c736368212045696e204861636b6572206973742065696e6520506572736f6e2c206469652067657a69656c742053797374656d652061756620646572656e20536963686572686569742068696e207072c3bc667420756e6420696d2046616c6c652c206461732065696e2045696e6472696e67656e206dc3b6676c696368206973742c206175662064656d205365727665722065696e6c6f6767742e204a65646f636820697374206b65696e652062c3b67377696c6c696765204162736963687420686965726265692c20736f6e6465726e20646965206b6c6172652054617473616368652c20646173732064696520506572736f6e20686965726d6974207a656967656e20776f6c6c74652c20646173732064617320616c7320276162736f6c75742073696368657265272053797374656d20646f6368206e6963687420736f207369636865722069737420616c7320646572204865727374656c6c657220616e676962742e2044696520506572736f6e207465696c74206469657320646572204669726d612061756368206672656977696c6c6967206d69742e2045722068696c667420616c736f2064656d20646f72746967656e2053797374656d61646d696e6973747261746f7220696e646972656b74206d6974204665686c6572207a752066696e64656e2e3c2f503e),
(15, 'Sicherheit', '', 'Cracker', 0x3c703e416e64657273206a65646f636820766572682661756d6c3b6c742065732073696368206265692065696e656d20437261636b65722e2048617570747a69656c0d0a09090965696e657320437261636b6572732073696e6420696e2064657220526567656c207a65727374266f756d6c3b72656e2c2044696562737461686c20756e6420446174656e6b6c61752e204a656465730d0a0909094d697474656c206973742064616265692052656368742e204d616e63686d616c206b616e6e206d616e20616e6e65686d656e2c206461737320437261636b6572207365687220696e74656c6c6967656e74650d0a090909506572736f6e656e2073696e642e2044696520766f72676568656e7377656926737a6c69673b6520697374206d616e63686d616c2073656872206c616e6777696572696720756e64207363687769657269670d0a090909756e64206572666f726465726e2067757465204f7267616e69736174696f6e2e204469657320747269666674206e696368742062656920616c6c656e207a752c206265736f6e646572730d0a0909096e696368742062656920437261636b65726e2c2064696520617573207265696e657220526163686520696e204e65747a7765726b6520496872657220457861726265697467656265720d0a09090965696e6472696e67656e20756e6420646572205a65727374266f756d6c3b72756e67656e20616e7269636874656e2e20486965722068616e64656c7420657320736963682068266f756d6c3b636873747761687273636865696e6c6963680d0a090909756d2065696e656e2045786d697461726265697465722c20646572207369636820662675756d6c3b7220646965204b2675756d6c3b6e646967756e6720722661756d6c3b6368656e2077696c6c206f64657220756d2065696e650d0a090909506572736f6e2c2064696520616c6c657320766572737563687420756d2065696e6d616c20696e20646965205363686c61677a65696c656e2064657220507265737365207a75206b6f6d6d656e2e3c62723e0d0a0909093c703e50726f6669637261636b6572206a65646f636820676568656e206c616e6773616d20756e6420756e617566662661756d6c3b6c6c696720616e204968720d0a0909094f706665722072616e2e20536965206572666f72736368656e20496872205a69656c2067656e6175657374656e73206269732068696e207a756d206b6c65696e7374656e2044657461696c0d0a090909756e64206d616e63686d616c20617563682064696520506572736f6e2073656c6273742e204e6163682064656e2065727374656e2067656865696d656e20637261636b73206c6567656e0d0a090909536965205363726970746520756e6420546f6f6c73206175662064696573656e2050432061622c2077656c636865207a7520776569746572656e20566f72676568656e20736568720d0a090909776963687469672073696e642e20446965732073696e6420736f67656e616e6e7465205769727473504373202675756d6c3b6265722077656c6368652077656974657265204f7065726174696f6e656e0d0a0909097665726c617566656e2c20616c736f206e69636874206469652048617570747a69656c652e204573206973742064657368616c62206e696368742073656c74656e20766f7267656b6f6d6d656e2c0d0a090909646173732064617320424b412064656e2066616c736368656e207665726861667465742068617474652e20566f6e2064696573656d206f6465722061756368206d6568726572656e0d0a09090957697274504373206572666f6c67656e2064696520656967656e746c6963686520416e67726966666520617566206461732048617570747a69656c2c2077656c63686573206d65697374656e730d0a090909536572766572206772266f756d6c3b26737a6c69673b6572657220556e7465726e65686d656e2c2042616e6b656e206f64657220736f6761722064617320424b412073656c62737420282073696e6420617563680d0a0909096e69636874206469652070657266656b74657374656e2029206572666f6c67656e2e3c62723e0d0a0909094265692065696e656d206572666f6c677265696368656e20427265616b20696e2068616e64656c742064657220437261636b6572206e756e0d0a09090973656872207363686e656c6c2c2064656e6e20657220686174206e757220736568722077656e6967205a65697420756e656e746465636b74207a7520626c656962656e2e20457220686f6c740d0a0909097369636820696e6e657268616c622077656e69676572205a6569742064696520776963687469677374656e20446174656e20766f6d2053657276657220756e64206c266f756d6c3b7363687420616e7363686c696526737a6c69673b656e640d0a090909616c6c652053707572656e2e2044617320424b41207374656874206f6674207261746c6f7320646120756e64206b616e6e206e69636874207765697465722068656c66656e20616c730d0a0909096469652057697274504373207a75206c6f6b616c6973696572656e2e2057656e6e206d616e20476c2675756d6c3b636b206861742066696e646574206d616e206175662064696573656e20576972745043730d0a090909646f6368206e6f6368206b6c65696e6520416e7a65696368656e206175662064656e20542661756d6c3b7465722e204d65697374656e73206973742068696572206a65646f636820456e6473746174696f6e2e3c62723e0d0a0909093c703e4175662064656e2053797374656d61646d696e6973747261746f722064657320616e67656772696666656e656e20536572766572732077617274656e0d0a0909096e756e2073656872207669656c6520417566676162656e2c2064656e6e2065732067696c74206e756e207a752076657268696e6465726e2c206461732064696573657220437261636b65720d0a0909092675756d6c3b6265722065696e657320646572204163636f756e7473206e6f63686d616c7320617566206461732053797374656d2067656c616e67656e206b616e6e2e204d616e206b616e6e20766f6e0d0a090909476c2675756d6c3b636b20737072656368656e2c2077656e6e2064657220437261636b6572206e69636874206e6f63682065696e656e2056697275732067657365747a7420686174206f6465720d0a090909736f67617220646965206b6f6d706c657474652046657374706c61747465207a65727374266f756d6c3b7274206861742e204d65697374656e73207665726c2661756d6c3b7566742064696573206a65646f63680d0a09090977656e696765722020676c696d70666c69636820616220756e642064657220437261636b65722068696e7465726c2661756d6c3b7373742065696e656e205669727573206175662064656d205365727665720d0a090909756e642064656e2057697274735043732064696520696e6e657268616c622077656e69676572205a6569742064656e206b6f6d706c657474656e20504320756e6272617563686261720d0a0909096d616368656e2e3c62723e0d0a09090945696e20437261636b65722069737420616c736f2065696e6520506572736f6e2c2064696520696d2067656865696d656e20696e2053797374656d650d0a09090965696e6472696e67656e20756e6420646f7274205363686164656e20766572757273616368656e2e20456e74776564657220617573207265696e656e206b72696d696e616c656e20456967656e7a7765636b650d0a0909096f646572206d616e63686d616c20736f67617220696d20417566747261672065696e657220616e646572656e204669726d61202f204f7267616e69736174696f6e2e3c2f703e),
(16, 'Sicherheit', '', 'Systemadministrator', 0x3c703e496e207669656c656e20462661756d6c3b6c6c656e2068616e64656c74206573207369636820756d2065696e6520506572736f6e206d697420616267657363686c6f7373656e656e0d0a090909496e666f726d6174696b65727374756469756d206f64657220756d2065696e6520506572736f6e206d6974206c616e676a2661756d6c3b68726967657220457266616872756e672e2044656d207374696d6d650d0a090909696368206a65646f6368206e69636874207a752c2064656e6e206461732069737420662675756d6c3b72206b6c65696e657265204265747269656265207a752074657565722e204f66742073696e640d0a09090965732065696e666163686520506572736f6e656e20646572204669726d612c2077656c636865206e7572206d696e696d616c202675756d6c3b6265722064696573656e20426572656963682042657363686569640d0a09090977697373656e2e2053656c62737420662675756d6c3b72206d697474656c73742661756d6c3b6e64696765204669726d656e206973742065696e20736f6c6368657320566f72686162656e20696e206465720d0a090909526567656c207a7520746575657220756e6420626561756674726167656e2065696e652065787465726e65204669726d61206d69742064657220426574726575756e6720646573204e65747a7765726b65732e0d0a0909094469657365206265617566747261677465204669726d612062656861757074657420737465747320766f6e20736963682073656c62737420696e2053616368656e20536963686572686569740d0a090909766f6c6c6b6f6d6d656e6520457870657274656e207a75207365696e2e204669726d656e2c206265692064656e656e20646965736520417573736167652061756368207a757472656666656e640d0a09090973696e642c2073696e642073656c74656e2e204572696e6e65726e20536965207369636820616e20224b696d626c65222c2064656e204d266f756d6c3b636874656765726e204e65747a7765726b7370657a69616c697374656e3f0d0a09090941636874656e2053696520696e2064696573656d2046616c6c652061756620646965205a6572746966697a696572756e6720646572204669726d612e20496d205a77656966656c6c7366616c6c650d0a0909096b266f756d6c3b6e6e656e20536965206175636820696d20496e7465726e65742067656e2675756d6c3b67656e64204175736b2675756d6c3b6e667465202675756d6c3b6265722073657269266f756d6c3b7365204669726d656e20696e2049687265720d0a0909094e2661756d6c3b686520657268616c74656e2e3c62723e0d0a0909095761732067656e617520736f6c6c74652065696e2053797374656d61646d696e6973747261746f72206b266f756d6c3b6e6e656e3f3c62723e0d0a0909095a75207365696e656e20417566676162656e6765626965746520676568266f756d6c3b72656e20756e74657220616e646572656d3a3c62723e0d0a0909094b656e6e746e6973736520696e3c62723e0d0a0909093c756c3e0d0a09090920203c6c693e566572736368696564656e652053797374656d6520282057696e646f77732c204c696e75782c204e6f76656c6c290d0a09090920203c6c693e566572736368696564656e65204e65747a7765726b746f706f6c6f6769656e0d0a09090920203c6c693e50726f746f6b6f6c6c6520756e64202675756d6c3b62657274726167756e6773617274656e0d0a09090920203c6c693e5665727363686c2675756d6c3b7373656c756e6720756e6420446174656e736963686572756e670d0a09090920203c6c693e457266616872756e6720696e204d6574686f64656e20646572204665686c6572737563686520756e6420416e616c7973650d0a09090920203c6c693e53742661756d6c3b6e6469676520616b7475656c6c652057656974657262696c64756e670d0a09090920203c2f6c693e0d0a0909093c2f756c3e3c62723e0d0a090909556e64206461732073696e642065696e696765207365696e657220742661756d6c3b676c696368656e20417262656974656e3a3c62723e0d0a0909093c756c3e0d0a09090920203c6c693e4b6f6e74726f6c6c65202675756d6c3b62657220416b74697669742661756d6c3b74656e20696d204e65747a7765726b20756e6420736f666f72746967650d0a09090909656967656e73742661756d6c3b6e64696765732048616e64656c6e20626569207a77656966656c68616674656e20566f72662661756d6c3b6c6c656e0d0a09090920203c6c693e4665686c65726265686562756e6720756e64202623383231313b737563686520696e6e657268616c6220646573204e65747a7765726b65730d0a09090920203c6c693e57617274756e6720756e64204b6f6e74726f6c6c6520616c6c657220436c69656e747320696d204c414e206d69742050726f746f6b6f6c6c696572756e670d0a090909202020200d0a09090920203c6c693e45696e7269636874756e67206e6575657220436c69656e747320696d204c414e206d697420616c6c656e2077696368746967656e0d0a09090909546f6f6c7320756e642045696e7374656c6c756e67656e0d0a09090920203c6c693e446174656e736963686572756e6720756e64204b6f6e74726f6c6c652064657220676573696368657274656e20446174656e206175660d0a0909090964657373656e2072696368746967656e2053706965676c756e670d0a0909093c2f6c693e0d0a0909093c2f756c3e3c62723e0d0a09090945732067696274206e6f63682065696e69676520776569746572652042657265696368652c206469652065696e2053797374656d61646d696e6973747261746f720d0a09090970666c6567656e206d7573732c20736f20697374206572206562656e66616c6c7320662675756d6c3b72206469652072696368746967652045696e7374656c6c756e6720646573204669726577616c6c730d0a090909766572616e74776f72746c6963682e20506572736f6e656e2c2064696520736f6c63686520542661756d6c3b7469676b656974656e207363686f6e206c2661756d6c3b6e676572206b656e6e656e2c2077697373656e0d0a090909736568722067656e61752c206461737320646965732073656872207669656c204172626569742062656465757465742e204a65646572204665686c6572206b616e6e2049686e656e0d0a09090964656e204a6f62206b6f7374656e2e20416e662661756d6c3b6e67657220686162656e20686965722077656e6967204368616e63656e207369636820766f6e20416e66616e6720616e207a752062656861757074656e2e0d0a090909486f6666656e207769722c20646965204669726d61206861742065696e2065696e736568656e2c2064617373206573206b65696e656e2070657266656b74656e2053797374656d61646d696e6973747261746f720d0a090909676962742e3c2f703e),
(17, 'Sicherheit', '', 'Arten der Angriffe', 0x3c703e4d656e7320726561202d2077617220657320416273696368743f204e61742675756d6c3b726c6963682c20646173206973742065696e6520756e6665686c626172652054617473616368652c2064656e6e207363686f6e206265692065696e656d205665727375636820696e206672656d64652053797374656d652065696e7a756472696e67656e207374656c6c742028207a756d696e6465737420696e204575726f706120292065696e20566572676568656e206461722c2064657373656e2052616e6720756e6420466f6c676520766f6e206465722041727420756e64205363686164656e206162682661756d6c3b6e67742e20486965722069737420646965204772656e7a656e207a7769736368656e204861636b65722028206d65697374656e732053797374656d61646d696e6973747261746f72656e2c2064696520496872207a7567657465696c746573204e65747a7765726b2074657374656e202920756e6420437261636b65722028206469652077616872656e205665726272656368657220292073656872207363686d616c2c207765696c206d616e20616c6c7a75206f667420616c6c657320696e2065696e656e2065696e7a6967656e20546f70662077697266742e20446965204d656469656e20756e64206265736f6e646572732064696520536f6674776172656865727374656c6c657220736568656e20616e73636865696e656e6420696e206a6564657220506572736f6e2c2064696520616e20736f207761732061756368206e75722064656e6b742c2065696e656e20536368776572766572627265636865722e2047656f726765204f7277656c6c732031393834206973742073656974206465722045696e662675756d6c3b6872756e67206465732067657365747a6c696368656e204c6175736368616e6772696666657320657273742072656368742065696e2053742675756d6c3b636b206e2661756d6c3b6865722067656b6f6d6d656e2e3c2f703e),
(18, 'Sicherheit', '', 'Phreaking', 0x3c503e44616d616c73202820756e642061756368207669656c6c65696368742076657265696e7a656c742068657574652029206b6f6e6e7465206d616e206d6974206b6c65696e656e20426f78656e2c20646965206461732045696e77657266656e20766f6e2047656c6473742675756d6c3b636b656e2073696d756c696572742c206b6f7374656e6c6f732074656c65666f6e696572656e2e20496e2065696e6572205a656974206465722047656c646b617274656e20756e6420436869707320686174207369636820646173206772756e646c6567656e642067652661756d6c3b6e646572742e2041756368206a65747a74206e6f63682066696e646574206d616e2050687265616b696e6720766f722c206e7572206562656e206175662065696e65206d6f6465726e6572656e2041727420756e64205765697365206d6974206d616e6970756c69657274656e20436869706b617274656e2e2057656e6e205369652064656e204175666261752064657220436869706b617274656e2076657273746568656e2c206b266f756d6c3b6e6e656e20536965206d69742048696c666520766f6e20437261636b626f78656e20756e642065696e6572206d616e6970756c69657274656e20436869706b61727465206b6f7374656e6c6f732074656c65666f6e696572656e2e20536965206c6164656e2065696e6661636820646965204b617274652c2077656e6e206469657365206c656572206973742c206d69742064657220437261636b626f78202820646965202675756d6c3b62726967656e73206e69636874206d616c207669656c206772266f756d6c3b26737a6c69673b65722069737420616c732065696e204b617274656e70722675756d6c3b6665722029207769656465722061756620756e642074656c65666f6e696572656e207765697465722e203c42523e4f646572205369652066696e64656e2065696e652054656c65666f6e7a656c6c6520696e2065696e6572207765697420616267656c6567656e656e204f72747363686166742c20776f2064696573657220547269636b20746174732661756d6c3b63686c696368206e6f63682066756e6b74696f6e696572742028206572737461756e6c696368206973742c2064617320657320736f6c63686520746174732661756d6c3b63686c696368206e6f63682067696274292e204469652054656c656b6f6d20686174207363686f6e20266f756d6c3b667465727320526563686e756e67656e20616e2054656c65666f6e7a656c6c656e2076657273636869636b7420282064657220506f7374626f7465207761722065727374206d616c20706c6174742c206265766f722065722064696520526563686e756e6720616e20646965205a656c6c656e742675756d6c3b72206b6c6562746520292e3c42523e5761732069737420646172616e20662675756d6c3b722065696e656e20437261636b657220736f20776963687469673f2045722077656926737a6c69673b2067656e61752c2064617373206d616e2069686e20697267656e6477616e6e206d616c206c6f6b616c6973696572656e20776972642e2044616e6e20776972642065732073656872206272656e7a6c69672e20496465616c2073696e642064616e6e20736f6c63686520266f756d6c3b6666656e746c69636865204665726e73707265636865722e3c2f503e),
(19, 'Sicherheit', '', 'DOS - denial of service', 0x3c703e496e20576f72746c617574656e3a3c62723e0d0a0909092256657273756368652065696e206175662064656d2053657276657220696e7374616c6c6965727465732050726f6772616d6d206f6465720d0a090909416e77656e64756e6720736f206f667420776965206d266f756d6c3b676c696368207a75207374617274656e206269732064657220536572766572206175666772756e6420646572202675756d6c3b6265726c617374756e670d0a090909616273742675756d6c3b727a742e223c62723e0d0a09090945732068616e64656c74207369636820696e2064657220526567656c20756d2065696e20456e646c6f737363686c656966656e70726f6772616d6d2c0d0a09090977656c6368657320646965204469656e7374652065696e6573205365727665727320656e646c6f73207374617274656e2e3c62723e0d0a090909426569737069656c3a0d0a0909095369652073757266656e2067656d2675756d6c3b746c69636820696d20496e7465726e657420756e642073746f26737a6c69673b656e206175662065696e656e20746f6c6c656e0d0a0909094c696e6b2c2077656c63686572204968726520496e746572657373652065727765636b74206861742e20536965206c696e6b656e2073696368206e756e20646f727468696e2c20616265720d0a09090973746174742065696e65732046656e737465727320266f756d6c3b66666e656e20736963682074617573656e64652c207363686c696526737a6c69673b656e205369652065696e6573206461766f6e2c20776965646572756d0d0a09090974617573656e64652c206269732049687220526563686e6572206c65747a7420656e64672675756d6c3b6c74696720616273742675756d6c3b727a742c206265766f7220536965206469652056657262696e64756e670d0a0909097a756d20496e7465726e6574206b617070656e206b6f6e6e74656e2e20456e7477656465722077617220686965722065696e2065696e6661636865732041637469766558206f6465720d0a09090965696e2053637269707420646172616e20736368756c642e3c62723e0d0a0909093c753e416268696c66653a203c2f753e6465616b746976696572656e20536965204163746976655820756e64204a61766120696d2042726f77736572210d0a090909536965206b6f6d6d656e207a7761722064616e6e206e69636874206d65687220696e2064656e20766f6c6c656e2047656e75737320646572204f6e6c696e6573656974656e2c206a65646f63680d0a0909096b266f756d6c3b6e6e656e205369652073696368657220676568656e2c206461737320736f2065747761732073696368206e69636874206e6f63686d616c7320776965646572686f6c656e20776972642e0d0a090909476573636877656967652064656e6e2c2065732068616e64656c74207369636820756d2065696e205365727665727365697469676573205363726970742061756620504850206f6465720d0a0909094153502e20496e2064696573656d2046616c6c2068696c66742049686e656e206e7572206e6f63682065696e65207370657a69656c6c652046696c746572736f6674776172652e3c2f703e0d0a0909093c703e447572636820656e646c6f73207369636820776965646572686f6c656e64652041747461636b656e206175662064656e205365727665722c0d0a09090977696520416266726167656e2c205374617475732c204563686f7320756e642050696e677320776972642064657220536572766572202675756d6c3b6265726c617374657420756e64207363686c696526737a6c69673b6c6963680d0a0909097a756d204162737475727a2067656272616368742e205a69656c20646162656920697374206d65697374656e732065696e6520766572737465636b74652041626672616765206175660d0a090909536368776163687374656c6c656e20696d2053797374656d2e3c62723e0d0a090909416268696c66656e206769627420657320696d20496e7465726e657420766f6e2064656e204865727374656c6c65726e2073656872207669656c650d0a090909756e642073696e64206d65697374656e7320696e20736f67656e616e6e74656e20536572766963657061636b73206b6f6d706c657474206572682661756d6c3b6c746c6963682e203c2f703e0d0a0909093c703e4175636820536965206b266f756d6c3b6e6e656e202820756e6420616c732041646d696e6973747261746f7220736f6c6c74656e205369652065730d0a0909096b266f756d6c3b6e6e656e2120292067657a69656c746520416268696c66652065696e626175656e3a3c62723e0d0a0909094d69742065696e656d206b6c65696e656e205363726970742028204949533a2056425363726970742c204c696e75783a20556e69782d5363726970740d0a09090929206b266f756d6c3b6e6e656e205369652076657268696e6465726e2c20646173732062657374696d6d74652045726569676e6973736520756e6420416e66726167656e2073696368207a6569746c6963680d0a0909096e6963687420776965646572686f6c656e2062697320646168696e2c206461737320536965206573206e69636874207a756c617373656e2c20736f6c63686520416e66726167656e0d0a090909766f6e20756e6175746f72697369657274656e204950204e756d6d65726e206e69636874206175736765662675756d6c3b6872742077657264656e20642675756d6c3b7266656e2e3c62723e0d0a09090950726f626c656d6174697363686572207769726420657320626569204953502077656e6e204b756e64656e20646f7274206175662064656d0d0a0909095365727665722061756620696872656e207669727475656c6c656e20446f6d61696e7320434749206f646572205363726970746520686162656e2c2077656c63686520616c7320756e7369636865720d0a09090967656c74656e2e204175732064696573656d204772756e6420756e746572736167656e207669656c652049535020696872656e204b756e64656e2064617320696e7374616c6c696572656e0d0a090909766f6e206e696368742076657274726175656e73772675756d6c3b72646967656e20536372697074656e202820426569737069656c3a204368617473637269707465202920203c2f703e);
INSERT INTO `sioux7_study` (`seite_id`, `bereich`, `bild`, `titel`, `descr`) VALUES
(20, 'Sicherheit', '', 'Computerviren', 0x3c703e576f686572206b6f6d6d656e20736f6c63686520566972656e20756e6420776172756d2077657264656e20736f6c636865202675756d6c3b62657268617570740d0a090909656e747769636b656c743f205a752065696e656d205465696c2073696e64206573206f6674206a756e676520456e747769636b6c65722c20646965206d697420696872656e20566972656e0d0a0909094175666d65726b73616d6b656974206572726567656e20776f6c6c656e2e20536f6c63686520506572736f6e656e20776f6c6c656e20696e2064657220526567656c206b65696e656e0d0a0909095363686164656e20766572757273616368656e2c20736f6e6465726e206e757220617566206469652050726f6772616d6d6965726b2675756d6c3b6e737465206175666d65726b73616d206d616368656e2c0d0a090909616c736f2065696e66616368206d616c202248616c6c6f2c20686965722062696e206963682220736167656e2e3c62723e0d0a090909416e64657273206a65646f63682062656920437261636b65726e2e2044757263682045696e7361747a2065696e657320566972757320776972640d0a0909096461732053797374656d206d616e6970756c696572742e205a69656c206973742065732c20536368776163687374656c6c656e20696d2053797374656d207a752065727a657567656e0d0a0909096f6465722028206265692067616e7a2062266f756d6c3b7377696c6c6967656e2029207a75207a65727374266f756d6c3b72656e2e2045732067696274206a65646f6368206175636820456e747769636b6c65722c0d0a090909646965206461662675756d6c3b722062657a61686c742077657264656e212044656e6e20776173206e75747a742065696e20416e7469766972656e70726f6772616d6d2c2077656e6e206573206b65696e650d0a090909566972656e20676962743f20556e64206f686e65206e65756520566972656e2062726175636874206d616e20776f686c206b61756d2073742661756d6c3b6e646967205570646174657320756e640d0a0909096e6575652056657273696f6e656e2e3c62723e0d0a09090947656661687220647572636820456d61696c2c2050726f6772616d6d65206175732064656d20496e7465726e6574206269732068696e0d0a0909097a75204a61766120282042616e6e657277657262756e67206d697420766572737465636b74657220436f64652029206b6f6d6d74206175732064656d20496e7465726e65742c20616265720d0a09090961756368206d6974676562726163687465204469736b657474656e206f646572204344204c6175667765726b65207374656c6c656e2065696e652072696573696765204765666168720d0a0909096461722e204573206973742066617374207363686f6e2065696e652050666c696368742c206461737320617566206a6564656e20526563686e65722065696e6520416e7469766972656e736f6674776172650d0a090909696e7374616c6c6965727420697374213c2f703e),
(21, 'Sicherheit', '', 'Scanner / Sniffer', 0x3c703e4a656465722c20646572206d6974204e65747a7765726b656e20617262656974657420756e6420662675756d6c3b722064696520536963686572686569740d0a0909097a7573742661756d6c3b6e646967206973742c20736f6c6c7465206d696e64657374656e732065696e6573206469657365722050726f6772616d6d65206b656e6e656e3a3c62723e0d0a0909093c756c3e0d0a09090920203c6c693e49534d20662675756d6c3b72204949530d0a09090920203c6c693e534154414e206f646572205341494e5420662675756d6c3b72204c696e75782f556e69780d0a09090920203c2f6c693e0d0a0909093c2f756c3e3c62723e0d0a09090944696573652050726f6772616d6d65206b266f756d6c3b6e6e656e20616c6c6520526563686e657220696d204e65747a7765726b20617566204865727a0d0a090909756e64204e696572656e2070722675756d6c3b66656e2e2053696520657268616c74656e2065696e652064657461696c6c6965727465202675756d6c3b6265727369636874202675756d6c3b6265722064696520536368776163687374656c6c656e0d0a0909096465722065696e7a656c6e656e20526563686e657220696d204e65747a7765726b20756e64206b266f756d6c3b6e6e656e20736f6d69742067657a69656c7420416268696c66652065696e7365747a656e2e3c62723e0d0a09090941626572206175636820756d206d656872202675756d6c3b626572206672656d64652053797374656d6520696e20457266616872756e67207a75206272696e67656e2e0d0a090909462675756d6c3b722065696e656e204861636b6572202f20437261636b6572206973742064696573206a65646f6368206568657220756e67656569676e65742c20646120736f6c63682065696e650d0a090909416b74697669742661756d6c3b7420617566662661756d6c3b6c6c742e2045686520536965206469652056657262696e64756e67206b617070656e206b6f6e6e74656e20686174206d616e205369652065727769736368740d0a090909756e64207374656c6c7420536965207a757220526564652e204b6c65696e65726520546f6f6c7320776965202667743b486f7374266c743b2c202667743b5472616365266c743b2c0d0a0909092667743b4e736c6f6f6b7570266c743b2c206c69656665726e206265737365726520496e666f726d6174696f6e656e206f686e6520646173206469657320676c656963682061756666616c6c656e0d0a090909776972642e205a69656c206973742065732064616265692c20736f207669656c6520496e666f726d6174696f6e656e20776965206e7572206d266f756d6c3b676c696368202675756d6c3b62657220506f7274730d0a090909756e642042656e75747a657220646573205365727665727320756e642064657373656e2053797374656d207a7520657266616872656e2e204d616e6368652053797374656d61646d696e6973747261746f72656e0d0a09090977697373656e206e69636874206d616c20776965207669656c6520506f727473206968722053657276657220756e74657273742675756d6c3b747a742e2044617320697374206a65646f63682050666c69636874210d0a09090957656e6e206e75722065696e65722064696573657220506f727473206f6666656e2069737420756e64206175662044656661756c742065696e67657374656c6c74206973742c2064616e6e0d0a09090969737420696e6e657268616c6220766f6e2053656b756e64656e206465722053657276657220226765637261636b74222e20486f6666656e746c696368207761722065732064616e6e0d0a0909096e75722065696e204861636b657220282069636820766572676562652069686d2c20616265722022616267657a617066746520446174656e2073696e642062697474652061627a75676562656e210d0a0909092920756e64206e696368742065696e20437261636b6572213c2f703e),
(22, 'Sicherheit', '', 'Passwortcracker', 0x3c703e4963682073656c6273742073747566652064696573652041727420766f6e20437261636b206568657220676572696e67662675756d6c3b67696765720d0a09090965696e20616c73205363616e6e65722e205a69656c2062656920646965736572204172742069737420656967656e746c696368206e75722062657374696d6d7465205061737377266f756d6c3b727465720d0a0909097a75206b6e61636b656e2e2048617570747a69656c2064616265692069737420696d6d657220726f6f74202f2041646d696e6973747261746f72206f6465722053757065727669736f722e0d0a09090957656e6e20657320736f6c6368656e2050726f6772616d6d656e2067656c696e67742065696e20646572617274696765732050617373776f7274207a75206b6e61636b656e2c2064616e6e0d0a0909096e65686d652069636820616e2c2064617373206461732050617373776f72742073656872207363686c65636874206765772661756d6c3b686c742077757264652e3c62723e0d0a0909094f62206e756e2064657220566f726e616d6520496872657220467261752c204b696e646573206f64657220467265756e6465732c206175730d0a090909496872656d20486f626279202820417374726f6c6f6769653f29206f646572207363686c696368742065696e2077696368746967657320446174756d2c20736f6c636865205061737377266f756d6c3b727465720d0a09090973696e642073656872206c6569636874207a75206b6e61636b656e20756e64207363686c65636874206765772661756d6c3b686c742e3c62723e0d0a0909092239373032222068617474652064612065696e657220616c732050617373776f72742e20566572737563687377656973652068617474650d0a090909696368206573206d616c2067656b6e61636b7420756e642069686d206d697467657465696c742c207365696e2050617373776f727420646f6368206d616c207a75202661756d6c3b6e6465726e2e0d0a0909094175732073706f6e74616e656e2045696e66616c6c202820656865722053636865727a2029206d65696e7465206963682c206573206b266f756d6c3b6e6e65207369636820756d206469652050494e0d0a0909097365696e6573204b6f6e746f732068616e64656c6e2e20564f4c4c54524546464552212048617474652064657368616c62206265696d20436865662061756368202661756d6c3b726765722062656b6f6d6d656e0d0a090909756e64206d757373746520646965204b6f7374656e20662675756d6c3b722065696e65206e657565204b72656469746b617274652062657a61686c656e2e3c62723e0d0a090909556e6420686965722066696e64656e2053696520646965205061737377266f756d6c3b727465723a3c62723e0d0a0909093c756c3e0d0a09090920203c6c693e57696e646f77732039352f39383a20616c73202a2e70776c20696d2057696e646f77737665727a656963686e69730d0a09090920203c6c693e4e543a207363686f6e206265737365722c207a756d616c206e75722065696e2041646d696e6973747261746f7220617566204e545c2a2e6366670d0a090909097a756772656966656e206b616e6e2e20416265722041636874756e672c2064656e6e20696e20646572205265676973747279207374656874206461732050617373776f7274204b4c415253434852494654210d0a09090920203c6c693e4c696e75783a202f6574632f7061737377642064696520646172756e746572206c696567656e64656e204461746569656e207a750d0a0909090962656b6f6d6d656e20772661756d6c3b6872652065696e205375706572676175646921204c617373656e2053696520646173206e69636874207a75210d0a090909093c2f6c693e0d0a0909093c2f756c3e3c2f703e),
(23, 'Sicherheit', '', 'Trojaner', 0x3c503e4b656e6e656e20536965206469652047657363686963687465206465732054726f6a616e69736368656e20506665726465733f3c42523e496368206d266f756d6c3b636874652049686e656e206b6c6172206162726174656e2c20536f66747761726520766f6e20756e73657269266f756d6c3b73656e204669726d656e206f64657220507269766174706572736f6e656e207a75206b617566656e20756e642061756620496872656e20526563686e6572207a7520696e7374616c6c696572656e2e2045686572206c65676520696368206e6f63682065696e2077656e6967206d656872204b61706974616c2064617a7520756d2065696e6520676c617562772675756d6c3b726469676520536f667477617265207a75206b617566656e2c20616c73206d6963682061756620646965205665726c6f636b756e672065696e65732062696c6c6967656e206f64657220736f676172206b6f7374656e6c6f73656e20546f6f6c732068696e207a7520676562656e2e2045696e20576f72742064617a753a3c42523e542d4f6e6c696e652067616c742062697368657220776567656e2064657220416e6f72646e756e6720766f6e205a61686c656e20756e642053796d626f6c656e20616c73207265636874207369636865722e20426973686572202e2e2e2e2e2e2e2e2e2e3c42523e4269732064616e6e2065696e65732054616765732065696e206b6f7374656e6c6f73657320546f6f6c207a75722042657363686c65756e6967756e67206465722054656c65666f6e76657262696e64756e67206175662064656d204d61726b7420617566746175636874652e20456967656e746c6963682065696e2073656872206775746573205765726b7a6575672c207a756d616c20657320696d6d65722073656872206c616e6765206461756572742c20626973206469652056657262696e64756e672073746568742e3c42523e44616e6e206162657220646572205363686f636b3a3c42523e44617320546f6f6c2073656e64657420616c6c6520446174656e2070657220456d61696c20616e2064656e2050726f6772616d6d696572657221205a756d20476c2675756d6c3b636b20776172656e206573206e7572204861636b65722c2064656e6e20626569646520676162656e207a752c2065696e656e2054726f6a616e657220696d20546f6f6c2065696e676562617574207a7520686162656e20756d207a75207a656967656e2c2064617373206175636820542d4f6e6c696e65202820646965202675756d6c3b62726967656e732064617320546f6f6c2061756368206e6f63682067656c6f627420756e6420656d70666f686c656e20686162656e2029206e69636874206162736f6c757420736963686572206973742e2054726f6a616e65722073696e6420736368776572207a752066696e64656e2c207765696c20646965736520416e682661756d6c3b6e6773656c20696e2042696e2661756d6c3b72636f64652028417373656d626c6572212920676573636872696562656e2073696e6420756e6420736f206b6c65696e2c2064617373206d616e206573206e757220616c7320537570657270726f66692065726b656e6e742e2041756368206963682073656c6273742062696e206461766f72206e69636874206162736f6c75742067657363682675756d6c3b747a742c206a65646f6368206861626520696368206d65696e656e20526563686e657220736f2065696e67657374656c6c742c2064617373206572206e7572206d6974206d65696e65722045696e77696c6c6967756e672073656e64656e20646172662e3c42523e566f72736963687420616c736f20766f7220467265657761726521204265736f6e6465727320766f722030313930204469616c65726e207365692067657761726e742e2045696e2065696e7a696765722054726f6a616e6572206b616e6e206d616e63686d616c206d656872205363686164656e20616e7269636874656e20616c7320566972656e2e3c2f503e),
(24, 'Sicherheit', '', 'Tools zum Schutz', 0x3c703e53656872207669656c65204669726d656e2076657273636877656967656e20626577757373742064696520416e67737420766f7220416e6772696666656e0d0a0909096175732064656e20656967656e656e2052656968656e2e204d6974676562726163687465204469736b657474656e206f64657220434473207374656c6c656e2065696e6520736568720d0a09090967726f26737a6c69673b652047656661687220662675756d6c3b7220556e7465726e65686d656e206461722e204d65697374656e732073696e642065732061756368207665722661756d6c3b726765727465204d697461726265697465722c0d0a09090977656c6368652061757320526163686520646572204669726d61205363686164656e20626569662675756d6c3b67742e203c62723e0d0a090909426569737069656c3a3c62723e0d0a09090945696e2073656974206a616872656c616e672065696e67657374656c6c7465722050726f6772616d6d696572657220756e642053797374656d61646d696e6973747261746f720d0a0909097769726420766f6e20646572204669726d612061757320776972747363686166746c696368656e2047722675756d6c3b6e64656e2067656b2675756d6c3b6e646967742e20446120646965204669726d6120756e662661756d6c3b6869670d0a0909096973742065696e6520416266696e64756e67207a75207a61686c656e2c207769726420646572204d69746172626569746572206672697374676572656368742067656b2675756d6c3b6e646967742e0d0a09090944617320417262656974736765726963687420626566696e6465742064696520676c6569636865205374656c6c756e6720756e642077696c6c69677420646572204b2675756d6c3b6e646967756e670d0a090909696d20766f6c6c656d20556d66616e67207a752e20462675756d6c3b722064656e204d697461726265697465722062656465757465742064696573206a65646f6368207365696e20456e64652e0d0a0909092252616368652069737420732675756d6c3b26737a6c69673b222c20756e67657363686f72656e2077696c6c20646572206568656d616c696765204d69746172626569746572206469657365204669726d61206e696368740d0a0909097665726c617373656e20756e642073696e6e74206175662065696e656e206175736765742675756d6c3b6674656c74656e205261636865706c616e2e204461206572206465727a656974206e6f63680d0a090909766f6c6c656e205a75677269666620617566206461732053797374656d206861742c20626175742065722065696e20706161722050726f6772616d6d65206f6465722048696e746572742675756d6c3b72656e0d0a09090965696e2e20446965736520616b74697669657274206572206e6f6368206e6963687420772661756d6c3b6872656e64207365696e657220226e6f63682220417262656974737a6569742e2044616e6e0d0a090909616265722069737420657320736f7765697420756e6420657220616b74697669657274206461732050726f6772616d6d2061757320646572206665726e6520756e65726b616e6e742e0d0a090909446965204669726d61206d757373206175732064696573656d204772756e64204b6f6e6b75727320616e6d656c64656e2c20646120646173206b6f6d706c65747465204e65747a7765726b0d0a0909097a65727374266f756d6c3b72742069737420756e6420646965204b6f7374656e207a756d20576965646572617566626175207a7520686f63682073696e642e3c62723e0d0a09090941626572206e69636874206e757220736f6c63686520462661756d6c3b6c6c652073696e64206175737363686c6167676562656e642c20736f6e6465726e0d0a09090961756368204d697461726265697465722c2064656e656e2064696520476566616872206175732064656d20496e7465726e6574206f646572206d69746765627261636874656e204469736b657474656e0d0a09090965696e66616368206e6963687420626577757373742073696e642e205363686f6e2065696e2065696e7a69676572205669727573206b616e6e2065696e206b6f6d706c65747465730d0a0909094e65747a7765726b206c61686d206c6567656e2e204269732064657220566972757320656e746665726e7420777572646520756e6420646965204e65747a7765726b742661756d6c3b7469676b656974656e0d0a0909097769656465722061756667656e6f6d6d656e2077657264656e206b266f756d6c3b6e6e656e2076657267656874207669656c205a6569742c2077617320662675756d6c3b7220646965204669726d612065696e0d0a090909656e6f726d6572205665726c757374206461727374656c6c742e3c62723e0d0a0909095374656c6c656e20536965206b6c6172652052696368746c696e69656e20662675756d6c3b722064656e204d697461726265697465722061756620756e640d0a090909666f726465726e205369652065696e6520536368756c756e6720766f6d2065696e67657374656c6c74656e204d697461726265697465722e20476562656e20536965206e696368740d0a090909676c6569636820616c6c6520526573736f757263656e20667265692c20736f6e6465726e206e757220736f6c6368652c2077656c63686520646572204d6974617262656974657220617563680d0a0909097769726b6c69636820627261756368742e3c62723e0d0a090909556d2065696e206b6c6172657320566572682661756d6c3b6c746e6973207a7520736368616666656e2c20656d706665686c65206963682049686e656e0d0a090909666f6c67656e6465733a3c62723e0d0a0909093c756c3e0d0a09090920203c6c693e5374656c6c656e20536965206b6c61726520736368726966746c696368652052696368746c696e69656e2061756620756e64206d616368656e0d0a090909095369652064656e204d6974617262656974657220646172617566206175666d65726b73616d0d0a09090920203c6c693e4265736368722661756d6c3b6e6b656e205369652064656e205a75677269666620617566206469656a656e6967656e2c2064696520676c617562772675756d6c3b726469670d0a09090909756e6420657266616872656e2073696e640d0a09090920203c6c693e496e7374616c6c696572656e205369652061756620616c6c656e20526563686e65726e20696d204e65747a7765726b20546f6f6c730d0a090909097a756d2053636875747a20766f6e204861726420756e6420536f6674776172650d0a09090920203c6c693e456d706665686c656e737765727420662675756d6c3b722064696520436c69656e747320697374204e54206162205048502e30206d6974206b6c6172656e0d0a09090909566f7265696e7374656c6c756e67656e200d0a09090920203c6c693e426175656e2053696520696d20526563686e657220646573204d6974617262656974657273206e757220736f6c636865204b6f6d706f6e656e74656e0d0a0909090965696e2c20646965206765627261756368742077657264656e0d0a090909093c2f6c693e0d0a0909093c2f756c3e3c62723e0d0a090909426569737069656c3a3c62723e0d0a09090945696e204d6974617262656974657220646572204669726d61206272617563687420662675756d6c3b7220646965202675756d6c3b62657274726167756e67207365696e65720d0a0909094275636868616c74756e677362696c616e7a656e2065696e204d6f64656d2e205374656c6c656e20536965207369636865722c206461732064696573657220526563686e65722c20616e0d0a09090964656d2064696520446174656e202675756d6c3b62657274726167656e2077657264656e20736f6c6c656e206e6963687420616d204e65747a7765726b2067656b6f7070656c74206973742e202675756d6c3b6265720d0a09090964696573656e20526563686e6572206b266f756d6c3b6e6e7465206d616e20736f6e7374206f686e652067726f26737a6c69673b65205363687769657269676b656974656e20696e204968722053797374656d0d0a09090965696e6472696e67656e20756e6420616e20776963687469676520446174656e2067656c616e67656e2e204441544556207a756d20426569737069656c207665726269657465742065730d0a09090964656e204669726d656e2c20736f6c636865204162726563686e756e6773636f6d707574657220616e2064617320696e7465726e65204e65747a7765726b207a75206b6f7070656c6e2e3c62723e0d0a0909094a65646572204d6974617262656974657220696e20646572204669726d612062656b6f6d6d74206a65206e6163682064656e204572666f726465726e697373656e0d0a09090965696e656e20526563686e65722062657265697467657374656c6c742c2077656c6368657220766f6e2049686e656e206f6465722064656d2041646d696e6973747261746f7220766f7265696e67657374656c6c740d0a090909756e64206d697420616c6c656e206572666f726465726c696368656e2050726f6772616d6d656e2065696e676572696368746574206973742e2045696e204d697461726265697465722c0d0a0909096465722077656974657265206265736f6e6465726520572675756d6c3b6e73636865206861742c206d7573732064696573206265692049686e656e206f6465722064656d2041646d696e6973747261746f720d0a0909096265616e74726167656e2e204f686e65206469652045696e77696c6c6967756e6720766f6e2049686e656e20736f6c6c7465206b65696e204d6974617262656974657220736963680d0a09090973656c627374207a752064696573656e2053636872697474206265667567742068616c74656e2e3c62723e0d0a090909446965736520546f6f6c7320736f6c6c74656e2061756620616c6c656e20436c69656e747320766f7268616e64656e207365696e3a3c62723e0d0a0909093c756c3e0d0a09090920203c6c693e53797374656d3a204c696e7578206f646572204e5420436c69656e74206162205048502e30206d697420766f7265696e67657374656c6c74656e0d0a0909090952696368746c696e69656e0d0a09090920203c6c693e416e7469766972656e736f6674776172650d0a09090920203c6c693e4861726477617265206e757220696d206572666f726465726c696368656e20556d66616e672028206b65696e65204d6f64656d7320290d0a09090920203c6c693e4261636b75706d266f756d6c3b676c6963686b656974202820626569204e5420696e746567726965727420290d0a09090920203c6c693e566f7265696e67657374656c6c7465205365727665727a75677269666620756e6420446174656e7370656963686572756e670d0a09090920203c2f6c693e0d0a0909093c2f756c3e3c62723e0d0a0909094465722041646d696e6973747261746f72202675756d6c3b626572776163687420616c6c6520542661756d6c3b7469676b656974656e20696d204e65747a7765726b0d0a090909756e64206d656c646574207a77656966656c68616674652045726569676e697373652064656d20566f7267657365747a74656e2e204162657220617563682065722073656c6273740d0a0909096d75737320616b7a657074696572656e2c20646173206572202675756d6c3b626572776163687420776972642e3c62723e0d0a09090945696e204d697461726265697465722c2077656c636865722064617320496e7465726e6574206e75747a742c20736f6c6c746520656e74737072656368656e64650d0a0909094772756e646b656e6e746e69737365202675756d6c3b6265722064696520416e77656e64756e6720756e6420476566616872656e2064657320496e7465726e6574732042657363686569642077697373656e2e0d0a090909204973742064696573206e69636874206465722046616c6c2c20736f206973742065696e652068617573696e7465726e6520536368756c756e67206e6f7477656e6469672e3c62723e3c2f703e),
(25, 'Sicherheit', '', 'Firewall', 0x3c703e2246657565726d61756572222c206469652046657565727765687220646573204e65747a7765726b657320736f6c6c2076657268696e6465726e2c0d0a0909096461737320756e626572656368746967746520506572736f6e656e2061756620446174656e204968726573204e65747a7765726b6573205a75677269666620686162656e2e204265736f6e646572730d0a090909736f6c6c20646572204669726577616c6c2076657268696e6465726e2c206461737320506572736f6e656e206175732064656d20496e7465726e6574206265692049686e656e2065696e6472696e67656e2e0d0a09090941626572206e69636874206e757220766f722064656d2045696e6472696e67656e207363682675756d6c3b747a7420646572204669726577616c6c2c20736f6e6465726e206175636820696d20656967656e656e0d0a0909094e65747a7765726b206b266f756d6c3b6e6e656e206d69742064696573656d20546f6f6c2052696368746c696e69656e206175666765626175742077657264656e2e2050726f6772616d6d652c0d0a09090964696520536572766572736569746967206c617566656e2c20776965207a756d20426569737069656c204d6963726f736f6674204f666669636520456e74657270726973652056657273696f6e2c0d0a0909096b266f756d6c3b6e6e656e206d69742064656d204669726577616c6c20736f2067657363682675756d6c3b747a742077657264656e2c20646173206e757220626572656368746967746520506572736f6e656e0d0a0909095a7567726966662061756620646965736520416e77656e64756e6720686162656e2e3c62723e0d0a09090944696573207374656c6c74206a65646f63682065696e65207365687220686f6865204175666761626520616e2064656e2041646d696e6973747261746f722c0d0a09090964656e6e206572206d75737320732661756d6c3b6d746c696368652052696368746c696e69656e20662675756d6c3b72206a6564656e204d6974617262656974657220646573204e65747a7765726b65732065696e7374656c6c656e0d0a090909756e642074657374656e2e3c62723e0d0a09090945696e2066616c7363682065696e6765726963687465746572204669726577616c6c207363682675756d6c3b747a7420536965206e69636874206d6568722c0d0a090909736f6e6465726e207374656c6c7420736f6761722065696e65206e6f63682068266f756d6c3b6865726520476566616872206461722e204265766f7220536965207369636820656e74736368656964656e0d0a090909696e20496872656d204e65747a7765726b2065696e656e204669726577616c6c2065696e207a75207269636874656e2c20736f6c6c74656e20536965206f646572206465722041646d696e6973747261746f720d0a090909736963682067656e6175657374656e73202675756d6c3b626572206469652041727420756e6420576569736520646573204669726577616c6c7320696e666f726d696572656e2e203c62723e0d0a09090945696e657220646572207072656973672675756d6c3b6e737469677374656e20756e642073656872206c6569636874207a752076657273746568656e64656e0d0a0909094669726577616c6c7320697374205a6f6e65416c61726d2e204469657365732050726f6772616d6d20726567697374726965727420616c6c652050726f6772616d6d6520756e64205a756772696666650d0a0909096175746f6d6174697363682c20642e682e20536965206f646572206465722041646d696e6973747261746f72206d2675756d6c3b7373656e20646965205a75677269666665206e7572206e6f63680d0a09090967656e65686d6967656e206f6465722061626c65686e656e2e203c62723e0d0a090909446572204669726577616c6c207769726420696e2064657220526567656c206e7572206175662064656d2053657276657220696e7374616c6c696572742c0d0a0909096175662064656e20646173206b6f6d706c65747465204e65747a7765726b207a756772656966742e2044696520766f72676568656e7377656926737a6c69673b652064657220536f6674776172650d0a0909096973742065696e66616368207a752076657273746568656e3a3c62723e0d0a09090944696520706572205443502f495020616e2064656e2053657276657220676572696368746574656e20416e66726167656e2077657264656e0d0a090909766f6d204669726577616c6c20696d20436f6d70696c6572206175662064657373656e20476c617562772675756d6c3b726469676b6569742068696e20676570722675756d6c3b66742e20486174206465720d0a0909097a756772656966656e646520526563686e65722064696520426572656368746967756e672c20736f20646172662064696573657220526563686e65722064696520416e77656e64756e670d0a0909097374617274656e2e20416e6465726e66616c6c7320776972642064696520416e667261676520616267656c65686e742c2070726f746f6b6f6c6c6965727420756e642064656d20616e66726167656e64656e0d0a090909526563686e6572206d697467657465696c742c2064617320646572205a75677269666620766572776569676572742077757264652e3c62723e0d0a0909094669726577616c6c732073696e64206562656e66616c6c732061756620526f7574657220756e6420696e74656c6c6967656e74656e20485542730d0a090909207a752066696e64656e2c2064696520766f6e2049686e656e20656e747765646572207065722054656c656e6574206f6465722042726f7773657220616e67657370726f6368656e0d0a09090977657264656e206b616e6e2e20446f7274206b266f756d6c3b6e6e656e205369652064656e204669726577616c6c20736f2065696e7374656c6c656e2c207769652053696520657320736963680d0a090909772675756d6c3b6e736368656e2e3c2f703e),
(26, 'Sicherheit', '', 'Arbeitsplatz / Software', 0x3c703e476567656e2675756d6c3b6265722065696e656e206e65752065696e67657374656c6c74656e204d6974617262656974657220697374206d616e206f66740d0a0909097365687220736b657074697363682e2044696573652041626c65686e756e67206973742061756368206f66742065696e652070737963686f6c6f6769736368652042656c617374756e670d0a090909662675756d6c3b722064656e206e6575656e204d697461726265697465722c207a756d616c206572206d6974206775746572204162736963687420696e20646572204669726d6120626567696e6e656e0d0a09090977696c6c2e20416e676566616e67656e20766f6e2052656368747362656c656872756e67656e2c2068617566656e77656973652056657274722661756d6c3b67656e2c2064696520646173206e75747a656e0d0a09090964657320496e7465726e657473207a7520707269766174656e205a7765636b656e20756e746572736167742c206269732068696e207a7520446174656e73636875747a6d6173736e61686d656e2c0d0a09090977656c63686520646173206b6f70696572656e20756e64206d69746e65686d656e20766f6e204669726d656e7370657a696669736368656e20446174656e20626569205374726166650d0a090909756e746572736167656e2e2044656d206e6575656e204d6974617262656974657220736f6c6c74652064696573206b6c6172207365696e2c20646173206175662049686e20696e206465720d0a09090965727374656e205a65697420696e20646572204669726d612065696e206265736f6e646572657220447275636b206c696567742e20446965204669726d612069737420776567656e0d0a09090964656e2068657262656e20522675756d6c3b636b7363686c2661756d6c3b67656e20646572206c65747a74656e205a65697420756e64206465722073636877616368656e204b6f6e6a756e6b747572206f66740d0a0909092675756d6c3b626572736b6570746973636820756e6420206d69737374726175697363682e2044696573206c65677420736963682065727374206e61636820576f6368656e206465722045696e6172626569742e3c62723e0d0a090909446173206d757373206a65646f6368206e69636874207365696e2c2077656e6e20646965204669726d6120766f6e20416e66616e6720616e0d0a09090961756368206469652072696368746967656e205363687269747465207a75722045696e7269636874756e672065696e6573206e6575656e2041726265697473706c61747a6573206d616368656e0d0a0909096b266f756d6c3b6e6e74652e205a752064656e20417566676162656e20646572204669726d6120676568266f756d6c3b72742065732c2064656e206e6575656e204d697461726265697465722c20646572206175730d0a09090965696e6572205669656c7a61686c20766f6e204d697462657765726265722065726e616e6e742077757264652c20766f6e20416e66616e6720616e2065696e20616e67656e65686d65730d0a09090942657472696562736b6c696d61207a7520676562656e2e3c62723e0d0a090909556d2064696573207a752065727265696368656e20697374206e69636874207669656c20417262656974206e6f7477656e6469672c20776972640d0a090909736963682061626572206c6f686e656e3a3c62723e0d0a0909093c756c3e0d0a09090920203c6c693e496e7374616c6c6174696f6e2064657320526563686e657273206d6974204e5420436c69656e74205048502e3020756e642045696e7269636874656e0d0a09090909646573204e65747a7765726b657320696e6b6c7573697665205a7567726966660d0a09090920203c6c693e496e7374616c6c6174696f6e2064657220546f6f6c730d0a09090920203c6c693e496e7374616c6c6174696f6e20616c6c6572206572666f726465726c696368656e20536f667477617265200d0a09090920203c6c693e5a756d2041627363686c7573733a2045696e7269636874656e20646572205a75677269666673726563687465206175662064656d0d0a090909095365727665722c20526f7574657220756e64204669726577616c6c0d0a090909093c2f6c693e0d0a0909093c2f756c3e3c62723e0d0a09090949737420646965732065727265696368742c2062726175636874207369636820646965204669726d61206568726c696368206e696368740d0a090909676c65696368207a75207669656c6520536f7267656e206d616368656e2e20416c6c65205a7567726966666520646573204d69746172626569746572732077657264656e2070726f746f6b6f6c6c696572742e0d0a0909093c62723e0d0a0909094175662064656d20526563686e657220736f6c6c7465206d696e64657374656e7320616c6c6520662675756d6c3b722064656e206e6575656e204d697461726265697465720d0a0909096e6f7477656e646967656e2050726f6772616d6d6520766f72696e7374616c6c69657274207365696e2e3c62723e0d0a090909426569737069656c3a2050726f6772616d6d69657265723c62723e0d0a0909094963682073656c62737420616c732050726f6772616d6d696572657220766f6e20496e7465726e6574616e77656e64756e67656e206d69740d0a090909446174656e62616e6b6b6f70706c756e6720686162652065696e656e207365687220686f68656e2042656461726620616e20536f6674776172652e203c62723e0d0a0909093c756c3e0d0a09090920203c6c693e4d532056697375616c53747564696f206b6f6d706c657474207a7572204265617262656974756e6720646572205363726970746520756e6420456e747769636b6c756e67656e0d0a09090920203c6c693e4d53204f6666696365206b6f6d706c6574740d0a09090920203c6c693e566572736368696564656e6520672661756d6c3b6e676967652042726f777365720d0a09090920203c6c693e446174656e62616e6b7365727665722c2073657061726174206f64657220646972656b7420696e7374616c6c696572740d0a09090920203c6c693e5765625365727665722c2073657061726174206f6465722061756620526563686e657220696e7374616c6c696572742c2064616d69740d0a0909090964696520416e77656e64756e67656e20676570722675756d6c3b66742077657264656e206b266f756d6c3b6e6e656e0d0a09090920203c6c693e566572736368696564656e6520546f6f6c73207a7572204f6e6c696e657374656c6c756e670d0a09090920203c6c693e566f6c6c656e205a756772696666206175662064617320496e7465726e65740d0a09090920203c6c693e4261636b75706d266f756d6c3b676c6963686b6569740d0a09090920203c6c693e447275636b65720d0a09090920203c6c693e4576656e7475656c6c202065696e2047726166696b70726f6772616d6d202820436f72656c44726177290d0a09090920203c2f6c693e0d0a0909093c2f756c3e3c62723e3c2f703e),
(27, 'Sicherheit', '', 'Schulungen', 0x3c703e4573207374656c6c742073696368206f667420696e204669726d656e206469652046726167652c206f622064617320506572736f6e616c0d0a09090965696e652067657a69656c746520536368756c756e67206265646172662e2044696573657320467261676520697374207365687220776963687469672c2064656e6e2077656e6e205369650d0a090909626572656974732065696e65204669726d61206d697420496e7472616e657420686162656e20756e64206e756e20617563682064617320496e7465726e6574206e75747a656e20776f6c6c656e2c0d0a090909697374206e756e20646965204672616765206f6666656e2c206f622064617320506572736f6e616c2076657273746568742c20776965206d616e2064617320496e7465726e657420756e640d0a090909766f7220616c6c656d20456d61696c70726f6772616d6d652062656e75747a742e3c62723e0d0a0909094d65697374656e732077697373656e20646965204d69746172626569746572206175732064656d20707269766174656e20426572656963680d0a090909686965722675756d6c3b62657220426573636865696420756e6420646f6368206e696368742067656e61752c2064656e6e2064696520476566616872206175732064656d20496e7465726e65740d0a09090977697264206d65697374656e73206e6963687420726963687469672065726b616e6e742e20457320697374206e756e207a77696e67656e64206e6f7477656e64696720646173206b6f6d706c657474650d0a090909506572736f6e616c2065696e657220536368756c756e67207a7520756e7465727a696568656e2e203c62723e0d0a0909094e75747a656e2053696520686965727a752065696e2070726f66657373696f6e616c657320556e7465726e65686d656e2c20736f20776972640d0a090909646965732072656368742074657565722e20536965206b266f756d6c3b6e6e656e206a65646f636820617563682064656e206265692049686e656e20616e67657374656c6c74656e2041646d696e6973747261746f720d0a0909096d697420646965736572204175666761626520626574726575656e2e204175732064656d20496e7465726e6574206b616e6e206d616e206c656963687420426573636872656962756e67656e0d0a090909756e64204c6568726d6174657269616c206265736f7267656e2e2044696520536368756c756e672064617565727420696e2064657220526567656c206e696368742073656872206c616e67652e3c62723e0d0a090909426569737069656c3a20616c6c67656d65696e652045696e77656973756e67207a7572204e75747a756e672064657320496e7465726e6574730d0a090909756e6420456d61696c70726f6772616d6d733c62723e0d0a0909093c756c3e0d0a09090920203c6c693e50726f20536368756c756e67206d6178696d616c2035205465696c6e65686d6572202820736f6e73742077697264206573207a750d0a09090909656e6720756d2064656e20504320290d0a09090920203c6c693e566f7267656665727469677465204e6163687363686c616762726f7363682675756d6c3b72656e0d0a09090920203c6c693e313020626973203135204d696e7574656e2070726f20536368756c756e670d0a09090920203c6c693e766f7267656665727469677465722056657274726167202675756d6c3b62657220646965204e75747a756e672064657320496e7465726e6574730d0a09090920203c2f6c693e0d0a0909093c2f756c3e3c62723e0d0a090909416e68616e642065696e657320566f72662675756d6c3b6872726563686e65727320776972642067657a656967742c20776965206a65646572206461730d0a090909496e7465726e6574207374617274656e20756e64206e75747a656e206b616e6e2c20736f7769652077696520456d61696c732061626765727566656e2077657264656e20756e64206265616e74776f727465742c0d0a090909627a772e206e6575652065727374656c6c656e206d7573732e204665726e65722077697264206175662064696520616c6c67656d65696e6520476566616872206175732064656d20496e7465726e65740d0a0909096175666d65726b73616d2067656d616368742e20426569206265656e64656e2064657220536368756c756e67206572682661756d6c3b6c74206a65646572205465696c6e65686d65722042726f7363682675756d6c3b72656e0d0a0909097a756d205468656d612e204a65646572205465696c6e65686d657220736f6c6c746520616e7363686c696526737a6c69673b656e642064696520566572747261677362657374696d6d756e67206465720d0a0909094669726d6120756e7465727a656963686e656e2c2077656c636865206c656469676c6963682065696e69676520466f726d616c69742661756d6c3b74656e207a7572204e75747a756e67206465730d0a0909094669726d656e656967656e656e20496e7465726e6574616e7363686c757373657320656e74682661756d6c3b6c742e3c62723e0d0a0909094b6f6d706c697a69657274657220776972642065732062656920536368756c756e67656e20696e2050726f6772616d6d696572756e672c0d0a09090941646d696e697374726174696f6e20756e642056657277616c74756e672e20446965736520536368756c756e67656e206b266f756d6c3b6e6e656e206e7572206475726368207175616c6966697a69657274650d0a09090946616368706572736f6e656e20766f7267656e6f6d6d656e2077657264656e2e2057656e64656e20536965207369636820696e2064696573656d2046616c6c20616e20646173207a7573742661756d6c3b6e646967650d0a09090941726265697473616d742e3c2f703e),
(28, 'Netzwerk', 'netzwerk1.jpg', 'Einf&uuml;hrung', 0x3c503e556d204e65747a7765726b652076657273746568656e207a75206b266f756d6c3b6e6e656e2c2062656461726620657320686575747a7574616765206b61756d206e6f6368207669656c2057697373656e2e2044616e6b204d6963726f736f667420756e642064656e206e6575656e20546563686e6f6c6f6769656e20646572204d6f6465726e652069737420657320666173742065696e204b696e646572737069656c2c204e65747a7765726b65207a7520626175656e2e20576173206d616e2064617a7520627261756368742c20697374206e69636874207669656c3a3c2f503e0d0a3c554c3e0d0a3c4c493e5365727665723c2f4c493e0d0a3c4c493e436c69656e74733c2f4c493e0d0a3c4c493e4e65747a7765726b617274656e202f204855423c2f4c493e0d0a3c4c493e50617463686b6162656c203c2f4c493e3c2f554c3e0d0a3c503e536368776965726967657220776972642065732c2077656e6e206d616e2073696368657265204e65747a7765726b65206d697420446174656e62616e6b7365727665722c2057656273657276657220756e64204669726577616c6c20626175656e2077696c6c2e2044617a752069737420646965204b656e6e746e697320266f756d6c3b62657220766572736368696564656e6520416e77656e64756e67656e2c20546f706f6c6f6769656e20756e6420766f7220616c6c656d2050726f746f6b6f6c6c65206e6f7477656e6469672e203c2f503e0d0a3c503e446f6368206973742064617320736f67656e616e6e746520466163686a6172676f6e206465722041646d696e6973747261746f72656e206d65697374656e7320726563687420266f756d6c3b6265727472696562656e2c2064656e6e207a752073636877657220697374206573206e756e206175636820776965646572206e696368742e204265736f6e64657273206f6674207072616c6c656e2041646d696e6973747261746f72656e206d69742064656e20736f67656e616e6e74656e2064726569204275636873746162656e2042656772696666652c20776f20646f6368206e6963687473207765697465722068696e74657220737465636b7420616c732065696e20656e676c69736368657220426567726966662066266f756d6c3b722065696e652050726f746f6b6f6c6c206f646572204e65747a7765726b73797374656d6172742e203c2f503e0d0a3c503e576965206c6569636874206573206973742065696e204e65747a7765726b207a7520626175656e2c20736f6c6c206869657220647267657374656c6c742077657264656e2e20556e64206573206b6c617070742062657374696d6d742c2077656e6e206e6963687420676c65696368206265696d2065727374656e206d616c2c20736f20646f6368206265696d206e266f756d6c3b63687374656e20416e6c6175662e203c2f503e),
(29, 'Netzwerk', '', 'Server', 0x3c503e446572205365727665722069737420646173204865727a20756e642047656869726e20646573204e65747a7765726b65732e2048696572206c617566656e20616c6c6520446174656e207a7573616d6d656e2c20766f6e2068696572207769726420616c6c65732076657277616c74657420756e64206b6f6e74726f6c6c696572742e204f686e652064656e205365727665722069737420646173204e65747a7765726b20656865722065696e206865727a6c6f7365205665726b6f70706c756e67202264756d6d65722220526563686e65722e203c2f503e0d0a3c503e576173206162657220737465636b742068696e7465722064656d2042656772696666202253657276657222203f3c2f503e0d0a3c503e446173206973742065696e65205361636865206f686e65207669656c6520576f7274652e2045732068616e64656c742073696368206d65687220756d2065696e656e206d6974206e6f6368206265736572657220536f66747761726520617573676573746174746574657220526563686e65722c206562656e20736f2077696520536965206573206b656e6e656e2e204175662064696573656d20526563686e6572206c617566656e206a65646f6368206b65696e652050726f6772616d6d6520662675756d6c3b72204d756c74696d656469612c20736f6e6465726e2067657a69656c7465202675756d6c3b62657277616368756e677370726f746f6b6f6c6c6520662675756d6c3b7220646173204e65747a7765726b2e266e6273703b205a756d65697374206973742064657220536572766572206e75722065696e20526563686e6572206d69742067726f737365722046657374706c617474656e6b6170617a69742661756d6c3b742c20776f20616c6c6520446174656e206175732064656d204e65747a7765726b2067657370656963686572742077657264656e2c20642e682e266e6273703b20536572766572206265646575746574207a7520646575747363682053706569636865722c2042657363682675756d6c3b747a65722e203c2f503e0d0a3c503e4d65697374656e73206e696d6d74206d616e20616e2c206461732064657220536572766572206175737363686c696573736c696368207a752064696573656d205a7765636b65206765626175742077757264652c207761732061756368206e6963687420736f2066616c736368206973742e20446f63682064657220536572766572206b616e6e206d65687220616c732064696520436c69656e74732c2065722076657268696e6465727420756e62657265636874696774656e205a7567726966662c2065727374656c6c74206175746f6d61746973636865204261636b757073202675756d6c3b626572204e616368742c2070726f746f6b6f6c6c696572742064696520542661756d6c3b7469676b656974656e20616c6c657220436c69656e747320696d204e65747a7765726b20756e64207669656c6573206d6568722e20446572205365727665722069737420616c736f2065696e652041727420224269672042726f746865722220696d204e65747a7765726b2e3c2f503e0d0a3c503e5a7567726966662062656b6f6d6d74206d616e207a756d20536572766572206e75722c2077656e6e206d616e206469652052656368746520657268616c74656e206861742c20646965206465722056657277616c74657220646573205365727665727320616e6c6567742e266e6273703b204469657365205a756772696666737265636874652073696e64206578616b7420766572676562656e2c20642e682e206e69636874206a656465722068617420736f676c6569636820766f6c6c656e205a7567726966662061756620616c6c6520446174656e2064657320536572766572732e203c2f503e0d0a3c503e4a65646f6368206c2661756d6c3b73737420736963682064657220536572766572206e69636874206e757220616c7320537065696368657220662675756d6c3b7220446174656e206e75747a656e2c20736f6e6465726e2061756368206265692067657a69656c7465722045696e7269636874756e6720616c7320576562536572766572206f64657220446174656e62616e6b736572766572206d6974204d532053514c206f646572204d532045786368616e67652e266e6273703b203c2f503e),
(30, 'Netzwerk', '', 'Clients', 0x3c503e57617320737465636b742068696e746572206465722042657a656963686e756e672022436c69656e74223f3c2f503e0d0a3c503e4e69636874732077656974657220616c732065696e6520616e646572652042657a656963686e756e6720662675756d6c3b7220496872656e20526563686e65722e20436c69656e7420697374206e75722065696e20426567726966662c2064656e206d616e20616e77656e6465742c2077656e6e20736963682065696e20526563686e6572202675756d6c3b62657220646173204e65747a7765726b20616e2064656e2053657276657220616e6d656c6465742e204265692064696573657220416e6d656c64756e6720616e2064656e2053657276657220776972642064656d20436c69656e74206d697467657465696c742c20776173206572206461726620756e64206175636820736f6c6c2e20476c656963687a65697469672070722675756d6c3b667420646572205365727665722064656e20436c69656e74206175662064657373656e20456967656e736368616674656e2068696e2c206f62206469652045696e7374656c6c756e67656e20736f2067656d616368742077757264656e2c207769652065732064657220536572766572207665726c616e67742e2057656e6e206e696368742c2064616e6e2077697264206573206b65696e204c6f67696e20676562656e2e3c2f503e0d0a3c503e5769652053696520496872656e20526563686e657220617566626175656e2c2061757374617474656e20756e642077656c63686520536f6674776172652053696520616c6c657320696e7374616c6c6965727420686162656e2c206461737320682661756d6c3b6e677420766f6e206465722054617473616368652049687265732042656461726665732061622e204a65646f63682077697264206d65697374656e732c20736f2077696520626569737069656c73776569736520626569204d69726f736f66742c206e6562656e62656920676570722675756d6c3b66742c206f6220646965206265692049686e656e20696e7374616c6c696572746520536f66747761726520617563682072656368746c696368206572776f7262656e20777572646520756e64206b65696e6520526175626b6f706965206973742e203c2f503e0d0a3c503e4265692065696e656d206572666f6c677265696368656e204c6f67696e20696e2064656e20536572766572206b266f756d6c3b6e6e656e205369652064656e20536572766572206a65206e6163682064656e20766572676562656e656e205265636874656e20616c732053706569636865722c20446174656e62616e6b736572766572206f64657220447275636b736572766572206e75747a656e2e204461722675756d6c3b6265722068696e617573206b266f756d6c3b6e6e656e2053696520736568656e2c2077656c63686520526563686e6572206e6f636820696d204e65747a7765726b20617262656974656e2e2057656e6e204175662064696573656e20526563686e65726e205665727a656963686e69737365206f64657220447275636b657220667265696765676562656e2077757264656e2c206b266f756d6c3b6e6e656e20536965206175636820646172617566207a756772656966656e206f646572206175662064656d20447275636b6572206e6562656e616e20647275636b656e2e3c2f503e0d0a3c503e266e6273703b3c2f503e),
(31, 'Netzwerk', '', 'Verbindungen', 0x3c503e53657276657220756e6420436c69656e74732073696e64206665727469672065696e676572696368746574206d697420616c6c656e206572666f726465726c696368656e2045696e7374656c6c756e67656e20756e6420536f6674776172652e204e756e207374656c6c742073696368206469652073636877696572696773746520467261676520646572204e65747a7765726b746f706f6c6f6769652e203c2f503e0d0a3c503e4e6f726d616c657277656973652073696e64206465727a65697420616c7465205665726b61626c756e67656e206d697420424e43204b6162656c20746f74616c206f75742c207a756d616c2065732073656872206f6674207a75204b6f6c6c6f73696f6e656e20756e6420416273742675756d6c3b727a65206b6f6d6d742e205a7572205a656974206e75747a74206d616e206661737420696d6d6572204661737445746865726e6574206d69742048554220756e642050617463686b6162656c2e20576173206162657220737465636b7420646168696e7465723f3c2f503e0d0a3c503e5669656c20756e6420646f6368206e6963687473207765697465722c20616c732064617373206d616e206e756e2065696e65204c266f756d6c3b73756e6720662675756d6c3b7220646965205665726c6567756e6720646572204b6162656c20626573736572206f7267616e6973696572656e206b616e6e2e20536f207761722062697368657220696d6d657220646173206772266f756d6c3b737374652050726f626c656d2065696e6573204e65747a7765726b6573206469652072696368746967652052656968656e666f6c67652064657220526563686e6572206269732068696e207a756d20456e6477696465727374616e642e204461626569206b616d20657320696d6d65722077696564657220766f722c206461732065696e69676520526563686e657220696d204e65747a7765726b206e6963687420676566756e64656e2077657264656e2e2041756368207a7520446174656e6b6f6c6c6f73696f6e656e2c2064696520646172617566206265727568656e2c20646173207a77656920526563686e6572207a75722073656c62656e205a6569742073656e64656e2c206b616d2065732066617374207a75206f66742e204f62656e647265696e2069737420646965207665726c6567756e672064657220424e43204b6162656c2073656872207363687765722e203c2f503e0d0a3c503e44617320686174206e756e2065696e20456e6465206d69742064657220546563686e6f6c6f67696520646573204661737445746865726e65742e20537461747420424e432077697264206e756e2065696e20747769737465642070616972204b6162656c2062656e75747a742e2044696520526563686e65722077657264656e20646972656b7420766f6e20646572204e65747a7765726b6b61727465206d69742064656d204855422076657262756e64656e2e204661737420737465687420656967656e746c696368206e7572206461766f722c207765696c206573206562656e2065726865626c696368207363686e656c6c6572206973742c20616c7320616c746520546f706f6c6f6769656e2e2044617320485542206861742064696520417566676162652c204b6f6c6c6f73696f6e656e207a75722076657268696e6465726e2e20446173206973742064657368616c622065696e666163686572206765776f7264656e2c207765696c2064696520446174656e206e69636874206d65687220766f6e20526563686e6572207a7520526563686e657220626973207a756d20416e6672616765726563686e6572206c617566656e2c20736f6e6465726e20646972656b742e203c2f503e0d0a3c503e416265723a206461732067616e7a652066756e6b74696f6e69657274206e6f6368206e6963687420726963687469672c2064656e206573206665686c74206574776173207365687220776963687469676573213c2f503e),
(32, 'Netzwerk', '', 'IP Adressen', 0x3c503e53696520686162656e20616c6c65732061756667656261757420756e642065696e6765726963687465742c207665726b6162656c7420756e642076657262756e64656e2c20616265722064616e6e207374656c6c656e2053696520666573742c20646173732064696520526563686e65722073696368206e696368742066696e64656e2e20576172756d3f202d2044696520416e74776f72742069737420736568722065696e66616368213c2f503e0d0a3c503e44696520526563686e65722066696e64656e2073696368206e696368742c207765696c20736965206e6963687420616472657373696572742077757264656e2020756e64207765696c206461732050726f746f6b6f6c6c206665686c742e2057656e6e205369652065696e656e2042726965662073636872656962656e2c206d2675756d6c3b7373656e2053696520617563682064696520416e7363687269667420616e676562656e2c20616e736f6e7374656e2077656973732064696520506f7374206e696368742c20776f68696e2064657220427269656620736f6c6c2e204461732068656973737420616c736f2c206461737320536965206a6564656d20526563686e657220696d204e65747a7765726b2065696e652065696e6465757469676520495020766572676562656e2e2044616265692067696274206573206578616b74652052696368746c696e69656e20756e64204e6f726d656e2c20616e736f6e7374656e20772661756d6c3b7265206461732077656c747765697465204e65747a7765726b2065696e206b6f6d706c6574746573204368616f732e3c2f503e0d0a3c503e495020737465687420662675756d6c3b7220496e7465726e65742050726f746f6b6f6c6c2c206973742061626572206175636820662675756d6c3b722064696520416472657373656e6175666c266f756d6c3b73756e672064657320526563686e657273207a7573742661756d6c3b6e6469672e204e65686d656e2077697220616e2c2049687220526563686e6572206861742064656e204e616d656e204e6f626f64792e2053696520676562656e2064656d20526563686e657220646965204950203139322e3136382e302e31302c20736f6d697420777572646520646572204e616d65206d69742064696573657220495020636f64696572742e204469652050726f746f6b6f6c6c65206b656e6e656e206c6569646572206b65696e65204e616d656e2c20736f6e6465726e206e757220416472657373656e20696e20466f726d20766f6e204e756d6d65726e2e203c2f503e0d0a3c503e566572676562616e20536965206e756e20616c6c656e20526563686e65726e20696d204e65747a7765726b2065696e652065696e6465757469676520495020696e6e657268616c622065696e657320416472657373656e6265726569636865732c20642e682e20766f6e203139322e3136382e302e53514c20626973203139322e3136382e302e39392e202661756d6c3b6e6465726e20536965206469652065727374656e207365636873205a61686c656e2c206d2675756d6c3b737373656e2064696520416472657373656e20616c6c657220616e646572656e20526563686e6572206562656e66616c6c7320617566206469657365204e756d6d65722067652661756d6c3b6e646572742077657264656e2e2041636874656e20536965206269747465206461726175662c206461737320536965206e75722062657374696d6d746520495020416472657373696572756e67206e75747a656e20642675756d6c3b7266656e2e204a6564657220526563686e657220696d204e65747a7765726b2064617266206e75722065696e652065696e646575746967652049502062656b6f6d6d656e2e2041636874656e205369652064657368616c62206461726175662c20646173206b65696e20526563686e657220696d204e65747a7765726b2064696520676c6569636865204950206861742e3c2f503e0d0a3c503e446965205375626e65746d61736b6520697374206e69636874732077656974657220616c732065696e65204175666c266f756d6c3b73756e6720662675756d6c3b722057656273656974656e2e2057656e6e2053696520696e20496872656d20496e7472616e6574206e75722065696e656e2053657276657220686162656e206f686e65205765627365727665722c2064616e6e20627261756368656e20536965206469657365206e696368742e205365747a656e2053696520646965205375626e65742065696e6661636820616c6c6520617566203235352e3235352e302e302e3c2f503e0d0a3c503e57656e6e20616c6c6520526563686e65722065696e6520495020657268616c74656e20686162656e206665686c74206e7572206e6f6368206461732072696368746967652050726f746f6b6f6c6c2e3c2f503e);
INSERT INTO `sioux7_study` (`seite_id`, `bereich`, `bild`, `titel`, `descr`) VALUES
(33, 'Netzwerk', '', 'Protokolle', 0x3c503e44616d616c73206272617563687465206d616e2073656872207669656c652050726f746f6b6f6c6c6520662675756d6c3b7220646173204e65747a7765726b2e20416e676566616e67656e20766f6e204e455442696f73206269732068696e207a7520646976657273656e20776569746572656e2050726f746f6b6f6c6c656e20662675756d6c3b7220447275636b657266726569676162652c205665727a656963686e697373667265696761626520756e6420616e64657265732e204469657365732050726f746f6b6f6c6c206d75737320756e626564696e67742061756620616c6c656e20526563686e65726e20646573204e65747a7765726b657320696e7374616c6c69657274207365696e2e3c2f503e0d0a3c503e486575746520627261756368656e20536965206e7572206e6f63682065696e2065696e7a696765732050726f746f6b6f6c6c3a20544350202f2049502e20426569204d6963726f736f6674204e65747a7765726b656e206e6f63682064617320467265696761626570726f746f6b6f6c6c2e2057617320737465636b742068696e7465722064696573656d2073636865696e6261722022736368776572656e2220426567726966663f3c2f503e0d0a3c503e5472616e736d697373696f6e20436f6e74726f6c6c2050726f746f6b6f6c6c202f20496e7465726e65742050726f746f6b6f6c6c202d206e69636874732077656974657220616c732065696e652041727420766f6e20446174656e617573746175736368732050726f746f6b6f6c6c2e20496e20646973656d2050726f746f6b6f6c6c2077697264206469652041647265737365206465732053656e646572732c2064696520416472657373652064657320456d70662661756d6c3b6e6765727320756e6420646965207a752073656e64656e64656e20446174656e20636f64696572742e203c2f503e0d0a3c503e426569737069656c3a2053696520776f6c6c656e20446174656e20766f6d2053657276657220686f6c656e2e2049687220526563686e65722073656e6465742065696e6520416e667261676520616e2064656e205365727665722e204465722053657276657220616e74776f72746574206d69742065696e657220426573742661756d6c3b746967756e672e20486162656e20536965206461732052656368742c20646965736520446174656e207a7520686f6c656e2c20736f2073656e6465742049686e656e2064657220536572766572206469657365206765772675756d6c3b6e73636874656e20446174656e2e20446162656920776972642073742661756d6c3b6e64696720676570722675756d6c3b66742c206f622064696520446174656e2061756368207269636874696720616e67656b6f6d6d656e2073696e642e204573206265737465687420616c736f2065696e652041727420446174656e6b6f6d6d756e696b6174696f6e2e3c2f503e0d0a3c503e556e64206e6f6368207761733a2046722675756d6c3b686572206b6f6e6e7465206d616e20646965736520446174656e202261627a617066656e222c206865757465206e69636874206d6568722c207765696c20646572204855422073656e6465742064696520446174656e206e7572206e6f636820646972656b74207a756d20526563686e65722c2064657220646965736520446174656e20616e6765666f72646572742068617474652e203c2f503e),
(34, 'Netzwerk', '', 'Druckserver', 0x3c503e4765736368616666742c20646173204e65747a7765726b2073746568742e2057656e6e2053696520696e20646572204e65747a7765726b756d676562756e6720616c6c6520526563686e657220646573204e65747a7765726b657320736568656e2c2069737420616c6c65732065696e6765726963687465742e204d616e63686d616c207369656874206d616e206e6f6368206e6963687420616c6c6520526563686e657220736f666f72742c206265736f6e6465727320626569204d6963726f736f6674206e696368742c207765696c20646965736520526563686e6572206b65696e65205265736f757263656e20667265696765676562656e20686162656e2e20446173206973742061626572206e6963687420776963687469672c2068617570747361636865206973742c2064617320646965204b6f6d6d756e696b6174696f6e207a7769736368656e20436c69656e7420756e6420536572766572206b6c617070742e203c2f503e0d0a3c503e57656e6e2053696520616e20496872656d20526563686e65722065696e656e20447275636b657220686162656e20756e642053696520776f6c6c656e2c20646173206175636820616e64657265206175662064696573656e20447275636b657220647275636b656e206b266f756d6c3b6e6e656e2c206d2675756d6c3b7373656e20536965206e6f63682064617320667265696761626570726f746f6b6f6c6c20696e7374616c6c6965727420756e6420616b7469766965727420686162656e2e20536965206b266f756d6c3b6e6e656e2064616e6e2064656e20447275636b65722066726569676562656e2e3c2f503e0d0a3c503e416e6465727320697374206573206a65646f63682062656920447275636b7365727665726e2e2044696573652073696e64206e6963687420616e20526563686e65726e20616e67657363686c6f7373656e2c20736f6e6465726e2073746568656e206672656920756e642073696e64206e7572206d69742064656d2050617463686b6162656c20616e20646173204e65747a7765726b2076657262756e64656e2e266e6273703b20576965206b616e6e20696368206175662064696573656e20447275636b657220647275636b656e3f3c2f503e0d0a3c503e44657220447275636b73657276657220777572646520626572656974732062656920646572204c6965666572756e67206d69742065696e65722065696e646575746967656e20495020766572736568656e2e204265766f72205369652064656e20445320616e20646173204e6574777a7765726b206b6f7070656c6e2c206d2675756d6c3b7373656e205369652070722675756d6c3b66656e2c206f62206b65696e20616e646572657220526563686e657220696d204e65747a7765726b2064696573652049502062657265697473206861742e266e6273703b2057656e6e206e696368742c206d2675756d6c3b7373656e205369652064656d2044532065696e6520616e6465726520495020676562656e2e3c2f503e0d0a3c503e556e74657220646572204f7074696f6e20447275636b65722065696e7269636874656e20772661756d6c3b686c656e20536965206e756e204e65747a7765726b647275636b657220756e6420416e7363686c7573736172742049502e2045732077697264206e756e206e6163682064656d20445320676573756368742e205769726420657220676566756e64656e2c20696e7374616c6c696572742073696368206469652054726569626572736f66747761726520676577266f756d6c3b686e6c6963682073656c6265722e2057656e6e206e696368742c20736f206d2675756d6c3b7373656e20536965206469652054726569626572434420646573204865727374656c6c657273206e75747a656e20756e64206469652049502064657320445320766f6e2048616e642065696e676562656e2e20546970703a206b6f70696572656e20536965206469652054726569626572206175662064656e2053657276657220756e6420676562656e205369652064617320565a20696d204e65747a7765726b20667265692c2064616e6e206b266f756d6c3b6e6e656e20616c6c6520436c69656e74732064696520547265696265722062656920426564617266206e75747a656e2e3c2f503e0d0a3c503e497374206465722044532065696e6765726963687465742c206d616368656e20536965206269747465206e6f63682065696e656e20546573742c2064616d697420536965206175636820736963686572207365696e206b266f756d6c3b6e6e656e2e3c2f503e0d0a3c503e266e6273703b3c2f503e),
(35, 'Netzwerk', '', 'Gateway', 0x3c503e49687220496e7472616e6574207374656874206265726569747320756e642069737420766f6c6c6b6f6d6d656e2065696e6765726963687465742e2053696520776f6c6c656e206e756e206562656e66616c6c7320646965204d266f756d6c3b676c6963686b6569742064657320496e7465726e65746573206e75747a656e2e2044617a7520627261756368656e205369652065696e20736f67656e616e6e74657320476174657761792e3c2f503e0d0a3c503e45696e2047617465776179206973742061756368206e6963687473206265736f6e646572657320616c732065696e652056657262696e64756e67207a752065696e656d204469656e73746c656973746572204968726572205761686c2e204d616e206b616e6e206573206175636820616c7320526f757465722062657a656963686e656e2e20536965206d2675756d6c3b7373656e2064656e20526f75746572206e757220616e206461732054656c65666f6e6e65747a7765726b206b6f7070656c6e2c20696d20526f75746572206469652056657262696e64756e6773646174656e2065696e676562656e20756e64206469652056657262696e64756e6720617566626175656e206c617373656e2e205374656874206469652056657262696e64756e672c20736f206b266f756d6c3b6e6e656e205369652064656e20526f75746572206e756e20616e20496872204e65747a7765726b206b6f7070656c6e2c20696e64656d205369652064656e20526f75746572202675756d6c3b6265722064656e2055706c696e6b206d697420496872656e204855422076657262696e64656e2e3c2f503e0d0a3c503e476562656e20536965206e6f636820696d20526f757465722065696e2c2077657220696d204c414e2064617320496e7465726e6574206e75747a656e20646172662e204d65697374656e732072656963687420657320766f6c6c6b6f6d6d656e2c2077656e6e2053696520657320617566205374616e64617264667265696761626520662675756d6c3b7220616c6c65207374656c6c656e2e2041636874656e20536965206a65646f6368206461726175662c206461732064696520522675756d6c3b636b7275666f7074696f6e206465616b74697669657274206973742c20616e736f6e7374656e206b616e6e206d616e207369636820766f6e2061757373656e2065696e772661756d6c3b686c656e2e3c2f503e0d0a3c503e4469652056657262696e64756e67206b6c61707074206e6f6368206e696368743f204e61742675756d6c3b726c6963682120536965206d2675756d6c3b7373656e206a65747a7420616c6c656e20526563686e65726e20696d204e65747a7765726b2c2064696520496e7465726e65747a75677269666620686162656e20642675756d6c3b7266656e2c206e6f6368206469652049502064657320526f7574657273206d6974746569656c656e2e20476568656e205369652064617a752065696e6661636820696e206469652045696e7374656c6c756e67656e20646573204e65747a7765726b657320756e64207465696c656e2053696520756e74657220646572204f7074696f6e2047617465776179206e6f6368206469652049502064657320526f7574657273206d69742e20556e64207363686f6e206b6c61707074206573202e2e2e2e2e2e3c2f503e0d0a3c503e4162657220766f7273696368742c2064656e6e206a65747a7420626567696e6e74206175636820646965204765666168722064657320416e67726966666573206175732064656d20496e7465726e65742e2044657220526f7574657220736f6c6c74652064657368616c622065696e656e20696e7465677269657274656e204669726577616c6c20686162656e2c2064656e2053696520736f2065696e7374656c6c656e2c2064617320496872204e65747a7765726b20696d20496e7465726e65742028666173742920616c6c65732074756e20646172662c206a65646f6368206175732064656d20496e7465726e6574206b65696e20416e677265696665722061756620496872204e65747a7765726b206b6f6d6d656e206b616e6e2e3c2f503e),
(36, 'Netzwerk', '', 'Vertiefung', 0x3c503e57656e6e2053696520626973206869657268696e20616c6c6573207665727374616e64656e20686162656e20756e64206e6f63682077656974657220676568656e20776f6c6c656e2c206269732053696520657320736f676172207a752065696e656e204469656e73746c656973746572206272696e67656e20776f6c6c656e2c2064616e6e206b266f756d6c3b6e6e656e20536965207765697465726c6573656e2e20416e736f6e7374656e2072656963687420657320626973207a752064696573656d204b61706974656c2e3c2f503e),
(37, 'Netzwerk', '', 'DBS und WebS', 0x3c503e5a756d65697374207769726420646965204469656e73746c65697374756e67206465732049535020616c73204261636b626f6e652062657a656963686e65742c207761732065696e66616368206e757220736f7669656c2062656465757465742c2064617320646572204469656e73746c6569737465722049686e656e207365696e204e65747a7765726b207a757220566572662675756d6c3b6867756e67207374656c6c742e20536965206b266f756d6c3b6e6e656e206d69742048696c66652064646965736573204469656e73746c65697374657273204968726520416e6765626f746520756e642047657363682661756d6c3b6674652061756368204f6e6c696e6520616e62696574656e2e3c2f503e0d0a3c503e44657220495350206265737465687420696e2064657220526567656c20617573205765627365727665726e205765625320756e6420446174656e62616e6b7365727665726e204442532e204175662064656e2057656253206b266f756d6c3b6e6e656e20536965204968726520496e7465726e657470722661756d6c3b73656e746174696f6e20616e62696574656e2c206175662064656e2044425320697374204968726520446174656e62616e6b20616e67656c6567742e2053696520686162656e20736f6d6974206265692064696573656d20416e6269657465722065696e6520666c657869626c65204d266f756d6c3b676c6963686b6569742065696e6573204f6e6c696e6567657363682661756d6c3b667465732e204465722049535020426574726569626572206765772661756d6c3b6872742049686e656e20616c736f2c202675756d6c3b626572207365696e204e65747a7765726b20496872652047657363682661756d6c3b667465207a7520766f6c6c7a696568656e2c206f686e65207369636820696e20646965736520416e67656c65676e6568656974656e2065696e207a75206d69736368656e2e204f6220616c7320526573656c6c6572206f646572206d697420656967656e656e205365727665722e3c2f503e0d0a3c503e57617320737465636b742068696e7465722064656d204953503f3c2f503e0d0a3c503e47656e61752077696520766f7268657220626573636872696562656e20686174206175636820646572204953502065696e20736f6c63686573204e65747a7765726b206175666765626175742e205374617474206a65646f63682065696e656e204469656e73746c656973746572207a757220416e62696e64756e6720616e206461732077656c747765697465204e65747a7765726b206861742064657220495350206d656872657265205374616e646c656974756e67656e207a7520776569746572656e204265747265696265726e2e20496e2064657220526567656c206d696e64657374656e732076696572205374616e646c656974756e67656e2e204461722675756d6c3b6265722068696e6175732073696e64206e6f6368207669656c6520776569746572652045696e7269636874756e67656e20696e7374616c6c696572742c20736f207a756d20426569737069656c2067657363682675756d6c3b747a746572205261756d206d6974204c2675756d6c3b6674756e6720756e642054656d706572617475726b6f6e74726f6c6c652c204669726577616c6c732c205374726f6d766572736f7267756e67656e20756e64204261636b75707365727665722c2077656c636865202675756d6c3b626572204e616368742077696368746967652046657374706c617474656e73706965676c756e67656e20766f6c6c7a696568656e2e203c2f503e0d0a3c503e446965204b6f7374656e20662675756d6c3b722065696e20736f6c6368657320566f72686162656e206c6f686e656e2073696368206e75722064616e6e2c2077656e6e2073656872207669656c65204b756e64656e2064696573656e204469656e7374206e75747a656e2e20496e2065696e6572205a656974206465732068617274656e204b6f6e6b7572656e7a6b616d70666573206973742065696e20736f6c6368657320566f72686162656e206d65697374656e732073656872207363687765722c207a756d616c20536965206265692064656e204b756e64656e2065727374206d616c2065696e20416e736568656e20657272696e67656e206d2675756d6c3b737373656e2e266e6273703b203c2f503e0d0a3c503e462675756d6c3b72206b6c65696e6520556e7465726e65686d656e206c6f686e7420657320736963682064657368616c62206e6963687420756e626564696e67742e2044657368616c62206973742064617320736f67656e616e6e746520486f7573696e672062656c6965627465722c20776f626569206d616e2065696e666163682065696e656e20656967656e656e20536572766572206265692064696573656d20416e626965746572206b6f7070656c6e206c2661756d6c3b73737420662675756d6c3b7220676572696e6765204765622675756d6c3b68722e2044657220495350206b2675756d6c3b6d6d65727420736963682064616e6e20756d20616c6c6520776569746572656e20746563686e69736368656e20416e67656c6567656e68656974656e2e3c2f503e),
(38, 'Netzwerk', '', 'Standleitung', 0x3c503e44534c2069737420766f6c6c20696e2c20646173207369656874206a6564657220616e2064656e20656e6f726d656e205a61686c656e206465722042656e75747a65722e204562656e66616c6c732073696e6420646965204b6f7374656e20662675756d6c3b722065696e6520736f6c6368652041727420766f6e20496e7465726e65746e75747a756e672072756e6420756d2064696520556872207072656973672675756d6c3b6e7374696765722e20446572204e6163687465696c206a65646f6368206973742c2064617320536965206562656e206e75722065696e656e204469656e73746c656973746572206e75747a656e2c20776f2053696520646f63682073656c6273742065696e204469656e73746c6569737465722073696e642e203c2f503e0d0a3c503e446965204c266f756d6c3b73756e67206465732050726f626c656d6573206973742065696e65205374616e646c656974756e67207a752065696e656e20616e646572656e20416e6269657465722c206d69742064656d20536965206b6f6f706572696572656e2e2045696e652065696e7a696765205374616e646c656974756e672069737420696e20416e626574726163687420662675756d6c3b722065696e65203130302d70726f7a656e746967652041757366616c6c7373696368657268656974207a752077656e69672e20536965206d2675756d6c3b7373656e2064657368616c62206d696e64657374656e73202675756d6c3b626572207a776569205374616e646c656974756e67656e20766572662675756d6c3b6867656e2e20446965204b6f7374656e2068696572662675756d6c3b722073696e64206e69636874206765726164652062696c6c69672c2077656e6e20536965206a65646f6368204968726520756e6162682661756d6c3b6e6769676b65697420772675756d6c3b6e736368656e2c2069737420646965732065696e652050666c696368742e3c2f503e0d0a3c503e4d65697374656e732069737420646965207a77656974652c2064726974746520756e642077656974657265205374616e646c656974756e672062696c6c6967657220616c73206469652048617570747374616e646c656974756e672e2057656e6e20536965206469652065727374656e207a776569205374616e646c656974756e67656e2062657369747a656e2c206b266f756d6c3b6e6e656e2053696520626567696e6e656e2c20496872656e20656967656e656e2049535020617566207a7520626175656e20756e64206461732067657374616c6c7465742073696368206761726e69636874206d616c207363687769657269672e3c2f503e),
(39, 'Netzwerk', '', 'NIC Dienste', 0x3c503e446120496872205365727665727374616e646f7274206465727a65697420446575747363686c616e64206973742c206d2675756d6c3b7373656e205369652073696368207a756572737420616c732049535020626569206465722044454e494320616e6d656c64656e2e204e6163682065696e65722050722675756d6c3b66756e672049686572657220416e676162656e20657268616c74656e2053696520766f6e20646f72742065696e656e206e75722049686e656e207a7567657465696c74656e20416472657373656e626572656963682e20446965204b6f7374656e20662675756d6c3b722064696573656e20416472657373656e626572656963682073696e64207365687220676572696e672e203c2f503e0d0a3c503e576f7a752062726175636865206963682064696573656e20495020416472657373656e626572656963683f3c2f503e0d0a3c503e53696520627261756368656e2064696573656e20495020416472657373656e6265726569636820662675756d6c3b7220496872656e2065727374656e204e616d656e737365727665722c207a77656974656e204e616d656e737365727665722c20476174657761792c20756e642077656974657265204e616d656e73736572766572206f64657220416e62696e64756e67656e202820526f7574657220292e20536965206d2675756d6c3b7373656e2064656e205365727665726e20756e642047617465776179732c2077656c6368652053696520616e62696574656e2c2065696e652065696e64657574696765204950207a757465696c656e2c206469652049686e656e206469652044454e494320766572676562656e206861742e266e6273703b20496e2064656e204761746577617973206d2675756d6c3b7373656e20536965206e6f63682065696e6967652045696e7374656c6c756e67656e20646572205a756772696666737265636874652065696e7374656c6c656e2e20497374206469657320766f6c6c7a6f67656e2c2073696e642053696520616220736f666f72742077656c7477656974207a752065727265696368656e2c206c65696465722061626572206175636820736f666f727420416e6772696666737a69656c207669656c6572204861636b657220756e6420437261636b65722e3c2f503e0d0a3c503e57656e6e20536965206e6562656e2064656e204469656e7374656e206e6f63682049687220656967656e6573204e65747a7765726b2062657472656962656e2c20736f207363682675756d6c3b747a656e2053696520646965736573206265736f6e64657273206775742e2044757263682065696e7269636874656e2065696e657320526f7574657273206d6974204669726577616c6c207a7769736368656e20496872204e65747a7765726b20756e642064656e204f6e6c696e657365727665726e2065727265696368656e205369652c2064617373206d616e206e696368742061756620496872204e6574777a7765726b207a756772656966656e206b616e6e2e20476562656e20536965206b65696e656e2064696573657220526563686e65722065696e652049502c206469652053696520766f6e2044454e494320657268616c74656e20686162656e2e205269636874656e2053696520696d20526f75746572206e6f63682065696e2c20646173732064696520495020416472657373656e626572656963682061757320496872656d204e65747a7765726b20617566206b65696e656e2046616c6c206765726f757465742077657264656e2e205a756d206265736f6e646572656e2053636875747a20656d706665686c656e207769722049686e656e2064656e20536572766572206e69656d616c7320646972656b74206d69742064696573656d20526f75746572207a752076657262696e64656e2c20736f6e6465726e20616e2065696e20776569746572657320696e74656c6967656e746573204855422e3c2f503e),
(40, 'Netzwerk', '', 'Ausbau', 0x3c503e4162206a65747a74206765687420616c6c65732073656872207363686e656c6c207765697465722e205369652073696e64206e756e20616c73204469656e73746c65697374657220766f6c6c6b6f6d6d656e20756e6162682661756d6c3b6e67696720756e6420646173207a656967742073696368206a65747a74206175636820616e68616e642064696573657320426569737069656c65733a3c2f503e0d0a3c503e45696e204b756e6465206d266f756d6c3b63687465206265692049686e656e2065696e6520446f6d61696e20686162656e20756e642062657374656c6c742064696573652e204e6163682041627363686c7573732064657320566572747261676573206d69742064696573656d204b756e64656e206265616e74726167656e2053696520626569206465722044454e4943206f6465722064656d204e4943204469656e73742c2064657220662675756d6c3b7220646965736520546f706c6576656c207a7573742661756d6c3b6e646967206973742c2065696e652049502e2044696520466f726d616c69742661756d6c3b74656e2073696e642072656368742065696e6661636820756e64206572666f6c67656e206d65697374656e73204f6e6c696e652e2053696520657268616c74656e20696e206b75727a6572205a6569742064696520495020766f6d204e4943204469656e73742e203c2f503e0d0a3c503e5269636874656e20536965206175662065696e656e204968726572205365727665722065696e207669727475656c6c6573205665727a656963686e69732065696e20756e642076657277656973656e2053696520696d204e616d656e737365727665722061756620646965736573205665727a656963686e6973732e205465696c656e205369652064656d20536572766572206e6f636820646965204950206d69742c20642e682e2077656e6e206a656d616e64206175662064656e204e616d656e73736572766572206b6f6d6d7420756e6420646965204e616d656e736175666c266f756d6c3b73756e67266e6273703b2820686965723a206469652049502064657220446f6d61696e20292c207769726420617566206469652053656974656e20646572206e6575656e20446f6d61696e2077656974657267656c65697465742e203c2f503e0d0a3c503e446572204b756e64652062656b6f6d6d74206e6f636820465450205a7567616e6720756e6420766f6c6c6573205a7567726966667372656368742e20536965207465696c656e2049686d206e6f636820646965736520446174656e206d69742e3c2f503e0d0a3c503e446164757263682073696e642053696520756e6162682661756d6c3b6e67696720756e6420766f6c6c6b6f6d656e20667265692e204465722065696e7a69676520556e746572736368696564206973742c206461732053696520662675756d6c3b722064696520746563686e69736368656e20416e67656c6567656e68656974656e2c2057617274756e6720756e6420536963686572756e67206162206a65747a742073656c62737420736f7267656e206d2675756d6c3b7373656e2e2057656e6e20536965206a65646f636820766f6e20416e66616e6720616e20616c6c65732072696368746967206d616368656e20756e6420646965204b756e64656e2049686e656e2076657274726175656e2c206861742073696368206465722041756677616e642067656c6f686e742e3c2f503e),
(41, 'Netzwerk', '', 'Einwahl', 0x3c503e446572206c65747a74652053636872697474207a752065696e657220766f6c6c6b6f6d6d656e656e204469656e73746c65697374756e67206973742064696520536572766963652c20617563682065696e652045696e7761686c207a752062696574656e206f646572204669726d656e20646965204d266f756d6c3b676c6963686b656974207a752062696574656e2c205374616e646c656974756e67656e207a752049686e656e207665726c6567656e207a75206c617373656e2e3c2f503e0d0a3c503e417563682068696572206b266f756d6c3b6e6e656e2053696520676574726f737420766f72676568656e2c206f686e65207669656c65205363687769657269676b656974656e207a752062656b6f6d6d656e3a3c2f503e0d0a3c503e5669656c652054656c65666f6e676573656c6c736368616674656e2062696574656e2065696e6520736f67656e616e6e74652062756e64657377656974652045696e7761686c6e756d6d657220616e2e204469657365204e756d6d65722076657262696e6465742064656e204b756e646520646972656b74206d697420496872656d205365727665722e2053696520657268616c6c74656e20766f6d204469656e73746c656973746572206469657365206665737467657365747a74652045696e7761686c6e756d6d65722e20446965204765622675756d6c3b6872656e2c2064696520536965206461662675756d6c3b72207665726c616e67656e2c206b266f756d6c3b6e6e656e205369652073656c6273742062657374696d6d656e2e2042656920646572206d6f6e61746c696368656e204162726563686e756e6720646965736572204469656e73746c65697374756e67736e756d6d65722077657264656e20646965204765622675756d6c3b6872656e20766f6e2064656e2042656e75747a6572206265726563686e65742e266e6273703b20446965204b6f7374656e2068696572662675756d6c3b722073696e64207365687220676572696e6720756e64206665726e657220686162656e205369652064616d6974206e69636874206e75722065696e656e204953502c20736f6e6465726e206175636820676c656963682065696e656e2045696e7761686c6b6e6f74656e2e203c2f503e0d0a3c503e446965732061756368206e6f63682073656c627374207a7520626175656e206c6f686e74207369636820617566206b65696e656e2046616c6c2e2053696520627261756368656e2064616e6e2073656872207669656c65205363686e6974747374656c6c656e2c20524153204b617274656e20756e642065696e6520756e676c6175626c69636820686f68652042616e646272656974652c20756e64206a65206772266f756d6c3b7373657220536965206469652042616e6462726569746520772661756d6c3b686c656e2c20646573746f2068266f756d6c3b68657220646965204b6f7374656e2e3c2f503e0d0a3c503e41626572206175636820616e64657265204669726d656e206b266f756d6c3b6e6e656e206265692049686e656e206b6f7070656c6e2e20536965206265616e74726167656e2065696e6661636820696d204175667472616720646572204669726d612065696e656e20776569746572656e20495020416472657373656e6265726569636820626569206465722044454e49432e204e61636820457268616c7420646572204950207269636874656e205369652065696e656e20526f75746572206265692049686e656e20616c73205365727665722065696e206d69742065696e6572206469657365722049502065696e2c2062656920646572204669726d6120616c7320436c69656e742e266e6273703b205363686c69657373656e205369652064696520526f7574657220616e20646965206765736368616c74657465205374616e646c656974756e672e205269636874656e2053696520616c6c6520526563686e6572206d6974206465722049502064657320436c69656e74726f75746572732065696e20756e64207363686f6e2068617420646965204669726d6120496e7465726e65747a7567616e672e205369652073696e642064616d69742050726f78796469656e73746c6569737465722e20446965204669726d61206b616e6e2061756368206175662057756e73636820496872656e20656967656e656e205765625320616e7363686c69657373656e2e204469657365722057656253206d7573732065696e65206469657365722049507320657268616c74656e2e205269636874656e2053696520696e20496872656d204e616d656e7373657276657220776965206765776f686e742065696e207669727475656c6c6573205665727a656963686e69732065696e2c206e75722064617320657320646965736d616c2065787465726e206973742e20416e736f6e7374656e20626c6569627420616c6c6573206265696d20616c74656e2c2064657220496e7465726e657467617374207769726420616220736f666f7274206175662064656e205765625320646572204669726d612077656974657267656c65697465742e3c2f503e),
(42, 'Internet', '', 'Einführung', 0x3c503e496e7465726e6574206f7074696d616c206e75747a656e20756e6420736f676172207269636874696720616e77656e64656e20697374206d6974746c65727765696c65206e69636874206d65687220736f2065696e666163682e204f6674207375636874206d616e207374756e64656e6c616e6720696d20496e7465726e6574206e6163682065696e657220416e74776f7274206175662065696e652046726167652e204f62206d6974206f646572206f686e6520537563686d61736368696e652c206d616e2062656b6f6d6d7420737465747320617563682073656872207669656c652053656974656e206d697420746f74616c656e20536368726f74742c2061626572206b65696e652066616368676572656368746520416e74776f727420617566206469652046726167652e204a65206cc3a46e676572206d616e2073756368742c20646573746f2074657565726572206469652054656c65666f6e726563686e756e672c20676573636877656967652064656e6e2c206d616e206861742044534c20466c6174726174652e3c2f503e0d0a3c503e36204d696f2e20446f6d61696e7320616c6c65696e6520696e20446575747363686c616e6420756e64207769657669656c652065732077656c74776569742073696e642c206b616e6e206d616e206e757220736368c3a4747a656e2e204265736f6e6465727320576172657a2c204861636b65727a2c2053686f7070696e6720756e6420756e73657269c3b67365204469656e73746c65697374756e67656e2062696574656e20736f6c6368656e20556e6675686720616e2e204f66742067656c616e676520696368206265692065696e65722053756368652061756620736f6c6368652064756d6d652053656974656e2c20776f206d616e206d69722061756368206e6f6368204469656e73746c65697374756e67656e20616e6269657465742c2064696520646f6368206e69636874732077656974657220696e207369636820686162656e2c20616c73206e75722057657262756e672e3c2f503e0d0a3c503e5472c3a46774206d616e207365696e6520456d61696c206265692065696e656d204e6577736c65747465722065696e2c20657268c3a46c74206d616e206f667420696e206ec3a4636873746572205a656974206175636820766f6e20616e646572656e20756e657277c3bc6e73636874656e20416e6269657465726e204e6577736c65747465722e20576172756d3f204461732073696e64205765726265706172746e657220756e6420616c7320736f6c6368652064c3bc7266656e20646965736520506172746e65722064656e204469656e7374206e75747a656e2e2053696520657268616c74656e2064657368616c62206a6564656e205461672068617566656e776569736520536368726f74742e3c2f503e0d0a3c503e4672757374726965727420766f6d2045726765626e6973207665726cc3a473737465206d616e2064617320496e7465726e657420756e64207363686c6965737374206469652056657262696e64756e672e205363686c6175657220697374206d616e206a65646f6368206e696368742c206f64657220646f63682c2064656e6e206a65747a74207765697373206d616e2067656e61752c20646173732064617320496e7465726e657420646f6368206e6963687420736f20676cc3a46e7a656e64206973742c207769652065732073696368206461727374656c6c742e203c2f503e0d0a3c503e5269636874696720616e77656e64656e20756e642066696e64656e206973742065696e65206b6c65696e65204b756e737420756e6420646f63682067616e7a2065696e666163682e204869657220736f6c6c206765686f6c66656e2077657264656e2c20646173207a752066696e64656e2c20776173206d616e207375636874653a2065696e6520416e74776f727420617566206469652046726167652e3c2f503e),
(43, 'Internet', '', 'Suchmaschinen', 0x3c503e4775742062656b616e6e746520537563686469656e7374652c20776965205961686f6f20756e6420476f6f676c652c2073696e64206e6963687420696d6d657220646965206265737465205761686c2e20446173206c69656774206e6963687420676c6569636820616e2064656e20537563686469656e7374656e2c20736f6e6465726e20616e2064657220462675756d6c3b6c6c652064657220496e666f726d6174696f6e656e2c2064696520646f72742067657370656963686572742073696e642e204265736f6e6465727320776963687469672073696e6420646965205375636862656772696666652c206e6163682064656e656e205369652073756368656e2e205a77656920537563686265677269666665207265696368656e2065696e66616368206e69636874206175732c20756d2064616d69742065696e2067757465732045726765626e6973207a752065727a69656c656e2c2064656e6e2064696520416e7a61686c20646572205472656666657220697374207a7520686f63682e2053696520627261756368656e2064657368616c62206e6f6368206d656872205375636862656772696666652e3c2f503e0d0a3c503e4869657220697374207a756d6569737420646965204772656e7a652064657220537563686469656e7374652c2064656e6e206d6178696d616c203130205375636862656772696666652073696e642065726c617562742e204d6568722053756368626567726966666520662675756d6c3b6872656e2064617a752c2064617320646965205375636865207669656c207a75206c616e6765206461756572742e266e6273703b20446173206973742064656e20537563686469656e7374656e206775742062656b616e6e7420756e64207363686f6e206c2661756d6c3b6e6765722065696e2072696573696765732050726f626c656d2e20476f6f676c65206861742065696e652067656c756e67656e65204c266f756d6c3b73756e6720676566756e64656e3a20537563686520696e2064657220537563686520626973207a752065696e656d2045726765626e6973204968726572205761686c2e2044616265692077657264656e2061756620496872656d20526563686e657220736f67656e616e6e746520436f6f6b6965732067657370656963686572742c2064696520646173206269736865726967652045726765626e6973206665737468616c74656e20756e642065696e6520776569746572652067657a69656c746520537563686520696e20646572206269736865726967656e2053756368652065726c617562742e204d616e206b616e6e20646164757263682064696520537563686520696d6d657220776569746572207665726665696e65726e2e3c2f503e0d0a3c503e41626572206175636820537563686469656e7374652073696e64206e6963687420696d6d6572206e757220226e6f6e2070726f666974206f7267616e69736174696f6e73222c20736f6e6465726e2067657a69656c746520416e6269657465722c20642e682e206475726368205a61686c756e6720676572696e67657220626973207365687220686f686572204765622675756d6c3b6872656e207769726420646173205375636865726765626e6973206d616e6970756c696572742e2044616265692077657264656e206a657765696c73207a752064656e205375636862656772696666656e206465722042656e75747a65722057657262756e67656e2065696e6765626175742c206469652064656d2053756368656e64656e2067656e6175207a752064696573656d205468656d6120536572766963656c65697374756e67656e20616e6269657465742e2045732062657374656874206a65646f6368206b65696e652050666c696368742c2064696573656e2053657276696365207a75206e75747a656e2c2064657368616c62207365692064656e20537563686d61736368696e656e20766572676562656e2e3c2f503e0d0a3c503e44756d6d206973742c20646173206f667420626569206e6f63682067657a69656c746572656e2053756368656e2053656974656e206175667461756368656e2c20646965202675756d6c3b6265726861757074206e6963687473206d69742064656d205468656d61207a752074756e20686162656e2e20446173206c696567742065696e6661636820646172616e2c2064617320696e2064656e204d65746173206465722053656974656e2067656e61752064696573652053756368626567726966666520676566756e64656e2077757264656e20756e6420646f6368207265696e206761726e69636874732064616d6974207a752074756e20686162656e2e204461732073696e6420766572737465636b74652057657262756e67656e206269732068696e207a7520576172657a2e203c2f503e0d0a3c503e266e6273703b3c2f503e),
(44, 'Internet', '', 'Links', 0x3c503e4f62204d5320496e7465726e65746578706c6f726572206f646572204e657473636170652c20536965206b266f756d6c3b6e6e656e2064696520676566756e64656e656e2053656974656e20756e6420646965204c696e6b73207a752064696573657220536569746520696e2049687265204661766f726974656e76657277616c74756e672073706569636865726e2e3c2f503e0d0a3c503e4265696d204945206b6c69636b656e205369652065696e6661636820697267656e64776f206175662065696e65206672656965205374656c6c6520646572205365697465206d697420646572207265636874656e204d61757374617374652e20496d204b6f6e746578746d656e752069737420646965204f7074696f6e266e6273703b2022207a75204661766f726974656e2068696e7a75662675756d6c3b67656e222e20572661756d6c3b686c656e205369652064696573652e204562656e66616c6c7320736f202661756d6c3b686e6c69636820697374206573206265696d204e532e203c2f503e0d0a3c503e56657277616c74656e205369652049687265204661766f726974656e206e616368204968726520496e746572657373656e2e204c6567656e2053696520646f72742065696e66616368204f72646e6572206d6974204b617465676f7269656e20616e20756e6420766572736368696562656e205369652064656e204c696e6b20696e20646965736573205665727a656963686e69732e205363686f6e20686162656e205369652065696e652067757465202675756d6c3b626572736963687420616c6c65722077696368746967656e204c696e6b73207a7520677574656e2053656974656e20696d20496e7465726e65742e3c2f503e0d0a3c503e566f727369636874206a65646f6368206265692065696e656d205570646174652049687265732042726f77736572732c2064656e6e206573206b6f6d6d7420766f722c20646173206265696d2055706461746520616c6c65204661766f726974656e20706c266f756d6c3b747a6c6963682076657273636877756e64656e2073696e642e20556e746572204461746569202d20496d706f7274696572656e20756e64204578706f7274696572656e206b266f756d6c3b6e6e656e205369652049687265204661766f726974656e207369636865726e2e20496d2046616c6c652c20646173206265696d20557064617465206469657365204c696e6b73207665726c6f72656e20676568656e2c206b266f756d6c3b6e6e656e2053696520646965736520776965646572206865727374656c6c656e206475726368206562656e2064696520676c6569636865204f7074696f6e2e3c2f503e0d0a3c503e47652675756d6c3b62746520416e77656e6465722077697373656e2c20776f20646173204661766f726974656e7665727a656963686e6973206c696567742e204b6f70696572656e2053696520646965736573205665727a656963686e69732065696e6661636820696e2065696e204261636b75707665727a656963686e69732e203c2f503e0d0a3c503e2675756d6c3b6272696e67656e733a2064617320676568742061756368206d69742064656d205665727a656963686e697320766f6e20456d61696c732c207a756d20426569737069656c204f75746c6f6f6b2045787072657373207370656963686572742064696520446174656e20756e7465722022446f6b756d656e746520756e642045696e7374656c6c756e67656e22202d202667743b496872204e616d65266c743b2d20416e77656e64756e6773646174656e202d20496e64656e7469746965732d2667743b4b4559266c743b2d4d6963726f736f66742d4f75746c6f6f6b2e205369636865726e2053696520646173205665727a656963686e697320756e642053696520686162656e2065696e204261636b757020496872657220456d61696c732e3c2f503e),
(45, 'Internet', '', 'Sites', 0x3c503e556e746572205369746573207665727374656874206d616e206469652050722661756d6c3b73656e746174696f6e206465722067657375636874656e20496e666f726d6174696f6e656e2e204461732073696e6420616c736f206469652053656974656e2c20646965206d616e2067657375636874206861742e20556e6420646f63682073696e64206573206f66742053656974656e2c20646965207265696e206761726e6963687473206d69742064656d205468656d61207a752074756e20686162656e2e266e6273703b20536f6c63686520756e73657269266f756d6c3b73652053656974656e20686162656e206e757220646173205a69656c2c204b756e64656e207a752077657262656e20756e642064656e20496e7465726e6574676173742064617a75207a75207665726c656974656e2c2064696573656e2053657276696365207a75206e75747a656e2e3c2f503e0d0a3c503e3139383920696e20457373656e207375636874652069636820656967656e746c696368206e6163682065696e656e20677574656e20536368756867657363682661756d6c3b66742e2041756620646572205374726173736520737072616368206d6963682065696e204d616e6e20616e2c20646572206d696368206672616774652c20776173206963682064656e6e2073756368652e204963682073616774652065732049686d2e20456967656e746c69636820772661756d6c3b72652064616d697420616c6c6573204f4b2c206f646572206e696368743f204e65696e2c206572206672616774652064616e6e206e6f63682c206f6220696368206175636820422675756d6c3b63686572207375636865206f646572204d7573696b204344732e204e61742675756d6c3b726c69636865207375636865206963682061756368206e61636820677574656e20422675756d6c3b636865726e2e2044756d6d65727765697365206861747465206963682064616e6e20746174732661756d6c3b63686c6963682065696e656e205a7765696a616872657376657274726167206d69742064656d204b65726c20616267657363686c6f7373656e2e20556e642077617320686174746520696368206461766f6e3f204e69636874732c2064656e6e20696368206861747465206e6f636820696d6d6572206b65696e652053636875686520676566756e64656e2c2073746174742064657373656e206d7573737465206963682061622064616e6e2064756d6d6520422675756d6c3b636865722062657a61686c656e2c2064696520646f6368206e696368747320776572742073696e642e20446572204b65726c206a65646f636820686174746520662675756d6c3b7220646965736520416e77657262756e67207365696e652050726f766973696f6e206b617373696572742e3c2f503e0d0a3c503e446173206b6f6d6d7420696d6d65722077696564657220766f7220756e6420697374202675756d6c3b626572616c6c207a752066696e64656e2c20736f67617220696e205a65697473636872696674656e206c6f636b656e206577696720646965205375706572616e6765626f74652e20417563682064617320496e7465726e6574206d61636874206461206b65696e65204175736e61686d656e2e2057657262756e6720697374206562656e2065696e65732064657220776963687469677374656e204d697474656c2c20756d207669656c65204b756e64656e207a752073616d6d656c6e2e2044617320496e7465726e65742067656874206a65646f63682065696e656e2053636872697474207765697465722c2064656e6e20646f72742073696e64206469652047657365747a65206e6f6368206e6963687420617573676572656966742e3c2f503e0d0a3c503e426569737069656c3a205369652062657374656c6c656e20766f6e2065696e656e20736f6c6368656e204469656e73746c656973746572204e6577736c65747465722c20656967656e746c696368206e757220766f6e2064696573656e2c20646f6368207363686f6e2077656e69676520576f6368656e2073702661756d6c3b74657220657268616c74656e2053696520766f6e207a61686c7265696368656e20776569746572656e20416e6269657465726e20456d61696c73206d697420416e6765626f74656e2e20576965206b6f6d6d74206461733f2047616e7a2065696e666163683a20646572204469656e73746c656973746572206973742065696e20506172746e65722064657320416e626965746572732e20416c7320506172746e65722062656b6f6d6d7420617563682064696573657220416e626965746572204968726520456d61696c20756e64205369652064616d69742057657262756e67656e2e204d656c64656e205369652064657368616c622064696573656e20536572766963652065696e666163682061622c2064656e6e2073657269266f756d6c3b736520416e62696574657220756e7465726c617373656e20736f6c6368656e20536368726f74742e3c2f503e0d0a3c503e266e6273703b3c2f503e),
(46, 'Internet', '', 'Darstellungen', 0x3c503e456e646c69636820676566756e64656e2c207761732064657220537563686520656e747370726963687420756e6420646f6368207769656465722065696e65206e65756520686572626520456e74742661756d6c3b75736368756e672c2064656e6e206469652053656974652069737420736f207363686c656368742061756667656261757420756e64206d69742073656872207669656c20226669726c6566616e7a2220626573742675756d6c3b636b742c20646173206d616e20676c6569636820776965646572207765676b6c69636b742e3c2f503e0d0a3c503e5363686c6563687465204b6f6e74726173746520766f6e2048696e7465726772756e6420756e6420566f726465726772756e642c206c616e6765204c6164657a656974656e20776567656e207a752067726f7373656e2047726166696b656e20756e64207a7520616c6c656e202675756d6c3b626572666c7573732061756368206e6f6368207363686c65636874206175666765626175742e2045696e204772756e64206d6568722c2064696573652053656974656e207a75206d656964656e2e204d65697374656e732068616e64656c74206573207369636820756d20416e662661756d6c3b6e67657273656974656e2c2064696520766f6e2057656270726573656e746174696f6e656e206b65696e652065696e7a6967656e20626c617373656e20536368696d6d657220686162656e2e20574f57202d20776f726c64206f66207761737465206e656e6e65206963682065732120576965206b616e6e206d616e206e757220736f6c6368652053656974656e202675756d6c3b6265726861757074207265696e7374656c6c656e3f2057656e6e207363686f6e2c2064616e6e206269747465206b65696e652068616c62652053616368656e2e3c2f503e0d0a3c503e4469652053656974656e20736f6c6c74656e202675756d6c3b62657273696368746c69636820756e6420696e666f726d61746976207365696e2e2047726166696b656e20756e64204d756c74696d656469612065696e62696e64656e206b616e6e206d616e20696d6d65722c2064616e6e2061626572206175636820726963687469672e20426564656e6b656e205369652c206461732073656872207669656c6520496e7465726e6574672661756d6c3b7374652050726f626c656d65206d69742064656e20417567656e20686162656e20756e642065696e656e207363686c65636874656e204b6f6e74726173742065696e66616368206e69636874206c6573656e206b266f756d6c3b6e6e656e2e2041756368207a757669656c6520556d73636872656962756e67656e20756e642073696e6e6c6f736573204765726564652c20776965206573206265692064656e202661756d6c3b72747a74656e206f667420736568722062656c69656274206973742c20662675756d6c3b687274206e69636874207a752064656d206572686f666674656e2045726765626e69732c20646173206765737563687465207a752066696e64656e2e203c2f503e0d0a3c503e44657368616c622073696e64207669656c652053656974656e206f6674207363686e656c6c6572207769656465722076657273636877756e64656e2c20616c732064696520537563686469656e7374652065732072656769737472696572656e206b266f756d6c3b6e6e656e2e2044616e6e266e6273703b207461756368656e2064696573652053656974656e20697267656e64776f20776965646572206175662c2061626572206e69636874206d65687220646f72742c20776f206d616e20676573756368742068617474652e20556e64206465722057656273656974656e6265747265696265722068617420657320756e7465726c617373656e20646f72742065696e656e2076657277656973207a752064656e206e6575656e204c696e6b20616e207a75206272696e67656e2e204461732062657a65756774206568726c6963682067657361677420766f6e20556e6b656e6e746e6973206f646572207363686c69636874204661756c686569742e203c2f503e0d0a3c503e477574652053656974656e2073696e64206b75727a2c20696e666f726d6174697620756e64202675756d6c3b62657273696368746c6963682e20416d2062657374656e206d616e2062617574207a7765692053656974656e2064617a75206175662c2077656e6e2065696e65205365697465206e69636874207265696368742e20496e206465722065727374656e2062657363687265696274206d616e206573206b75727a20756e6420622675756d6c3b6e64696720756e642061756620646572206e2661756d6c3b63687374656e206c616e6720756e6420617573662675756d6c3b68726c6963682e2044617320697374206465722057756e736368206465732053756368656e64656e2e3c2f503e),
(47, 'Internet', '', 'Dienste', 0x3c503e2257697373656e20536965207363686f6e20776173206c6f73206973743f22202d204e6575652045726b656e6e746e6973736520756e642042656b616e6e746d616368756e67656e2c204e6163687269636874656e20756e6420496e666f726d6174696f6e656e2c20696d6d657220616b7475656c6c207365696e2e20576f20616e64657265206e6f6368206e69636874732077697373656e2c2073696e6420536965206265726569747320696e666f726d696572742e20576f68657220686162656e205369652064656e6e2064696520496e666f726d6174696f6e656e3f2044617320697374206d69722061626572206e6f6368206761726e696368742062656b616e6e742c2064656e6e20776564657220696d20526164696f2c205a656974756e67206f646572204665726e736568207775726465206574776173206461766f6e206572772661756d6c3b686e742e3c2f503e0d0a3c503e47616e7a2065696e666163683a2053696520686162656e206265692065696e656d2073657269266f756d6c3b73656e204469656e73746c6569737465722c20426569737069656c3a205765622e64652c2065696e656e204e6577736c65747465722061626f6e6e697265742e204461647572636820657268616c74656e2053696520742661756d6c3b676c6963682064696520616b7475656c6c7374656e204e6163687269636874656e2061757320616c6c65722057656c7420756e642077697373656e20696e206b75727a6572202675756d6c3b6265727369636874202675756d6c3b626572207669656c65732042657363686569642e20536f6c63686520496e666f726d6174696f6e656e2073696e64206d65697374656e73204b75727a2675756d6c3b6265727369636874656e20646572206272616e74616b7475656c6c7374656e2045726569676e697373656e206d6974204c696e6b73207a752064656e204f6e6c696e6573656974656e2c2077656c63686520617573662675756d6c3b68726c6963686520496e666f726d6174696f6e656e20626565696e68616c74656e2e3c2f503e0d0a3c503e4f646572205369652073756368656e20616e6465726520506572736f6e656e206d69742064656e656e20536965202675756d6c3b6265722062657374696d6d746520456967656e736368616674656e206f64657220457266616872756e67656e20737072656368656e206b266f756d6c3b6e6e656e2e20496e2064696573656e2042657265696368206269657465742064617320496e7465726e65742065696e65207365687220627265697465205669656c66616c7420616e3a20466f72756d2c20436861742c204e6577736c65747465722c2042266f756d6c3b7273656e2c20756e64207669656c657320776569746572652e266e6273703b2044612077697264206573206f6674207365687220736368776572206175732064696573656e20416e6765626f74656e2064617320726963687469676520662675756d6c3b722073696368207a752066696e64656e2e204a65646f63682073656920766f72204368617420756e6420466f72656e2067657761726e742c2064656e6e206d65697374656e732073696e642064696520496e68616c74652064696573657220466f72656e20756e642043686174732073656872207363686c656368742e204573206b6f6d6d7420696d6d657220266f756d6c3b667465727320766f722c20646173732053636865727a626f6c646520696e20736f6c6368656e20536572766963656c65697374756e67656e2064756d6d65205370722675756d6c3b6368652c205665726c696e6b756e67656e206f6465722050726f706167616e6461207265696e73636872656962656e2e204465722057656261646d696e6973747261746f72206861742073696368207761687273636865696e6c696368207363686f6e2064657320266f756d6c3b666572656e207363687761727a2067652661756d6c3b72676572742c2077697220617563682e3c2f503e0d0a3c503e53657269266f756d6c3b736520416e62696574657220736368616c74656e20736f6c6368652042656974722661756d6c3b67652065727374206e6163682065696e676568656e6465722050722675756d6c3b66756e67206465732042656974726167657320667265692e20536f6d69742077697264207665726d696564656e2c20646173206573206761726e69636874207a7520736f6c6368656e20566f72662661756d6c3b6c6c656e206b6f6d6d7420756e6420736f6c636865202244756d6d736368772661756d6c3b747a6572222073696368206665726e2068616c74656e2e2042656920736f6c6368656e20416e6269657465726e2066696e64656e20536965207369636865726c69636820656e646c696368206469652072696368746967656e20416e73707265636873706172746e6572207a7520496872656d204765737563682e3c2f503e),
(48, 'Internet', '', 'Emailservice', 0x3c503e4e61636820646572204175737761686c2073657269266f756d6c3b73657220416e6269657465722077657264656e206175636820536965206765726e6520616b7475656c6c652042657269636874652070657220456d61696c2062656b6f6d6d656e20776f6c6c656e2e20486965727a7520627261756368656e20536965206e69636874207669656c3a2045696e6520456d61696c206265692065696e656d20504f5033204469656e737420756e642065696e2050726f6772616d6d2c206d69742077656c6368656e205369652064696520456d61696c73206162727566656e206b266f756d6c3b6e6e656e2e20416e7363686c69657373656e642074726167656e2053696520646965736520456d61696c20696e2064656e204e6577736c65747465726469656e73742065696e20756e642061626f6e6e696572656e2064696573656e204469656e73742e2041622064616e6e20657268616c74656e2053696520726567656c6d2661756d6c3b7373696720456d61696c7320766f6e2064696573656e20416e6269657465722e3c2f503e0d0a3c503e4175636820686965722069737420566f727369636874207769656465726d616c20616e67656272616368742e20456d61696c7320696e2048544d4c20466f726d61742073696e642073656872206f6674206d69742065787465726e656e2047726166696b656e20756e64204c696e6b732076657262756e64656e2e205775737374656e20536965207363686f6e2c2064617373206d616e2073656c627374206265692065696e657220736f6c6368656e205665726c696e6b756e6720696d2048696e7465726772756e642065696e69676573202675756d6c3b62657220496872656e20526563686e657220657266616872656e206b616e6e3f204e65696e3f2044616e6e20776972642065732068266f756d6c3b63687374652022456973656e6261686e222c2064617373205369652053636875747a736f66747761726520696e7374616c6c696572656e2e20576172756d3f202675756d6c3b6265722064696520495020756e6420646965206765726f75746574652041647265737365206b616e6e206d616e20496872656e20457263686e657220616e737072656368656e2c20736f6c616e676520536965204f6e6c696e652073696e642e20506c266f756d6c3b747a6c69636820657268616c74656e20536965204e65747a7765726b6e6163687269636874656e20616c7320506f7075702046656e73746572206d6974204e6163687269636874656e20766f6e20536368776163687374656c6c656e20496872657320526563686e6572732e204461732069737420517561747363682c2064656e6e2064616d69742077696c6c206d616e20536965206e757220766572756e7369636865726e20756e642064617a75206265776567656e2c2064656e20646f727420616e6765676562656e656e204c696e6b2065696e7a75676562656e2e205761732064616e6e2070617373696572743f205369652077657264656e206175662065696e65206175746f6d61746973636865205365697465206d69742053657475702065696e65732030313930204469616c6572732067656c656974657421204f646572206162657220657268616c74656e2065696e656e20566972757320616c73202244616e6b65736368266f756d6c3b6e222e3c2f503e0d0a3c503e476568656e2053696520696e206469652056657277616c74756e6720496872657320526563686e65727320756e6420736368616c74656e20536965266e6273703b64656e205761726e6469656e737420756e64204e65747a7765726b6e6163687269636874656e6469656e73742065696e6661636820616221204c6164656e205369652064696520456d61696c7320766f6d2053657276657220756e64207363686c69657373656e2053696520646965204f6e6c696e6576657262696e64756e672e204c6573656e2053696520736f6c63686520456d61696c73206e7572204f66666c696e652c2064616e6e2077657264656e206469652047726166696b656e20756e6420766572737465636b74656e2050722675756d6c3b66706978656c206e6963687420616b746976696572742e203c2f503e0d0a3c503e426569204469656e736c6569737465726e20766f6e204a6f62616e6765626f74656e206f6465722042266f756d6c3b7273656e2c2077696520456261792c206b266f756d6c3b6e6e656e205369652049687265204e6577736c657474657220736f2065696e7374656c6c656e2c2064617373206469657365206e757220616c73205465787420676573656e6465742077657264656e2e2044616d6974207665726d656964656e2053696520766572737465636b7465207665726c696e6b756e67656e2e20536f6c63686520416e6269657465722073696e642073657269266f756d6c3b732c20642e682e20536965206b266f756d6c3b6e6e656e20736f6c63686520456d61696c7320617563682077656e6e20536965204f6e6c696e652073696e6420266f756d6c3b66666e656e2e204665686c206469657365204f7074696f6e206265696d20416e6269657465722c20736f206d656964656e205369652064696573656e206c69656265722e3c2f503e);
INSERT INTO `sioux7_study` (`seite_id`, `bereich`, `bild`, `titel`, `descr`) VALUES
(49, 'Internet', '', 'Domains', 0x3c503e426569202675756d6c3b6265722036204d696f2e20446f6d61696e7320616c6c65696e6520696e20446575747363686c616e642077697264206d616e2073696368207369636865726c6963682062616c642066726167656e2c2077696520736f2065747761732066756e6b74696f6e69657274206b616e6e2e20526563686e6574206d616e2073696368206175732c2064617373206a65646520446f6d61696e2065696e652062657374696d6d746520416e7a61686c20616e20496e666f726d6174696f6e656e206269657465742c20736f206d2675756d6c3b73737465207363686f6e20616c6c65696e6520696e20446575747363686c616e642064696520462675756d6c3b6c6c652064657220496e666f726d6174696f6e656e206461732053746161747361726368697620756d205669656c666163686573202675756d6c3b6265727472656666656e2e3c2f503e0d0a3c503e44656d206973742061626572206e6963687420736f2c2064656e6e2063612e2036302050726f7a656e7420616c6c6572207265676973747269657274656e20446f6d61696e732073696e64206e69636874732077656974657220616c73206c65657265204261757374656c6c656e206f646572205765697465726c656974756e67656e2e20536f2073696e64207669656c6520446f6d61696e73206d69742064656e20676c65696368656e204e616d656e2c206162657220616e646572656e20546f706c6576656c732c20776965202e636f6d2c202e6e657420756e6420616e64657265206e75722065696e65205765697465726c656974756e67206175662064696520776168726520446f6d61696e2e204a65206e616368204c616e64206973742064696520456e64756e672064657220446f6d61696e20656e74737072656368656e642067657a656963686e65743a3c2f503e0d0a3c554c3e0d0a3c4c493e64653a20446575747363686c616e643c2f4c493e0d0a3c4c493e66723a204672616e6b72656963683c2f4c493e0d0a3c4c493e61743a20266f756d6c3b7374657272656963683c2f4c493e0d0a3c4c493e63683a205363687765697a3c2f4c493e0d0a3c4c493e636f6d3a20436f6d6d65727a69616c2c20642e682e204d65687273707261636869673c2f4c493e0d0a3c4c493e7573772e3c2f4c493e3c2f554c3e0d0a3c503e446172617573206b266f756d6c3b6e6e656e2053696520656e746e65686d656e2c20756d2077656c63686573204c616e6420657320736963682068616e64656c7420756e642077656c63686520537072616368652062656e75747a7420776972642e205369742067696274204175736e61686d656e2c20776f207a7761722064696520546f706c6576656c202e64652073746568742c206162657220737461747420646575747363682065696e6520616e6465726520537072616368652062656e75747a7420776972642e204461732073696e64207a756d6569737420416e6269657465722c2064696520496872652053656974656e206e6f6368206d697420646572205a656974206175662064657574736368202675756d6c3b6265727365747a656e20776f6c6c656e2c2064612061626572206b65696e2067656569676e657465722028206d65697374656e73206162657220656865722062696c6c6967657265722029202675756d6c3b6265727365747a6572207a752066696e64656e206973742c2077657264656e206469652053656974656e20766f72616220657273742077656974657268696e20696e20646572205572737072756e677366617373756e672067657a656967742e203c2f503e0d0a3c503e536965206b266f756d6c3b6e6e656e20616c736f207363686f6e20616e68616e642064657220546f706c6576656c656e64756e67206572736568656e2c20756d2077656c636865205370726163686520657320736963682068616e64656c742e205769652061626572207363686f6e206572772661756d6c3b686e742073696e642073656872207669656c6520446f6d61696e732065696e66616368206e757220224261757374656c6c656e222e3c2f503e0d0a3c503e266e6273703b3c2f503e),
(50, 'Internet', '', 'Inhalt', 0x3c503e4175636820646572204e616d652064657220446f6d61696e2073616774207363686f6e207669656c6573202675756d6c3b6265722064656e20766f7261757373696368746c696368656e20496e68616c7420646572204461727374656c6c756e67656e206175732e20536f20697374207a756d20426569737069656c20557262616e73576f726c64206469652042657a656963686e756e6720662675756d6c3b72202257656c74206465732053746164746d656e736368656e222c206f646572206265737365722065696e652042657a656963686e756e672064657220746563686e69736368656e20456e747769636b6c756e672e205769722068616c74656e20756e73206175636820616e2064656e204e616d656e2e3c2f503e0d0a3c503e4d69742065696e2077656e6967205068616e746173696520756e64204b6f6d62696e6174696f6e2066696e64656e20536965206d616e63686d616c2061756368206f686e6520537563686d61736368696e652064696520726963687469676520446f6d61696e206d69742064656e20766f6e2049686e656e2067657375636874656e20496e68616c74656e2e204d616368656e2053696520736963682065696e666163682065696e696765205374696368776f72746520756e64207265696d656e20536965206d616c2065696e696765206d266f756d6c3b676c69636865204e616d656e207a7573616d6d656e2e204a65747a74206e6f6368206f6e6c696e65206d616c2070726f62696572656e2e205369652077657264656e206572737461756e74207365696e2c2077656e6e2053696520657320746174732661756d6c3b63686c6963682066696e64656e2e204461732069737420616265722061756368207363686f6e20616e68616e6420646572204b6e6170706865697420646572204e616d656e206b65696e205a7566616c6c206d6568722e3c2f503e0d0a3c503e4e6163682077696520766f72206b616e6e2065732061626572207365696e2c206461737320536965206175662065696e65204261757374656c6c65206f6465722061626572206175662053656974656e206d69742067616e7a20616e646572656e20496e68616c742067656c616e67656e2e205374617474206465722c2077696520646572204e616d65206265736167742c20766f6e2049686e656e2065727761727465746520496e68616c74652066696e64656e205369652065696e656e2053686f702c2065696e65204469656e73746c65697374756e67206f64657220616265722065747761732067616e7a206265736f6e64657273207363686c65636874657320766f723a2050726f706167616e6461206f64657220736f676172204b696e6465736d69737368616e646c756e672120496e2064696573656d2046616c6c2062697474656e20776972205369652c2064656e204c696e6b20616e206461732056657266617373756e677373636875747a207a752073656e64656e206f64657220756e732064696573206d6974207a75207465696c656e2e203c2f503e0d0a3c503e44617320496e7465726e657420697374206e69636874206e75722065696e6520462675756d6c3b6c6c6520766f6e20496e666f726d6174696f6e656e2c20736f6e6465726e20617563682065696e6520462675756d6c3b6c6c6520766f6e20736b727570656c6f73656e2047657363682661756d6c3b6674736d61636865726e2c2041627a6f636b65726e20756e642050726f706167616e64612c206e6963687420696d6d6572206e75722064657220576172657a2c204861636b65726e20756e6420437261636b65726e2e203c2f503e),
(51, 'Internet', '', 'Sicherheit', 0x3c503e57656e6e20536965204f6e6c696e652073696e642c206973742049687220526563686e657220662675756d6c3b72206a6564656e206175732064656d20496e7465726e65742065696e206f6666656e657320506f7274616c20662675756d6c3b722065696e656e2067657a69656c74656e20416e67726966662e20476573636877656967652064656e6e2c20536965207363682675756d6c3b747a656e20496872656e20526563686e65722067657a69656c74206d69742053636875747a736f6674776172652e266e6273703b204162657220617563682077656e6e20536965206e6f636820736f7669656c652050726f6772616d6d65207a756d2053636875747a6520496872657320526563686e65727320696e7374616c6c696572656e206b6f6d6d74206d616e2064757263682c2077657474656e2064617373202e2e2e2e2e2e2e2e20446572204368616f732043756d707574657220436c756220696e2048616d627572672068617420646173207363686f6e207a75206f667420626577696573656e21204461206b616e6e206d616e2065636874207365687220756e7369636865722077657264656e2c20776173205369652061626572206e6963687420627261756368656e2c2077656e6e2053696520736963682072696368746967207363682675756d6c3b747a656e3a3c2f503e0d0a3c554c3e0d0a3c4c493e616b7475656c6c6520416e7469766972656e736f667477617265206d697420456d61696c7363616e6e65723c2f4c493e0d0a3c4c493e64656b746976696572656e205369652064656e205761726e6469656e73742c204e65747a7765726b6e61636872696368746469656e737420756e6420626569204e657473636170652064656e20414f4c204d657373656e6765723c2f4c493e0d0a3c4c493e4e5420686174206e6f63682064656e204d51204d657373656e6765722c206175636820646572206d757373206465616b746976696572742077657264656e3c2f4c493e0d0a3c4c493e6576656e7475656c6c206e6f63682065696e656e204669726577616c6c20696e7374616c6c696572656e2c205a6f6e65416c61726d2069737420662675756d6c3b722070726976617465205a7765636b65206b6f7374656e6c6f733c2f4c493e0d0a3c4c493e656e746665726e656e20536965206d69742048696c666520766f6e2046726565746f6f6c732064656e204469656e737420416c657861202820696d20494520756e64204e53206472696e2c206465722073656e64657420446174656e21293c2f4c493e0d0a3c4c493e62656920585020656d706665686c656e207769722065696e65206b6f6d706c6574746520496e7374616c6c6174696f6e2064657320616b7475656c6c656e20536572766963657061636b733c2f4c493e3c2f554c3e0d0a3c503e266e6273703b3c2f503e),
(52, 'Internet', '', 'Viren, Trojaner und Co.', 0x3c503e4d6974207363686c6f747465726e64656e20482661756d6c3b6e64656e20756e6420666c61747465726e64656e204e657276656e207374656c6c652069636820616c732041646d696e6973747261746f7220666573742c2064617373206a656d616e6420617566206d65696e656e20526563686e65722065696e2050726f6772616d6d2068696e7465726c6567742068617474652c2064617320646965204d266f756d6c3b676c696368206269657465742c2064617320616e64657265206175732064656d20496e7465726e6574206d65696e65206b6f6d706c657474652046657374706c61747465206c6164656e206b266f756d6c3b6e6e656e2e20536f666f727420656e746665726e6520696368206461732050726f6772616d6d20756e64206f62656e647265696e20636865636b652069636820646965206b6f6d706c657474652046657374706c617474652064757263682e20444f434b5649455720737465687420696e2065696e6967656e205665727a656963686e697373656e2e20446120776172206a656d616e6420756e6420686174207369636820446f6b6f6d656e746520766f6e206d697220616e6765736568656e21203c2f503e0d0a3c503e576572207761722065733f20576572206b6f6e6e746520646120617566206d65696e656e20526563686e6572206b6f6d6d656e3f204175732064656d20496e7465726e6574206f64657220776f6865722c20696368207765697373206573206e696368742e205374756e64656e6c616e67207375636865206963682064657368616c62206e61636820646965205572736163686520756e6420776572646520662675756d6c3b6e6469673a266e6273703b2045696e2054726f6a616e65722120446572206b6f6d6d742061626572206e69636874206175732064656d20496e7465726e65742c20736f6e6465726e20647572636820286f2067726175732129204e6574736361706521204469657365722054726f6a616e65722068617474652073696368207769652065696e205775726d20616e2064656e2057696e646f7773204578706c6f726572206472616e6765682661756d6c3b6e677420756e64206265696d20266f756d6c3b66666e656e20766f6e20576f7274646f6b756d656e74656e2065696e6520444f4b564945572068696e7465726c617373656e2e2057656e6e20696368206e756e204f6e6c696e6520676568652c206b266f756d6c3b6e6e7465206465726a656e6967652c2064657220646173206461207265696e67656261757420686174202820697374202675756d6c3b6272696e67656e73206e6f6368206472696e20212029206d65696e6520446f6b756d656e74652065696e736568656e2e20576172756d3f205765696c20696e206469657365722044617465696d2064657220466569676562657363686c2675756d6c3b7373656c206973742c2064657220646965204461746569207a75722045696e73696368742066726569676962742e3c2f503e0d0a3c503e426574722675756d6c3b677420756e73204e65747363617065206d69742064696573656e205a757361747a70726f67726d6d656e207769652064656e20414f4c204d657373656e6765722c206465722073696368206e69636874206d616c20656e746665726e656e206c2661756d6c3b7373743f2049636820686162652064656e20656e746665726e7420756e64207765726465204e65747363617065206e696520776965646572206e75747a656e2e204568657220626c656962652069636820626569204d6963726f736f66742c20616c7320646173732064696573657220656e676c6973636865266e6273703b205370696f6e20616c6c6520417262656974656e20766f6e206d6972207665726e6963687465742e3c2f503e),
(53, 'Internet', '', 'Speed', 0x3c503e5a756d2041627363686c7573732062657363682661756d6c3b66746967656e2077697220756e73206e6f6368206d69742064657220476573636877696e6469676b6569742064657220496e7465726e657476657262696e64756e672e203c2f503e0d0a3c503e5a756765676562656e2c2044534c20697374207363686e656c6c2c20736f207363686e656c6c2061626572206175636820776965646572756d206e696368742c206265736f6e64657273206e69636874207a75722048617570747a656974207a7769736368656e203920556872206d6f7267656e732062697320313820556872206162656e64732c20766f6e204d6f7461672062697320467265697461672e2044617320747269666674206175636820626569204953444e20616e20756e64206973742065696e20726963687469676573202661756d6c3b726765726e69732e266e6273703b204a65206d6568722042656e75747a657220696d204d6f6d656e742064617320496e7465726e6574206e75747a656e20756e64206469652042616e6462726569746520626973207a7572206e2661756d6c3b63687374656e205665727465696c657273746174696f6e206465722054656c656b6f6d6d2062656c656774206973742c20646573746f207a2661756d6c3b686572207769726420646965202675756d6c3b62657274726167756e672c206269732068696e2c20646173207265696e206761726e6963687473206d65687220676568742c207765696c20646965204c656974756e67206d616c2077696564657220746f74206973742e3c2f503e0d0a3c503e41626765736568656e20766f6e2064696573656e204d2661756d6c3b6e67656c6e206c696567742065732061626572206e69636874206e757220616e20646572204c656974756e672c20736f6e6465726e206175636820616e20646965202675756d6c3b62657274726167756e67736b6170617a69742661756d6c3b7420756e642045696e7374656c6c756e67656e20696e206465722052656769737472792e204d54552c2050616b65746772266f756d6c3b7373652c20756e64204b616e616c622675756d6c3b6e646c756e672073696e642066617374207363686f6e2076657267657373656e20756e64204672656d6477266f756d6c3b727465722c206f62776f686c206765726164652064696573652045696e7374656c6c756e67656e2064657220466c61736368656e68616c7320662675756d6c3b7220646965202675756d6c3b62657274726167756e6773676573636877696e6469676b656974206973742e203c2f503e0d0a3c503e456e74776564657220536965207374656c6c656e20646965736520576572746520696e2064657220526567697374727920766f6e2048616e64206175662068266f756d6c3b686572652057657274652c20776173206a65646f6368206175636820726563686e65726973636865204c65697374756e67206572666f72646572742c206f64657220536965206e65686d656e2065696e204672656577617265746f6f6c20756e64207374656c6c656e2064616d6974206469652057657274652068266f756d6c3b6865722e20466f6c6765206973742c206461737320536965206162206a65747a742061756368207769726b6c696368206d6568722061757320496872656e20416e7363686c7573732072617573686f6c656e2e2053657269266f756d6c3b736520416e62696574657220736f6c636865722050726f6772616d6d652066696e64656e20536965207369636865726c6963682073656872207363686e656c6c2e203c2f503e),
(54, 'PHP', '', 'Einführung', 0x3c503e504850206973742065696e65207365727665727365697469676520537072616368652e20446572205572737072756e67206b6f6d6d742061757320432f432b2b20756e6420777572646520696e2048544d4c2053656974656e206d69742050485020434f444520616c7320536372697074737072616368652065696e6765626175742e2044657220436f6d70696c6572206973742073657276657273656974696720696e7374616c6c6965727420756e64206c6965666572742064656d20436c69656e742048544d4c2053656974656e206d69742064657220496e746572707265746174696f6e2e2044657220436c69656e742073656c627374206b616e6e2064696520436f6465206e69636874206c6573656e2e2041756620556e69782f4c696e757820506c617474666f726d656e206973742064696573657220436f6d70696c6c6572206265726569747320656e7468616c74656e20756e642077697264206265692064657220496e7374616c6c6974696f6e2065696e65732053657276657273206d697420696e7374616c6c696572742e204465727a65697420616b7475656c6c3a2050485020536963686572686569742f5048502e203c2f503e0d0a3c503e576f7a75206469657365205370726163686520677574206973743f2044696520416e74776f7274206973742065696e666163683a20756d206175732064656e2062697368657220756e666c65787369626c656e2048544d4c2053656974656e2c2077656c6368652073696368206e757220647572636820646972656b7465204265617262656974756e6720c3a46e6465726e206c617373656e2c2064796e616d69736368652053656974656e207a752067657374616c74656e2e20536f206b616e6e20696e2064657220656e20504850205365697465207a756d20426569737069656c20696d6d65722064617320616b7475656c6c6520446174756d2073746568656e2c202046756e6b74696f6e656e2061757320432f432b2b20736963682065696e62696e64656e2c206f646572204675726d756c617265207072c3bc66656e2e3c2f503e0d0a3c503e536f6c63686520416e77656e64756e67656e2073696e64206e7572206b6c65696e6520756e77696368746967652045696e7a656c7465696c65206465722050485020416e77656e756e67656e2e2057696368746967657220697374206469652045696e62696e64756e6720766f6e20446174656e20756e6420546162656c6c656e2c2077656c63686520736963682064796e616d6973636820c3bc6265722065696e652056657277616c74756e672070666c6567656e206c617373656e2e2042656920652d436f6d6d65727a6520756e642053686f70616e77656e64756e67656e2073696e6420736f6c63686520446174656e207365687220776963687469672066c3bc722064696520417274696b656c70666c65676520756e642042657374656c6c6175666e61686d652e20416c6c2064696573206cc3a47373742073696368206175732065696e652056657277616c74756e67207265616c6973696572656e2e203c2f503e),
(0, NULL, NULL, 'neu', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_sysprotokoll`
--

DROP TABLE IF EXISTS `sioux7_sysprotokoll`;
CREATE TABLE `sioux7_sysprotokoll` (
  `sys_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `datum` date DEFAULT NULL,
  `syslog` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_sysprotokoll`
--

INSERT INTO `sioux7_sysprotokoll` (`sys_id`, `dom_id`, `user_id`, `datum`, `syslog`) VALUES
(1024, 0, 25180, '2017-04-22', ' ID:26 von sioux7_tables  ge&auml;ndert.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_tables`
--

DROP TABLE IF EXISTS `sioux7_tables`;
CREATE TABLE `sioux7_tables` (
  `table_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `titel` varchar(150) NOT NULL,
  `rights` enum('999','777','555','333') NOT NULL DEFAULT '333',
  `rang` int(10) NOT NULL,
  `mode` int(1) DEFAULT NULL COMMENT 'HTML Mode',
  `info` text,
  `sortfield` varchar(200) DEFAULT NULL,
  `sort_order` enum('myselect','ASC','DESC') DEFAULT NULL,
  `reiter` enum('myselect','SuperAdmin','Admin','Verwaltung','Alle') DEFAULT NULL,
  `plugin` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_tables`
--

INSERT INTO `sioux7_tables` (`table_id`, `dom_id`, `lang`, `titel`, `rights`, `rang`, `mode`, `info`, `sortfield`, `sort_order`, `reiter`, `plugin`) VALUES
(0, NULL, NULL, 'neu', '333', 0, NULL, NULL, NULL, NULL, 'SuperAdmin', NULL),
(2, NULL, NULL, 'sioux7_tables', '999', 1, NULL, NULL, NULL, NULL, 'SuperAdmin', NULL),
(3, NULL, NULL, 'sioux7_admin', '333', 2, 0, '', 'adminname', 'ASC', 'Admin', ''),
(4, NULL, NULL, 'sioux7_kategorie', '777', 3, NULL, NULL, NULL, NULL, 'SuperAdmin', NULL),
(9, NULL, NULL, 'sioux7_language', '999', 1, 0, '', 'lang_id', NULL, 'SuperAdmin', ''),
(10, NULL, NULL, 'sioux7_banner', '777', 3, 0, '', 'banner_id', 'DESC', 'Verwaltung', ''),
(12, NULL, NULL, 'sioux7_presse', '555', 6, 1, '', 'datum', 'DESC', 'Verwaltung', ''),
(13, NULL, NULL, 'sioux7_abonennt', '555', 6, 1, '', 'aname', 'ASC', 'Verwaltung', ''),
(15, NULL, NULL, 'sioux7_grouprights', '999', 2, 0, NULL, NULL, NULL, 'SuperAdmin', NULL),
(19, NULL, NULL, 'sioux7_report', '777', 7, 0, '', 'titel1', 'DESC', 'Admin', ''),
(20, NULL, NULL, 'sioux7_update_files', '555', 8, 0, '', 'file_id', 'DESC', 'Admin', ''),
(21, NULL, NULL, 'sioux7_links', '555', 9, 0, '', 'links_id', 'DESC', 'Admin', ''),
(22, NULL, NULL, 'sioux7_konfiguration', '999', 0, 0, NULL, NULL, NULL, 'SuperAdmin', NULL),
(23, NULL, NULL, 'sioux7_codesnippets', '555', 3, 0, 'CodeSchnippsel', 'cs_id', 'DESC', 'Verwaltung', 'code'),
(24, NULL, NULL, 'sioux7_blog', '333', 10, 1, 'Ratschlaggeber, Tipps, Tricks', 'blog_id', 'DESC', 'Alle', 'blog'),
(25, NULL, NULL, 'sioux7_planung', '555', 10, 1, 'Planungen und Realisierung von Projekte', NULL, NULL, 'Verwaltung', 'planung'),
(26, 0, 'de', 'sioux7_study', '555', 0, 1, 'Kleine BettellektÃ¼re', 'seite_id', NULL, 'Alle', ''),
(27, 0, 'de', 'sioux7_developing', '555', 2, 1, 'Entwicklungen', 'dev_id', 'DESC', 'Verwaltung', ''),
(28, 0, 'de', 'sioux7_lexika', '555', 100, 1, '', 'befehl', 'ASC', 'Alle', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sioux7_update_files`
--

DROP TABLE IF EXISTS `sioux7_update_files`;
CREATE TABLE `sioux7_update_files` (
  `file_id` int(11) NOT NULL,
  `dom_id` int(11) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `titel` varchar(100) DEFAULT NULL,
  `descr` text,
  `counter` int(10) DEFAULT NULL,
  `datei` varchar(200) DEFAULT NULL,
  `spende` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sioux7_update_files`
--

INSERT INTO `sioux7_update_files` (`file_id`, `dom_id`, `lang`, `titel`, `descr`, `counter`, `datei`, `spende`) VALUES
(0, NULL, NULL, 'neu', NULL, 1, NULL, NULL),
(3, 0, 'de', 'Plugin Events', 'Mit diesen Plugin kÃ¶nnen Sie Ihre eigenen oder eingetragene  Events anbieten.', 0, 'full.zip', 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `sioux7_abonennt`
--
ALTER TABLE `sioux7_abonennt`
  ADD PRIMARY KEY (`abo_id`);

--
-- Indizes für die Tabelle `sioux7_admin`
--
ALTER TABLE `sioux7_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indizes für die Tabelle `sioux7_banner`
--
ALTER TABLE `sioux7_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indizes für die Tabelle `sioux7_blog`
--
ALTER TABLE `sioux7_blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indizes für die Tabelle `sioux7_boxes`
--
ALTER TABLE `sioux7_boxes`
  ADD PRIMARY KEY (`box_id`);

--
-- Indizes für die Tabelle `sioux7_codesnippets`
--
ALTER TABLE `sioux7_codesnippets`
  ADD PRIMARY KEY (`cs_id`);

--
-- Indizes für die Tabelle `sioux7_content`
--
ALTER TABLE `sioux7_content`
  ADD PRIMARY KEY (`con_id`);

--
-- Indizes für die Tabelle `sioux7_developing`
--
ALTER TABLE `sioux7_developing`
  ADD PRIMARY KEY (`dev_id`);

--
-- Indizes für die Tabelle `sioux7_domain`
--
ALTER TABLE `sioux7_domain`
  ADD PRIMARY KEY (`dom_id`);

--
-- Indizes für die Tabelle `sioux7_firma`
--
ALTER TABLE `sioux7_firma`
  ADD PRIMARY KEY (`firma_id`);

--
-- Indizes für die Tabelle `sioux7_grouprights`
--
ALTER TABLE `sioux7_grouprights`
  ADD PRIMARY KEY (`gr_id`);

--
-- Indizes für die Tabelle `sioux7_kategorie`
--
ALTER TABLE `sioux7_kategorie`
  ADD PRIMARY KEY (`kategorie_id`);

--
-- Indizes für die Tabelle `sioux7_konfiguration`
--
ALTER TABLE `sioux7_konfiguration`
  ADD PRIMARY KEY (`cof_id`);

--
-- Indizes für die Tabelle `sioux7_language`
--
ALTER TABLE `sioux7_language`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indizes für die Tabelle `sioux7_lexika`
--
ALTER TABLE `sioux7_lexika`
  ADD PRIMARY KEY (`lex_id`);

--
-- Indizes für die Tabelle `sioux7_links`
--
ALTER TABLE `sioux7_links`
  ADD PRIMARY KEY (`links_id`);

--
-- Indizes für die Tabelle `sioux7_link_cache`
--
ALTER TABLE `sioux7_link_cache`
  ADD PRIMARY KEY (`link_id`);

--
-- Indizes für die Tabelle `sioux7_planung`
--
ALTER TABLE `sioux7_planung`
  ADD PRIMARY KEY (`pl_id`);

--
-- Indizes für die Tabelle `sioux7_presse`
--
ALTER TABLE `sioux7_presse`
  ADD PRIMARY KEY (`p_id`);

--
-- Indizes für die Tabelle `sioux7_report`
--
ALTER TABLE `sioux7_report`
  ADD PRIMARY KEY (`m_id`);

--
-- Indizes für die Tabelle `sioux7_reportinhalt`
--
ALTER TABLE `sioux7_reportinhalt`
  ADD PRIMARY KEY (`mi_id`);

--
-- Indizes für die Tabelle `sioux7_solutions`
--
ALTER TABLE `sioux7_solutions`
  ADD PRIMARY KEY (`sol_id`);

--
-- Indizes für die Tabelle `sioux7_statistik`
--
ALTER TABLE `sioux7_statistik`
  ADD PRIMARY KEY (`stat_id`);

--
-- Indizes für die Tabelle `sioux7_study`
--
ALTER TABLE `sioux7_study`
  ADD PRIMARY KEY (`seite_id`);

--
-- Indizes für die Tabelle `sioux7_sysprotokoll`
--
ALTER TABLE `sioux7_sysprotokoll`
  ADD PRIMARY KEY (`sys_id`);

--
-- Indizes für die Tabelle `sioux7_tables`
--
ALTER TABLE `sioux7_tables`
  ADD PRIMARY KEY (`table_id`);

--
-- Indizes für die Tabelle `sioux7_update_files`
--
ALTER TABLE `sioux7_update_files`
  ADD PRIMARY KEY (`file_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `sioux7_abonennt`
--
ALTER TABLE `sioux7_abonennt`
  MODIFY `abo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT für Tabelle `sioux7_admin`
--
ALTER TABLE `sioux7_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25181;
--
-- AUTO_INCREMENT für Tabelle `sioux7_banner`
--
ALTER TABLE `sioux7_banner`
  MODIFY `banner_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `sioux7_blog`
--
ALTER TABLE `sioux7_blog`
  MODIFY `blog_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT für Tabelle `sioux7_boxes`
--
ALTER TABLE `sioux7_boxes`
  MODIFY `box_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `sioux7_codesnippets`
--
ALTER TABLE `sioux7_codesnippets`
  MODIFY `cs_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'codeschnippsel', AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT für Tabelle `sioux7_content`
--
ALTER TABLE `sioux7_content`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT für Tabelle `sioux7_developing`
--
ALTER TABLE `sioux7_developing`
  MODIFY `dev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT für Tabelle `sioux7_domain`
--
ALTER TABLE `sioux7_domain`
  MODIFY `dom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `sioux7_firma`
--
ALTER TABLE `sioux7_firma`
  MODIFY `firma_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `sioux7_grouprights`
--
ALTER TABLE `sioux7_grouprights`
  MODIFY `gr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `sioux7_kategorie`
--
ALTER TABLE `sioux7_kategorie`
  MODIFY `kategorie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT für Tabelle `sioux7_konfiguration`
--
ALTER TABLE `sioux7_konfiguration`
  MODIFY `cof_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT für Tabelle `sioux7_language`
--
ALTER TABLE `sioux7_language`
  MODIFY `lang_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `sioux7_lexika`
--
ALTER TABLE `sioux7_lexika`
  MODIFY `lex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=595;
--
-- AUTO_INCREMENT für Tabelle `sioux7_links`
--
ALTER TABLE `sioux7_links`
  MODIFY `links_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT für Tabelle `sioux7_link_cache`
--
ALTER TABLE `sioux7_link_cache`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT für Tabelle `sioux7_planung`
--
ALTER TABLE `sioux7_planung`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT für Tabelle `sioux7_presse`
--
ALTER TABLE `sioux7_presse`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT für Tabelle `sioux7_report`
--
ALTER TABLE `sioux7_report`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `sioux7_reportinhalt`
--
ALTER TABLE `sioux7_reportinhalt`
  MODIFY `mi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `sioux7_solutions`
--
ALTER TABLE `sioux7_solutions`
  MODIFY `sol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `sioux7_statistik`
--
ALTER TABLE `sioux7_statistik`
  MODIFY `stat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2189;
--
-- AUTO_INCREMENT für Tabelle `sioux7_study`
--
ALTER TABLE `sioux7_study`
  MODIFY `seite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT für Tabelle `sioux7_sysprotokoll`
--
ALTER TABLE `sioux7_sysprotokoll`
  MODIFY `sys_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1025;
--
-- AUTO_INCREMENT für Tabelle `sioux7_tables`
--
ALTER TABLE `sioux7_tables`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT für Tabelle `sioux7_update_files`
--
ALTER TABLE `sioux7_update_files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
