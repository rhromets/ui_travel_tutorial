import 'package:flutter/material.dart';
import 'package:ui_travel_tutorial/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        primaryColor: const Color(0xFF3EBACE),
        colorScheme: theme.colorScheme.copyWith(
          secondary: const Color(0xFFD8ECF1),
        ),
        scaffoldBackgroundColor: const Color(0XFFF3F5F7),
      ),
      home: const HomeScreen(),
    );
  }
}
