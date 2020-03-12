import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../app_state.dart';
import 'abstract_view_model.dart';

///Class to filter store
class SectionViewModel extends ViewModel {
  ///variable to store all category names
  List<String> sectionNames;

  ///variable to store function which will change category
  Function goToSection;

  ///Constructor
  SectionViewModel({this.sectionNames, this.goToSection});

  /// Function to provide limited info to dashboard from store
  static SectionViewModel fromStore(Store<AppState> store) {
    var categoryNames = [].cast<String>();

    var sectionNode = store.state.currentNode;
    categoryNames = List.from(sectionNode.child.keys);

    return SectionViewModel(
        sectionNames: categoryNames,
        goToSection: (categoryName) =>
            store.dispatch(SetCurrentNode(sectionNode.child[categoryName])));
  }
}
