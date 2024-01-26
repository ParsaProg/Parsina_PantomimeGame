import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

extension AppNavigators on BuildContext {
  //! Push
  void pushtopage(
    Widget widget,
    BuildContext context,
    dynamic transtitonType,
    Duration duration,
    Function func
  ) {
    Navigator.push(
      context,
      PageTransition(
        child: widget,
        type: transtitonType,
        duration: duration,
      ),
    ).then((value) => func());
  }

  //? Wait push
  void removeUntillPush(BuildContext context, Widget widget, bool isroute,
      dynamic transtitonType, Duration duration) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        child: widget,
        type: transtitonType,
        duration: duration,
      ),
      (route) => isroute,
    );
  }
}
