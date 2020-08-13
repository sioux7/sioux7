<?PHP
session_start();
include "../../sioux7conf/globals.inc.php";
require_once "functions.inc.php";
connect2db();
   if ($_REQUEST['action'] == 'login') {
      if ($_POST['benutzer'] == '' || $_POST['pw'] == '') {
         $error = TRUE;
         $errorMsg = 1;
      }
      else {
         $password = md5($_REQUEST['pw']);
		 $check = "SELECT * FROM `sioux7_admin` WHERE `email` = '".$_POST['benutzer']."'";
         $getUserValuesQuery = @mysql_query($check) or die(mysql_error());
         $getUserValuesFetch = @mysql_fetch_array($getUserValuesQuery);
         if (@mysql_num_rows($getUserValuesQuery) < 1) {
            $error = TRUE;
            $errorMsg = 1;
         }
         if ($password != $getUserValuesFetch['passwort']) {
            $error = TRUE;
            $errorMsg = 2;
         }
         
      }

      if ($error == TRUE) {
         if ($errorMsg == 1) { $msg = "Benutzername oder Passwort falsch."; }
		 if ($errorMsg == 2) { $msg = "Benutzer nicht gefunden."; }
        
         $_SESSION['user_logged_in'] = "";
      }
      else {
         $_SESSION['user_id'] = $getUserValuesFetch['admin_id'];
         $_SESSION['username'] = $getUserValuesFetch['login'];
		 $_SESSION['right'] = $getUserValuesFetch['rights'];
		 $_SESSION['user_logged_in'] = 1;
		 $_SESSION['DOM']=$_POST['DOM'];
      }
   }
   elseif ($_GET['action'] == 'logout') {
      $_SESSION['user_id'] = "";
      $_SESSION['username'] = "";
	  $_SESSION['right'] = "";
	  $_SESSION['user_logged_in'] = "";
	  $_SESSION['DOM']="";
      session_destroy();
      $msg = "Sie haben sich erfolgreich ausgeloggt!";
   }
if($msg != ""){
	header("location: ../../sioux7management/index.php?msg=".$msg);}
else {
	header("location: ../../sioux7management/start.php");}
?>