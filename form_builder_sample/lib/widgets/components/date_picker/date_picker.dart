import 'package:flutter/material.dart';

import 'date_field.dart';

///enum to hold the calendar fields
enum CalendarFields {
  ///Date field of calendar
  date,

  ///Month field of calendar
  month,

  ///Year field of calenda
  year
}

///Class for reusable DatePicker
class DatePicker extends StatefulWidget {
  ///Constructor for custom date picker
  DatePicker();

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  ///Variable for selected month
  int date;
  int month;
  int year;
  DateTime computedDate;

  final Map<CalendarFields, FocusNode> focusNodes = {
    CalendarFields.date: FocusNode(),
    CalendarFields.month: FocusNode(),
    CalendarFields.year: FocusNode()
  };

  final _separator = Text(
    "/",
    style: TextStyle(fontSize: 20),
  );

  _DatePickerState();

  @override
  void dispose() {
    super.dispose();

    focusNodes.forEach((field, node) {
      node.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 37,
              child: DateField(
                "DD",
                maxLength: 2,
                focusNode: focusNodes[CalendarFields.date],
                prevNode: null,
                nextNode: focusNodes[CalendarFields.month],
                onChange: (value) {
                  setState(() {
                    date = int.parse(value);
                  });
                },
              ),
            ),
            _separator,
            Container(
              width: 50,
              child: DateField(
                "MM",
                maxLength: 2,
                prevNode: focusNodes[CalendarFields.date],
                focusNode: focusNodes[CalendarFields.month],
                nextNode: focusNodes[CalendarFields.year],
                onChange: (value) {
                  setState(() {
                    month = int.parse(value);
                  });
                },
              ),
            ),
            _separator,
            Container(
              width: 60,
              child: DateField(
                "YYYY",
                maxLength: 4,
                prevNode: focusNodes[CalendarFields.month],
                focusNode: focusNodes[CalendarFields.year],
                nextNode: null,
                onChange: (value) {
                  setState(() {
                    year = int.parse(value);
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
