import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/redux/actions/actions.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/models/abstract_view_model.dart';
import 'package:formbuilder/redux/models/dashboard_view_model.dart';
import '../square_box.dart';

///Class for dashboard component
class Dashboard extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const type = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StoreConnector<AppState, ViewModel>(
        onInit: (store) {
          var dashBoardNode = store.state.dashBoardNode;
          store.dispatch(SetCurrentNode(dashBoardNode));
        },
        converter: DashboardViewModel.fromStore,
        builder: (context, view) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: getButtonList(view),
          );
        },
      ),
    );
  }

  /// Function to get all category name buttons
  List<Widget> getButtonList(DashboardViewModel viewModel) {
    var widgets = [].cast<Widget>();
    widgets.add(Expanded(flex: 1, child: SizedBox()));

    for (var categoryName in viewModel.categoryNames) {
      widgets.add(
        Expanded(
          flex: 1,
          child: SquareBox(
            label: categoryName,
            onPressed: viewModel.goToCategory,
          ),
        ),
      );
    }
    widgets.add(Expanded(flex: 1, child: SizedBox()));
    return widgets;
  }
}
