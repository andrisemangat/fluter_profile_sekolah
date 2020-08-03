import 'package:profile_sekolah/provider/guru.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:profile_sekolah/animation/FadeAnimation.dart';
import 'package:profile_sekolah/provider/guru.dart';
import 'package:profile_sekolah/screen/guru/list_berita_guru.dart';
import 'package:profile_sekolah/screen/guru/tambah_berita.dart';
import 'package:profile_sekolah/widgets/card_item.dart';

class MainGuruPage extends StatefulWidget {
  static const routeName = '/main-guru-page';

  @override
  _MainGuruPageState createState() => _MainGuruPageState();
}

class _MainGuruPageState extends State<MainGuruPage> {
     GuruInf getGuruInfo;

     String guruId;
     String namaGuru;
     String tglLahir;
     String alamat;
     String password;

     @override
     Widget build(BuildContext context) {
         getGuruInfo= Provider.of<Guru>(context).getGuruInf();

         guruId = getGuruInfo.guruId;
         namaGuru = getGuruInfo.namaGuru;
         tglLahir = getGuruInfo.tglLahir;
         alamat = getGuruInfo.alamat;
         password = getGuruInfo.password;
    
         return WillPopScope(
             onWillPop: () async => false,
             child: Scaffold(
                 body: Container(
                         width: double.infinity,
                         decoration: BoxDecoration(
                             gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                                 Color.fromRGBO(154, 233, 178, 1),
                                 Color.fromRGBO(173, 187, 238, 1),
                                 ]
                                 )
                             ),
                         child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                 Padding(
                                     padding: EdgeInsets.all(20),
                                     child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget>[
                                               SizedBox(
                                                   height: 50,
                                               ),
                                               Center(
                                                   child: FadeAnimation(
                                                       1.3,
                                                       Text(
                                                           "KODE GURU : $guruId",
                                                           style: GoogleFonts.antic(
                                                           textStyle: TextStyle(
                                                               color: Colors.white,
                                                               fontWeight: FontWeight.bold
                                                               ),
                                                               fontSize: 25,
                                                              ),
                                                            ))
                                                 ),
                                               Center(
                                                   child: FadeAnimation(
                                                       1.3,
                                                       Text(
                                                           "NAMA GURU : $namaGuru",
                                                           style: GoogleFonts.antic(
                                                               textStyle: TextStyle(
                                                               color: Colors.white,
                                                               fontWeight: FontWeight.bold),
                                                               fontSize: 25,
                                                               ),
                                                            )
                                                       )
                                                     ),
                                               Center(
                                                   child: FadeAnimation(
                                                       1.3,
                                                       Text(
                                                       "Alamat : $alamat",
                                                       style: GoogleFonts.asar(
                                                           textStyle: TextStyle(
                                                               color: Colors.white,
                                                               fontWeight: FontWeight.bold),
                                                           fontSize: 20,
                                                           ),
                                                       )
                                                    )
                                                    ),
                                                Center(
                                                     child: FadeAnimation(
                                                         1.3,
                                                      Text(
                                                           "Phone Number : ",
                                                           style: GoogleFonts.asar(
                                                               textStyle: TextStyle(
                                                                   color: Colors.white,
                                                                   fontWeight: FontWeight.bold),
                                                               fontSize: 20,
                                                               ),
                                                           )
                                                       )
                                                       ),

                                             ],
                                         ),

                                     ),
                                 SizedBox(
                                     height: 20,
                                      ),
                                 Expanded(
                                      child: Container(
                                           width: double.infinity,
                                           decoration: BoxDecoration(
                                               color: Colors.white,
                                               borderRadius: BorderRadius.only(
                                                   topLeft: Radius.circular(60),
                                                   topRight: Radius.circular(60))
                                               ),
                                           padding: EdgeInsets.all(20),
                                           child: GridView.count(
                                               primary: false,
                                               padding: const EdgeInsets.all(20.0),
                                               crossAxisSpacing: 10,
                                               crossAxisCount: 2,
                                               children: <Widget>[
                                                   CardItem(
                                                       desc: 'BERITA',
                                                       img: 'assets/images/newspaspe5.png',
                                                       color: Color.fromRGBO(120, 99, 101, 1),
                                                       function: (){   Navigator.push(
                                                           context,
                                                           MaterialPageRoute(
                                                           builder: (context) => ListBeritaGuru()),
                                                           );
                                                           }
                                                       ),
                                                   /*CardItem(
                                                       desc: 'log Out',
                                                       img: 'assets/images/logout-icon.png',
                                                       color: Color.fromRGBO(154, 80, 80, 1),
                                                       /*function: (){  
                                                           Provider.of<Guru>(context).logOut();
                                                           Navigator.push(
                                                               context,
                                                               MaterialPageRoute(
                                                                   builder: (context) => logOut()),
                                                               );
                                                           }*/
                                                       ),*/
                                                   ],
                                               ),                                           
                                           ),
                                     ),
                                 ],
                             ),
                     ),
                 ),
             );

         }

}
