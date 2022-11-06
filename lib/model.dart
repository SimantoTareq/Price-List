import 'package:flutter/cupertino.dart';

class Model_class {
  String img;
  String name;
  String price;
  bool isLike;
  Model_class(this.img, this.name, this.price, this.isLike);

  static List<Model_class> generatedList() {
    return [
      Model_class('images/1.png', 'Dairy Milk', '100', false),
      Model_class('images/2.png', 'Bournville', '200', false),
      Model_class('images/3.png', 'Safari', '80', false),
      Model_class('images/4.png', 'Cookies', '150', false),
      Model_class('images/5.png', 'donuts', '70', false),
      Model_class('images/6.png', ' Biscuit', '300', false),
      Model_class('images/7.png', 'Chocolate', '100', false),
      Model_class('images/8.png', 'Chocolate', '100', false),
    ];
  }
}
