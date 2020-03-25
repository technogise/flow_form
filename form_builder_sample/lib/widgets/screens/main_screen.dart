import 'package:flutter/material.dart';
import 'package:formbuilder/formbuilder.dart';
import 'package:formbuildersample/mappers/screen_mapper.dart';

///Class for main screen component
class MainScreen extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const id = '/main-screen';

  @override
  Widget build(BuildContext context) {
    return FormBuilderWidget(builder: (formMetadata) {
      if (formMetadata != null) {
        return ScreenMapper.getScreen(
          formMetadata.screenType,
        );
      }
      return Container();
    });
  }
}
