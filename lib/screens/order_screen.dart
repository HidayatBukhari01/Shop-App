import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/order_items.dart';

import '../model/orders.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderItems = Provider.of<Orders>(context);
    return orderItems.order.isEmpty
        ? const Center(
            child: Text("No orders made so far!! Do Now."),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
                itemCount: orderItems.order.length,
                itemBuilder: (context, index) {
                  return OrderItems(orders: orderItems.order[index]);
                }),
          );
  }
}
