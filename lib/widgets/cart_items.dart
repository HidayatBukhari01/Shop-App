import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';

class CartItems extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final int quantity;
  final String id;
  final String productId;
  const CartItems(
      {super.key,
      required this.id,
      required this.productId,
      required this.image,
      required this.title,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: const Icon(Icons.delete),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Are you sure?"),
                  content:
                      const Text("Do you really want to remove this item?"),
                  actions: [
                    InkWell(
                        onTap: () => Navigator.of(context).pop(true),
                        child: const Text("Yes")),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () => Navigator.of(context).pop(false),
                        child: const Text("No")),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xfff8f8f7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text("Price : $price"),
              ],
            ),
            const Spacer(),
            Text("$quantity"),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
