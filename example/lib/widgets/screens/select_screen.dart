import 'package:flow_form/flow_form.dart';
import 'package:flutter/material.dart';

import '../../mappers/select_type_mapper.dart';
import '../components/comment.dart';
import '../components/question.dart';

///Class for reusable choice screen component
class SelectScreen extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const type = 'select-input';

  @override
  Widget build(BuildContext context) {
    var questionNavigation = FlowFormProvider.navigatorOf(context);
    var selectScreenMeta = questionNavigation.getSelectScreenMeta();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Comment(text: selectScreenMeta.comment),
        QuestionCard(text: selectScreenMeta.question),
        SelectMapper.getSelect(
          selectScreenMeta,
          next: (answer) {
            questionNavigation.goToNext(answer);
          },
        )
      ],
    );
  }
}
