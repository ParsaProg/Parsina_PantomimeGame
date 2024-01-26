import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pantomimegame/providers/extensions/extensions.dart';
import 'package:pantomimegame/views/game_start.dart';

import '../../views/game_screen.dart';
import '../controllers/controllers.dart';

class AppAlertDilogs {
  static void showAlert({
    required Widget title,
    required Widget? content,
    required List<Widget> actions,
    required BuildContext context,
  }) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        return Transform.scale(
          scale: 1,
          child: AlertDialog(
            actions: actions,
            title: title,
            content: content,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}

class StartGame {
  static void start({
    required Widget widget,
    required BuildContext context,
    required Function then,
  }) {
    context.pushtopage(widget, context, PageTransitionType.rightToLeft,
        const Duration(milliseconds: 300), () {
      PantomimeGameScreen.startState.value = 0;
      PantomimeGameScreen.errorCounter.value = 0;
      then();
    });
  }
}

class ShowSnackBars {
  static void showSnackBar(
      {required Text titleText,
      required Text messageText,
      required Color backgroundColor,
      required bool shouldIconPulse,
      required Widget icon,
      required DismissDirection dismissDirection,
      required Curve forwardAnimationCurve}) {
    Get.snackbar(
      '',
      '',
      backgroundColor: backgroundColor,
      titleText: titleText,
      messageText: messageText,
      icon: icon,
      shouldIconPulse: shouldIconPulse,
      forwardAnimationCurve: forwardAnimationCurve,
      dismissDirection: dismissDirection,
    );
  }
}
