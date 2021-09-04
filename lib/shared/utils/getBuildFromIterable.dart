import 'package:riven/shared/domain/entities/build.dart';

List<Build> getBuildFromIterable(
    Iterable<String> iterable, List<Build> buildSource) {
  final List<Build> builds = [];
  for (var championName in iterable) {
    for (var e in buildSource) {
      if (e.champion!.name == championName) {
        builds.add(e);
      }
    }
  }

  return builds;
}
