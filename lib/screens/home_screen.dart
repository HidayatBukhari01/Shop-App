import 'package:flutter/material.dart';
import '../widgets/balance_card.dart';
import '../widgets/category_nav.dart';
import '../widgets/menu_items.dart';
import '../widgets/search_bar.dart';
import '../widgets/shop_ad.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SearchBar(),
          SizedBox(
            height: 20.0,
          ),
          BalanceCard(),
          SizedBox(
            height: 20.0,
          ),
          CategoryNav(),
          SizedBox(
            height: 20.0,
          ),
          MenuItems(),
          SizedBox(
            height: 20.0,
          ),
          ShopAd(),
          ShopAd(),
        ],
      ),
    );
  }
}
