<?php
if (!ini_get('register_globals')) {
    while(list($key,$value)=each($_FILES)) $GLOBALS[$key]=$value;
    while(list($key,$value)=each($_ENV)) $GLOBALS[$key]=$value;
    while(list($key,$value)=each($_GET)) $GLOBALS[$key]=$value;
    while(list($key,$value)=each($_POST)) $GLOBALS[$key]=$value;
    while(list($key,$value)=each($_COOKIE)) $GLOBALS[$key]=$value;
    while(list($key,$value)=each($_SERVER)) $GLOBALS[$key]=$value;
}
?>