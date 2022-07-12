import 'dart:io';

class Product {
  late String _name;
  late double _price;
  late File _image;

  Product({required String name, required double price, required File image});
}
