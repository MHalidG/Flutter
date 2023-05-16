void main(){

  selami("Halid");
  selami("Ferhat");
  selami("Demir");
  selami("Suleyman");
  selami("Mehmet");
  selami("Halid");

print(hesapla(100000000, 15));
test1(1, 2, 3);
test2(2);
test3();
test3(s3:1,s2:1,s1:4);
}

void  selami(String a){
  print("Selam $a");

}

double hesapla(double krediTutari,double yuzde){
  var sonuc=krediTutari*yuzde/100;

  return sonuc;
}


void test1(int s1, int s2, int s3){
  print(s1);
  print(s2);
  print(s3);

}
void test2(int s1, [int? s2, int? s3]){
  print(s1);
  print(s2);
  print(s3);

}

void test3({int? s1, int? s2, int? s3}){
  print(s1);
  print(s2);
  print(s3);

}