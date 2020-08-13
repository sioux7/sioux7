<?php
$vdatum=date("Y-m-d");
$abfrageb = "SELECT * from sioux7_banner where banner_id <> 0 order by aufrufe LIMIT 1";
$resultb = @mysqli_query($GLOBALS['DB'],$abfrageb);
while ($rowb = mysqli_fetch_array ($resultb)) 
{
$name= $rowb["titel"];
$bild = $rowb["banner"];
$link = $rowb["link"];
$aufrufe = $rowb["aufrufe"];
$klicks = $rowb["klicks"];
$alt=$rowb["alt"];

$aufrufe = $aufrufe+1;

// CODE
echo "<div id='banner'><a href='libary/include/banner/bannercount.php?bname=".$name."' target='_blank'><img src='".$bild."' border=0 alt='".$alt."'></a></div>";	  
$update = "update sioux7_banner set aufrufe='$aufrufe' where titel='$name'";
$result1 = mysqli_query($GLOBALS['DB'],$update);
}
?>