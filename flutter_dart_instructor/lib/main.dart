import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(home: MyApp()));

}

class MyApp extends StatelessWidget {

  String mesaj = "Kurtlarin Tepesine Hosgeldiniz!";
  var not = 65;
  var ogrenciler = [
    "Cihangir",
    "Malik",
    "Cahit",
    "Caglar",
    "Teymur",
    "Qira",
    "Kurt"
  ];


  @override
  Widget build(BuildContext context) {
    //Widget donen bir method
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),

    );
  }

  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 50) {
      mesaj = "Ogrenci Gecti";
    } else if (puan >= 40) {
      mesaj = "Butunleme Vakti";
    } else {
      mesaj = "Kaldi";
    }

    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("SinavSonucu"),
      content: Text(mesaj),
    );
    showDialog(
        context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: ogrenciler.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(ogrenciler[index]);
                })),
        Center(
          child: ElevatedButton(
            child: Text("SonucuGor"),
            onPressed: () {
              var mesaj = sinavHesapla(30);
              mesajGoster(context, mesaj);
            },
          ),
        ),
      ],
    );
  }
}

/*ListView(
              children: <Widget>[
                Text("Cihangir",),
                Text("Malik",),
                Text("Selami",),

              ],
            ),*/
