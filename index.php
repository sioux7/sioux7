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
include "libary/include/functions.inc.php";
include "libary/include/reg_globals.inc.php";
//$_SESSION['DOM']=getDOM();
$_SESSION['DOM']=2;
if($_REQUEST['lang']) {$_SESSION['LANG']=$_REQUEST['lang'];}
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

$template->add_stylesheet('/media/css/bootstrap.min.css','screen','all');
$template->add_stylesheet('/media/css/jquery.mmenu.all.css','screen','all');
$template->add_stylesheet('/media/css/nav.css','screen','all');


$template->add_footerscript('http://code.jquery.com/jquery-2.2.0.min.js','file');
$template->add_footerscript('https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js','file');
$template->add_footerscript('/media/js/jquery.mmenu.min.all.js','file');
$template->add_footerscript('/media/js/slick.js','file');
$template->add_footerscript('/media/js/jquery.main.js','file');

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