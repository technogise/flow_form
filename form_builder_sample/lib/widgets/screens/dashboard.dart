import 'package:flow_form/flow_form.dart';
import 'package:flow_form/question_navigation.dart';
import 'package:flutter/material.dart';

import '../square_box.dart';

///Class for dashboard component
class Dashboard extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const type = 'dashboard';

  @override
  Widget build(BuildContext context) {
    var questionNavigation = FlowFormProvider.navigatorOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: getButtonList(questionNavigation),
    );
  }

  /// Function to get all category name buttons
  List<Widget> getButtonList(QuestionNavigation questionNavigation) {
    var widgets = [].cast<Widget>();
    widgets.add(Expanded(flex: 1, child: SizedBox()));

    for (var categoryName in questionNavigation.getSectionNames()) {
      widgets.add(
        Expanded(
          flex: 1,
          child: SquareBox(
            label: categoryName,
            onPressed: questionNavigation.gotoSection,
          ),
        ),
      );
    }
    widgets.add(Expanded(flex: 1, child: SizedBox()));
    return widgets;
  }
}
