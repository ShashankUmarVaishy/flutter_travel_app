import 'package:flutter/material.dart';

class NumberOfAdults extends StatelessWidget {
  final num? adults;
  final ValueChanged<num?>onChanged;

  const NumberOfAdults({
  super.key,
  required this.adults,
  required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
                        "Number of Adults",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 6),
                      //Adult count
                      TextFormField(
                        keyboardType: TextInputType.number, // Numeric keyboard
                        decoration: InputDecoration(
                          hintText: "Enter number of adults",
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey, width: 2),
                          ),
                        ),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        onChanged: (val) => onChanged(int.tryParse(val) ?? 0),
                      ),
      ],
    );
  }
}