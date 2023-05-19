import 'package:flutter/material.dart';
import '../models/student.dart';
import '../validation/student_validator.dart';
class StudentAdd extends StatefulWidget{
  late List<Student> students;
  StudentAdd(List<Student> students){
this.students=students;

  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
   // throw UnimplementedError();
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  late List<Student> students;
  var student=Student.withoutInfo();
  var formKey=GlobalKey<FormState>();

  _StudentAddState(List<Student> students){
    this.students=students;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ogrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
          child: Form(
            key:formKey,
            child:Column(
              children: <Widget>[
                 buildFirstNameField(),
                 buildLastNameField(),
                 buildGradeField(),
                 buildSubmitButton()
              ],
            )
          ),
      )
    );
  }

  Widget buildFirstNameField() {
   return TextFormField(
      decoration: InputDecoration(labelText: "Ogrenci Adi",hintText: "Ogrencinin Soyadini Giriniz"),
      validator:validateFirstName,
      onSaved:(String? value){
        student.firstName=value!;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ogrenci Soyadi",hintText: "Ogrencinin Soyadini Giriniz"),
      validator:validateLastName,
      onSaved:(String? value){
        student.lasstName=value!;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ogrenci Notu",hintText: "Ogrencinin Aldigi Notu Giriniz"),
      validator:validateGrade,
      onSaved:(String? value){
        student.grade=int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Bilgileri Kaydet"),
      onPressed: (){
      if(formKey.currentState!.validate()){
        formKey.currentState?.save();
        students.add(student);
        saveStudent();
        Navigator.pop(context);
      }
    },);
    
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lasstName);
    print(student.grade);

  }
}