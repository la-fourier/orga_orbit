import 'package:flutter/material.dart';

class CalendarWeekView extends StatelessWidget {
  final List<String> daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: daysOfWeek.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: daysOfWeek.length,
      ),
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Text(daysOfWeek[index]),
        );
      },
    );
  }
}
