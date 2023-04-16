import 'package:flutter/material.dart';

class ShopAd extends StatelessWidget {
  const ShopAd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.93,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: const Image(
          image: AssetImage('images/ad.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
