import 'package:riven/shared/domain/entities/champion_stats.dart';

class ChampionStatsMapper {
  static ChampionStats fromMap(Map<String, dynamic> map) {
    return ChampionStats(
      banrate: double.parse(
        map['banrate'].replaceAll('%', ''),
      ),
      gamesAnalyzed: int.parse(
        map['gamesAnalyzed'].toString().replaceAll(',', ''),
      ),
      name: map['name'],
      pickrate: double.parse(
        map['pickrate'].replaceAll('%', ''),
      ),
      portraitUrl: map['portrait'],
      role: map['role'],
      tier: map['tier'],
      winrate: double.parse(
        map['winrate'].toString().replaceAll('%', ''),
      ),
    );
  }
}
