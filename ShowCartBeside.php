<?php
$QShowCart=mysql_query("SELECT s.ID, s.JumlahBeli,
							b.ISBN, b.harga, b.judul

						FROM ShoppingCart s, buku b
						WHERE 
						s.ISBN=b.ISBN
						AND s.SessionId='".$SessionId."'");

$Jml=mysql_num_rows($QShowCart);


if($Jml)
{
	
	echo "<a href='?v=shopping_cart' title='Lihat Keranjang Belanja'>Keranjang Belanja <b>[$Jml]</b></a>";
	
}
else {
	echo 'Keranjang Belanja [0]';
}
?>
