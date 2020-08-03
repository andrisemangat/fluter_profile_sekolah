<?php
   include '../conn.php';
   
   $id= $_POST['userid'];
   //$id= $_GET['id'];
   $queryResult=$connect ->query("SELECT * FROM murid WHERE userid ='".$id."'");
   $result =array();
   while ($fetchData=$queryResult->fetch_assoc()) {
     $result[]=$fetchData;
   }
   echo json_encode($result);

 ?>
