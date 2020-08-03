<?php   
     include '../conn.php'; 
     $guru_id=$_POST['guru_id'];
     $password=$_POST['password'];

     $queryResult=$connect->query("SELECT * FROM guru WHERE guru_id='".$guru_id."' AND password = '".$password."'");
     $result=array();
     while($fetchData=$queryResult->fetch_assoc()){
         //if (password_verify($password, $fetchData['password'])) {
         $result[]=$fetchData;
         //}
     }
     echo json_encode($result); // send the data as json
?>
