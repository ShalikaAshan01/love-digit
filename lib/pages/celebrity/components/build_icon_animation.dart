import 'package:flutter/material.dart';
import 'package:flutter_template/pages/celebrity/components/icon_animation.dart';
import 'package:flutter_template/ui/build_icon.dart';

class BuildIconAnimation extends StatelessWidget {
  final IconAnimation animation;
  final bool right;
  final IconData icon;
  final VoidCallback onPressed;
  BuildIconAnimation({Key key,@required AnimationController animationController, this.right=false,@required this.icon, this.onPressed}) :
  animation = IconAnimation(animationController),super(key: key);


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
        builder:(context,child)=> buildAnimation(context));
  }
  Widget buildAnimation(BuildContext context){
    final offset = right?-20.0:20.0;
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.translate(
          offset: Offset(animation.horizontalPadding.value * offset,0),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.diagonal3Values(
              animation.iconSize.value,
              animation.iconSize.value,
              animation.iconSize.value,
              // 1
            ),
            child: BuildIcon(
              onPressed: onPressed,
              icon: icon,
            ),
          ),
        ),
      ],
    );
  }
}

