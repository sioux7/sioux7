<?php
$query="SELECT * FROM sioux7_kategorie WHERE dom_id=".$_SESSION['DOM']." AND lang='".$_SESSION['LANG']."' AND parent=0 AND menu='footer' AND aktiv='1' ORDER BY rang";
$result=mysqli_query($GLOBALS['DB'],$query);
while($row=mysqli_fetch_array($result)){
if($row['kategorie_id'] !=0 && $row['titel'] !="") {
		echo '<a href="'.getLink($row['kategorie_id']).'">'.$row['titel'].'</a>';}
}
?>