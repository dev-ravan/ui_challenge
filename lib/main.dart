import 'package:flutter/material.dart';
import 'package:plantify/screens/intro.dart';
import 'package:plantify/utils/themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Plantify",
        home: const IntroScreen(),
        theme: lightTheme);
  }
}
