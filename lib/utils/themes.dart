import 'package:flutter/material.dart';

final palette = Palette();

class Palette {
  Color primary = const Color(0xff76984b);
  Color secondary = const Color(0xff76984b);
  Color background = const Color(0xffececee);
  Color grey = const Color(0xffa9a9a9);
  Color pink = const Color(0xffFF4B91);

  Color black = Colors.black;
  Color white = Colors.white;
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: palette.background,
  colorScheme: ColorScheme.light(
    background: palette.background,
    primary: palette.primary,
    secondary: palette.secondary,
  ),
  useMaterial3: true,
);
