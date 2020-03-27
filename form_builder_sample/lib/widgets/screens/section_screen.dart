import 'package:flutter/material.dart';
import 'package:formbuilder/formbuilder.dart';
import 'package:formbuilder/question_navigation.dart';

import '../components/square_buttons.dart';

///Class to render sections
class RenderSection extends StatelessWidget {
  /// Constructor
  RenderSection({Key key}) : super(key: key);

  ///Id for routes
  static const type = 'section';

  @override
  Widget build(BuildContext context) {
    var questionNavigation = FormBuilderProvider.navigatorOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: getButtonList(questionNavigation),
    );
  }

  /// Function to get all category name buttons
  List<Widget> getButtonList(QuestionNavigation questionNavigation) {
    return questionNavigation
        .getSectionNames()
        .map(
          (categoryName) => SquareButton(
            label: categoryName,
            onPressed: questionNavigation.gotoSection,
          ),
        )
        .toList();
  }
}
