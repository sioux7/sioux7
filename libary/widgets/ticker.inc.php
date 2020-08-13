<?php
$sql_query = "SELECT * FROM sioux7_ticker WHERE dom_id=".$_SESSION['DOM']." AND lang='".$_SESSION['LANG']."' AND t_id <> 0";
$result = mysqli_query($GLOBALS['DB'],$sql_query);
echo '
<ul class="typing">';
while ($row = mysqli_fetch_array($result)) {
    echo '<li>'.$row['inhalt'].'</li>';
}
echo '</ul>';
?>