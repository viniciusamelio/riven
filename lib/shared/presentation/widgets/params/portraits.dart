import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riven/shared/presentation/styles/color.dart';

class PortraitParams {
  Function()? onTap;
  final String imageUrl;
  String? name;
  String? lane;
  Color? accentColor;
  Color? textColor;
  double? size;
  double? borderWidth;

  PortraitParams({
    this.onTap,
    required this.imageUrl,
    this.name,
    this.lane,
    this.accentColor,
    this.size,
    this.borderWidth,
  }) {
    textColor = accentColor;
    if (accentColor == Colors.transparent) {
      textColor = primaryGreen;
    }
  }
}
