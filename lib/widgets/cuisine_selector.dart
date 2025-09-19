import 'package:flutter/material.dart';

class CuisineSelector extends StatelessWidget {
  final List<Map<String, String>> cuisines;
  final String? selected;
  final ValueChanged<String?> onChanged;
  const CuisineSelector({
    super.key,
    required this.cuisines,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: cuisines.map((c) {
            final name = c["name"] ?? "";
            final image = c["image"] ?? "";

            return InkWell(
              onTap: () => onChanged(name),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selected == name
                        ? Colors.deepPurple
                        : Colors.grey.shade300,
                    width: 2,
                  ),
                  color: selected == name
                      ? Colors.deepPurple[100]
                      : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Radio<String>(
                      value: name,
                      groupValue: selected,
                      activeColor: Colors.deepPurple,
                      onChanged: onChanged,
                    ),

                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selected == name
                              ? Colors.deepPurple
                              : Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image,
                        width: 170,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 12),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
