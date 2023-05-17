void main() {
  List sehirler = ["Uc", "Triaki", "Zapolyo"];
  List<String> sehirs;
  List cities;

  var pr1 = Product("Seftali", 20.00);
  List<Product> products = [];
  products.add(pr1);
  print(products);
}

class Product {
  late String name;
  late double unitPrice;

  Product(String name, double unitPrice) {
    this.name = name;
    this.unitPrice = unitPrice;
  }
}
