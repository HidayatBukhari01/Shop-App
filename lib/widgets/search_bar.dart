import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          hintText: 'Search here...',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          suffixIcon: const Icon(
            Icons.search_rounded,
            color: Color(0xff626262),
            size: 32,
          ),
        ),
      ),
    );
  }
}
