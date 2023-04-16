import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/favourite_items.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/widgets/bottom_nav.dart';

import 'screens/order_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavouriteItems(),
    CartScreen(),
    OrderScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _builtAppBar() {
    switch (_selectedIndex) {
      case 0:
        return const Text("");
      case 1:
        return const Text(
          "Favourite Products",
        );
      default:
        return const Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: _builtAppBar(),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onTapItem: _onItemTapped,
      ),
    );
  }
}
