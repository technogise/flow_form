import 'package:flutter/material.dart';
import 'package:formbuilder/formbuilder.dart';

import '../components/comment.dart';
import '../components/date_picker/date_picker.dart';
import '../components/select/options.dart';

///Class for reusable datePicker component
class DatePickerScreen extends StatefulWidget {
  /// Static variable to refer this class in routes
  static const type = 'date-picker';

  /// Constructor
  DatePickerScreen({Key key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePickerScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var questionNavigation = FormBuilderProvider.navigatorOf(context);
    var selectScreenMeta = questionNavigation.getSelectScreenMeta();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Comment(text: selectScreenMeta.comment),
        DatePicker(),
        Options(
          options: selectScreenMeta.options,
          onPressed: questionNavigation.submitAnswer,
        ),
      ],
    );
  }
}
