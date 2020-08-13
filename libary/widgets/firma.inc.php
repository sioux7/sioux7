<?php
  $sql_queryfir = "SELECT * FROM sioux7_firma";
  $resultfir = mysqli_fetch_assoc(mysqli_query($GLOBALS['DB'],$sql_queryfir));
  echo '<p>'.$resultfir['firma'].'<br>'.$resultfir['adresse'].'<br>'.$resultfir['plz'].' '.$resultfir['ort'].'<br>'.$resultfir['land'].'</p>
  		<p>@ '.$resultfir['email'].'</p>';
?>  