import 'package:flutter/foundation.dart';
import 'package:shop_app/model/cart.dart';

class OrderItem {
  final String id;
  final double total;
  final DateTime dateTime;
  final List<CartItem> cartItems;
  OrderItem({
    required this.id,
    required this.total,
    required this.cartItems,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];
  List<OrderItem> get order {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartItems, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            total: total,
            cartItems: cartItems,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
