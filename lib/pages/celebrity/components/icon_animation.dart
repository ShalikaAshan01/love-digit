import 'package:flutter/animation.dart';

class IconAnimation {
  final AnimationController controller;
  final Animation<double> horizontalPadding;
  final Animation<double> iconSize;

  IconAnimation(this.controller)
      : horizontalPadding = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
                curve: Interval(0.4, 1, curve: Curves.easeIn),
                parent: controller)),
        iconSize = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            curve: Interval(0, 0.3, curve: Curves.easeIn), parent: controller));
}
