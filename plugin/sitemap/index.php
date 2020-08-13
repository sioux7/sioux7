<?php 
$feld="kategorie_id";
$table="sioux7_kategorie";

$menu=MyDbObject::sitemap($table,0,0,' - ','top',$feld);
echo "Topmenu: <ul style='list-style: none;'>".$menu."</ul>"; 
$menu=MyDbObject::sitemap($table,0,0,' - ','menu',$feld);
echo "Hauptmenu: <ul style='list-style: none;'>".$menu."</ul>";
$menu=MyDbObject::sitemap($table,0,0,' - ','footer',$feld);
echo "Footer: <ul style='list-style: none;'>".$menu."</ul>";
?>