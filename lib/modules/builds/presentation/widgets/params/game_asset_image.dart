import 'package:flutter/material.dart';

class GameAssetImageParams {
  final String imageUrl;
  final double? size;
  final String? label;
  final Color? borderColor;

  GameAssetImageParams({
    required this.imageUrl,
    this.size,
    this.borderColor,
    this.label,
  });
}
