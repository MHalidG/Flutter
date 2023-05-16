
void main() {
  //map 1
/*var sozluk=new Map();

sozluk["Book"]="kitap";
sozluk["little"]="kucuk";
//map 2*/
  var sozluk1 = {"kitap": "Book", "Sozluk": "Selami",}; //{key:value,key:value}
  sozluk1["Buyuk"] = "big";

//print(sozluk);
//print(sozluk1);
//sozluk.remove("Book");

  //print(sozluk);
  //print(sozluk1);
/*
for(var key in sozluk1.keys){
  print(key + " : "+ sozluk1[key]!);
}

  for(var value in sozluk1.values){
    print(value );
  }

  print(sozluk1.containsKey("Selami"));
  print(sozluk1.containsKey("kitap"));
*/
  sozluk1.forEach((k, v) => {print("$k : $v")});

}