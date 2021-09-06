import 'package:riven/shared/domain/entities/champion_stats.dart';

class ChampionStatsMapper {
  static ChampionStats fromMap(Map<String, dynamic> map) {
    return ChampionStats(
      banrate: map['banrate'].runtimeType == String
          ? double.parse(
              map['banrate'].replaceAll('%', ''),
            )
          : map['banrate'],
      gamesAnalyzed: map['gamesAnalyzed'].runtimeType == String
          ? int.parse(
              map['gamesAnalyzed'].toString().replaceAll(',', ''),
            )
          : map['gamesAnalyzed'],
      name: map['name'],
      pickrate: map['pickrate'].runtimeType == String
          ? double.parse(
              map['pickrate'].replaceAll('%', ''),
            )
          : map['pickrate'],
      portraitUrl: map['portrait'],
      role: map['role'],
      tier: map['tier'],
      winrate: map['winrate'].runtimeType == String
          ? double.parse(
              map['winrate'].toString().replaceAll('%', ''),
            )
          : map['winrate'],
    );
  }

  static Map<String, dynamic> toMap(ChampionStats championStats) {
    return {
      'banrate': championStats.banrate,
      'gamesAnalyzed': championStats.gamesAnalyzed,
      'name': championStats.name,
      'pickrate': championStats.pickrate,
      'portrait': championStats.portraitUrl,
      'role': championStats.role,
      'tier': championStats.tier,
      'winrate': championStats.winrate,
    };
  }
}
