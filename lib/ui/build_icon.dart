import 'package:flutter/material.dart';

class BuildIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const BuildIcon({Key key, @required this.icon, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0,
                ),
              ]),
        ),
        IconButton(
            icon: Icon(
              icon,
              color: Theme.of(context).appBarTheme.iconTheme.color,
              size: 20,
            ),
            onPressed: onPressed)
      ],
    );
  }
}
