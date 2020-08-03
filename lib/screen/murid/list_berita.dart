import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:profile_sekolah/animation/FadeAnimation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_sekolah/helper/get_helper.dart';
import 'package:profile_sekolah/widgets/murid/show_berita.dart';

class ListBerita extends StatefulWidget{
    final String userid;
    ListBerita({this.userid});
    //ListBerita();
    @override
    _ListBeritaState createState()=> _ListBeritaState();
}

class _ListBeritaState extends State<ListBerita>{
     var listBeritas;
     ScrollController _controller;
     //ScrollController _scrollController;
     //bool _isOnTop = true;

 /*@override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }*/

     @override
     void initState(){
//print('user id ' + this.widget.userid);
         //listBeritas = GetHelper.getData(widget.userid, 'get_data_berita','berita_id');
         listBeritas = GetHelper.getData('andri', 'get_data_berita','berita_id');
         //print('berita mumet 1');
         //print('berita '+listBeritas);
         //print('berita mumet 2');
         //_scrollController = ScrollController();
         _controller = ScrollController();
         super.initState();
         }


/*  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }*/
/*
  _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
    setState(() => _isOnTop = true);
  }

  _scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
    setState(() => _isOnTop = false);
    _scrollController = ScrollController();
  }     */
     @override
     Widget build(BuildContext context){
         return Scaffold(
             appBar: new AppBar(
                 title: new Text("LIST BERITA"),
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
                               padding: EdgeInsets.all(5),
                               child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: <Widget>[
                                       SizedBox(
                                           height: 10,
                                           ),
                                       Center(
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
                                       future: listBeritas,
                                       builder: (context, snapshots) {
                                           if (!snapshots.hasData || snapshots.data.length == 0) {
                                               return Center(
                                                   child: Text('Tidak ada berita',
                                                   style: GoogleFonts.antic(
                                                   fontWeight: FontWeight.bold,
                                                   fontSize: 30)));
                                            }
                                            return ListView.builder(
                                                 controller: _controller,
                                                 scrollDirection: Axis.vertical,
                                                 shrinkWrap: true,                                              
                                                 itemCount: 4, //snapshots.data.length,
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
                 /*floatingActionButton: FloatingActionButton(
                     onPressed: _isOnTop ? _scrollToBottom : _scrollToTop,
                     child: Icon(_isOnTop ? Icons.arrow_downward : Icons.arrow_upward),
                     )*/                 
             );
         }
}