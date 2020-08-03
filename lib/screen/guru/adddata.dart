import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {


TextEditingController controllerberitaId = new TextEditingController();
TextEditingController controllerNamaBerita = new TextEditingController();
TextEditingController controllerIsiBerita = new TextEditingController();
//TextEditingController controllerStock = new TextEditingController();

void addData(){
  var url="http://10.0.2.2/api_profile_sekolah/guru/tambah_data_berita.php";

  http.post(url, body: {
    "berita_id": controllerberitaId.text,
    "nama_berita": controllerNamaBerita.text,
    "isi_berita": controllerIsiBerita.text
  });



}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("TAMBAH BERITA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerberitaId,
                  decoration: new InputDecoration(
                      hintText: "KODE BERITA", labelText: "KODE BERITA"),
                ),
                new TextField(
                  controller: controllerNamaBerita,
                  decoration: new InputDecoration(
                      hintText: "NAMA BERITA", labelText: "NAMA BERITA"),
                ),
                new TextField(
                  controller: controllerIsiBerita,
                  decoration: new InputDecoration(
                      hintText: "ISI BERITA", labelText: "ISI BERITA"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("ADD DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
