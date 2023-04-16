import 'package:flutter/material.dart';

import 'products.dart';

class Product with ChangeNotifier {
  final List<Products> _items = [
    Products(
        productId: 1,
        productName: "Table Lamp",
        productDescription: "Very Good Product",
        productPrice: 250.0,
        imageUrl: 'images/lamp.jpg'),
    Products(
        productId: 2,
        productName: "Jordan Zoom Separate PF",
        productDescription: "Very Genuine Product",
        productPrice: 230.0,
        imageUrl: 'images/shoes.jpg'),
    Products(
        productId: 3,
        productName: "Oversized Tee",
        productDescription: "Very Nice",
        productPrice: 100.0,
        imageUrl: 'images/shirt.jpg')
  ];
  List<Products> get items {
    return [..._items];
  }

  Products findById(int id) {
    return _items.firstWhere((element) => element.productId == id);
  }

  List<Products> get favouriteItems {
    return _items.where((element) => element.isFavourite).toList();
  }

  void addProduct() {
    notifyListeners();
  }

  void toggleFavourite(int productId) {
    final product =
        _items.firstWhere((element) => element.productId == productId);
    product.isFavourite = !product.isFavourite;
    notifyListeners();
  }
}
