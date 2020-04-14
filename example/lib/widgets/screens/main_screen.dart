import 'package:flow_form/flow_form.dart';
import 'package:flutter/material.dart';
import 'package:example/mappers/select_type_mapper.dart';

///Class for main screen component
class MainScreen extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const id = '/main-screen';

  @override
  Widget build(BuildContext context) {
    var formProvider = FlowFormProvider.of(context);
    return FlowFormNotifier(builder: (formMetadata) {
      if (formMetadata != null) {
        return formProvider.getWidget(formMetadata.screenType);
      }
      return Container();
    });
  }
}
