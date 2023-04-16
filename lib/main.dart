import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/main_screen.dart';
import 'package:shop_app/model/cart.dart';
import 'package:shop_app/model/orders.dart';
import 'package:shop_app/model/product.dart';
import 'package:shop_app/screens/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Product()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
        routes: {
          DetailScreen.routeName: (context) => const DetailScreen(),
        },
      ),
    );
  }
}
