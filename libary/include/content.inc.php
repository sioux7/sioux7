<?php
$intCurrentKat = parsePageName2Id($_GET['kategorie']);
$query="select * from sioux7_kategorie where kategorie_id=".$intCurrentKat;

$row=mysqli_fetch_array(mysqli_query($GLOBALS['DB'],$query));
echo "<h1>".$row['titel']."</h1>";
// vorbidden sites
$vorbidden=array();
$querys="SELECT * FROM sioux7_kategorie";
$results=mysqli_query($GLOBALS['DB'],$querys);
while($rows=mysqli_fetch_array($results)){
if($rows['intern'] == 1 && $_SESSION['member_id'] =="") {
		$vorbidden[]=$rows['kategorie_id'];}
}
echo '<div class="row">';
if(!in_array($intCurrentKat,$vorbidden)) {
$query1="select * from sioux7_content where con_id <> 0 and level=".$intCurrentKat." ORDER BY rang";
$res1=mysqli_query($GLOBALS['DB'],$query1);
while($row1=mysqli_fetch_array($res1)){
echo '<div class="'.$row1['layout'].' '.$row1['cols'].'">';
if (file_exists("upload/images/".$row1['bild']) == 1 && $row1['bild'] !="") {
	if($row1['fullwidth'] == 0) $style='style="float:'.$row1['pos'].'; margin: 5px; max-width: 180px;"';
	echo '<img src="upload/images/'.$row1['bild'].'" alt="Bild"  '.$style.'/>';
}
if($row1['plugin'] !=""){
	include 'plugin/'.$row1['plugin'].'/index.php';
} else if($row1['ismodul'] == 1){
	eval($row1['inhalt']);
} else {
	echo $row1['inhalt'];
}
if (file_exists("upload/files/".$row1['datei']) == 1 && $row1['datei'] !="") {
		$type = explode(".",$row1['datei']);
		if($type[1]=='mp4'){
			$_SESSION['play_musik'] = $row1['datei'];
			include 'media/video/index.php';					
		} else {
			$icon= type($type[1]); 
			echo '<br><img src="media/images/icons/'.$icon[0].'" alt="">&nbsp;<a href="upload/files/'.$row1['datei'].'" target="_blank"/>'.$icon[1].'</a>';
		}
}
echo '</div>';
}
} else {
	echo '<div class="col-md-12">Du musst eingeloggt sein um diese Seite sehen zu k&ouml;nnen.</div>';
}
echo '</div>';
?>