import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:profile_sekolah/screen/login_page.dart';
import 'package:profile_sekolah/provider/murid.dart';
import 'package:profile_sekolah/screen/murid/main_murid_page.dart';
import 'package:profile_sekolah/screen/guru/main_guru_page.dart';
import 'package:profile_sekolah/provider/guru.dart';

void main() {
   runApp(MyApp());
}
String userid='';
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(  
       //MaterialApp(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Murid() 
        ),
        ChangeNotifierProvider(
          create: (context) => Guru(), 
        ),
      ],
      child:MaterialApp(
        title: 'App Name',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.transparent,
        ),
        home: Login(), // homepage
        routes: { 
          MainMuridPage.routeName: (ctx) => MainMuridPage(),
          MainGuruPage.routeName: (ctx) => MainGuruPage(),

  
        },
        //routes: <String,WidgetBuilder>{
          //  '/mainParentPage': (BuildContext context)=> new mainParentPage(userid: username,),
            //'/MemberPage': (BuildContext context)=> new MemberPage(username: username,),
            //'/MyHomePage': (BuildContext context)=> new MyHomePage(),
         //},        
        
      ),
    );
  }
}
 