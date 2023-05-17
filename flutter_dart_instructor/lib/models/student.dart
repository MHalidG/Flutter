class Student{
  late String firstName;
  late String lasstName;
  late int grade;
  late String _status;

  Student(String firstName,String lastName,int grade){
  this.firstName=firstName;
  this.lasstName=lastName;
  this.grade=grade;
  }

  String get getFirsName{
    return "Ogr - "+this.firstName;
  }

  void set setFirstName(String value){
    this.firstName=value;
  }

  String get getStatus{
    String message = "";
    if (this.grade >= 50) {
      message = "Ogrenci Gecti";
    } else if (this.grade >= 40) {
      message = "Butunleme Vakti";
    } else {
      message = "Kaldi";
    }
    return message;
  }


}

/*
  var ogrenciler = [
    "Cihangir",
    "Malik",
    "Cahit",
    "Caglar",
    "Teymur",
    "Qira",
    "Kurt"
  ];
*/

