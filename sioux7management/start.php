<?php
session_start();
if(!isset($_SESSION['DOM'])) { $_SESSION['DOM'] = "2";}
if(isset($_REQUEST['DOM'])) {
	$_SESSION['DOM'] = $_REQUEST['DOM'];}
if(!isset($_SESSION['reiter'])) { $_SESSION['reiter'] = "verwaltung";}
if(isset($_REQUEST['reiter']) and $_REQUEST['reiter'] !="") {
	$_SESSION['reiter'] = $_REQUEST['reiter'];}
if($_SESSION['user_id'] =="") {header("location: index.php");}
if(!isset($_SESSION['lang'])) { $_SESSION['lang'] = "de";}
if(isset($_REQUEST['lang']) and $_REQUEST['lang'] !="") {
	$_SESSION['lang'] = $_REQUEST['lang'];}	
if(!isset($_SESSION['table'])) { $_SESSION['table'] = "tables";}
if(isset($_REQUEST['table']) and $_REQUEST['table'] !="") {
	$_SESSION['table'] = $_REQUEST['table'];}

include "../sioux7conf/globals.inc.php";
include "inc/functions.inc.php";
connect2db();
$msg = '';
$sql_domaincheck = "SELECT * FROM sioux7_konfiguration WHERE dom_id=".$_SESSION['DOM'];
$resultdom = mysqli_query($GLOBALS['DB'],$sql_domaincheck);
if(!mysqli_num_rows($resultdom)) {
	$terror = TRUE;
	$msg .= '<div class="box_fehler">Bitte Einstellungen prüfen<span style="float:right"><a href="start.php?seite=uebersicht&table=sioux7_konfiguration&sortfield=cof_id&sortmode=">prüfen</a></span></div>';
}
$sql_langcheck = "SELECT * FROM sioux7_language WHERE dom_id=".$_SESSION['DOM'];
$resultlang = mysqli_query($GLOBALS['DB'],$sql_langcheck);
if(!mysqli_num_rows($resultlang)) {
	$terror = TRUE;
	$msg .= '<div class="box_fehler">Bitte Sprache prüfen<span style="float:right"><a href="start.php?seite=uebersicht&table=sioux7_language&sortfield=lang_id&sortmode=">prüfen</a></span></div>';
}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="../template/<?php echo TPL.'/favicon.ico' ?>" type="image/x-icon" />
<title><?php echo DOM; ?> - Verwaltung</title>
<link href="general.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/general.js"></script>
<script type="text/javascript" src="js/jquery_002.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/accord.js"></script>
<script type="text/javascript" src="js/jquery_003.js"></script>
<script type="text/javascript">
	$(function() {
		$("#accordion").accordion( { autoHeight: false, active: '.selected' } );
	});
	</script>
<script>
function popup(datei,name,b,h,scroll){
	AUSWidth=(screen.width)?(screen.width-b)/2:0;
	AUSHeight=(screen.height)?(screen.height-h)/2:0;
	neuesfenster=window.open(''+datei+'',''+name+'','location=0,scrollbars=yes,resizable=yes,menubar=0,left='+AUSWidth+',top='+AUSHeight+',width='+b+',height='+h+'');
	neuesfenster.focus(); }
</script>
</head>
<body>
<div id="box_main">
<?php
	if($terror){
		echo $msg;
	}
?>
<div id="box_head" class="standardbox">
<span class="rechts">
	<b>Eingeloggt als:</b> <?php echo ucfirst($_SESSION['username'])." (".recht($_SESSION['right']).")"; ?>
	&nbsp;-&nbsp; 
	
	<a href="inc/login.php?action=logout" target="_top">Logout <img src="images/icon_loeschen2.gif" alt="Logout" style="margin: 0pt 0pt 3px 4px;"  border="0"></a>
</span>
<form method="POST" action="start.php" class="domainselect">
	<select name="DOM" onchange="submit();">
	<?php
	$sql_domain = "SELECT * FROM sioux7_domain WHERE domain_id <> 0";
	$resultdom = mysqli_query($GLOBALS['DB'],$sql_domain);
	while ($rowdom = mysqli_fetch_array($resultdom)) {?>
		<option value="<?php echo $rowdom['domain_id']; ?>" <?php if($rowdom['domain_id'] == $_SESSION['DOM']) { echo "selected"; } ?>><?php echo $rowdom['domainname']; ?></option>
	<?php } ?>
	</select>
</form>
<form method="POST" action="start.php" class="langselect">
	<select name="lang" onchange="submit();">
 <?php
$sql_querylang = "SELECT * FROM sioux7_language WHERE lang_id <> 0 AND dom_id=".$_SESSION['DOM'];
$resultlang = mysqli_query($GLOBALS['DB'],$sql_querylang);
while ($rowlang = mysqli_fetch_array($resultlang)) {?>
<option value="<?php echo $rowlang['vat']; ?>" <?php if($rowlang['vat'] == $_SESSION['lang']) { echo "selected"; } ?>><?php echo $rowlang['vat']; ?></option>
		<?php } ?>
	</select>
</form>
</div>
<div id="box_head" class="standardbox">
<?php
$enum=enum_select('sioux7_tables', 'reiter');
print "<div id='bereich'><table width='100%'><tr>";
for($i=0;$i<sizeof($enum);$i++) {
	if($enum[$i] !='myselect') {
	if($enum[$i] != 'SuperAdmin' || $_SESSION['right'] >= 990){
	 print '<td><a href="start.php?reiter='.$enum[$i].'">&raquo;&nbsp;';
	 if($enum[$i]==$_REQUEST['reiter']) {print '<font color="red">'.$enum[$i].'</font>';} else {print $enum[$i];} 
	 print '</a></td>';
	}}
}
print "</tr></table></div>";
?>
</div>        
<div id="box_navigation" class="standardbox">
	<?php include 'navigation.inc.php'; ?>
</div>


<div id="box_content" class="standardbox">
<?php
	if($_REQUEST['seite'] == "") $_REQUEST['seite']="start";
	$seite = $_REQUEST['seite'];
	include 'seiten/'.$seite.'.php'; 
?>
</div>
 </div>
<div id="fancybox-tmp"></div><div id="fancybox-loading"><div></div></div><div id="fancybox-overlay"></div><div id="fancybox-wrap"><div id="fancybox-outer"><div class="fancy-bg" id="fancy-bg-n"></div><div class="fancy-bg" id="fancy-bg-ne"></div><div class="fancy-bg" id="fancy-bg-e"></div><div class="fancy-bg" id="fancy-bg-se"></div><div class="fancy-bg" id="fancy-bg-s"></div><div class="fancy-bg" id="fancy-bg-sw"></div><div class="fancy-bg" id="fancy-bg-w"></div><div class="fancy-bg" id="fancy-bg-nw"></div><div id="fancybox-inner"></div><a id="fancybox-close"></a><a href="javascript:;" id="fancybox-left"><span class="fancy-ico" id="fancybox-left-ico"></span></a><a href="javascript:;" id="fancybox-right"><span class="fancy-ico" id="fancybox-right-ico"></span></a></div></div>
</body>
</html>
<?php
function recht($rt){
switch($rt) {
case 999:
	$return="Superadmin";
break;
case 777:
	$return="Admin";
break;
case 555:
	$return="Mitglied";
break;
default:
	$return="Gast";
break;
}
return $return;
}
?>