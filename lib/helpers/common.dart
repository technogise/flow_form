import 'dart:convert';
import 'package:flutter/services.dart';

/// Class to serialize json
class Serializer {
  ///Function to fetch json from given path
  static Future<Map<String, dynamic>> fetchJson(String path) async {
    return await rootBundle.loadString(path).then(parseJson);
  }

  ///Function to parse json from string state
  static Map<String, dynamic> parseJson(String jsonString) {
    Map<String, dynamic> parsedJson = json.decode(jsonString);

    if (parsedJson.containsKey("data")) {
      return parsedJson["data"];
    }
    return parsedJson;
  }
}
