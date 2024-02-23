import 'package:flutter/material.dart';
import 'package:todo_app/OnlineShoping/Provider/model.dart';

class Cart extends ChangeNotifier {
  final List<Item> cart = [];

  void addCart(Item item) {
    cart.add(item);
    notifyListeners();
  }

  void removeCart(Item item) {
    cart.remove(item);
    notifyListeners();
  }
}
