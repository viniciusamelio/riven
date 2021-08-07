import 'package:flutter/widgets.dart';

class PortraitParams {
  Function()? onTap;
  final String imageUrl;
  String? name;
  String? lane;
  final Color accentColor;
  double? size;

  PortraitParams(
      {this.onTap,
      required this.imageUrl,
      this.name,
      this.lane,
      required this.accentColor,
      size});
}
