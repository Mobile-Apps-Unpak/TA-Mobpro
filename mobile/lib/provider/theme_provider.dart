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
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        toolbarTextStyle: TextStyle(color: Colors.white)),
    iconTheme:
        IconThemeData(color: Color.fromARGB(255, 230, 20, 20), opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[200],
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        toolbarTextStyle: TextStyle(color: Colors.black)),
    iconTheme:
        IconThemeData(color: Color.fromARGB(255, 212, 211, 211), opacity: 0.8),
  );
}
