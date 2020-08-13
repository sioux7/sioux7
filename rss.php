<?php
include "sioux7conf/globals.inc.php";
Header('Content-Type: application/xml');
echo '<?xml version="1.0" encoding="UTF-8" ?>' . "\n";
echo '<?xml-stylesheet href="http://www.w3.org/2000/08/w3c-synd/style.css" type="text/css"?>' . "\n";
$connection = mysqli_connect($server, $user, $passwort, $datenbank);
$sql_dom = mysqli_query($connection,"SELECT * FROM sioux7_domain WHERE domain_id=".$_GET['dom']);
$row_dom = mysqli_fetch_array($sql_dom);
?>
<rss version="2.0">
<channel>
<title>RSS <?php echo $row_dom['domainname']; ?></title>
<link><?php echo $row_dom['domainname']; ?></link>
<description><?php echo $row_dom['domdescr']; ?></description>
<webMaster>O. Urban</webMaster>
<language>deutsch</language>
<image>
  <url><?php echo 'media/logo/uid.png';?></url>
</image>
<docs>http://blogs.law.harvard.edu/tech/rss</docs>
<?php
$sql_result = mysqli_query($connection,"SELECT * FROM sioux7_presse WHERE p_id <> 0 AND dom_id=".$_GET['dom']." AND lang='de' ORDER BY p_id DESC LIMIT 0,10");

// Format results by row
while ($row = mysqli_fetch_array($sql_result)) {
	  $title = replace($row['titel']);
	  $content = replace($row['descr']);
	  $added = date("D, d M Y 12:00:00",strtotime($row['datum']));
	  $link = "http://".$_SERVER['HTTP_HOST']."/presse.html?p_id=".$row['p_id'];
	  echo '<item>' . "\n";
	  echo '  <title>' . $title . '</title>' . "\n";
	  echo '  <link> '.$link.'</link>' . "\n";
	  echo '  <description> '.strip_tags($content).' </description>'. "\n"; // . "\n";
	  echo '  <pubDate>'.$added.'</pubDate>' . "\n";
	  echo '</item>' . "\n";
}

function replace($what){
  $what = str_replace('ü','ue',$what);
  $what = str_replace('ö','oe',$what);
  $what = str_replace('ä','ae',$what);
  $what = str_replace('ß','ss',$what);
  $what = str_replace('Ü','Ue',$what);
  $what = str_replace('Ö','Oe',$what);
  $what = str_replace('Ä','Oe',$what);
  $what = str_replace('&uuml;','ue',$what);
  $what = str_replace('&ouml;','oe',$what);
  $what = str_replace('&auml;','ae',$what);
  $what = str_replace('&szlig;','ss',$what);
  $what = str_replace('&Uuml;','Ue',$what);
  $what = str_replace('&Ouml;','Oe',$what);
  $what= str_replace('&Auml;','Ae',$what);
  $what = str_replace('..',' ',$what);
  $what = str_replace('–',' ',$what);
  $what = str_replace('&raquo;',' ',$what);
  $what = str_replace('&laquo;',' ',$what);
  $what = str_replace('&eacute','ee',$what);
  $what = str_replace('&nbsp;',' ',$what);
  $what = str_replace('&sect;','',$what);
  return $what;
}
?>
</channel>
</rss>
