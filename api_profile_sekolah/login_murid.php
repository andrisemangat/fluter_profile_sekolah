<?php
   include 'conn.php';
   $username= $_POST['userid'];
   $password= $_POST['password'];

   $queryResult=$connect->query("SELECT * FROM murid WHERE userid='".$username."' AND password = '".$password."'");
   $result=array();
   while($fetchData=$queryResult->fetch_assoc()){
      //if (password_verify($password, $fetchData['password'])) {  // use for the hashed password
         $result[]=$fetchData;
        // }
		// else 
			// echo 'cek';
      }
    echo json_encode($result); // send the data as json
?>
