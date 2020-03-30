import 'package:flutter/material.dart';
import 'package:flow_form/helpers/database.dart';
import 'package:flow_form/redux/store.dart';

class FlowForm {
  String _flowPath;
  String _screenMetaPath;
  Database _database;
  final registerWidgets = Map<String, Widget>();

  FlowForm(FlowFormBuilder formBuilder) {
    _flowPath = formBuilder.flowPath;
    _screenMetaPath = formBuilder.screenMetaPath;
    _database = formBuilder.database;
    registerWidgets.addAll(formBuilder.registerWidgets);
    setFlowAndDataPath(_flowPath, _screenMetaPath);
    setupDB(_database);
  }
}

class FlowFormBuilder {
  
  FlowFormBuilder(this._flowPath);

  final String _flowPath;
  String _screenMetaPath;
  Database _database;
  final _registerWidgets = Map<String, Widget>();

  String get flowPath => _flowPath;

  String get screenMetaPath => _screenMetaPath;

  set screenMetaPath(String value) {
    _screenMetaPath = value;
  }

  Database get database => _database;

  set database(Database value) {
    _database = value;
  }

  get registerWidgets => _registerWidgets;

  set registerWidgets(value) {
    _registerWidgets.addAll(value);
  }

  void registerWidget(String key, Widget newWidget) {
    _registerWidgets[key] = newWidget;
  }

  FlowForm build() => FlowForm(this);
}
