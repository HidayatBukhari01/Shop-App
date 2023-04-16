import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/orders.dart';

class OrderItems extends StatefulWidget {
  final OrderItem orders;
  const OrderItems({super.key, required this.orders});

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _expandable = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text("\$${widget.orders.total}"),
            subtitle: Text(
                DateFormat('dd MM yyyy hh:mm').format(widget.orders.dateTime)),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _expandable = !_expandable;
                  });
                },
                icon:
                    Icon(_expandable ? Icons.expand_less : Icons.expand_more)),
          ),
          if (_expandable)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              height: min(widget.orders.cartItems.length * 20.0 + 10.0, 180),
              child: ListView(
                children: widget.orders.cartItems
                    .map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                            Text('${e.quantity} x \$${e.price}'),
                          ],
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
