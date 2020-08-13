<?php
if(isset($play_musik)) {$play_musik=$_REQUEST['$play_musik'];}
echo'
<div id="page" align="'.$row1['pos'].'">
<!-- this A tag is where your Flowplayer will be placed. it can be anywhere -->
<a  
	 href="/upload/files/'.$_SESSION['play_musik'].'"  
	 style="display:block;width:520px;height:330px;"  
	 id="player"> 
</a> 
<script>
	flowplayer("player", "media/video/player/flowplayer-3.2.5.swf");
</script>
&copy; Flowplayer</div>';
?>
 	