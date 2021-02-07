import 'package:flutter/material.dart';
import 'package:flutter_template/components/components.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool gradient;

  const GradientButton(
      {Key key,
      @required this.onPressed,
      @required this.text,
      this.gradient = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle buttonStyle = Theme.of(context).textTheme.button;
    BoxDecoration boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(circularBorderRadius),
        color: Theme.of(context).buttonColor);

    if (gradient) {
      buttonStyle =
          Theme.of(context).textTheme.button.copyWith(color: Colors.white);
      boxDecoration = BoxDecoration(
          borderRadius: BorderRadius.circular(circularBorderRadius),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ]));
    }

    return GestureDetector(
      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Text(
          text,
          style: buttonStyle,
        ),
        decoration: boxDecoration,
      ),
    );
  }
}
