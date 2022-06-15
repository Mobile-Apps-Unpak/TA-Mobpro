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
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        toolbarTextStyle: TextStyle(color: Colors.white)),
    iconTheme: const IconThemeData(
      color: Color(0xffffd44c),
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
        color: Color.fromARGB(255, 212, 211, 211), opacity: 0.8),
  );
}
