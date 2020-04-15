import 'package:flutter/material.dart';

import 'helpers/database.dart';
import 'redux/store.dart';

class FlowForm {
  FlowForm(FlowFormBuilder formBuilder) {
    _flowPath = formBuilder.flowPath;
    _screenMetaPath = formBuilder.screenMetaPath;
    _database = formBuilder.database;
    registerWidget = formBuilder.registerWidget;
    setFlowAndDataPath(_flowPath, _screenMetaPath);
    setupDB(_database);
  }

  String _flowPath;
  String _screenMetaPath;
  Database _database;
  RegisterWidget registerWidget;
}

class FlowFormBuilder {
  FlowFormBuilder(this.flowPath);

  final String flowPath;
  String screenMetaPath;
  Database database;
  RegisterWidget registerWidget;

  FlowForm build() => FlowForm(this);
}

typedef Widget RegisterWidget(String type);
