import 'package:flutter/material.dart';

void main(){


  runApp(MaterialApp(
    home: MyApp()
  ));


}

class MyApp extends StatelessWidget{

  String mesaj="Kurtlarin Tepesine Hosgeldiniz!";
  var not=65;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(mesaj),
     ),
     body: Center(
       child: ElevatedButton(
         child:Text("SonucuGor"),
         onPressed: () {
           int puan=95;
          String mesaj="";
           if(puan>=50){
             mesaj="Ogrenci Gecti";
           }else if(puan>=40){
             mesaj="Butunleme Vakti";
           }else{
             mesaj="Kaldi";
           }
           var alert=AlertDialog(
             title: Text("SinavSonucu"),
             content: Text(mesaj),
           );
           showDialog(context: context, builder: (BuildContext context) => alert);
         },
       ),
     ),
   );
  }

}