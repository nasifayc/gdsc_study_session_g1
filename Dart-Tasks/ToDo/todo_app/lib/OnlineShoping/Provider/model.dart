import 'package:flutter/material.dart';

class Item {
  final String imagePath, name;
  final double price;
  bool isAdded;
  Item(
      {required this.imagePath,
      required this.name,
      required this.price,
      required this.isAdded});
}

class Stock extends ChangeNotifier {
  final List<Item> stock = [
    Item(
        imagePath: 'assets/images/item1.avif',
        name: 'SkateBoared',
        price: 30.0,
        isAdded: false),
    Item(
        imagePath: 'assets/images/item2.webp',
        name: 'Toaster',
        price: 75.25,
        isAdded: false),
    Item(
        imagePath: 'assets/images/item3.webp',
        name: 'Shirts',
        price: 25.65,
        isAdded: false),
    Item(
        imagePath: 'assets/images/item4.avif',
        name: 'Basketball',
        price: 100.25,
        isAdded: false),
    Item(
        imagePath: 'assets/images/item5.avif',
        name: 'Brand HP Laptops',
        price: 2045.25,
        isAdded: false),
    Item(
        imagePath: 'assets/images/item2.webp',
        name: 'Toaster',
        price: 75.25,
        isAdded: false),
    Item(
        imagePath: 'assets/images/item3.webp',
        name: 'Shirts',
        price: 200.25,
        isAdded: false),
    Item(
        imagePath: 'assets/images/item4.avif',
        name: 'Toaster',
        price: 75.25,
        isAdded: false),
  ];

  void addItem(Item item) {
    stock.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    stock.removeAt(index);
    notifyListeners();
  }

  void mark(Item item) {
    item.isAdded = true;
    notifyListeners();
  }

  void unmark(Item item) {
    item.isAdded = false;
    notifyListeners();
  }
}
