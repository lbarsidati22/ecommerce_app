import 'package:ecommerce_app/model/item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List selectedPrudact = [];
  int price = 0;
  add(Item product) {
    selectedPrudact.add(product);
    price += product.price.round();
    notifyListeners();
  }

  delete(Item product) {
    selectedPrudact.remove(product);
    price -= product.price.round();
    notifyListeners();
  }
}
