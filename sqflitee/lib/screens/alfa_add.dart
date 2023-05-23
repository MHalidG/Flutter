import 'package:flutter/material.dart';
import 'package:sqflitee/models/kahraman.dart';

import '../data/dbHelper.dart';

class AlfaAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return AlfaAddState();
  }

}

class AlfaAddState extends State {
  //TextEditingController txtName=TextEditingController();
  var dbHelper=DbHelper();
  var txtIsim=TextEditingController();
  var txtYetenekler=TextEditingController();
  var txtGucSeviyesi=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alfa Ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildIsimField(),buildYeteneklerField(),buildGucSeviyesiField(), buildSaveButton()
          ],
        ),
      ),
    );
  }

  buildIsimField() {
    return TextField(
      decoration: InputDecoration(labelText: "Alfa adi"),
      controller: txtIsim,
    );

  }

  buildYeteneklerField() {
    return TextField(
      decoration: InputDecoration(labelText: "Alfanin Yetenekleri"),
      controller: txtYetenekler,
    );

  }

  buildGucSeviyesiField() {
    return TextField(
      decoration: InputDecoration(labelText: "Alfa Guc Seviyesi"),
      controller: txtGucSeviyesi,
    );

  }

  buildSaveButton() {
    return FilledButton(
        child: Text("Ekle"),
         onPressed:(){
          setState(() {
            addAlfa();
          });
              },
    );
  }

  void addAlfa() async{

  var result= await dbHelper.insert(Kahraman(txtIsim.text, txtYetenekler.text, double.tryParse(txtGucSeviyesi.text)));

  Navigator.pop(context,true);
  }
}