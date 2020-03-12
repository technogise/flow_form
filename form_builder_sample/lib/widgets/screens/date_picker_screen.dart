import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/redux/models/store_view_model.dart';
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
    return StoreConnector(
      converter: StoreViewModel.fromStore,
      builder: (context, viewModel) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Comment(text: viewModel.getScreenData("label")),
            DatePicker(),
            Options(
              options: viewModel.getScreenData("options"),
              onPressed: viewModel.moveToNextNode,
            ),
          ],
        );
      },
    );
  }
}
