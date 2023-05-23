import 'package:flutter/material.dart';
import 'package:sqflitee/data/dbHelper.dart';

import '../models/kahraman.dart';

class KahramanDetail extends StatefulWidget{

  Kahraman kahraman;
  KahramanDetail(this.kahraman);


  @override
  State<StatefulWidget> createState() {
    return _KahramanDetailState(kahraman);
  }



}
enum Options{delete,update}
class _KahramanDetailState  extends State{
  Kahraman kahraman;
  _KahramanDetailState(this.kahraman);
  var dbHelper=DbHelper();
  var txtIsim=TextEditingController();
  var txtYetenekler=TextEditingController();
  var txtGucSeviyesi=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kahraman Detayi : ${kahraman.isim}"),
        actions: <Widget>[
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context)=><PopupMenuEntry<Options>>[
              PopupMenuItem<Options>(
              value: Options.delete,
                child: Text("Sil"),
              ),
              PopupMenuItem<Options>(
                value: Options.update,
                child: Text("Guncelle"),
              )
            ],
          )
        ]
      ),
      body:buildKahramanDetail() ,
    );
  }

  buildKahramanDetail() {
   return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          buildIsimField(),buildYeteneklerField(),buildGucSeviyesiField()
        ],
      ),
    );
  }

  void selectProcess(Options options) async{

    switch(options){
      case Options.delete:
        await dbHelper.delete(kahraman.id!);
        Navigator.pop(context,true);
        break;

      case Options.update:
        await dbHelper.update(Kahraman.withId(
            kahraman.id,
            kahraman.isim,
            kahraman.yetenekler,
            kahraman.gucSeviyesi));
        Navigator.pop(context,true);
        break;
      default:
        break;
    }
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
}
