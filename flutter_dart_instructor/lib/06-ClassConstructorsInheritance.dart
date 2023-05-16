void main() {
  PersonelManager pManager = PersonelManager();
  var pManager1 = new PersonelManager();
  var pManager2 = PersonelManager();
  pManager.create();
  pManager.delete();
  pManager.update();
  pManager.read();

  var cManager = CustomerManager();
  var customer = Customer.withInfo("Cihangir", "Dagdeviren");
  var customer1 = Customer();
  customer1.firstName = "Ali";
  customer1.lastName = "Dagdeviren";
  cManager.create(customer);
  cManager.create(customer1);

  Person customer2=Customer.withInfo("Malik", "Dagdeviren");
  cManager.create(customer2 as Customer);
  //***** Referans tip data yonetimi
  //C1'in refini C2'nin refiyle esitledigimiz icin C2 de ne degisiklik yaparasak c1de de o oluyor artik.
  customer1=customer2;
  customer2.firstName="MehmetcanDen";

  Personel p1=Personel();
  p1.firstName="Mehmetcan";

  var pController=PersonController();
  //Person Controllerda yazdigimiz methodun parametresini Person yaptik. Person Classi Customer ve Personelin
  //Parenti oldugu icin ikisinden de ibje alabildi.Hafiza yonetimi adina kritik bir adim.
  pController.operation(p1);
  pController.operation(customer1);

}
class PersonController{
  void operation(Person person){
    print("Inheritance demo : "+person.firstName);
  }

}


class PersonelManager {
  void create() {
    print("Eklendi");
  }

  void update() {
    print("Guncellendi");
  }

  void delete() {
    print("silindi");
  }

  void read() {
    print("Personel Bilgisi Getirildi");
  }
}

class CustomerManager {
  void create(Customer customer) {
    print("Eklendi : " + customer.firstName);
  }

  void update() {
    print("Guncellendi");
  }

  void delete() {
    print("silindi");
  }

  void read() {
    print("Personel Bilgisi Getirildi");
  }
}

class Customer extends Person {
    //Ayni isimde iki Constructor olmuyor imzasi farkli olsa bile
  //Customer(){}
  Customer() {}
  Customer.withInfo(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }
}

class Personel extends Person{
  late int dateOfStart;

  Personel(){}
  Personel.withInfo(String firstName,String lastName,int dateOfStart){
  this.firstName=firstName;
  this.lastName=lastName;
  this.dateOfStart=dateOfStart;
  }

}

class Person{
  late String firstName;
  late String lastName;

}
