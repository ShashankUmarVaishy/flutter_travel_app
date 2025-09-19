import 'package:flutter/material.dart';

class CateringOptions extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onChanged;

  const CateringOptions({
    super.key,
    required this.onChanged,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           
            Expanded(
              child: InkWell(
                onTap: () => onChanged("Veg"),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selected == "Veg" ? Colors.green : Colors.grey,
                    ),
                    color: selected == "Veg"
                        ? const Color.fromARGB(255, 206, 249, 207)
                        : Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => onChanged("Veg"),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.grey, width: 1),
                            color: selected == "Veg"
                                ? Colors.green
                                : Colors.transparent,
                          ),
                        ),
                      ),

                      SizedBox(height: 4, width: 8),
                      Icon(Icons.eco, color: Colors.green), 
                      SizedBox(width: 2),
                      Text(
                        "Veg",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: InkWell(
                onTap: () => onChanged("Non-Veg"),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selected == "Non-Veg" ? Colors.red : Colors.grey,
                    ),
                    color: selected == "Non-Veg"
                        ? const Color.fromARGB(255, 253, 193, 193)
                        : Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => onChanged("Non-Veg"),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.grey, width: 1),
                            color: selected == "Non-Veg"
                                ? Colors.red
                                : Colors.transparent,
                          ),
                        ),
                      ),
                      SizedBox(height: 4, width: 8),
                      Icon(Icons.set_meal, color: Colors.red),
                      SizedBox(width: 2),
                      Text(
                        "Non-Veg",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
