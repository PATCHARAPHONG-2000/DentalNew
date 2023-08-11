import 'dart:convert';
import 'package:flutter/services.dart';

class Language {
  static late Map<String, dynamic> localizedStrings;

  static Future<void> loadLocalizedStrings(String languageCode) async {
    String jsonString =
        await rootBundle.loadString('assets/$languageCode.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    localizedStrings = jsonMap;
  }
}
