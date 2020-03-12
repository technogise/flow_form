import 'package:flutter/material.dart';

import '../widgets/components/select/multi_options.dart';
import '../widgets/components/select/options.dart';
import '../widgets/components/select/radio.dart';

///Class for mapping component names from json to component
class SelectMapper {
  ///Function to provide requested screen
  static Widget getSelect({
    String type = Options.type,
    List options,
    Function next,
    dynamic selectedValue
  }) {
    var mapper = {
      Options.type: Options(
        options: options,
        onPressed: next,
        selectedValue: selectedValue,
      ),
      RadioButtons.type: RadioButtons(
        options: options,
        onPressed: next,
        selectedValue: selectedValue,
      ),
      MultiSelectOptions.type: MultiSelectOptions(
        options: options,
        onPressed: next,
      )
    };

    return mapper[type];
  }
}
