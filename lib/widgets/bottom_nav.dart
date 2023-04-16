import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:provider/provider.dart';

import '../model/cart.dart';

class BottomNav extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTapItem;
  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTapItem,
  });

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(21), topRight: Radius.circular(21)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: widget.selectedIndex,
            onTap: widget.onTapItem,
            unselectedItemColor: const Color.fromARGB(255, 38, 38, 38),
            selectedItemColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(Icons.home_filled),
                  label: "Home"),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_outline_outlined,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(Icons.favorite),
                  label: "Favourite"),
              BottomNavigationBarItem(
                icon: Consumer<Cart>(
                  builder: (_, cartData, __) {
                    return badge.Badge(
                      badgeAnimation: const badge.BadgeAnimation.fade(
                        animationDuration: Duration(seconds: 3),
                      ),
                      badgeContent: Text(cartData.itemCount.toString()),
                      child: const Icon(
                        Icons.work_outline,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
                activeIcon: const Icon(Icons.work),
                label: "Cart",
              ),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list_alt,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(Icons.list_alt),
                  label: "Profile"),
            ],
          ),
        ));
  }
}
