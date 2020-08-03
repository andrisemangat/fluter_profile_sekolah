import 'dart:convert';
//import 'dart:js';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:profile_sekolah/screen/murid/main_murid_page.dart';

class MuridInf  {
  final String userid;
  final String password;
  final String name;
  final String email;
  final String address;
  final String nis;
  MuridInf({this.userid ,this.password ,this.name ,this.email ,this.address, this.nis});

}

class Murid with ChangeNotifier{
     MuridInf _inf;

     MuridInf getMuridInf(){
         return _inf;
         }

     void setMuridInf(MuridInf inf){
         _inf=inf;
         print(_inf);
         notifyListeners();
         }
  
     Future<bool> loginMuridAndGetInf(String userid,String pass) async{
//print(userid.trim());       
         var response;
         var datauser;
         try{
             response = await http.post(
                   "http://10.0.2.2/api_profile_sekolah/login_murid.php",
                   body: {
                   "userid": userid.trim(),
                   "password": pass.trim(),
                   });
             if(response.statusCode == 200){ //true jika data ada
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

     Future<bool> getInfWithID(String id) async{
         var response;
         var datauser;
         try{
             response = await http.post(
                 "http://10.0.2.2/api_profile_sekolah/murid/get_data_murid.php",
                  //param: { 'userid':id }
                 body: {
                     "userid": id, 
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
/*     String msg='';
     Future<List> _loginUser(String userid,String pass) async {
         final response = await http.post("http://10.0.2.2/my_store/login.php", body: {
                   "userid": userid.trim(),
                   "password": pass.trim(),
              });

         var datauser = json.decode(response.body);
         if(datauser.length==0){
             setInf(datauser);
             //setState(() {
             //    msg="Login Fail";
             //    });

         }else{
             //Navigator.of(context).pushNamed(MainMuridPage.routeName); // go to the Main page for parent            
             //Navigator.pushReplacementNamed(context, '/AdminPage');
             setInf(datauser);
             //setState(() {
             //    username= datauser[0]['username'];
             //});

          }

  return datauser;
}*/
        

     setInf(dynamic datauser){  
       MuridInf muridInf = MuridInf(
          userid: datauser[0]['userid'],
          password: datauser[0]['password'],
          name: datauser[0]['name'],
          email: datauser[0]['email'],
          address: datauser[0]['address'],
          nis: datauser[0]['nis']);
          setMuridInf(muridInf);
       }

     logOut(){
         _inf=new MuridInf(); // kosongkan variabel
        notifyListeners();
        print(_inf.userid);
        }
  
}
