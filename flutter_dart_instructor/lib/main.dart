import 'package:flutter/material.dart';

import 'models/student.dart';

void main() {

  runApp(MaterialApp(home: MyApp()));

}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Ogrenci Takip Sistemi";

  String seciliOgrenci="abc";

  //var not = 65;
  List<Student> students=[Student("Cihangir","Dagdeviren",100),
    Student("Malik","Devrilmez", 99),Student("Bartok","Varyemez", 30),Student("Mehmet Ali", "Saman", 45)];

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
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://i1.sndcdn.com/artworks-000147503915-rk15y4-t500x500.jpg"),
                    ),
                    title: Text(students[index].firstName+" "+students[index].lasstName),
                    subtitle: Text("Sinavdan Aldigi Not : "+students[index].grade.toString()+" ["+students[index].getStatus+"]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: (){
                      setState(() {
                        seciliOgrenci=students[index].firstName+" "+students[index].lasstName;
                        print(seciliOgrenci);
                      });                      //print(students[index].firstName+" "+students[index].lasstName);

                    },
                  );
                })),
        Text("Secili Ogrenci : "+seciliOgrenci),
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

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.account_balance);
    } else {
      return Icon(Icons.clear);
    }
  }
}
/*ListView(
              children: <Widget>[
                Text("Cihangir",),
                Text("Malik",),
                Text("Selami",),

              ],
            ),*/
