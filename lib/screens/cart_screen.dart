import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/orders.dart';
import 'package:shop_app/widgets/cart_items.dart';

import '../model/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<Cart>(context);
    return cartItems.items.isEmpty
        ? const Center(
            child: Text("Your Cart Is Empty! Bummer!!"),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      itemCount: cartItems.itemCount,
                      itemBuilder: (context, index) {
                        return CartItems(
                            id: cartItems.items.values.toList()[index].id,
                            productId: cartItems.items.keys.toList()[index],
                            image: cartItems.items.values.toList()[index].image,
                            title: cartItems.items.values.toList()[index].title,
                            price: cartItems.items.values.toList()[index].price,
                            quantity: cartItems.items.values
                                .toList()[index]
                                .quantity);
                      }),
                ),
                Expanded(
                    child: Column(
                  children: [
                    const Divider(
                      thickness: 0.07,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "\$${cartItems.cartTotal().toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                            cartItems.items.values.toList(),
                            cartItems.cartTotal());
                        cartItems.clear();
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                            child: Text(
                          "Proceed to buy",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        )),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          );
  }
}
