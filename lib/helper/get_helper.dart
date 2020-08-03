import 'dart:convert';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:profile_sekolah/screen/murid/main_murid_page.dart';
import 'package:profile_sekolah/screen/guru/main_guru_page.dart';

class GetHelper{
     static Future getData(
         String dataId, String typeOfData, String inputData) async {
         try {
             final http.Response response = await http.post(
                "http://10.0.2.2/api_profile_sekolah/murid/$typeOfData.php",
                //"http://10.0.2.2/api_profile_sekolah/murid/get_data_berita.php",
                //"http://10.0.2.2/api_profile_sekolah/murid/get_data_kelas_detail.php",
                //headers: { 'berita_id':'BER001' }
                //headers: <String, String>{
                //'Content-Type': 'application/json; charset=UTF-8',
                //},
                body: {
                 inputData: dataId
                 //'nis' :'001'
                 }
                    );

                if (response.statusCode == 200) { 
                     var userData = await json.decode(response.body);
                     //print("cek "+ userData);
                     return userData;
                     }
               } catch (e) {
                   print(e);
                   }
          }
//

  static Future simpanBerita(GlobalKey<FormState> formKey, BuildContext context,
      String beritaId, String namaBerita, String isiBerita) async {
    if (formKey.currentState.validate()) {
      try {
        
        var data = {
          'berita_id': beritaId,
          'nama_berita': namaBerita,
          'isi_berita': isiBerita
        };
        var response = await http.post(          
          "http://10.0.2.2/api_profile_sekolah/guru/tambah_data_berita.php",
          //body: json.encode(data),
          body: (data),
        );
       //var message = jsonDecode(response.body);
        //var message = (response.body);
        //  print('ce '+ message);

        if (response.statusCode == 200) { 
          var message = jsonDecode(response.body);
          print(message);

          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Center(child: Text('INFO')),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Center(
                              child: Text(
                            message,
                            style: GoogleFonts.antic(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )),
                          Center(
                            child: FlatButton(
                              child: Text("Ok"),
                              color: Colors.blueAccent,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(MainGuruPage.routeName);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        }
      } catch (e) {
        print(e);
      }
    }
  }





}