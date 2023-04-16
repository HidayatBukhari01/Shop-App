import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/products.dart';

import '../screens/detail_screen.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(builder: (context, product, child) {
      return Container(
          margin: const EdgeInsets.all(10),
          width: 160,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, DetailScreen.routeName,
                      arguments: product.productId);
                },
                child: Container(
                  height: 170,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width:
                          70, //set the width of the container to a short value
                      child: Text(
                        product.productName,
                        textAlign:
                            TextAlign.start, //set the text alignment to center
                        maxLines: 2, //set the maximum number of lines to 2
                        overflow: TextOverflow
                            .ellipsis, //set the text overflow behavior
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          product.toggleFavourite();
                        },
                        child: Icon(product.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border)),
                  ],
                ),
              ),
            ],
          ));
    });
  }
}
