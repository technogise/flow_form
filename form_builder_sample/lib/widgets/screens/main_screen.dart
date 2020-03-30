import 'package:flow_form/flow_form.dart';
import 'package:flutter/material.dart';

///Class for main screen component
class MainScreen extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const id = '/main-screen';

  @override
  Widget build(BuildContext context) {
    var formProvider = FlowFormProvider.of(context);
    return FlowFormNotifier(builder: (formMetadata) {
      if (formMetadata != null) {
        return formProvider.getScreen(formMetadata.screenType);
      }
      return Container();
    });
  }
}
