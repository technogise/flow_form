import 'package:flutter/widgets.dart';
import 'package:formbuilder/redux/models/abstract_view_model.dart';

//singleton
class WidgetRegistry {
  Map widgets = {};

  void registerWidget(Map widgets) {
    this.widgets = widgets;
  }

  Widget getScreen(String type) {
    return this.widgets[type];
  }
}

WidgetRegistry _registry;

WidgetRegistry getRegistry() {
if(_registry == null) {
_registry = new WidgetRegistry();
}
return _registry;
}