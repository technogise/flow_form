import 'package:flutter/material.dart';

import '../widgets/screens/date_picker_screen.dart';
import '../widgets/screens/file_upload_screen.dart';
import '../widgets/screens/select_screen.dart';
import '../widgets/screens/text_input_screen.dart';

///Class for mapping component names from json to component
class ScreenMapper {
  ///Function to provide requested screen
  static Widget getScreen(String type) {
    var mapper = {
      SelectScreen.type: SelectScreen(),
      DatePickerScreen.type: DatePickerScreen(),
      TextInputScreen.type: TextInputScreen(),
      FileUploadScreen.type: FileUploadScreen()
    };

    return mapper[type];
  }
}
