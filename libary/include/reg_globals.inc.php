<?php
if (!ini_get('register_globals')) {
    $superglobals=array("_GET", "_POST", "_REQUEST", "_ENV", "_FILES", "_SESSION", "_COOKIES", "_SERVER");
    foreach($GLOBALS as $key => $value) {           
	    $GLOBALS[$key] = $value;
    }
}
?>