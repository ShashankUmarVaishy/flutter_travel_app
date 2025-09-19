import 'package:flutter/material.dart';

class BudgetField extends StatelessWidget {
  final String? budget;
  final String currency;
  final ValueChanged<String?> onBudgetChanged;
  final ValueChanged<String> onCurrencyChanged;

  const BudgetField({
    super.key,
    required this.budget,
    required this.currency,
    required this.onBudgetChanged,
    required this.onCurrencyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Budget",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400, width: 1.5),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            children: [
              // Expanded numeric input
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Amount",
                    border: InputBorder.none,
                  ),
                  onChanged: onBudgetChanged,
                ),
              ),

              // Dropdown for currency
              DropdownButton<String>(
                value: currency,
                underline: const SizedBox(), // removes default underline
                items: ["INR", "USD", "EUR", "YEN"].map((currency) {
                  return DropdownMenuItem(
                    value: currency,
                    child: Text(currency),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) onCurrencyChanged(val);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
