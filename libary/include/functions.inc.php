<?php
function mysqli_field_name($result, $field_offset) {
    $properties = mysqli_fetch_field_direct($result, $field_offset);
    return is_object($properties) ? $properties->name : false;
}

function getRootParent($intKatID) {
		$intKatID = (int)$intKatID;
		$sqlParentKat = mysqli_query($GLOBALS['DB'],"	SELECT 		parent
										FROM		sioux7_kategorie
										WHERE		kategorie_id = {$intKatID}");
		$arrParentKat = mysqli_fetch_assoc($sqlParentKat);
		if ($arrParentKat['parent']<1) return $intKatID;
		return getRootParent($arrParentKat['parent']);
}

function getParentKats($intKatID, $bolVorschau = false) {
		if ($bolVorschau) $strAddAktivQuery = "AND	aktiv='1'";
		$arr = array($intKatID);
		$strParentQuery = "	SELECT 		parent
							FROM		sioux7_kategorie
							WHERE		kategorie_id = {$intKatID}
							".$strAddAktivQuery;
		$sqlParentKat = mysqli_query($GLOBALS['DB'],$strParentQuery);
		$arrParentKat = mysqli_fetch_assoc($sqlParentKat);
		if ($arrParentKat['parent']>0)
		$arr = array_merge($arr, getParentKats($arrParentKat['parent']));
		return $arr;
}
	
function parsePageName2Id($string) {
		$url=explode('/',$string);
		$anz=count($url)-1;
		$site=$url[$anz];
		$mysite=str_replace('-',' ',$site);
		$strParentQuery = "	SELECT 		kategorie_id
							FROM		sioux7_kategorie
							WHERE		dom_id=".$_SESSION['DOM']." AND lang='".$_SESSION['LANG']."' AND titel  LIKE '".$mysite."%'";
		$sqlParentKat = mysqli_query($GLOBALS['DB'],$strParentQuery);
		$arrParentKat = mysqli_fetch_assoc($sqlParentKat) or header("location: http://".$_SERVER['HTTP_HOST']."/");
		return $arrParentKat['kategorie_id'];		
}

function getLink($id = NULL) {
	$strReturn='';
	$arrBezeichnung = mysqli_fetch_assoc(mysqli_query($GLOBALS['DB'],"SELECT titel, parent FROM sioux7_kategorie WHERE kategorie_id = '".$id."' LIMIT 1"));
	if($arrBezeichnung['parent'] > 0) {
		$strReturn.=str_replace('.html','',getlink($arrBezeichnung['parent']))."/";
	}
	$katBez=make2url($arrBezeichnung['titel']);
	$link = $strReturn.$katBez;
	return $link;
}

function getBreadcrumb($intKategorie){
	if($intKategorie != 0) {
		$arrInfo = mysqli_fetch_assoc(mysqli_query($GLOBALS['DB'],"SELECT * FROM sioux7_kategorie WHERE kategorie_id='$intKategorie' LIMIT 1"));
		$strReturn = $arrInfo['titel']."|";
		if($arrInfo['parent'] > 0) $strReturn.=getBreadcrumb($arrInfo['parent']);
	} else {
		$strReturn = ucfirst($_REQUEST['seite']);
	}
	return $strReturn;
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

function datum($dat){
	$datetime = explode(" ",$dat);
	$dat = explode("-",$datetime[0]);
	$dat = array_reverse($dat);
	$dat = implode(".", $dat);
	return $dat;
}

function type($what) {
	switch ($what) {
	case "pdf": $type = "pdf.jpg";$tname ="PDF"; break;
	case "zip": $type = "zip.jpg";$tname ="ZIP"; break;
	default: $type=""; break;
	}
	return array($type,$tname);
}

function xeregi($need,$search) {
	if (preg_match("/".$need."/i", $search)) {
	   return TRUE;
	} else {
	   return FALSE;
	}
}

function shortText($string,$lenght=20) {
    if(strlen($string) > $lenght) {
        $string = substr($string,0,$lenght)."...";
        $string_ende = strrchr($string, " ");
        $string = str_replace($string_ende," ...", $string);
    }
    return $string;
}
if(!function_exists('enum_select')){
function enum_select( $table , $field ){
	$query = " SHOW COLUMNS FROM `$table` LIKE '$field' ";
	$result = mysqli_query( $GLOBALS['DB'],$query );
	$row = mysqli_fetch_array( $result );
	$regex = "/'(.*?)'/";
	preg_match_all( $regex , $row[1], $enum_array );
	$enum_fields = $enum_array[1];
	return( $enum_fields );
}} 	
function sitescroll($table,$field,$bereich){
	if(!$_REQUEST['entry']) $_REQUEST['entry']=0;
	if(!$_REQUEST['page']) $_REQUEST['page']=1;
	if($bereich) {$where.=' AND bereich="'.$bereich.'"';$link='&bereich='.$bereich;}
	if ($_REQUEST['search']) {
		$myq=mysqli_query($GLOBALS['DB'],"SELECT * FROM ".$table);
		$myfields_cnt = mysqli_num_fields($myq);
		$where.= " AND ( ";
		for($k = 0; $k < $myfields_cnt; $k++) {
			if($k==$myfields_cnt-1) {
				$where.= mysqli_field_name ($myq,$k)." LIKE '%".$_REQUEST['search']."%'";
			} else {
				$where.= mysqli_field_name ($myq,$k)." LIKE '%".$_REQUEST['search']."%' OR ";
			}
		}
		$where.= " ) ";
	}
	$sql_query1 = "SELECT * FROM ".$table." WHERE dom_id=".$_SESSION['DOM']." AND lang='".$_SESSION['LANG']."' AND ".$field." <> 0".$where;
	$erg = mysqli_query($GLOBALS['DB'],$sql_query1);
	$num_entries = mysqli_num_rows($erg);
	$all_pages = $num_entries / MAXSHOW;
	$num_pages = intval($all_pages);
	if($num_pages < $all_pages) $num_pages++;
	if ($num_pages > 0) {
	if ($_REQUEST['page'] < $num_pages) {
			$i = $_REQUEST['page'];
			$page_num = $_REQUEST['page'] + 1;
			$a_w = "<a href=\"".$_GET['kategorie'].".html?entry=" .($i * MAXSHOW)."&page=".$page_num.$link."\">weiter &raquo;</a>";}
			if($_REQUEST['page'] > 1 and $num_pages > 1) {
			$i = $_REQUEST['page'] - 2;
			$page_num = $_REQUEST['page'] - 1;
			$a_z = "<a href=\"".$_GET['kategorie'].".html?entry=" .($i * MAXSHOW)."&page=".$page_num.$link."\">&laquo; zur&uuml;ck</a>";}
		
		for ($i=0; $i < $num_pages; $i++) {
		$page_num = $i + 1;
		if($page_num==$_REQUEST['page']){
					$a_m.="&nbsp;<font color='red'>".$_REQUEST['page']."</font>&nbsp;";}
				else{
					$a_m.= " <a href=\"".$_GET['kategorie'].".html?entry=" .($i * MAXSHOW)."&page=".$page_num.$link."\">$page_num</a>";}
		}
	} 
	 if($_REQUEST['search']) {$mysearch='<div>Suchergebnis f&uuml;r: <b>'.$_REQUEST['search'].'</b></div>';}
	 if($_REQUEST['bereich']) {$in='<input type="hidden" name="bereich" value="'.$bereich.'">';}
	 $ret='<div><div style="float:right;"><form method="GET">'.$in.'<input type="text" name="search" value="">&nbsp;<input type="submit" value="suche" class="button"></form></div><div style="float:right;margin-right: 30px;">'.$a_w.'</div><div style="float:left;">'.$a_z.'</div><div align="center">[Seite: '.$a_m.']'.$mysearch.'</div></div>';	
	$sql_queryk=$sql_query1." LIMIT ".$_REQUEST['entry'].",".MAXSHOW;
	return array($ret,$sql_queryk);
}
function searchablefields($search=NULL,$id=NULL){
	if($search) {$q=' AND titel="'.$search.'"';}
	$test="select titel,plugin from sioux7_tables where rights<'778'".$q;
	$res=mysqli_query($GLOBALS['DB'],$test) or die($test);
	while($t=mysqli_fetch_array($res)){
	if($t['titel'] != 'neu'){
	$pplugin=$t['plugin'];
	$fuck="select * from ".$t['titel'];
	$fk=mysqli_query($GLOBALS['DB'],$fuck) or die($fuck);
	$fields_cnt = mysqli_num_fields($fk);
	for($j = 0; $j < $fields_cnt; $j++) {
		$name = mysqli_field_name ($fk,$j);
		$type = mysqli_field_type($fk, $j);
		if(xeregi('_id', $name)) {$want.=$name.',';}
		if($type=="text" || $type=="string" || $type=="blob" ){if($name == "bereich") {$brereich.=$name.',';} else {$want.=$name.',';}}
	}
	$want = substr($want,0,-1);
	$build .= $t['titel'].'=>'.$want.$bereich;
	}}
	if($build && $pplugin){
	$ret=getIntro($build,$id,$pplugin);
}}
function getIntro($build,$id=NULL,$pplugin=NULL){
	$fields=explode('=>',$build);
	$get=explode(',',$fields[1]);
	if($id) {$q=' WHERE '.$get[0].'='.$id;}
	$need='SELECT '.$fields[1].' FROM '.$fields[0].$q;
	$res=mysql_query($need) or die($need);
	while($row=mysql_fetch_assoc($res)){
		$link=getTheLink($get[0],$id,$pplugin);
		for($a=1;$a<count($get);$a++){
			if($get[$a]=='titel') {echo '<a href="'.$link.'">'.$row[$get[$a]].'</a><br>';}
		}
	}
}
function getTheLink($id_name,$id,$plugin=NULL){
	$query="SELECT kat.titel as ktitel, kat.parent FROM sioux7_kategorie kat, sioux7_content cont WHERE cont.plugin='".$plugin."' AND kat.kategorie_id=cont.level LIMIT 1";
	$res=@mysql_query($query);
	$arrBezeichnung = @mysql_fetch_assoc($res);
	if($arrBezeichnung['parent'] > 0) {
		$strReturn.=str_replace('.html','',getlink($arrBezeichnung['parent']))."/";
	}
	$katBez=make2url($arrBezeichnung['ktitel']);
	$link = $strReturn.$katBez.'?'.$id_name.'='.$id;
	return $link;
}
?>