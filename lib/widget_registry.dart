import 'package:flutter/widgets.dart';

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