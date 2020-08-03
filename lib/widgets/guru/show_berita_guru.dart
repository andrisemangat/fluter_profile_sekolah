import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_sekolah/animation/FadeAnimation.dart';

class ShowBerita extends StatelessWidget {
     final String beritaId;
     final String namaBerita;
     final String isiBerita;
     final String tglBerita;
     ShowBerita(
         {this.beritaId ="", this.namaBerita = "", this.isiBerita = "", this.tglBerita=""});     

     @override
     Widget build(BuildContext context) {
         return Column(
              children: <Widget>[
                 ListTile(
                     leading: Icon(
                         Icons.album,
                         color: Colors.red,
                         ),
                     title: Text(namaBerita),
                     subtitle: Text(tglBerita), 
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
                                                             child: Text('BERITA : $namaBerita', style: GoogleFonts.antic(
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
                                                                 Text('ISI BERITA : $isiBerita',
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
                                                         Center(child: Text(tglBerita,style: GoogleFonts.antic(
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
