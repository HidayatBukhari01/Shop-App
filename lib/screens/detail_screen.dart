import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/cart.dart';
import 'package:shop_app/model/product.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});
  static const routeName = '/detail-screen';

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final loadedProuct = Provider.of<Product>(context).findById(id);
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        title: const Text("Detail Product"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  loadedProuct.toggleFavourite();
                });
              },
              icon: Icon(
                loadedProuct.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: Center(
                child: Image.asset(
                  loadedProuct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        loadedProuct.productName,
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                      Button(
                        text: "\$${loadedProuct.productPrice}",
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 140,
              decoration: BoxDecoration(
                color: const Color(0xfff6f6f6),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(30, 30),
                        backgroundColor: Colors.black,
                        shape: const CircleBorder(), //<-- SEE HERE
                        // padding: EdgeInsets.all(20),
                      ),
                      child: const Icon(
                        Icons.remove,
                      ),
                    ),
                    Text(
                      cart.checkQuantity(loadedProuct.productName).toString(),
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(30, 30),
                        backgroundColor: Colors.black,
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  ]),
            ),
            InkWell(
              onTap: () {
                cart.addItem(
                    loadedProuct.productId.toString(),
                    loadedProuct.productName,
                    loadedProuct.productPrice,
                    loadedProuct.imageUrl);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text("Item added to cart"),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                      label: "Undo",
                      onPressed: () {
                        cart.removeSingleItem(
                            loadedProuct.productId.toString());
                      }),
                ));
              },
              child: const Button(
                text: "Add to Cart",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  const Button({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 110,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
