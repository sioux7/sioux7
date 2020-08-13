<?php
if(!isset($_REQUEST['bereich'])) {$bereich='Server';} else {$bereich=$_REQUEST['bereich'];}
$ask=sitescroll('sioux7_blog','blog_id',$bereich);
echo $ask[0];
$enum=enum_select('sioux7_blog', 'bereich');
print "<div id='bereich' style='height: 40px;'><ul style='list-style:none;'>";
for($i=0;$i<sizeof($enum);$i++) {
	if($enum[$i] !='myselect') {
	 print '<li style="float: left;"><a href="'.$_GET['kategorie'].'.html?bereich='.$enum[$i].'">&raquo;&nbsp;';
	 if($enum[$i]==$bereich) {print '<font color="red">'.$enum[$i].'</font>';} else {print $enum[$i];} 
	 print '</a></li>';
	}
}
print "</ul></div>";
if(!isset($_REQUEST['blog_id'])){
$result = mysqli_query($GLOBALS['DB'],$ask[1]);
$t=0;
print "<hr><table>";
while ($row = mysqli_fetch_array($result)) {

        if($row['blog_id'] !=0){
			print "<tr><td><a href='".$_GET['kategorie'].".html?blog_id=".$row['blog_id']."'><font color='red'>&raquo;&nbsp;".$row['title']."</font></a><br>".$row['short']."</td></tr>";}
$t++;
}
print "</table>";
} else {
$sql_query = "SELECT * FROM sioux7_blog WHERE blog_id=".$_REQUEST['blog_id'];
$result = mysqli_query($GLOBALS['DB'],$sql_query);
$link = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
while ($row = mysqli_fetch_array($result)){
	echo '
<table>
<tbody>
<tr>
	<td><h3>'.$row['title'].'</h3></td>
</tr>
<tr>
	<td><strong>'.$row['short'].'</strong></td>
</tr>
<tr>
	<td>';
	if($row['bild'] != "" and file_exists ("upload/images/".$row['bild']) == 1){
	echo '<img SRC="upload/images/'.$row['bild'].'" ALT="" style="max-width: 200px;float: left;margin-right: 15px;">';
	}
	echo $row['descr'];
echo '
	</td>
</tr>';
if($row['datei'] !="") {
	echo '
<tr>
	<td align="right"><a href="upload/files/'.$row['datei'].'">Anhang: '.$row['datei'].'</a></td>
</tr>'; }
echo '
<tr>
	<td align="right">'.datum($row['datum']).'</td>
</tr>
</tbody>
</table>';
}
}				
?>
	