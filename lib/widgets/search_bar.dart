import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const MySearchBar({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: value)
        ..selection = TextSelection.fromPosition(
          TextPosition(offset: value.length),
        ),
      onChanged: onChanged,
      decoration: InputDecoration(
        
        prefixIcon: const Icon(Icons.search),
        hintText: "Search",
        filled: true,
        fillColor: Colors.deepPurple.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 16,
        ),
      ),
      style: const TextStyle(fontSize: 18), // control text size
    );
  }
}
