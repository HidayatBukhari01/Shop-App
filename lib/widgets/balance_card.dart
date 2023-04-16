import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width * 0.93,
      decoration: BoxDecoration(
          color: const Color(0xff212121),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(blurRadius: 10.0)]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Balance",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "VISA",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "\$285.0",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                Text(
                  "...380",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
