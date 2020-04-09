import 'package:flutter/material.dart';

import 'helpers/database.dart';
import 'redux/store.dart';

class FlowForm {
  FlowForm(FlowFormBuilder formBuilder) {
    _flowPath = formBuilder.flowPath;
    _screenMetaPath = formBuilder.screenMetaPath;
    _database = formBuilder.database;
    registerWidgets.addAll(formBuilder.registerWidgets);
    setFlowAndDataPath(_flowPath, _screenMetaPath);
    setupDB(_database);
  }

  String _flowPath;
  String _screenMetaPath;
  Database _database;
  final Map<String, Widget> registerWidgets = <String, Widget>{};
}

class FlowFormBuilder {
  FlowFormBuilder(this.flowPath);

  final String flowPath;
  String screenMetaPath;
  Database database;
  Map<String, Widget> registerWidgets = <String, Widget>{};

  FlowForm build() => FlowForm(this);
}
