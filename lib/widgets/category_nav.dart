import 'package:flutter/material.dart';
import 'package:shop_app/model/categories.dart';

class CategoryNav extends StatefulWidget {
  const CategoryNav({
    super.key,
  });

  @override
  State<CategoryNav> createState() => _CategoryNavState();
}

class _CategoryNavState extends State<CategoryNav> {
  int selectedIndex = 0;
  List<Category> categoryItems = [
    Category(icon: Icons.home_filled, title: "Best Deal"),
    Category(icon: Icons.kitchen, title: "Kitchen"),
    Category(icon: Icons.chair, title: "Furniture"),
    Category(icon: Icons.laptop, title: "Laptops")
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: MediaQuery.of(context).size.width * 0.93,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryItems.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(6),
                height: 150,
                width: 70,
                decoration: BoxDecoration(
                    color: index == selectedIndex
                        ? const Color(0xff89a9d1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      categoryItems[index].icon,
                      color: index == selectedIndex
                          ? Colors.white
                          : const Color(0xff333333),
                      size: 30,
                    ),
                    Text(
                      categoryItems[index].title,
                      style: TextStyle(
                          color: index == selectedIndex
                              ? Colors.white
                              : const Color(0xffb4b4b8)),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
