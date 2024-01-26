import 'package:flutter/material.dart';

class AppScreenSize {
  static double screenwidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenheight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
