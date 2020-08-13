<?php
if(!isset($_REQUEST['bereich'])) {$bereich='PHP';} else {$bereich=$_REQUEST['bereich'];}
$ask=sitescroll('sioux7_codesnippets','cs_id',$bereich);
echo $ask[0];
$sql_query = "SELECT * FROM sioux7_codesnippets WHERE dom_id=".$_SESSION['DOM']." AND lang='".$_SESSION['LANG']."'";
$result = mysqli_query($GLOBALS['DB'],$sql_query);
$enum=enum_select('sioux7_codesnippets', 'bereich');
print "<div id='bereich'><ul>";
for($i=0;$i<sizeof($enum);$i++) {
	 print '<li><a href="'.$_GET['kategorie'].'.html?bereich='.$enum[$i].'">&raquo;&nbsp;';
	 if($enum[$i]==$bereich) {print '<font color="red">'.$enum[$i].'</font>';} else {print $enum[$i];} 
	 print '</a></li>';
}
print "</ul></div>";
if(!isset($_REQUEST["cs_id"])) {
$res=mysqli_query($GLOBALS['DB'],$ask[1]);
print "<br><div id='auswahl'><ul>";
while($row=mysqli_fetch_array($res)) {
if($row["cs_id"] !=0) {
 print "<li><a href='".$_GET["kategorie"].".html?cs_id=".$row["cs_id"]."&bereich=".$bereich."'>&raquo;&nbsp".$row["titel"]."</a><br>".$row["descr"]."</li>";
}}
print "</ul></div>";
} else {
$sql="SELECT * FROM sioux7_codesnippets WHERE cs_id=".$_REQUEST["cs_id"];
$res=mysqli_query($GLOBALS['DB'],$sql) or die(mysql_error());
$row=mysqli_fetch_array($res);
print '<div style="clear:both;"><hr></div>';
print '<div class="codeit">';
print '<h3>'.$row['titel'].'</h3>';
print '<p>'.$row["descr"].'</p>';
print  '<pre class="code" data-language="'.strtolower($_REQUEST["bereich"]).'">'.$row['code'].'</pre>';
print '</div>';
}
?>

