import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/entities/champion_stats.dart';

class BuildHeaderParams {
  final Build build;
  late ChampionStats championStats;
  BuildHeaderParams({
    required this.build,
  }) {
    championStats = build.champion!;
  }
}
