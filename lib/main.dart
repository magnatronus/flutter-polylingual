import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'polylingual.dart';

/// Load the First Widget and initialise PolyLingual
void main() async {

  // To start with load in your custom translation file then when loaded run the main app
  PolyLingual.defaultLanguageCode = "es";
  await PolyLingual.load("res/strings.json");

  // run your app here
  runApp(DemoApp());

}

/// Simple demo Material App 
class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DemoApp',
        home: LanguageScreen(),
        localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
        supportedLocales: [
          const Locale("en", ""),
          const Locale("es", ""),    
          const Locale("fr", ""),    
        ],

      );
  }
}


// Simple Screen to show the use of PolyLingual
class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PolyLingual Demo")),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[

          Text(
            PolyLingual.of(context).string("greeting"),
            style: TextStyle(color: Colors.blue),
          ),

          Text(
            PolyLingual.of(context).string("good"),
            style: TextStyle(color: Colors.orange),
          ),

          Text(
            PolyLingual.of(context).string("thankyou"),
            style: TextStyle(color: Colors.blue),
          ),

          Text(
            PolyLingual.of(context).string("welcome"),
            style: TextStyle(color: Colors.orange),
          ),


        ],
      )
    );
  }
}

