import 'package:flutter/material.dart';

class ResponseTimeSelector extends StatelessWidget {
  final bool isFastResponse;
  final ValueChanged<bool> onToggle;
  final String? responseTime;
  const ResponseTimeSelector({
    super.key,
    required this.isFastResponse,  
    required this.onToggle,
    required this.responseTime
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Get offer within (optional)",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        GestureDetector(
          onTap: () => onToggle(!isFastResponse),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: isFastResponse ? Colors.deepPurple : Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: isFastResponse
                  ? [
                      BoxShadow(
                        color: const Color.fromARGB(255, 219, 199, 254),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
              color: Colors.white, // keep background consistent
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "24 hours",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text("Needs 1 extra point"),
              ],
            ),
          ),
        ),

        const Text(
          "Normal response time is within 2 days",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
