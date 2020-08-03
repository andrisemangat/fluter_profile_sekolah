
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_sekolah/animation/FadeAnimation.dart';
import 'package:profile_sekolah/helper/get_helper.dart';

class TambahBerita extends StatefulWidget {
  final String beritaId;
  final String namaBerita;
  final String isiBerita;

  TambahBerita({this.beritaId, this.namaBerita, this.isiBerita});

  @override
  _TambahBeritaState createState() => _TambahBeritaState();
}

class _TambahBeritaState extends State<TambahBerita> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController beritaIdControl = new TextEditingController();
  TextEditingController namaBeritaControl = new TextEditingController();
  TextEditingController isiBeritaControl = new TextEditingController();

  @override
  void initState() {
    super.initState();
    //print(widget.schoolId);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Color.fromRGBO(154, 233, 178, 1),
              Color.fromRGBO(173, 187, 238, 1),
            ])),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: FadeAnimation(
                            1.3,
                            Text(
                              "Tambah Berita",
                              style: GoogleFonts.antic(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                fontSize: 40,
                              ),
                            ))),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child: Padding(
                          padding: EdgeInsets.all(30),
                          child: SingleChildScrollView(
                              child: Column(children: <Widget>[
                            SizedBox(
                              height: 60,
                            ),
                            FadeAnimation(
                              1.4,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(225, 95, 27, .3),
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Form(
                                  key: _formKey,
                                  child: Column(children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        controller: beritaIdControl,
                                        decoration: InputDecoration(
                                            hintText: "KODE BERITA",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 100,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        controller: namaBeritaControl,
                                        decoration: InputDecoration(
                                            hintText: "NAMA BERITA",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value.length < 3) {
                                            return '$value MINIMAL 3 HURUF';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        controller: isiBeritaControl,
                                        decoration: InputDecoration(
                                            hintText: "ISI BERITA",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),                                    
                                    SizedBox(
                                      height: 40,
                                    ),
                                    FadeAnimation(
                                        1.6,
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 50),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Color.fromRGBO(
                                                  154, 233, 178, 1)),
                                          child: Center(
                                            child: FlatButton(
                                                child: Text(
                                                  "SIMPAN",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                onPressed: () {
                                                  GetHelper.simpanBerita(
                                                      _formKey,
                                                      context,
                                                      beritaIdControl.text,
                                                      namaBeritaControl.text,
                                                      isiBeritaControl.text);
                                                }),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 50,
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ])))))
            ])));
  }
}
