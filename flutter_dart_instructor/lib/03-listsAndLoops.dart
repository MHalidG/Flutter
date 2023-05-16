void main(){

  var sehirler=["Ankara","Mehmet","Selami"];
  sehirler.add("Dyaribekir");
  //print(sehirler.where((s) => s.contains("a")));
  sehirler.add("Yozgat");
  sehirler.add("Corum");
  sehirler.add("Meitingen");
  for(var i=0;i<sehirler.length;i++){
    print(sehirler[i]);
  }
  for (var sehir in sehirler){
    print(sehir);
  }
  int sayi =6;
 while(sayi>=0){
   print(sehirler[sayi]);
   sayi--;
 }
 var sayi2=10;
 do{
   print(sayi2);
   sayi2++;
 }while(sayi2>1000);

}