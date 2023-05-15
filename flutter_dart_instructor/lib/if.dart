void main(){
  bool sistemeGirmisMi=false;

  //var sistemeGirdikMi=true;
  //sistemeGirdikMi="Engin";

  if(sistemeGirmisMi==true){
    print("Anasayfaya gidildi");
  }else{//if(sistemeGirmisMi==false){
    print("Login sayfasina gidildi");
  }

  int puan=90;

  if(puan>=50){
    print("Ogrenci Gecti");
  }else if(puan>=40){
    print("Butunleme Vakti");
  }else{
    print("Kaldi");
  }

  String not="C";
  //String not="c";
  switch(not){
    case "A":{print("Aferim La Veled");}
      break;
    case "B":{print("La Az daha Gayret Yigidim");}
      break;
    case "C":{print("Oglim Aklin nerede senin ulaaaa");}
      break;
    default:{print("Bu neyin nesi ola gardas");}
  }


}