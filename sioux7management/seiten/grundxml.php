<?php    
 function create_xml()
 { 
 	 $sql_query1= "SELECT kategorie_id,titel FROM sioux7_kategorie WHERE aktiv='1'";
	 $result1 = mysqli_query($GLOBALS['DB'],$sql_query1);
	 while ($row = mysqli_fetch_array($result1)) {
 	 $file_modified_time = date('Y-m-d');
		 if($row['kategorie_id'] !=0){
		 $xml .= "<url>";
		 $xml .= "<loc><![CDATA[http://".$_SERVER['HTTP_HOST']."/".getLink($row['kategorie_id'])."]]></loc>";
		 $xml .= "<lastmod>$file_modified_time</lastmod>";
		 $xml .= "<changefreq>monthly</changefreq>";
		 $xml .= "<priority>0.5</priority>";
		 $xml .= "</url>\n";}}
	
	return $xml;
 }
 
 function create_basepath_xml()
 {
 	 $file_modified_time = date('Y-m-d');
	 
	 $xml  = "<url>";
     $xml .= "<loc>http://".$_SERVER['HTTP_HOST']."/" . "</loc>";
     $xml .= "<lastmod>$file_modified_time</lastmod>";
     $xml .= "<changefreq>daily</changefreq>";
     $xml .= "<priority>0.5</priority>";
	 $xml .= "</url>";
	
	return $xml;
	
 }
 
 function create_xml_header()
 {
	$str = '<?xml version="1.0" encoding="UTF-8"?>';
	$str .= '<?xml-stylesheet type="text/xsl" href="sitemap-style.xsl"?>';
	$str .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
	return $str;
 }
 
 function create_xml_footer()
 {
	return '</urlset>';
 }
 
 // Change the Domainname in create_xml(). This File is only for german.
 
 $xml_basepath = create_basepath_xml();
 
 $xml_header = create_xml_header();
 
 $xml_footer = create_xml_footer();
 
 $xml_list = create_xml();
 
 //send correct content header to browser
 //header("Content-type: text/xml"); 
 $txt= $xml_header."\n";
 $txt.= $xml_basepath."\n";
 $txt.= $xml_list."\n";
 $txt.= $xml_footer."\n";
 	$fp = fopen ('../sitemap.xml', 'w' );
  	flock($fp,2);
	fwrite($fp,$txt);
	flock($fp,3);
	fclose($fp);
echo "Sitemap XML wurde erstellt!";
?>