<?php

function connect2db(){
	global $server,$user,$passwort,$datenbank;
	$db_verbindung = mysqli_connect($server, $user, $passwort, $datenbank);
	if(!$db_verbindung){
		print "Hier ensteht eine neue Domain.<br><br>";
		print "Leider kann diese Seite kurzzeitig nicht dargestellt werden.<br><br>";
		print "Wir bitten Sie um etwas Geduld.";
		//mail("urban@uidev.de", "DB-ERROR: Connect @ ".$_SERVER['HTTP_HOST'], "Eine Verbindung zur Datenbank war nicht moeglich.\nDatum: ".date("d.m.Y - H:i:s")."\nError-Meldung: ".mysql_error(), "From: dbinfo@vionic.info");
		die();
	}
	$GLOBALS['DB'] = $db_verbindung;
	mysqli_set_charset($db_verbindung, "utf8");
	$dbQuery=mysqli_query($db_verbindung,"SELECT * FROM sioux7_konfiguration WHERE dom_id=".$_SESSION['DOM']);
	while($arrKonf = mysqli_fetch_assoc($dbQuery)){
		define(strtoupper($arrKonf['schluessel']), $arrKonf['wert']);
	}
		
}

function mysqli_field_name($result, $field_offset)
{
    $properties = mysqli_fetch_field_direct($result, $field_offset);
    return is_object($properties) ? $properties->name : false;
}

function mysqli_field_type($result, $field_offset)
{
    $properties = mysqli_fetch_field_direct($result, $field_offset);
    return is_object($properties) ? $properties->type : false;
}

function mysqli_field_flags($result, $field_offset)
{
    $properties = mysqli_fetch_field_direct($result, $field_offset);
    return is_object($properties) ? $properties->flags : false;
}

function mysqli_field_len($result, $field_offset)
{
    $properties = mysqli_fetch_field_direct($result, $field_offset);
    return is_object($properties) ? $properties->length : false;
}

function enum_select( $table , $field ){
	$query = " SHOW COLUMNS FROM `$table` LIKE '$field' ";
	$result = mysqli_query($GLOBALS['DB'],$query);
	$row = mysqli_fetch_array( $result);
	$regex = "/'(.*?)'/";
	preg_match_all( $regex , $row[1], $enum_array );
	$enum_fields = $enum_array[1];
	return( $enum_fields );
} 	

function shortText($string,$lenght=20) {
    if(strlen($string) > $lenght) {
        $string = substr($string,0,$lenght)."...";
        $string_ende = strrchr($string, " ");
        $string = str_replace($string_ende," ...", $string);
    }
    return $string;
}

function xeregi($need,$search) {
	if (preg_match("/".$need."/i", $search)) {
	   return TRUE;
	} else {
	   return FALSE;
	}
}
function getLink($id = NULL) {
	$strReturn='';
	$arrBezeichnung = mysqli_fetch_assoc(mysqli_query($GLOBALS['DB'],"SELECT titel, parent FROM sioux7_kategorie WHERE kategorie_id = '".$id."' LIMIT 1"));
	if($arrBezeichnung['parent'] > 0) {
		$strReturn.=str_replace('.html','',getlink($arrBezeichnung['parent']))."/";
	}
	$katBez=make2url($arrBezeichnung['titel']);
	$link = $strReturn.$katBez;
	$exist='SELECT * FROM sioux7_link_cache WHERE dom_id='.$_SESSION['DOM'].' AND lang ="'.$_SESSION['LANG'].'" AND url="'.$link.'"';
	$num=mysqli_num_rows(mysqli_query($GLOBALS['DB'],$exist));
	if($num==0) {
		$param='kat_id => '.$id;
		$CleanUrl='INSERT INTO sioux7_link_cache (dom_id,lang,url,params) VALUES ("'.$_SESSION['DOM'].'","'.$_SESSION['LANG'].'","'.$link.'","'.$param.'")';
		$ins=mysqli_query($GLOBALS['DB'],$CleanUrl);
	}
	return $link;
}

function make2url($string){
	$string = replace($string);
	$string = $string.".html";
	return strtolower($string);

}

function replace($string){
	$umlaut1=array('Ã„','Ã¤','Ãœ','Ã¼','Ã–','Ã¶','ÃŸ','€','…','†','Š','š','Ÿ',' & ','&','`','.de','.com','.tv','.',' ','§','?','!',',');
	$umlaut2=array('ae','ae','ue','ue','oe','oe','ss','ae','oe','ue','ae','oe','ue','und','und','-','','','-tv','','-','ss','','','');
	$newstring=str_replace($umlaut1, $umlaut2, $string);
	return $newstring;
}

?>