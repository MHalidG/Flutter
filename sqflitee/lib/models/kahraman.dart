class Kahraman{

  int? id;
  String? isim;
  String? yetenekler;
  double? gucSeviyesi;

  Kahraman(this.isim,this.yetenekler, this.gucSeviyesi);

  Kahraman.withId(this.id,this.isim,this.yetenekler, this.gucSeviyesi);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"]=isim;
    map["yetenekler"]=yetenekler;
    map["guc"]=gucSeviyesi;
    if(id==null){
      map["id"]=id;
    }
    return map;
  }

  Kahraman.fromObject(dynamic o){
    this.id=int.tryParse(o["id"].toString())!;
    this.isim=o["name"];
    this.yetenekler=o["yetenekler"];
    this.gucSeviyesi=double.tryParse(o["guc"].toString())!;
  }

}