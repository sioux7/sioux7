<?php
	  echo'<div class="yamm" role="navigation"> 
        <div class="navbar-header">
		<!--Button -->
		<div id="menuheader" class=" visible-xs">
			<a href="#menu-left" class="navbar-toggle button">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>						
			</a>			
		</div>
		<!-- //Button -->
	</div>
		<div class="collapse navbar-collapse" role="navigation"><nav id="navi" class="navi">';
		$menu=MyDbObject::kat("sioux7_kategorie", 0,'menu');
		echo $menu;
		echo '</nav></div>
		      </div>
		      <nav id="menu-left" class="padd-menu"></nav>';
?>
