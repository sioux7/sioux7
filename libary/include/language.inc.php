<?php
echo '<ul>';
$sql_querylang = "SELECT * FROM sioux7_language WHERE lang_id <> 0 AND activ='activ' AND dom_id=".$_SESSION['DOM']." ORDER BY lang_id DESC";
$resultlang = mysqli_query($GLOBALS['DB'],$sql_querylang);
while ($rowlang = mysqli_fetch_array($resultlang)) {
echo '
<li>
<form action="/" method="POST">
<input type="text" name="lang" value="'.strtoupper($rowlang['vat']).'" onclick="submit();">
</form>
</li>';
} 
echo '</ul>';
?>