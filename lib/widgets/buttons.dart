import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  Function onTap;
  double width;
  double height;
  Widget content;
  Color color;
  AppButton({
    required this.color,
    required this.content,
    required this.height,
    required this.onTap,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () => onTap(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: content,
      ),
    );
  }
}
