import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class event_cal extends StatefulWidget {
  const event_cal({Key? key}) : super(key: key);

  @override
  State<event_cal> createState() => _event_calState();
}

class _event_calState extends State<event_cal> {
  DateTime today=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TableCalendar(
            focusedDay:today ,firstDay:DateTime.utc(2024),lastDay: DateTime.utc(2030),
          ),
        )
      ],
    );
  }
}
