import 'package:flutter/material.dart';
import 'package:formbuilder/redux/models/abstract_view_model.dart';

import '../widgets/screens/dashboard.dart';
import '../widgets/screens/date_picker_screen.dart';
import '../widgets/screens/file_upload_screen.dart';
import '../widgets/screens/section_screen.dart';
import '../widgets/screens/select_screen.dart';
import '../widgets/screens/text_input_screen.dart';

///Class for mapping component names from json to component
class ScreenMapper {
  ///Function to provide requested screen
  static Widget getScreen(String type, ViewModel viewModel) {
    var mapper = {
      SelectScreen.type: SelectScreen(),
      DatePickerScreen.type: DatePickerScreen(),
      Dashboard.type: Dashboard(),
      TextInputScreen.type: TextInputScreen(),
      RenderSection.type: RenderSection(),
      FileUploadScreen.type: FileUploadScreen(viewModel)
    };

    return mapper[type];
  }
}
