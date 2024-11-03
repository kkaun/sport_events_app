import 'package:flutter/material.dart';

class DateFilter extends StatelessWidget {
  final List<String> dates = ["Yesterday", "Today", "Tomorrow"];
  final String selectedDate;
  final Function(String) onDateSelected;

  DateFilter(
      {super.key, required this.selectedDate, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: dates.map((date) {
          final isSelected = date == selectedDate;
          return GestureDetector(
            onTap: () => onDateSelected(date),
            child: Column(
              children: [
                Text(
                  date.toUpperCase(),
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.black38,
                    fontWeight:
                        isSelected ? FontWeight.w500 : FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                if (isSelected)
                  Container(
                    height: 3,
                    width: 60,
                    color: Colors.blue,
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
