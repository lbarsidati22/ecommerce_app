import 'package:ecommerce_app/test/test_data.dart/test_prudact.dart';
import 'package:flutter/material.dart';

class TestCart with ChangeNotifier {
  List testSelectedcart = [];
  int price = 0;
  add(TestPrudact testCakout) {
    testSelectedcart.add(testCakout);
    price += testCakout.testPrice.round();
    notifyListeners();
  }

  delete(TestPrudact testCakout) {
    testSelectedcart.remove(testCakout);
    price -= testCakout.testPrice.round();
    notifyListeners();
  }
}
