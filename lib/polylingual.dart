import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;


/// PolyLingual is an easy way of adding translation strings to your app
/// It  detects the current phone language and provides a mechanism to return 
/// a localised string for that language, if available.
/// Otherwise it will return the string in the selected default.
class PolyLingual {

  Locale locale;
  static Map <dynamic, dynamic> _values;
  static String defaultLanguageCode="en";

  PolyLingual(this.locale);

  /// Create an instance of PolyLingual and pass in the current phone locale
  static PolyLingual of(BuildContext context) {
    return PolyLingual(Localizations.localeOf(context));
  }

  /// Get the required string in the current phone language 
  /// [id] is the key value of the required string from the resource file
  String string(id) {
    print(locale.languageCode);
    try{
      return _values[locale.languageCode][id];
    }catch(e) {
      return _values[defaultLanguageCode][id];
    }
  }

  /// Initialise PolyLingual using a custom translation file that can be loaded from a defined asset
  /// This method should always be run first, usually in the main() function, so that the strings are available to the rest of the app
  /// 
  /// [filename] is the name of the file (declared as an asset in pubspec.yaml)
  /// for example: 
  ///  assets:
  ///   - res/strings.json
  static load(String filename) async {
    var strings = await rootBundle.loadString(filename);
    _values = jsonDecode(strings);
  }

}


