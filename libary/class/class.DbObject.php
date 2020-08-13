<?php
class MyDbObject {
	var $_table_name;
	var $_id_name;
	public function __construct() {
        require('sioux7conf/globals.inc.php');
		$db_verbindung = @mysqli_connect($server, $user, $passwort, $datenbank);
		if(!$db_verbindung){
			print "Hier ensteht eine neue Domain.<br><br>";
			print "Leider kann diese Seite kurzzeitig nicht dargestellt werden.<br><br>";
			print "Wir bitten Sie um etwas Geduld.";
			die();
		} else {
			$GLOBALS['DB'] = $db_verbindung;
			mysqli_set_charset($db_verbindung, "utf8");
			$sql_DOM="SELECT domain_id FROM sioux7_domain WHERE domainname='".$_SERVER['HTTP_HOST']."'";
			$res=mysqli_query($GLOBALS['DB'],$sql_DOM);
			$arrDOM=mysqli_fetch_array($res);
			$_SESSION['DOM'] = $arrDOM['domain_id'];
			$dbQuery=mysqli_query($db_verbindung,"SELECT * FROM sioux7_konfiguration WHERE dom_id=".$_SESSION['DOM']);
			while($arrKonf = mysqli_fetch_assoc($dbQuery)){
				define(strtoupper($arrKonf['schluessel']), $arrKonf['wert']);
			}
		}
    }
	static function loadtopivars(){
		$pi=array();
		foreach($_GET as $key => $value){
			$pi[$key]=mysqli_real_escape_string($value);
		}
		return $pi;
	}
	function DbObject($table_name, $felder, $init, $sort = null, $ausgabe = NULL) {
		$this->_table_name = $table_name;
		self::pruefen();
		self::getID();
		self::loadtopivars();
		$query = self::getQuery($init,$sort,$felder);
		if(!$result = mysqli_query($GLOBALS['DB'],$query)){
			$_SESSION['sort']='';
			header("location: .");
		}
		$num=mysqli_num_rows($result);
		if($num == 0) die('Kein Ergebnis');
		while($row=mysqli_fetch_assoc($result)){
			$daten[]=$row;
		}
		if($ausgabe == 'table') {
			self::display($daten);
		} else if($ausgabe == 'details') {
			self::details($daten);
		} else {
			return $daten;
		}
	}
	function getQuery($id = null,$sort = null,$felder) {
		if ($table_name == "") $table_name = $this->_table_name;
		if ($id_name == "") $id_name = $this->_id_name;
		$where = " WHERE 1=1 ";
		if ($id !== null && $id !=0) {
			$where.= " AND `".$this->_id_name."`='".mysql_real_escape_string($id)."'";
		}
		if ($this->search) {
			$sf=explode(',',$felder);
			$where.= " AND (";
			for($k=0;$k<count($sf);$k++){
				if($k==count($sf)-1) {
					$where.= " `$sf[$k]` LIKE '%".mysql_real_escape_string($this->search)."%'";
				} else {
					$where.= " `$sf[$k]` LIKE '%".mysql_real_escape_string($this->search)."%' OR ";
				}
			}
			$where.= " ) ";
		}
		$order = self::getSortClause($sort);
		if(!$this->entry) $this->entry=0;
		if (!$this->search) {$limit=' LIMIT '.$this->entry.','.MAXSHOW;}
		$felder.=",".$this->_id_name;
		$query = "SELECT $felder FROM `$table_name`$where$order$limit";
		return $query;
	}
	function getSortClause($sort) {
		if ($sort === null OR $sort == '')
			return "";
		$order = "";
		foreach($sort AS $value => $dir) {
			if ($value === 0)
				continue;
			if ($order == "")
				$order = " ORDER BY ";
			else
				$order .= ",";
			$order .= "`$value` ".$dir;
			$this->sortby =$value;
			$this->art = $dir;
		}
		return $order;
	}
	function display($daten){
		self::sitescroll();
		$th=self::getColumns($daten[0]);
		echo '<div id="wrap"><div class="divTable">
				 <div class="headRow">';
				 for($i=0;$i<count($th);$i++){
					if($th[$i]==$this->_id_name) {continue;}
				 	if($this->sortby == $th[$i]) {if($this->art == 'DESC') {$art='ASC';$z='&darr;';} else {$art='DESC';$z='&uarr;';}} else {$art='ASC';$z='&darr;';}
					echo'<div class="divCellHead" align="center">'.$th[$i].'<a href="?sort='.$th[$i].'&art='.$art.'">'.$z.'</a></div>';
				 }
				 echo '<div class="divCellHead" style="text-align:right;">&darr;</div>';
		echo '	 </div>';
		for($i=0;$i<count($daten);$i++){
				echo '<div class="InhaltRow">';
				foreach($daten[$i] AS $key=>$inhalt){
					if($key==$this->_id_name) {$this->_show=$inhalt;continue;}
					if($inhalt) {$text=self::shortText($inhalt,100);} else {$text='&nbsp;';}
                	echo '<div class="divCellInhalt">'.$text.'</div>';
                }
                echo '<div class="divCellInhalt" style="text-align:right;"><a href="?show='.$this->_show.'">show</a></div>';
            	echo '</div>';
		}
		echo '</div></div>';
	}
	function details($daten){
		foreach($daten[0] AS $key=>$inhalt){
			if($key==$this->_id_name) {continue;}	
			if($inhalt) {$text=$inhalt;} else {$text='&nbsp;';}
            echo '<div>'.$key.': </div><div>'.$text.'</div>';
        }
		echo '<div><a href="?show=0">&laquo; back</a></div>';
	}
	function getColumns($data) {
		$columns = array();
		foreach ($data AS $key => $value) {
			$columns[] = $key;
		}
		return $columns;
	}
	function sitescroll() {
		$aquery='SELECT * FROM '.$this->_table_name;
		$result=mysqli_query($GLOBALS['DB'],$aquery);
		$this->num_entries = mysqli_num_rows($result);

		$this->all_pages = $this->num_entries / MAXSHOW;
		$this->num_pages = intval($this->all_pages);
		if($this->all_pages > $this->num_pages) $this->num_pages++;
		if($this->num_pages < $this->all_pages) $this->num_pages++;
		if ($this->num_pages > 0 && !$_REQUEST['search']) {
			if(!$this->entry) $this->entry=0;
			if(!$this->page) $this->page=1;
			if ($this->page < $this->num_pages) {
				$i = $this->page;
				$page_num = $this->page + 1;
				$a_w = " <a href=\"?entry=" .($i * MAXSHOW)."&page=".$page_num."\">weiter &raquo;</a>";}
				if($this->page > 1 and $this->num_pages > 1) {
				$i = $this->page - 2;
				$page_num = $this->page - 1;
				$a_z = " <a href=\"?entry=" .($i * MAXSHOW)."&page=".$page_num."\">&laquo; zur&uuml;ck</a>";}
	
			for ($k=0; $k < $this->num_pages; $k++) {
				$page_num = $k + 1;
				if($page_num==$this->page){
					$a_m .= "&nbsp;<font color='red'>".$this->page."</font>&nbsp;";}
				else{
					$a_m .= " <a href=\"?entry=".($k * MAXSHOW)."&page=".$page_num."\">$page_num</a>";}
				}
			} 
	 echo '<div><div style="float:right;"><form method="GET"><input type="text" name="search" value=""><input type="submit" value="suche"></form></div><div style="float:right;margin-right: 30px;">'.$a_w.'</div><div style="float:left;">'.$a_z.'</div><div align="center">'.$a_m.'</div></div>';
	}
	function getID(){
		$ts=mysqli_query($GLOBALS['DB'],"SHOW KEYS FROM ".$this->_table_name." WHERE Key_name = 'PRIMARY'");
		$ats = mysqli_fetch_array($ts);
		$this->_id_name = $ats['Column_name'];
	}
	function shortText($string,$lenght) {
	    if(strlen($string) > $lenght) {
	        $string = substr($string,0,$lenght)."...";
	        $string_ende = strrchr($string, " ");
	        $string = str_replace($string_ende," ...", $string);
	    }
	    return $string;
	}
	function pruefen(){
	 $pruefe='SELECT * FROM '.$this->_table_name;
	 if(!mysqli_query($GLOBALS['DB'],$pruefe)) die('Tabelle : '.$this->_table_name.' nicht vorhanden!');
	}
	static function kat($table, $intStart,$menu){
		global $_SESSION;
		$strSQL = "SELECT * FROM ".$table." WHERE dom_id=".$_SESSION['DOM']." AND lang='".$_SESSION['LANG']."' AND parent=".$intStart." AND menu='".$menu."' AND aktiv=1 ORDER BY rang";
		$dbQuery = mysqli_query($GLOBALS['DB'],$strSQL);
		$strReturn .="<ul ";
		if($intStart==0) {$strReturn .="class='nav navbar-nav navbar-left'";} else {$strReturn .="class='dropdown-menu'";}
		$strReturn .=">";
		while($arrKat = mysqli_fetch_array($dbQuery)){
			if($arrKat['kategorie_id'] !='0' && $arrKat['titel']) {
	
				$strReturn.="<li ";
				if($intStart==0) {$strReturn .="class='dropdown'";} else {$strReturn .="class='dropdown-submenu'";}
				$strReturn.="><a href='".getLink($arrKat['kategorie_id'])."' title='".$arrKat['beschreibung']."'";
				if($arrKat['icon']) {$icon = '<i class="fa '.strtolower($arrKat['icon']).'" aria-hidden="true"></i>';} else {$icon = '';}
				$strReturn.=">".$icon." ".$arrKat['titel']."</a>";
	
				$strSQL2 = "SELECT * FROM ".$table." WHERE parent=".$arrKat['kategorie_id']." AND aktiv=1";
				$unter=mysqli_query($GLOBALS['DB'],$strSQL2);
				if($unter) {
					if(mysqli_num_rows($unter)>0) $strReturn.= self::kat($table,$arrKat['kategorie_id'],$menu);
				}
			}
		}
		$strReturn .="</li></ul>";
		return $strReturn;
	}
	function login($pw,$user,$set = NULL){
		if(!$set) {
			$password = md5($pw);
			$check = "SELECT * FROM `sioux7_members` WHERE `email` = '".$user."' AND passwort='".$password."' AND dom_id=".$_SESSION['DOM'];
			$getUserValuesQuery = @mysqli_query($GLOBALS['DB'],$check);
			$getUserValuesFetch = @mysqli_fetch_array($getUserValuesQuery);
			$_SESSION['member_id'] = $getUserValuesFetch['member_id'];
			$_SESSION['username'] = $getUserValuesFetch['login'];
			$_SESSION['right'] = $getUserValuesFetch['rights'];
		} else {
			unset($_SESSION['member_id']);
			unset($_SESSION['username']);
			unset($_SESSION['right']);
		}
	}
	static function sitemap($table, $intStart, $pos=0, $strEinrueckung="&nbsp;-",$menu,$feld){
		$strSQL = "SELECT * FROM ".$table." WHERE dom_id=".$_SESSION['DOM']." AND lang='".$_SESSION['LANG']."' AND parent=".$intStart." AND aktiv=1 AND menu='".$menu."' ORDER BY rang";
		$dbQuery = mysqli_query($GLOBALS['DB'],$strSQL);
		while($arrKat = mysqli_fetch_assoc($dbQuery)){
			if($arrKat['kategorie_id'] !='0' && $arrKat['titel']) {
				$strReturn.="<li>".str_repeat($strEinrueckung, $pos)."&raquo;  <a href='".getLink($arrKat[$feld])."'";
				$strReturn.=">".$arrKat['titel']." ";
				$strReturn.="</a><br>".str_repeat($strEinrueckung, $pos)."&nbsp;&nbsp;".strip_tags($arrKat['beschreibung']);
				$strReturn .="</li>";	
				$strSQL2 = "SELECT * FROM ".$table." WHERE dom_id=".$_SESSION['DOM']." AND lang='".$_SESSION['LANG']."' AND parent=".$arrKat[$feld]." AND menu='".$menu."'";
				if($arrKat[$feld] != 0) {
					$unter=mysqli_query($GLOBALS['DB'],$strSQL2);
					if(mysqli_num_rows($unter)>0) $strReturn.= self::sitemap($table,$arrKat[$feld],$pos+2,$strEinrueckung,$menu,$feld);
				}
			}}
			return $strReturn;
	}
	
}
?>
