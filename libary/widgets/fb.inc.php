<?php
$content.="	  <script>(function(d, s, id) {
			  var js, fjs = d.getElementsByTagName(s)[0];
			  if (d.getElementById(id)) return;
			  js = d.createElement(s); js.id = id;
			  js.src = '//connect.facebook.net/de_DE/sdk.js#xfbml=1&appId=777409912280785&version=v2.0';
			  fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));</script>
			 <div class='fb-like-box' data-href='http://www.facebook.com/olaf.urban' data-width='600' data-height='200' data-colorscheme='light' data-show-faces='false' data-header='true' data-stream='true' data-show-border='true'></div>";
echo $content;
?>