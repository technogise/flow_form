import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../app_state.dart';
import 'abstract_view_model.dart';

///Class to filter store
class DashboardViewModel extends ViewModel {
  ///variable to store all category names
  List<String> categoryNames;

  ///variable to store function which will change category
  Function goToCategory;

  ///Constructor
  DashboardViewModel({this.categoryNames, this.goToCategory});

  /// Function to provide limited info to dashboard from store
  static DashboardViewModel fromStore(Store<AppState> store) {
    var categoryNames = [].cast<String>();

    var dashBoardNode = store.state.dashBoardNode;
    categoryNames = List.from(dashBoardNode.child.keys);

    return DashboardViewModel(
        categoryNames: categoryNames,
        goToCategory: (categoryName) =>
            store.dispatch(SetCurrentNode(dashBoardNode.child[categoryName])));
  }
}
