import 'package:flutter/material.dart';

// const textColor = Color.fromRGBO(249, 253, 226, 1);
// const backgroundColor = Color.fromRGBO(33, 38, 3, 1);
// const primaryColor = Color.fromRGBO(33, 38, 3, 1);
// const secondaryColor = Color.fromRGBO(38, 3, 33, 1);
// const accentColor = Color.fromRGBO(48, 16, 229, 1);

const textColor = Color.fromRGBO(33, 33, 33, 1);
const backgroundColor = Color.fromRGBO(232, 235, 213, 1);
const primaryColor = Color.fromRGBO(33, 38, 3, 1);
const secondaryColor = Color.fromRGBO(38, 3, 33, 1);
const accentColor = Color.fromRGBO(48, 16, 229, 1);

ThemeData baseTheme = ThemeData(
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      splashFactory: NoSplash.splashFactory,
      animationDuration: Duration(seconds: 0),
    ),
  ),
);

ThemeData lightTheme = baseTheme.copyWith(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: Color.fromARGB(224, 156, 166, 175),
        secondary: secondaryColor,
        onSecondary: Color.fromARGB(197, 152, 152, 25),
        error: Color.fromARGB(157, 201, 86, 86),
        onError: Color.fromARGB(200, 91, 79, 79),
        background: backgroundColor,
        onBackground: textColor,
        surface: accentColor,
        onSurface: Color.fromARGB(202, 14, 198, 222)
        ),
    brightness: Brightness.light,
    // primaryColor: primaryColor,
    // floatingActionButtonTheme:
        // FloatingActionButtonThemeData(backgroundColor: secondaryColor),
    // elevatedButtonTheme: ElevatedButtonThemeData(
        // style: ButtonStyle(
            // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                // EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
            // shape: MaterialStateProperty.all<OutlinedBorder>(
                // RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(20.0))),
            // backgroundColor: MaterialStateProperty.all<Color>(secondaryColor))),
    // inputDecorationTheme: InputDecorationTheme(
        // labelStyle: TextStyle(
          // color: accentColor,
          // fontWeight: FontWeight.bold,
        // ),
        // border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(20.0),
            // borderSide: BorderSide.none),
        // filled: true,
        // fillColor: Colors.grey.withOpacity(0.1)));
);

ThemeData darkTheme = baseTheme.copyWith(
  colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(157, 201, 86, 86),
      onPrimary: Color.fromARGB(157, 201, 86, 86),
      secondary: Color.fromARGB(157, 201, 86, 86),
      onSecondary: Color.fromARGB(157, 201, 86, 86),
      error: Color.fromARGB(157, 201, 86, 86),
      onError: Color.fromARGB(157, 201, 86, 86),
      background: Color.fromARGB(157, 201, 86, 86),
      onBackground: Color.fromARGB(157, 201, 86, 86),
      surface: Color.fromARGB(157, 201, 86, 86),
      onSurface: Color.fromARGB(157, 201, 86, 86)
      ),
  brightness: Brightness.dark,
  // primaryColor: Colors.white,
  // switchTheme: SwitchThemeData(
    // trackColor: MaterialStateProperty.all<Color>(Colors.grey),
    // thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  // ),
  // inputDecorationTheme: InputDecorationTheme(
      // border: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(20.0),
          // borderSide: BorderSide.none),
      // filled: true,
      // fillColor: Colors.grey.withOpacity(0.1)),
  // elevatedButtonTheme: ElevatedButtonThemeData(
      // style: ButtonStyle(
          // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              // EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
          // shape: MaterialStateProperty.all<OutlinedBorder>(
              // RoundedRectangleBorder(
                  // borderRadius: BorderRadius.circular(20.0))),
          // backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          // foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          // overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),
);

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  bool isDarkMode() {
    if (_themeMode == ThemeMode.light) {
      return false;
    } else {
      return true;
    }
  }

  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
