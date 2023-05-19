import 'package:flutter/material.dart';
import '../models/student.dart';
import '../validation/student_validator.dart';
class StudentEdit extends StatefulWidget{
  late Student selectedStudent;
  StudentEdit(Student selectedStudent){
    this.selectedStudent=selectedStudent;

  }
  @override
  State<StatefulWidget> createState() {

    return _StudentEditState(selectedStudent);
    // throw UnimplementedError();
  }
}

class _StudentEditState extends State with StudentValidationMixin {
  late Student selectedStudent;
  var formKey=GlobalKey<FormState>();

  _StudentEditState(Student selectedStudent){
    this.selectedStudent=selectedStudent;
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
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(labelText: "Ogrenci Adi",hintText: "Ogrencinin Soyadini Giriniz"),
      validator:validateFirstName,
      onSaved:(String? value){
        selectedStudent.firstName=value!;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lasstName,
      decoration: InputDecoration(labelText: "Ogrenci Soyadi",hintText: "Ogrencinin Soyadini Giriniz"),
      validator:validateLastName,
      onSaved:(String? value){
        selectedStudent.lasstName=value!;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Ogrenci Notu",hintText: "Ogrencinin Aldigi Notu Giriniz"),
      validator:validateGrade,
      onSaved:(String? value){
        selectedStudent.grade=int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Bilgileri Kaydet"),
      onPressed: (){
        if(formKey.currentState!.validate()){
          formKey.currentState?.save();
          saveStudent();
          Navigator.pop(context);
        }
      },);

  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lasstName);
    print(selectedStudent.grade);

  }
}