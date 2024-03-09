class Product {
  final String name;
  final String brand;
  final String imageURL;
  final int price;
  final String description;

  Product(this.name, this.brand, this.imageURL, this.price, this.description);

  factory Product.fromJson(Map<String, dynamic> json) {
    return new Product(json["name"], json["brand"], json["imageURL"],
        json["price"], json["description"]);
  }
}
