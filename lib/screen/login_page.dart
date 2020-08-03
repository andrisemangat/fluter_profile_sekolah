import 'package:flutter/material.dart';
import 'package:profile_sekolah/animation/FadeAnimation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:profile_sekolah/provider/murid.dart';
import 'package:profile_sekolah/provider/guru.dart';
import 'package:profile_sekolah/screen/murid/main_murid_page.dart';
import 'package:profile_sekolah/screen/guru/main_guru_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // key untuk form
   TextEditingController user = new TextEditingController(); // controller userID
   TextEditingController pass = new TextEditingController(); // control untuk password

   int selectedRadio = 1; // variable radiobutton

   // control radiobutton
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

// alert  jika user atau password salah 
  showAlert(String title, String content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => Login()));
                },
              )
            ],
          );
        });
  }

//loading
  showLoadingProgress() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            )),
          );
        });
  }

  // login function
  _login() async {    
      if (_formKey.currentState.validate()) { // check if semua data valid
         //showLoadingProgress(); //loading
         if (selectedRadio == 1) { // jika murid
          //Murid._loginUser(String userid,String pass) async {
          //}
       //Murid.loginMuridAndGetInf(user.text, pass.text).then((state){

  //});
             Provider.of<Murid>(context, listen: false).loginMuridAndGetInf(user.text, pass.text).then((state){
                 if(state){ 
                     Navigator.of(context).pushNamed(MainMuridPage.routeName); 
                 }else{
                     showAlert('Error', 'USER ID atau PASSWORD salah'); 
                 }
             }
             );
        } 
         else if (selectedRadio == 2) { // jika guru
            Provider.of<Guru>(context).loginGuruGetInf(user.text, pass.text).then((state){ 
               if(state){ 
                  Navigator.of(context).pushNamed(MainGuruPage.routeName); 
               }else{
                  showAlert('Error', 'USER atau PASSWORD SALAH'); 
                  }
               });
        }
      }
    }
  
   @override
   Widget build(BuildContext context) {
    return Scaffold(   
       body:  Container(
                 width: double.infinity,
                 decoration: BoxDecoration(
                     /*image: DecorationImage(
                         image: AssetImage(
                             'assets/images/sekolah.png'),
                             fit: BoxFit.fill,
                          ),*/                   
                     gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                     Color.fromRGBO(154, 233, 178, 10),
                     Color.fromRGBO(173, 187, 238, 1),
                     ])),
                 child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                     SizedBox(
                         height: 50,
                         
                         ),
                     Padding(
                         padding: EdgeInsets.all(20),
                         child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                 Container(
                                                 height: 200,
                                                 margin: EdgeInsets.symmetric(horizontal: 50),
                                                 decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                      image: AssetImage(
                                                      'assets/images/sekolah.png'),
                                                      fit: BoxFit.fill,
                                                       ),                                                   
                                                     borderRadius: BorderRadius.circular(50),
                                                     color: Color.fromRGBO(154, 233, 178, 1)
                                                     )
                                     ),
                                 /*Center(
                                     child: FadeAnimation(
                                         1,
                                         Text(
                                           "Login",
                                           style: GoogleFonts.antic(
                                           textStyle: TextStyle(
                                           color: Colors.white,
                                           fontWeight: FontWeight.bold),
                                           fontSize: 70,
                                             ),
                                           )
                                         ),
                                   ),*/
                                 /*SizedBox(
                                   height: 10,
                                   ),*/
                                 /*Center(
                                     child: FadeAnimation(
                                         1,
                                         Text(
                                           "SELAMAT DATANG",
                                           style: GoogleFonts.asar(
                                           textStyle: TextStyle(
                                           color: Colors.white,
                                           fontWeight: FontWeight.bold),
                                           fontSize: 20,
                                             ),
                                           )
                                         ),
                                   ),*/
                               ],
                           ),
                         ),
                     SizedBox(
                        height: 40,
                        ),
                     Expanded(
                        child: Container(
                             decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))
				                           ),
                              child: Padding(
                                 padding: EdgeInsets.all(30),
                                 child: SingleChildScrollView(
                                   child: Column(
                                       children: <Widget>[
                                          SizedBox(
                                             height: 10,
                                             ),
                                          FadeAnimation(
                                             1.4,
                                             Container(
                                                 decoration: BoxDecoration(
                                                     color: Colors.white,
                                                     borderRadius: BorderRadius.circular(40),
                                                     boxShadow: [
                                                         BoxShadow(
                                                             color: Color.fromRGBO(100, 100, 100, 100),
                                                             //blurRadius: 20,
                                                             offset: Offset(0, 0)
                                                             )
                                                     ]),
                                                  child: Form(
                                                      key: _formKey,
                                                      child: Column(
                                                         children: <Widget>[
                                                            Container(
                                                                 width: double.infinity,
                                                                 padding: EdgeInsets.all(10),
                                                                 decoration: BoxDecoration(
                                                                     border: Border(
                                                                     bottom: BorderSide(
                                                                     color: Colors.black))
                                                                     ),
                                                                 child: TextFormField(
                                                                        controller: user,
                                                                        decoration: InputDecoration(
                                                                           hintText: "Username",
                                                                           hintStyle:
                                                                           TextStyle(color: Colors.black),
                                                                           border: InputBorder.none
                                                                           ),

                                                                    ),

                                                               ),
                                                            Container(
                                                                 width: double.infinity,
                                                                 padding: EdgeInsets.all(10),
                                                                 decoration: BoxDecoration(
                                                                     border: Border(
                                                                         bottom: BorderSide(
                                                                         color: Colors.black)
                                                                         )
                                                                     ),
                                                                 child: TextFormField(
                                                                     controller: pass,
                                                                     obscureText: true,
                                                                     decoration: InputDecoration(
                                                                     hintText: "Password",
                                                                     hintStyle:
                                                                        TextStyle(color: Colors.black),
                                                                     border: InputBorder.none),
                                                                     keyboardType: TextInputType.visiblePassword,
                                                                    ),
                                                                 ),
                                                          Row(
                                                               mainAxisAlignment: MainAxisAlignment.center,
                                                               children: <Widget>[
                                                                     Radio(
                                                                         activeColor: Colors.green,
                                                                         groupValue: selectedRadio,
                                                                         value: 1,
                                                                         onChanged: (val) {
                                                                             print(val);
                                                                             setSelectedRadio(val);
                                                                             },
                                                                         ),
                                                                     Text('murid',
                                                                         style: GoogleFonts.asar(
                                                                             textStyle: TextStyle(
                                                                             color: Colors.black,
                                                                             fontWeight: FontWeight.bold),
                                                                             fontSize: 20,
                                                                             )
                                                                          ),
                                                                     Radio(
                                                                         activeColor: Colors.green,
                                                                         groupValue: selectedRadio,
                                                                         value: 2,
                                                                         onChanged: (val) {
                                                                               print(val);
                                                                               setSelectedRadio(val);
                                                                              },
                                                                          ),
                                                                      Text('guru',
                                                                           style: GoogleFonts.asar(
                                                                               textStyle: TextStyle(
                                                                               color: Colors.black,
                                                                               fontWeight: FontWeight.bold),
                                                                               fontSize: 20,
                                                                               )
                                                                            ),
                                                                  ],
                                                             ),


                                                            ],

                                                         ),

                                                     ),
                                               
                                             ),


                                             
                                             ),
                                          SizedBox(
                                             height: 40,
                                             ),

                                          FadeAnimation(
                                             1,
                                             Container(
                                                 height: 50,
                                                 margin: EdgeInsets.symmetric(horizontal: 50),
                                                 decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(50),
                                                     color: Color.fromRGBO(154, 233, 178, 1)
                                                     ),
                                                 child: Center(
                                                      child: FlatButton(
                                                         child: Text(
                                                             "Login",
                                                             style: TextStyle(
                                                                 color: Colors.white,
                                                                 fontWeight: FontWeight.bold),
                                                              ),
                                                          onPressed: () { // when we press this button excute login function
                                                             _login();                                     
                                                            }
                                                        ),
                                                     ),
                                                  )
                                              ),
                                          SizedBox(
                                               height: 50,
                                              ),                                              
                                       ],
                                   ),
                                 ),
                              ),

                        ),
                        ),

                        
                     ]
                 ),

       ),

    );
   }
}
