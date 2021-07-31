import 'package:riven/shared/domain/entities/champion_stats.dart';

class ChampionStatsMapper {
  static ChampionStats fromMap(Map<String, dynamic> map) {
    return ChampionStats(
      banrate: double.parse(
        map['banrate'].toString().replaceAll('%', '').replaceAll('.', ''),
      ),
      gamesAnalyzed: int.parse(
        map['gamesAnalyzed'].toString().replaceAll(',', 'replace'),
      ),
      name: map['name'],
      pickrate: double.parse(
        map['pickrate'].toString().replaceAll('%', '').replaceAll('.', ''),
      ),
      portraitUrl: map['portrait'],
      role: map['role'],
      tier: map['tier'],
      winrate: double.parse(
        map['winrate'].toString().replaceAll('%', '').replaceAll('.', ''),
      ),
    );
  }
}
