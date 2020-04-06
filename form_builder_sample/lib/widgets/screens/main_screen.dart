import 'package:flow_form/flow_form.dart';
import 'package:flutter/material.dart';
import 'package:formbuildersample/main.dart';

///Class for main screen component
class MainScreen extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const id = '/main-screen';

  @override
  Widget build(BuildContext context) {
    return FlowFormNotifier(builder: (formMetadata) {
      if (formMetadata != null) {
        return switchMapper(formMetadata.screenType);
      }
      return Container();
    });
  }
}
