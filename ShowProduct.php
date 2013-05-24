<?php

  $p      = new Paging;
  $batas  = 16;
  $posisi = $p->cariPosisi($batas);
  
  //FILTER VARIABLE GET
  
  if(!is_numeric(isset($_GET['halaman'])) AND !is_numeric($_GET['halaman']))
  {
	 echo '<meta http-equiv="refresh" content="0;url=index.php">';
	exit;
  }

  $QProduct=mysql_query("SELECT ISBN, judul, fileGambar, harga
						FROM buku LIMIT $posisi, $batas") OR DIE ('<meta http-equiv="refresh" content="0;url=index.php">');

echo "<table align='center'>";
$i=0;
$kolom=4;
while($r=mysql_fetch_array($QProduct)){
	$ISBN=$r['ISBN'];
	$Judul=$r['judul'];
	$FileGambar='dashboard/img/thumb_'.$r['fileGambar'];
	$Harga=number_format($r['harga'],2,",",".");
	
			if($i>=$kolom){
			echo "
			<tr>
			";
			$i=0;
			}
			
		echo "<td align='center' width='150'>
		$Judul<br />";
		
		if(file_exists($FileGambar)){
			echo "<a href='?v=show_product_detail&id=$ISBN'><img src='$FileGambar' alt='$Judul' width='100' height='150'\></a><br />";
		}
		else {
			echo "<a href='?v=show_product_detail&id=$ISBN'><img src='dashboard/img/photo_not_available.jpg' width='100' height='150'></a><br />";
		}
		
		
		echo "
		Rp $Harga<br /> 
		<form action='InsertProduct.php' method='POST'>
		<input type='hidden' name='ISBN' value='$ISBN'>
		<input type='hidden' name='jml' value='1' size='2' \>
		<input type='submit' value='Beli' name='submit' \>
		</form>
		</td>";	
			
	$i++;		
			
}
echo "</table>";

	$jmldata = mysql_num_rows(mysql_query("SELECT ISBN, judul, fileGambar, harga
								FROM buku"));
    $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
	if(!isset($hal)){
		$hal=0;
	}
    $linkHalaman = $p->navHalaman($hal, $jmlhalaman);

    echo "<div id=paging>Hal: $linkHalaman</div><br>";
	
	if($_GET['halaman']>$jmlhalaman)
	{
		 echo '<meta http-equiv="refresh" content="0;url=index.php">';
		exit;
	}
?>
