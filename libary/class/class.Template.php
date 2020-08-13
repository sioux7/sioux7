<?php

class Template {
   public $template;
   
   function load($filepath) {

      $this->template = file_get_contents($filepath);
      $this->module();
      $this->widgets();

   }
   
   function module() {
   	global $_SESSION;
   	  $vars=array(	"slider"=>INC."slider.inc.php",
   	  				"topnav"=>INC."topnav.inc.php",
   	  				"language"=>INC."language.inc.php",   	  				
   	  				"breadcrumb"=>INC."breadcrumb.inc.php",
   	  				"banner"=>INC."banner/werbung.inc.php",
   	  			  	"menu"=>"template/".TPL."/inc/nav.inc.php",
		   	  		"content"=>INC."content.inc.php",
   	  				"footernav"=>INC."footernav.inc.php");
	  foreach($vars AS $key=>$val){
   	  	$this->modul = file_get_contents($val);
   	  	if(strstr($this->template,"#".$key."#")){
   	  		$this->template = str_replace("#".$key."#", $this->modul, $this->template);}
   	  }
   	  if($_SESSION['message']){
   	  	$this->template = str_replace("#message#", $_SESSION['message'], $this->template);
   	  }
   	  
   }
   
   function widgets() {
   	global $_SESSION;
   	$vars=array(	"ticker"=>WG."ticker.inc.php",
   					"presse"=>WG."news.inc.php",
   					"latest"=>WG."latest.inc.php",
   					"fb"=>WG."fb.inc.php",
   					"amazon"=>WG."amazon.inc.php",
   					"firma"=>WG."firma.inc.php",
   					"sozial"=>WG."sozial.inc.php",
   					"member"=>WG."login.inc.php");
   	foreach($vars AS $key=>$val){
   		$this->widget = file_get_contents($val);
   		if(strstr($this->template,"#".$key."#")){
   			$this->template = str_replace("#".$key."#", $this->widget, $this->template);}
   	}   
   }

   function replace($var, $content) {
      $this->template = str_replace("#$var#", $content, $this->template);

   }
   
   function add_meta($name, $content) {
		switch(strtolower($name)) {
			case "content-type":
			case "content-style-type":
			case "content-script-type":
			case "expires":
			case "refresh":
			case "content-language":
			case "set-cookie":
			case "cache-control":
			case "pragma":
				$this->headers[] = "  <meta http-equiv=\"$name\" content=\"$content\" />";
				break;
			default:
				$this->headers[] = "  <meta name=\"$name\" content=\"$content\" />";
				break;
		}
	}

   function add_stylesheet($filename, $media="screen", $name="") {
		for ($i = 0; $i < count($this->stylesheets); $i++) {
			if ($this->stylesheets[$i] == $filename &&
			    $this->stylesheets_media[$i] == $media &&
			    $this->stylesheets_name[$i] == $name)
				return;
		}
		$this->stylesheets[] = $filename;
		$this->stylesheets_media[] = $media;
		$this->stylesheets_name[] = $name;
	}
   
   function add_script($content, $type = "inline") {
		for ($i = 0; $i < count($this->scripts_type); $i++) {
			if ($this->scripts_type[$i] == $type &&
			    $this->scripts_content[$i] == $content)
				return;
		}
		$this->scripts_type[] = $type;
		$this->scripts_content[] = $content;
	}
	
	function add_footerscript($content, $type = "file") {
		$this->scripts_ftype[] = $type;
		$this->scripts_fcontent[] = $content;
	}
	
	function emit_head() {
		echo "<!DOCTYPE html>\n";
		echo "<html>\n<head>\n";
		echo "<!-- \n This website is powered by SIOUX7 \n SIOUX7 is a free open source Content Management Framework created by O. Urban and licensed under GNU/GPL.\n Information and contribution at http://sioux7.uidev.de/ \n -->\n";
		// include INC.'gzip_header.inc.php'; => this will only go if gzip is enabled on server!
		echo "<meta charset=\"utf-8\">".chr(10);
		echo "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">".chr(10); 
    	echo "<meta name=\"language\" content=\"".$_SESSION['LANG']."\"/>".chr(10); 
    	echo "<meta name=\"robots\" content=\"index,follow,archive\"/>".chr(10); 
    	echo "<meta name=\"revisit-after\" content=\"14 days\" />".chr(10);
		
		for ($i = 0; $i < count($this->headers); $i++) {
			echo $this->headers[$i]."\n";
		}		
		echo '<base href="'.BASE.'/" />'.chr(10);
		include INC.'meta.inc.php';
		echo '<link rel="shortcut icon" href="template/'.TPL.'/favicon.ico" type="image/x-icon" />'.chr(10);
		echo '<script type="text/javascript">if (top != self) { alert("This site is framed!") }</script>'.chr(10);
		echo '<script type="text/javascript" src="media/video/js/flowplayer-3.2.4.min.js"></script>'.chr(10);
		for ($i = 0; $i < count($this->stylesheets); $i++) {
			echo "  <link type=\"text/css\" rel=\"stylesheet\" media=\"".$this->stylesheets_media[$i]."\" href=\"".$this->stylesheets[$i]."\" title=\"".$this->stylesheets_name[$i]."\" />\n";
		}
		
		for ($i = 0; $i < count($this->scripts_type); $i++) {
			if ($this->scripts_type[$i] == "inline")
				echo "<script type=\"text/javascript\"><!--\n".$this->scripts_content[$i]."  --></script>\n";
			else if ($this->scripts_type[$i] == "file") {
				echo "<script type=\"text/javascript\" src=\"".$this->scripts_content[$i]."\"></script>\n";
			} 
		}
		// User defined head
		if(file_exists("template/".TPL."/inc/header.inc.php")){
			echo file_get_contents("template/".TPL."/inc/header.inc.php");
		}
		// Ende
		if($_SESSION['message']){
		echo '<script type="text/javascript">
		    $(document).ready(function(){
		            $(window).load(function()
		        	{
		        		$(\'#hideMe\')
		                        .animate({
		                                \'height\' : \'25px\'
		                            }, 750
		                        );
		        	});
		        	setTimeout(function() {
     					 $(\'#hideMe\')
		                        .animate({
		                                \'height\' : \'0px\'
		                            }, 750
		                        );
					}, 5000);
		    });		
		    </script>';
			}
		echo "\n</head><body class='sioux7'>\n";
	}
	
	function emit_tfooter() {	
		for ($i = 0; $i < count($this->scripts_ftype); $i++) {
			echo "<script type=\"text/javascript\" src=\"".$this->scripts_fcontent[$i]."\"></script>\n";
		}
		// User defined head
		if(file_exists("template/".TPL."/inc/footer.inc.php")){
			echo file_get_contents("template/".TPL."/inc/footer.inc.php");
		} 
		echo "\n</body>\n</html>";
   }
	
	function publish() {
     		eval("?>".$this->template."\n<?");
   }
   
   function code() {
   			
		   	ob_implicit_flush(TRUE);
		   	ob_start();
		   	eval("?>".$this->template."<?");
		   	$data = ob_get_contents();
		   	ob_end_clean();
		   	ob_implicit_flush(FALSE);
     		return $data;

   }

}

?>