import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/product.dart';
import 'package:shop_app/widgets/menu_card.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final menuItems = Provider.of<Product>(context).items;
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width * 0.93,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: menuItems[index],
              child: const MenuCard(),
            );
          }),
    );
  }
}
