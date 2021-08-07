import 'package:riven/shared/domain/entities/build.dart';

class PortraitGridParams {
  int? maxCrossAxisExtent;
  final List<Build> builds;
  double? portraitsSize;

  PortraitGridParams(
    this.builds, {
    this.maxCrossAxisExtent,
    this.portraitsSize,
  });
}
