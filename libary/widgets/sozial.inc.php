<?php
echo '<div class="col-social">';
if(FACEBOOK){
	echo '<a href="'.FACEBOOK.'" target="_blank">
	<i class="fa fa-facebook"></i>
	</a>';
}
if(XING){
	echo '<a href="'.XING.'" target="_blank">
	<i class="fa fa-xing"></i>
	</a>';
}
if(SKYPE){
	echo '<a href="skype:'.SKYPE.'?add">
	<i class="fa fa-skype"></i>
	</a>';
}
if($_SESSION['LANG'] == 'de'){
	echo '<a href="rss.php?dom='.$_SESSION['DOM'].'" target="_blank">
	<i class="fa fa-rss"></i>
	</a>';
}
echo '</div>';
?>