import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:profile_sekolah/provider/murid.dart';
import 'package:profile_sekolah/animation/FadeAnimation.dart';
import 'package:profile_sekolah/widgets/card_item.dart';
import 'package:profile_sekolah/screen/murid/list_berita.dart';
import 'package:profile_sekolah/screen/murid/list_siswa_kelas.dart';
import 'package:profile_sekolah/screen/login_page.dart';

class MainMuridPage extends StatefulWidget {
     static const routeName = '/main-murid-page';
     @override
     _MainMuridPageState createState() => _MainMuridPageState();
}
class _MainMuridPageState extends State<MainMuridPage> {
    MuridInf getMuridInfo;
    String userid;
    String password;
    String email;
    String address;
    String nis;
    String name;

  @override
  void initState() { 
       super.initState();
       WidgetsBinding.instance.addPostFrameCallback((_){
           Provider.of<Murid>(context).getInfWithID(userid).then((state) { 
               if (state) {
                   getMuridInfo = Provider.of<Murid>(context).getMuridInf();          
                   } else {
                   print('Something wrong just happened');
                   }
               }
               );

           },
           );  
  }

 
 @override
  Widget build(BuildContext context) {
     getMuridInfo= Provider.of<Murid>(context).getMuridInf();
     //MuridInf getMuridInfo;
     userid = getMuridInfo.userid;
     password = getMuridInfo.password;
     email = getMuridInfo.email;
     address = getMuridInfo.address;
     nis = getMuridInfo.nis;
     name = getMuridInfo.name;

     return new WillPopScope(
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
                                                       "$name",
                                                       style: GoogleFonts.antic(
                                                           textStyle: TextStyle(
                                                               color: Colors.white,
                                                               fontWeight: FontWeight.bold
                                                               ),
                                                           fontSize: 25,
                                                           ),
                                                     ),

                                                 ),

                                           ),
                                         Center(
                                             child: FadeAnimation(
                                                 1.3,
                                                 Text(
                                                     "NIS : $nis",
                                                     style: GoogleFonts.asar(
                                                         textStyle: TextStyle(
                                                             color: Colors.white,
                                                             fontWeight: FontWeight.bold
                                                             ),
                                                         fontSize: 20,
                                                         ),                                                     
                                                     ),
                                                 ),

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
                                         topRight: Radius.circular(60)
                                         )
                                     ),
                                 padding: EdgeInsets.all(20),
                                 child: GridView.count(
                                     primary: false,
                                     padding: const EdgeInsets.all(20.0),
                                     crossAxisSpacing: 10,
                                     crossAxisCount: 2,
                                     children: <Widget>[
                                         CardItem(
                                             desc: 'Berita',
                                             img: 'assets/images/newspaspe5.png',
                                             color: Color.fromRGBO(125, 180, 123, 1),
                                             function: () {
                                                 Navigator.push(
                                                     context,
                                                     MaterialPageRoute(
                                                         builder: (context) => ListBerita(userid : userid,)),
                                                     );
                                                 },                                             
                                             ),
                                         CardItem(
                                              desc: 'Data siswa',
                                              img: 'assets/images/murid.png',
                                              color: Color.fromRGBO(75, 76, 96, 1),
                                              function: () {
                                                 Navigator.push(
                                                     context,
                                                     MaterialPageRoute(
                                                         builder: (context) => ListSiswaKelas(nis : nis,)),
                                                     );
                                                 },                                              
                                             ),
                                           

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