<?php
$sql_query = "SELECT * FROM sioux7_slider WHERE slider_id <> 0";
$result = mysqli_query($GLOBALS['DB'],$sql_query);
$s=0;
?>
<div id="carousel-header" class="carousel slide" data-ride="carousel">
  <!-- Positionsanzeiger -->
  	<ol class="carousel-indicators">
	  <?php
		  while ($row = mysqli_fetch_array($result)) {
	  ?>
	<li data-target="#carousel-header" data-slide-to="<?php echo $s;?>" class="<?php if($s==0){ echo 'active';} ?>"><div class="pinner"></div></li>
	<?php
	$s++;
	}
	?>
	</ol>

  <!-- Verpackung für die Elemente -->
  <div class="carousel-inner" role="listbox">
	  <?php
		$sql_query = "SELECT * FROM sioux7_slider WHERE slider_id <> 0";
		$result = mysqli_query($GLOBALS['DB'],$sql_query);
		$s=0;
		  while ($row = mysqli_fetch_array($result)) {
	  ?>
	<div class="item <?php if($s==0){ echo 'active';} ?>">
	  <img src="upload/images/<?php echo $row['bild']; ?>" alt="Slider">
	  <div class="carousel-caption">
	  <?php echo $row['caption']; ?>
	  </div>
	</div>
	<?php
	$s++;
	}
	?>
  </div>
  <!-- Schalter -->
  <a class="left carousel-control" href="#carousel-header" role="button" data-slide="prev">
	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	<span class="sr-only">Zurück</span>
  </a>
  <a class="right carousel-control" href="#carousel-header" role="button" data-slide="next">
	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	<span class="sr-only">Weiter</span>
  </a>
</div>