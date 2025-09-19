import 'package:flutter/material.dart';

class EventDatesSelector extends StatelessWidget {
  final List<DateTime> dates;
  final GestureTapCallback pickDate;
  const EventDatesSelector({
    super.key,
    required this.dates,
    required this.pickDate,
    //required this.onChanged,
  });

  String monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Event Dates",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 8),
        ...dates.map((d) {
          // Format date like 1st March 2025
          String daySuffix(int day) {
            if (day >= 11 && day <= 13) return 'th';
            switch (day % 10) {
              case 1:
                return 'st';
              case 2:
                return 'nd';
              case 3:
                return 'rd';
              default:
                return 'th';
            }
          }

          String formattedDate =
              "${d.day}${daySuffix(d.day)} ${monthName(d.month)} ${d.year}";

          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey, width: 1.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDate,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Icon(Icons.calendar_month_rounded, color: Colors.grey),
              ],
            ),
          );
        }),

        // Add more dates button
        GestureDetector(
          onTap: pickDate,
          child: Container(
            width: double.infinity, // full width
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " + add more dates",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Icon(Icons.calendar_month_rounded, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
