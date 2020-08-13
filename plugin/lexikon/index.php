<?php
if(!isset($_REQUEST['bereich'])) {$bereich='Glosar';} else {$bereich=$_REQUEST['bereich'];}
if(!isset($_REQUEST['t'])) {$buchst='a';} else {$buchst=$_REQUEST['buchst'];}
$sql_query = "SELECT * FROM sioux7_lexika";
$result = mysqli_query($GLOBALS['DB'],$sql_query);
$enum=enum_select('sioux7_lexika', 'bereich');
print "<div id='bereich' style='height: 40px;'><ul style='list-style:none;'>";
for($i=0;$i<sizeof($enum);$i++) {
	if($enum[$i] != 'myselect') {
	 print '<li style="float: left;"><a href="'.$_GET['kategorie'].'.html?bereich='.$enum[$i].'">&raquo;&nbsp;';
	 if($enum[$i]==$bereich) {print '<font color="red">'.$enum[$i].'</font>';} else {print $enum[$i];} 
	 print '</a></li>';
	}
}
print "</ul></div>";
if(!isset($buchst)) {$buchst="A";}
print "<center><table border=0 width=370><tr>";
	for($i=65;$i<91;$i++) {
	if(isset($_GET['t']) and $_GET['t']==$i){
	   print "<td><font color='red'>&#".$i."</font></td>";
	}
	else {
	  print "<td><a href='".$_GET['kategorie'].".html?bereich=".$bereich."&buchst=&#".$i."&t=".$i."'>&#".$i."</a></td>";
	    }
        }
print "</tr></table></center>";
$sql_query_lex = "SELECT * FROM sioux7_lexika WHERE befehl LIKE '".$buchst."%' and bereich='$bereich' order by befehl";
$result_lex  = mysqli_query($GLOBALS['DB'],$sql_query_lex);
print "<hr><table>";
while ($row_lex  = mysqli_fetch_array($result_lex)) {
	if($row_lex['bild'] != "" and file_exists ("upload/images/".$row_lex['bild']) == 1){
		print '<tr><td><img SRC="upload/images/'.$row['bild'].'" BORDER="1" ALT="" style="max-width: 200px;float: left;margin-right: 15px;"></td></tr>';
	 }	
	print "
            <tr>
		
                <td align='left'><b>".$row_lex ['befehl']."</td>
	   </tr>";
   if($row_lex['aufbau'] !=""){
	print"<tr>
		
                <td align='left'><b>".$row_lex ['aufbau']."</td>
	   </tr>";}
   print"   <tr>
		
                <td align='left' class='textformat'><blockqoute>".$row_lex['text']."</blockquote></td>
            </tr>
           <tr>
		<td><hr></td>
	   </tr>";
}
print "</table>";

?>