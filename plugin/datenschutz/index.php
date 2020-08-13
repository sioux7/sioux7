<?php
$sql_queryfir = "SELECT * FROM sioux7_firma WHERE dom_id=".$_SESSION['DOM'];
$resultfir = mysqli_fetch_assoc(mysqli_query($GLOBALS['DB'],$sql_queryfir));
$sql_queryfir2 = "SELECT * FROM sioux7_firma_content WHERE firma_id=".$resultfir['firma_id']." AND lang='".$_SESSION['LANG']."'";
$resultfir2 = mysqli_fetch_assoc(mysqli_query($GLOBALS['DB'],$sql_queryfir2));
echo '<div class="datenschutz">'.$resultfir2['datenschutz'].'</div>';
?>