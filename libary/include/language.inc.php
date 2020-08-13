<?php
echo '<ul>';
$sql_querylang = "SELECT * FROM sioux7_language WHERE lang_id <> 0 AND activ='activ' ORDER BY lang_id DESC";
$resultlang = mysqli_query($GLOBALS['DB'],$sql_querylang);
while ($rowlang = mysqli_fetch_array($resultlang)) {
echo '
<li style="float:right;">
<form action="home.html" method="POST">
<input type="hidden" name="lang" value="'.$rowlang['vat'].'">
<input type="image" src="upload/images/'.$rowlang['bild'].'" value="'.$rowlang['vat'].'" onclick="submit();" name="mylanguage" style="height:20px;width:20px;">
</form>
</li>';
} 
echo '</ul>';
?>
