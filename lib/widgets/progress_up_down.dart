import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../constants/colors/constants_colors.dart';

// ignore: must_be_immutable
class ProgressUp extends StatelessWidget {
  double width;
  Color color;
  Color iconUpColor;
  Color icondownColor;
  Function up;
  Function down;

  TextStyle textStyle;
  // ignore: prefer_typing_uninitialized_variables
  var content;
  ProgressUp(
      {required this.color,
      required this.textStyle,
      required this.content,
      required this.down,
      required this.iconUpColor,
      required this.icondownColor,
      required this.up,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ZoomTapAnimation(
            onTap: () {
              down();
            },
            child: CircleAvatar(
              backgroundColor:
                  GameScreenColors.downCount_ButtonColor_choeseDore,
              radius: 23,
              child: Icon(
                Icons.remove,
                color: icondownColor,
              ),
            ),
          ),
          Obx(
            () => Text(
              content.toString(),
              textDirection: TextDirection.rtl,
              style:
                  textStyle,
            ),
          ),
          ZoomTapAnimation(
            onTap: () {
              up();
            },
            child: CircleAvatar(
              backgroundColor: GameScreenColors.upCount_ButtonColor_choeseDore,
              radius: 23,
              child: Icon(
                Icons.add,
                color: GameScreenColors.tittle_choeseCountTeam_iconButtonplus,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
