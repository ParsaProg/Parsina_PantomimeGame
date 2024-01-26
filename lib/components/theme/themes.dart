import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData scrollBarTheme = ThemeData(
    fontFamily: 'DANA-REGULAR',
    useMaterial3: true,
    scrollbarTheme: const ScrollbarThemeData(
      thumbColor: MaterialStatePropertyAll(Colors.white),
    ),
  );
}
