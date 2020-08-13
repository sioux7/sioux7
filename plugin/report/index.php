<?php
$query_an="SELECT * FROM sioux7_report WHERE m_id <> 0 ORDER BY m_id DESC";
$result_an=mysqli_query($GLOBALS['DB'],$query_an);
echo '<div id="accordion1" class="panel-group">';
$k=0;
while($row_an=mysqli_fetch_array($result_an)){
	$k++;
	echo '
	<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a class="collapsed" data-toggle="collapse" data-parent="#accordion1" href="#k'.$k.'">'.$row_an["titel1"].'&nbsp;-&nbsp; '.$row_an["report"].'</a></h4></div>';
			$query_report="SELECT * FROM sioux7_reportinhalt WHERE mi_id <> 0 AND level=".(int)$row_an["m_id"];
			echo '<div id="k'.$k.'" class="panel-collapse collapse">';
			$result_report=mysqli_query($GLOBALS['DB'],$query_report);
			while($row_report=mysqli_fetch_array($result_report)){
				echo '<div class="panel-body">'.$row_report["titel"].'<br>'.$row_report["text"].'</div>';
	        	}
		echo '</div></div>';
}
echo '</div>';
?>