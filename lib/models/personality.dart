import 'package:flutter/material.dart';

class Personality{
  final String title;
  final IconData yourIcon;
  final IconData partnerIcon;
  final String yourSubtitle;
  final String partnerSubtitle;

  Personality(this.title, this.yourIcon, this.partnerIcon,
      {this.yourSubtitle, this.partnerSubtitle});
}
