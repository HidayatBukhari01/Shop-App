import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/product.dart';

class FavouriteItems extends StatelessWidget {
  const FavouriteItems({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context);
    final favouriteItems = productData.favouriteItems;
    return favouriteItems.isEmpty
        ? const Center(
            child: Text("No Favourite Item"),
          )
        : Consumer<Product>(
            builder: (context, productData, child) {
              return ListView.builder(
                  itemCount: favouriteItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    favouriteItems[index].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(favouriteItems[index].productName),
                              InkWell(
                                  onTap: () {
                                    productData.toggleFavourite(
                                        favouriteItems[index].productId);
                                  },
                                  child: const Icon(Icons.favorite)),
                            ],
                          ),
                        ));
                  });
            },
          );
  }
}
