
<?php
     include '../conn.php';
     $json = file_get_contents('php://input');
     $obj = json_decode($json,true);

     $berita_id= $obj['berita_id'];
     $nama_berita= $obj['nama_berita'];
     $isi_berita=$obj['isi_berita'];
     $tgl_berita='';

     $sql = "INSERT INTO BERITA (berita_id,nama_berita,isi_berita) VALUES ('".$berita_id."','".$nama_berita."','".$isi_berita."')";

     if(mysqli_query($connect,$sql)){
	     $MSG = 'SIMPAN BERHASIL.' ;	 
	     $json = json_encode($MSG);
	     echo $json ;
     }
     mysqli_close($connect);
 ?>
