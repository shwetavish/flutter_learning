import 'dart:io';

class Product {
  late String name;
  late double price;
  late File image;

  Product({required this.name, required this.price, required this.image});
}
