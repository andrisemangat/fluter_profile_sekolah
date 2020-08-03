import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GuruInf {
     final String guruId;
     final String namaGuru;
     final String tglLahir;
     final String alamat;
     final String password;
   
     GuruInf({this.guruId, this.namaGuru, this.tglLahir, this.alamat, this.password});
}

class Guru with ChangeNotifier{
     GuruInf _inf;

     GuruInf getGuruInf(){
         return _inf;
         }

     void setGuruInf(GuruInf inf){
         _inf=inf;
         print(_inf);
         notifyListeners();
         }

     Future<bool> loginGuruGetInf(String guruId,String pass) async{
         var response;
         var datauser;
         try{
              response = await http.post(
                   "http://10.0.2.2/api_profile_sekolah/guru/get_data_guru.php",
                  body: {
                       "guru_id": guruId.trim(), 
                       "password": pass.trim(),
                       }
                    );
               if(response.statusCode == 200){ 
                   datauser = await json.decode(response.body);
                   setInf(datauser);
                   return true;
                   }
                   print(datauser);
              }catch(e){
                   print(e); // else print the error then return false
      
               }
               return false;    
             }

     setInf(dynamic datauser){
         GuruInf guruInf = GuruInf(
             guruId: datauser[0]['guru_id'],
             namaGuru: datauser[0]['nama_guru'],
             tglLahir: datauser[0]['tgl_lahir'],
             alamat: datauser[0]['alamat'],
             password: datauser[0]['password']);
             setGuruInf(guruInf);

         }
 
    logOut(){
        _inf = new GuruInf(); 
        notifyListeners();
       print(_inf.guruId);
  }


}