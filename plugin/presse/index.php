<?php
if(!$_REQUEST['p_id']){
$ask=sitescroll('sioux7_presse','p_id','');
echo $ask[0];
$result = mysqli_query($GLOBALS['DB'],$ask[1]);
    print "<div class='press'><ul>";
 	while ($row = mysqli_fetch_array($result)) {
		print "<li><small>".datum($row['datum'])."</small><br> <a href='".$_GET['kategorie'].".html?p_id=".$row['p_id']."'>".$row['titel']."</a><hr></li>";}
	print "</ul></div>";
}
else {
$id = intval($_REQUEST['p_id']);
$sql_query = "SELECT * FROM sioux7_presse WHERE p_id=".$id;
$result = mysqli_query($GLOBALS['DB'],$sql_query) or die($sql_query);
while ($row = mysqli_fetch_array($result)){
	  echo '<small>'.datum($row['datum']).'</small><br>'; 
	  if($row['bild'] != "" and file_exists ("upload/images/".$row['bild']) == 1){
	  echo '<img SRC="upload/images/'.$row['bild'].'" ALT="News" style="margin: 5px; max-width: 180px; float:left;">';
	 }
	 echo $descr=$row['descr'];
	}
}	
?>	