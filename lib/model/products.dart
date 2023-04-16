import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  final int productId;
  final String productName;
  final String productDescription;
  final double productPrice;
  final String imageUrl;
  bool isFavourite;
  Products({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.imageUrl,
    this.isFavourite = false,
  });
  void toggleFavourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
