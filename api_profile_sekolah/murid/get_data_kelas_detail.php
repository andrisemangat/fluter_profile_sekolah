<?php
     include '../conn.php';	 
     $nis = $_POST['nis']; 
     
	 $queryResult=$connect ->query("         SELECT A.NIS AS 'NIS' , B.NAME AS 'NAME', B.ADDRESS AS 'ALAMAT', A.KELAS_ID AS 'KELAS_ID'
                                             FROM KELAS_DETAIL A, MURID B
                                             WHERE A.NIS = B.NIS AND
                                               A.KELAS_ID IN
                                                 (SELECT C.KELAS_ID
                                                  FROM KELAS_DETAIL C
												  WHERE C.NIS = '".$nis."')");
     $result =array();
     while ($fetchData=$queryResult->fetch_assoc()) {
         $result[]=$fetchData;
     }
     echo json_encode($result);
 ?>
 
 
