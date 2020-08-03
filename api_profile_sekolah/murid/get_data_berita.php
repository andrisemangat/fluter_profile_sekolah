<?php
     include '../conn.php';
	 
     //$berita_id= ($_POST['berita_id']); 
	 //$berita_id = $_GET['berita_id']; 
	 
	 
     //$queryResult=$connect ->query("SELECT * FROM berita WHERE berita_id ='".$berita_id."'");
	 $queryResult=$connect ->query("SELECT * FROM berita ");
     $result =array();
     while ($fetchData=$queryResult->fetch_assoc()) {
         $result[]=$fetchData;
     }
     echo json_encode($result);
 ?>
 
 
