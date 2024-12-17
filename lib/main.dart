import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'widgets/app_theme.dart';

void main() {
  runApp(KickoffApp());
}

class KickoffApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kickoff',
      theme: AppTheme.themeData,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
