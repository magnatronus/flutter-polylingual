# polylingual

## Now Available as a Flutter Package
This project has been converted into a Flutter package which can be found [here](https://github.com/magnatronus/polylingual-package)


## Introduction
A sample Flutter app with a simple class (PolyLingual) that can be used for localising the text in an app.


<img src="https://raw.githubusercontent.com/magnatronus/flutter-polylingual/master/screenshots.png" />



## Testing
Clone this project, make sure you do a **flutter get**  and then simple run up the app.
The demo has been set for 3 languages (EN, ES and FR) and has a simple string file of 4 phrases (be gentle I used Google Translate as my Spanish is aweful).
That said the translation file only defines strings for 2 languages (ES and EN), this was done so that the *defaultLanguage* setting could be tested.

When you switch your phone language (in this case either EN or ES) the app should run and display the localised strings, any other language should display ES as ths is set in main.dart as the default language.

If the phone is set to an unsupported language then ES will be displayed as this was set as the default.

## How PolyLingual Works
The first thing you MUST do is load in the translation strings for PolyLingual to use. This is done in main() before the main widget is loaded to make sure we have all the strings available.

```
void main() async {

  // To start with load in your custom translation file then when loaded run the main app
  PolyLingual.defaultLanguageCode = "es";
  await PolyLingual.load("res/strings.json");

  // run your app here
  runApp(DemoApp());
  
}
```

You also need to do the following to the pubspec.yaml file

```
  flutter_localizations:
    sdk: flutter 
```

as well as (in the case of this demo) define the string file as an asset

```
  assets:
  #  - images/a_dot_burr.jpeg
  #  - images/a_dot_ham.jpeg
    - res/strings.json
```

Then, whenever you need to display a localised string somewhere just use

```
PolyLingual.of(context).string("greeting")
```

where 'greeting' is a key in the translation file (take a look at the *strings.json* file for the correct format).


# iOS
Please note that for iOS you will also need to add any supported languages to the Runner info.plist file. Read [here for more info](https://flutter.io/tutorials/internationalization/)



## Getting Started

For help getting started with Flutter, view the online
[documentation](https://flutter.io/).
