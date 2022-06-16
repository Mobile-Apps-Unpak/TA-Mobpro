import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
    primaryColor: const Color.fromARGB(255, 29, 29, 29),
    colorScheme: const ColorScheme.dark(),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        toolbarTextStyle: TextStyle(color: Colors.white)),
    iconTheme: const IconThemeData(
      color: Color(0xffffd44c),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffffd44c),
        ),
      ),
      prefixIconColor: Color(0xffffd44c),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xffffd44c),
      selectionColor: Color(0xffffd44c),
      selectionHandleColor: Color(0xffffd44c),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[200],
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        toolbarTextStyle: TextStyle(color: Colors.black)),
    iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 66, 165, 245), opacity: 0.8),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue.shade400,
        ),
      ),
      prefixIconColor: Colors.blue[400],
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xffffd44c),
      selectionColor: Color(0xffffd44c),
      selectionHandleColor: Color(0xffffd44c),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.black,
      ),
    ),
    splashColor: Colors.blue.shade400,
  );
}
