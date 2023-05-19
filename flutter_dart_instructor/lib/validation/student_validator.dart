


mixin class StudentValidationMixin{



  String? validateFirstName(String? value) {
    if (value!.length < 2) {
      return "Enaz iki karakter icermelidir";
    }
  }

  String? validateLastName(String? value) {
    if (value!.length < 2) {
      return "Enaz iki karakter icermelidir";
    }
  }
  String? validateGrade(String? value) {

    int grade=int.parse(value!);

    if (grade<0||grade>100) {
      return "Deger 0-100 arasinda olmalidir";
    }
  }
}