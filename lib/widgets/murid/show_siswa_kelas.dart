import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_sekolah/animation/FadeAnimation.dart';

class ShowSiswaKelas extends StatelessWidget {
     String nis;
     String name;
     String alamat;
     String kelasId;
     ShowSiswaKelas(
         {this.nis ="", this.name = "", this.alamat = "", this.kelasId=""});     

     @override
     Widget build(BuildContext context) {
         return Column(
              children: <Widget>[
                 ListTile(
                     leading: Icon(
                         Icons.people,
                         color: Colors.red,
                         ),
                     title: Text(name),
                     subtitle: Text(kelasId), 
                     onTap:(){
                          showDialog(
                               context: context,
                               builder: (BuildContext context) {
                                   return FadeAnimation(
                                         1.5,
                                         AlertDialog(
                                             //title: Center(child: Text(namaBerita)),
                                             shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                                             content:Container(
                                                 height: MediaQuery.of(context).size.height*0.2,
                                                 child: SingleChildScrollView(
                                                     child: Column(children: <Widget>[
                                                         Center(
                                                             child: Text('NAMA : $name', style: GoogleFonts.antic(
                                                                 textStyle: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,
                                                                     fontSize: 20
                                                                     ),
                                                                    ),)
                                                             ),
                                                         Divider(thickness: 1.5,),
                                                         SizedBox(height: 10,),
                                                         Center(
                                                             child: 
                                                                 Text('KELAS : $kelasId',
                                                                 style: GoogleFonts.antic(
                                                                       textStyle: TextStyle(
                                                                           color: Colors.black,
                                                                           fontWeight: FontWeight.bold,
                                                                           fontSize: 15
                                                                           ),
                                                                        )
                                                                      )
                                                              ),
                                                         Divider(thickness: 1.5,),
                                                         SizedBox(height: 10,),
                                                         Center(child: Text('alamat : $alamat',style: GoogleFonts.antic(
                                                             textStyle: TextStyle(
                                                                 color: Colors.black,
                                                                 fontWeight: FontWeight.bold,
                                                                 fontSize: 15
                                                                 ),
                                                              )
                                                             )
                                                             ),
                                                         Divider(thickness: 1.5,),
                                                         SizedBox(height: 10,),


                                                         ],
                                                     ),
                                                 ),
                                             ),
                                   ));
                                   },
                               );
                         },
                     ),
                 ],
             );
         }
}
