import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/formbuilder.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/models/abstract_view_model.dart';
import 'package:formbuilder/redux/models/section_view_model.dart';

import '../components/square_buttons.dart';

///Class to render sections
class RenderSection extends StatelessWidget {
  /// Constructor
  RenderSection({Key key}) : super(key: key);

  ///Id for routes
  static const type = 'section';

  @override
  Widget build(BuildContext context) {
    var formBuilder = FormBuilderProvider.navigatorOf(context);
    print("Form " + formBuilder.toString());
    return Container(
      child: StoreConnector<AppState, ViewModel>(
        converter: SectionViewModel.fromStore,
        builder: (context, view) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: getButtonList(view),
          );
        },
      ),
    );
  }

  /// Function to get all category name buttons
  List<Widget> getButtonList(SectionViewModel viewModel) {
    return viewModel.sectionNames
        .map(
          (categoryName) => SquareButton(
            label: categoryName,
            onPressed: viewModel.goToSection,
          ),
        )
        .toList();
  }
}
