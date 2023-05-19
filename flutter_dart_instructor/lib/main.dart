import 'package:flutter/material.dart';
import 'package:flutter_dart_instructor/screens/student_add.dart';
import 'package:flutter_dart_instructor/screens/student_edit.dart';

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

  //Student selectedStudent;
  Student selectedStudent=Student.withId(0, "", "", 0);
  //late Student selectedStudent;

  //var not = 65;
  List<Student> students = [
    Student.withId(1,"Cihangir", "Dagdeviren", 100),
    Student.withId(2,"Malik", "Devrilmez", 99),
    Student.withId(3,"Bartok", "Varyemez", 30),
    Student.withId(4,"Mehmet Ali", "Saman", 45)
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

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Islem Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
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
                      backgroundImage: NetworkImage(
                          "https://i1.sndcdn.com/artworks-000147503915-rk15y4-t500x500.jpg"),
                    ),
                    title: Text("${students[index].firstName} ${students[index].lasstName}"),
                    subtitle: Text("Sinavdan Aldigi Not : ${students[index].grade} [${students[index].getStatus}]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent=students[index];
                        print(selectedStudent.firstName);
                      }); //print(students[index].firstName+" "+students[index].lasstName);
                    },
                  );
                })),
        Text("Secili Ogrenci : "+ selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: TextButton(
                child: Row(
                  //color verilmiyor
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 1.0),
                    Text("Yeni Ogrenci"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,//ayni raw icindeki elemanlarin total flex payi satiri kac paya boldugunu anlatir/
              //Flex degeri ise o widgetin kac pay kaplayacagini belirler
              child: ElevatedButton(
                child: Row(
                  children:<Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 5.0),
                    Text("Guncelle"),
                  ],
                ),
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedStudent)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: MaterialButton(
                color: Colors.amberAccent,
                child:  Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(width: 1.0),Text("Ogrenciyi Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });

                 var mesaj = "Silindi";
                  mesajGoster(context, mesaj);
                },
              ),
            )
          ],
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

/*
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
  }*/