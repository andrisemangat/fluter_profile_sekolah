import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:profile_sekolah/animation/FadeAnimation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_sekolah/helper/get_helper.dart';
import 'package:profile_sekolah/widgets/murid/show_siswa_kelas.dart';

class ListSiswaKelas extends StatefulWidget{
    final String nis;
    ListSiswaKelas({this.nis});
    @override
    _ListSiswaKelasState createState()=> _ListSiswaKelasState();
}

class _ListSiswaKelasState extends State<ListSiswaKelas>{
     var listSiswaKelass;

     @override
     void initState(){
//print('user id ' + this.widget.userid);
         //listBeritas = GetHelper.getData(widget.userid, 'get_data_berita','berita_id');
         listSiswaKelass = GetHelper.getData(this.widget.nis, 'get_data_kelas_detail','nis');
         //print('berita mumet 1');
         //print('berita '+listBeritas);
         //print('berita mumet 2');
         super.initState();
         }

     @override
     Widget build(BuildContext context){
         return Scaffold(
             appBar: new AppBar(
                 title: new Text("DAFTAR SISWA"),
                 ),           
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
                               padding: EdgeInsets.all(10),
                               child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: <Widget>[
                                       SizedBox(
                                           height: 5,
                                           ),
                                       Center(
                                           child: FadeAnimation(
                                               1.3,
                                               Text(
                                                   "KELAS",
                                                   style: GoogleFonts.antic(
                                                       textStyle: TextStyle(
                                                           color: Colors.white,
                                                           fontWeight: FontWeight.bold),
                                                           fontSize: 40,
                                                        ),
                                                    )
                                                )
                                             ),
                ],
              ),

                               ),
                           Expanded(
                               child: Container(
                                   width: double.infinity,
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius:
                                       BorderRadius.only(topRight: Radius.circular(100))
                                       ),
                                   padding: EdgeInsets.all(20),
                                   child: FutureBuilder(
                                       future: listSiswaKelass,
                                       builder: (context, snapshots) {
                                           if (!snapshots.hasData || snapshots.data.length == 0) {
                                               return Center(
                                                   child: Text('Tidak ada SISWA',
                                                   style: GoogleFonts.antic(
                                                   fontWeight: FontWeight.bold,
                                                   fontSize: 30)));
                                            }
                                            return ListView.builder(
                                                 itemCount: snapshots.data.length,
                                                 itemBuilder: (context, index) {
                                                     return ShowSiswaKelas(
                                                             nis: snapshots.data[index]['NIS'],
                                                             name: snapshots.data[index]['NAME'],                                                             
                                                             alamat: snapshots.data[index]
                                                             ['ALAMAT'],
                                                             kelasId: snapshots.data[index]
                                                             ['KELAS_ID']);
                                                           },
                                                 );
                                           },
                                       ),
                                   ),
                           ),

                           ],
                     ),
                 ),
             );
         }
}