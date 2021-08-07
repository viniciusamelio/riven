import 'package:flutter/widgets.dart';
import 'package:riven/shared/domain/entities/build.dart';

class PortraitGridParams {
  String? routeName;
  int? maxCrossAxisExtent;
  final List<Build> builds;
  double? portraitsSize;
  Color? accentColor;

  PortraitGridParams(
    this.builds, {
    this.maxCrossAxisExtent,
    this.routeName,
    this.accentColor,
    this.portraitsSize,
  });
}
