import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/models/store_view_model.dart';
import 'package:formbuildersample/mappers/screen_mapper.dart';

///Class for main screen component
class MainScreen extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const id = '/main-screen';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StoreViewModel>(
        converter: StoreViewModel.fromStore,
        builder: (context, viewModel) {
          if (viewModel.currentNode != null) {
            return ScreenMapper.getScreen(
              viewModel.currentNode.type,
              viewModel,
            );
          }
          return Container();
        });
  }
}
