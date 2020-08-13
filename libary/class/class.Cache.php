<?php
class u_cache {
	var $caching = false;
	var $cache_dir = 'sioux7cache/';
	var $cache_lifetime = 300;
	
	function getSiteCache(){
		$cache=parsePageName2Id($_GET['kategorie']);
		$sqlCache="SELECT cache FROM sioux7_kategorie WHERE kategorie_id=".$cache;
		$resCache = mysqli_query($GLOBALS['DB'],$sqlCache) or die(mysql_error());
		$isCache = mysqli_fetch_assoc($resCache);
		if($isCache['cache'] == 1) {
			$cs=true;
		} else {
			$cs=false;
		}
		return $cs;
	}
	
	function setCacheDir($dir){
	 $cacheDir = realpath($dir);
			
	 if (is_dir($cacheDir) && is_writable($cacheDir))
		{
		$this->cache_dir = $cacheDir;
		}
	else
		{
		echo ("The cache directory '$cacheDir' either does not exist, or is not writable");
		}
	}
	
	function setCacheLifetime($seconds=0){
	 $this->cache_lifetime = is_numeric($seconds) ? $seconds : 0;
	}
	
	function setCaching($state){
		if (is_bool($state))
		{
		$this->caching = $state;
		}
	}
	
	function isCached($file, $id = null){
	$cacheId  = $id ? md5($id . 'sioux7') : md5('sioux7');
	$filename = $this->cache_dir . '/' . $cacheId . '/' . basename($file);
	if (is_file($filename))
		{
		clearstatcache();
		if (filemtime($filename) > (time() - $this->cache_lifetime))
			{
			$isCached = true;
			}
		}
	 return isset($isCached) ? true : false;
	}
	
	function addCache($file, $content, $id = null){
	
	$cacheId  = $id ? md5($id . 'sioux7') : md5('sioux7');
	
	$filename  = $this->cache_dir . '/' . $cacheId . '/' . basename($file);
	
	$directory = $this->cache_dir . '/' . $cacheId;
		
	@mkdir($directory, 0777);
	
	if(file_put_contents($filename, $content) == FALSE)
		{
		return ("Unable to write to cache");
		}
    }
	
	function getCache($file, $id = null){
		$cacheId  = $id ? md5($id . 'sioux7') : md5('sioux7');
		$filename = $this->cache_dir . '/' . $cacheId . '/' . basename($file);
		$content=file_get_contents($filename);
		return isset($content) ? $content : false;
	}
	
}
?>