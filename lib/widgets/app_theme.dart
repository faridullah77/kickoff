import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.black87,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black54,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      elevation: 5,
    ),
  );
}
