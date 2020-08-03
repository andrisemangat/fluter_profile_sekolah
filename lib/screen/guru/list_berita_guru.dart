import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:profile_sekolah/animation/FadeAnimation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_sekolah/helper/get_helper.dart';
import 'package:profile_sekolah/widgets/guru/show_berita_guru.dart';
//import 'package:profile_sekolah/screen/guru/adddata.dart';
import 'package:profile_sekolah/screen/guru/tambah_berita.dart';

class ListBeritaGuru extends StatefulWidget{
    //final String userid;
    ListBeritaGuru();
    //ListBerita();
    @override
    _ListBeritaGuruState createState()=> _ListBeritaGuruState();
}

class _ListBeritaGuruState extends State<ListBeritaGuru>{
     var listBeritaGurus;

     @override
     void initState(){
//print('user id ' + this.widget.userid);
         //listBeritas = GetHelper.getData(widget.userid, 'get_data_berita','berita_id');
         listBeritaGurus = GetHelper.getData('andri', 'get_data_berita','berita_id');
         //print('berita mumet 1');
         //print('berita '+listBeritas);
         //print('berita mumet 2');
         super.initState();
         }

     @override
     Widget build(BuildContext context){
         return Scaffold(
             appBar: new AppBar(
                 title: new Text("LIST BERITA"),
                 ),     
              floatingActionButton: new FloatingActionButton(
                     child: new Icon(Icons.add),
                     onPressed: ()=>Navigator.of(context).push(
                         new MaterialPageRoute(
                          builder: (BuildContext context)=> new TambahBerita(),
                          )
                         ),
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
                               padding: EdgeInsets.all(20),
                               child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: <Widget>[
                                       SizedBox(
                                           height: 10,
                                           ),
                                       /*Center(
                                           child: FadeAnimation(
                                               1.3,
                                               Text(
                                                   "BERITA",
                                                   style: GoogleFonts.antic(
                                                       textStyle: TextStyle(
                                                           color: Colors.white,
                                                           fontWeight: FontWeight.bold),
                                                           fontSize: 40,
                                                        ),
                                                    )
                                                )
                                             ),*/
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
                                       future: listBeritaGurus,
                                       builder: (context, snapshots) {
                                           if (!snapshots.hasData || snapshots.data.length == 0) {
                                               return Center(
                                                   child: Text('Tidak ada berita',
                                                   style: GoogleFonts.antic(
                                                   fontWeight: FontWeight.bold,
                                                   fontSize: 30)));
                                            }
                                            return ListView.builder(
                                                 itemCount: snapshots.data.length,
                                                 itemBuilder: (context, index) {
                                                     return ShowBerita(
                                                             beritaId: snapshots.data[index]['berita_id'],
                                                             namaBerita: snapshots.data[index]['nama_berita'],                                                             
                                                             isiBerita: snapshots.data[index]
                                                             ['isi_berita'],
                                                             tglBerita: snapshots.data[index]
                                                             ['tgl_berita']);
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