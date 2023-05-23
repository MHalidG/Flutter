import 'package:flutter/material.dart';
import 'package:sqflitee/data/dbHelper.dart';
import 'package:sqflitee/screens/kahraman_detail.dart';

import '../models/kahraman.dart';
import 'alfa_add.dart';

class KahramanListesi extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return _KahramanListState();
  }

}

class _KahramanListState extends State {
  var dbHelper=DbHelper();
  late List<Kahraman> kahramanlar;
  int kahramanSayac=0;

  @override
  void initState() {

      getAlfalar();


    //Yukarida kahramanlar listesi create edildi ama icine data atanmadi.
    //Burda atanma icin islemi baslatiyoruz. Data geldikce dolduruluyor

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alfalar"),
      ),
      body: buildKahramanListesi(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){goToAlfaAdd();},
        child: Icon(Icons.add),
        tooltip: "Alfa Ekle",
      ),
    );

  }

  ListView buildKahramanListesi() {
//return type vermeden de return edebiliyoruz. Fakat okunabilirlik acisindan yaziyoruz
return ListView.builder(
    itemBuilder: (BuildContext context, int position){
      return Card(
        color: Colors.green,
        elevation:2.0,
        child:ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,child: Text("K"),),
          title: Text(this.kahramanlar[position].isim!),
          subtitle: Text(this.kahramanlar[position].yetenekler!),
          onTap: (){
            goToDetail(this.kahramanlar[position]);
          },
        )
        );
},
  itemCount: kahramanSayac//bunu item builderin ustune yazdigimiz zaman sayac dogru calismiyor bu yuzden ekleme yaoptiktan sionra
  //Liste yenilenmiyor
);

  }

  void goToAlfaAdd() async{
   bool result= await Navigator.push(context, MaterialPageRoute(builder: (context)=>AlfaAdd()));
    if(result!=null){
      if(result){

      }
    }
  }


  void getAlfalar(){
    var kahramanlarFuture=dbHelper.getAlfas();
    kahramanlarFuture.then((data){
      setState(() {
        this.kahramanlar=data;
        kahramanSayac=data.length;
      });
  });

}

  void goToDetail(Kahraman kahraman) async {
    var result = await Navigator.push(context,MaterialPageRoute(builder: (context)=>KahramanDetail(kahraman)));
  if(result!=null){
    if(result){
      getAlfalar();
    }
  }

  }
}