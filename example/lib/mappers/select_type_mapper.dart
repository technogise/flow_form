import 'package:flutter/material.dart';
import 'package:flow_form/redux/models/store_view_model.dart';
import 'package:example/widgets/screens/date_picker_screen.dart';
import 'package:example/widgets/screens/file_upload_screen.dart';
import 'package:example/widgets/screens/select_screen.dart';
import 'package:example/widgets/screens/text_input_screen.dart';

import '../widgets/components/select/multi_options.dart';
import '../widgets/components/select/options.dart';
import '../widgets/components/select/radio.dart';

///Class for mapping component names from json to component
class SelectMapper {
  ///Function to provide requested screen
  static Widget getSelect(SelectScreenMeta selectScreenMeta, {Function next}) {
    var mapper = {
      Options.type: Options(
        options: selectScreenMeta.options,
        onPressed: next,
        selectedValue: selectScreenMeta.selectedValue,
      ),
      RadioButtons.type: RadioButtons(
        options: selectScreenMeta.options,
        onPressed: next,
        selectedValue: selectScreenMeta.selectedValue,
      ),
      MultiSelectOptions.type: MultiSelectOptions(
        options: selectScreenMeta.options,
        onPressed: next,
      )
    };

    return mapper[selectScreenMeta.optionType];
  }
}


Widget switchMapper(String type) {
  switch (type) {
    case SelectScreen.type:
      return SelectScreen();
    case DatePickerScreen.type:
      return DatePickerScreen();
    case TextInputScreen.type:
      return TextInputScreen();
    case FileUploadScreen.type:
      return FileUploadScreen();
    default:
      return Container(
        child: Center(
          child: Text("No Screen Found"),
        ),
      );
  }
}
