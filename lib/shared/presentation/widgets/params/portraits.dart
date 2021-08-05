import 'package:flutter/widgets.dart';

class PortraitParams {
  final Function onTap;
  final String imageUrl;
  final String name;
  final String lane;
  final Color accentColor;
  double? size;

  PortraitParams(
      {required this.onTap,
      required this.imageUrl,
      required this.name,
      required this.lane,
      required this.accentColor,
      size});
}
