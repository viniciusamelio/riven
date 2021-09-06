import 'package:riven/shared/domain/entities/champion_counter.dart';

class ChampionCounterMapper {
  static ChampionCounter fromMap(Map<String, dynamic> map) {
    return ChampionCounter(
        gamesCount: int.parse(
          map['gamesCount']
              .toString()
              .replaceAll('games', '')
              .replaceAll(',', '')
              .replaceAll('.', '')
              .trim(),
        ),
        name: map['name'],
        portraitUrl: map['src'],
        winrate: double.parse(
          map['winrate'].toString().replaceAll('% WR', '').trim(),
        ));
  }

  static Map<String, dynamic> toMap(ChampionCounter champion) {
    return {
      'gamesCount': champion.gamesCount,
      'name': champion.name,
      'src': champion.portraitUrl,
      'winrate': champion.winrate,
    };
  }
}
