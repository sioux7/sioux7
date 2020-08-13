<?php
error_reporting(E_ERROR);
ini_set('display_errors', 1);
session_start();
require_once ('libary/class/class.DbObject.php');
if (!($DBObj instanceof MyDbObject)) {
	$DBObj = new MyDbObject();
}
if($_REQUEST['login'] OR $_REQUEST['set']) {
	$DBObj->login($_REQUEST['pw'],$_REQUEST['benutzer'],$_REQUEST['set']);
}
$arrInfo = mysqli_fetch_assoc(mysqli_query($GLOBALS['DB'],"SELECT * FROM sioux7_kategorie WHERE property='startseite' AND lang='".$_SESSION['LANG']."' LIMIT 1"));
if(!$_GET['kategorie']) {$_GET['kategorie'] = $arrInfo['titel'];}
include "libary/include/functions.inc.php";
include "libary/include/reg_globals.inc.php";
if($_REQUEST['lang']) {$_SESSION['LANG']=strtolower($_REQUEST['lang']);}
if(!$_SESSION['LANG']) {$_SESSION['LANG'] = 'de';}
include INC."stats.inc.php";
require_once(SCLASS."class.Cache.php");
if (!($cache instanceof u_cache)) {
	$cache = new u_cache();
}
$cs= $cache->getSiteCache();
$cache->setCaching($cs);
$cache->setCacheDir("sioux7cache/");
$cache->setCacheLifetime(3600);
include SCLASS.	"class.Template.php";
if (!($template instanceof Template)) {
	$template = new Template();
}

$template->add_stylesheet('media/css/bootstrap.min.css','screen','all');
$template->add_stylesheet('media/css/jquery.mmenu.all.css','screen','all');
$template->add_stylesheet('media/css/bootstrap-datepicker.min.css','screen','all');


$template->add_footerscript('media/js/jquery-2.2.0.min.js','file');
$template->add_footerscript('media/js//bootstrap.min.js','file');
$template->add_footerscript('media/js/jquery.mmenu.min.all.js','file');
$template->add_footerscript('media/js/slick.js','file');
$template->add_footerscript('media/js/bootstrap-datepicker.min.js','file');

$template->load("template/".TPL."/index.php");
$template->emit_head();
if($cache->caching && !$_SESSION['user_id']){
	if(strstr($_GET['kategorie'],'/')){
		$url=explode('/',$_GET['kategorie']);
		$anz=count($url)-1;
		$seite=$url[$anz];
	} else {
		$seite=$_GET['kategorie'];
	}
	if(!$cache->isCached($seite.".html")){
		$cache->addCache($seite.".html", $template->code(),0);}
	$content=$cache->getCache($seite.".html",0);
	echo $content."\n</html>";
	}
else{
	echo $template->publish();
	$template->emit_tfooter();
}
?>