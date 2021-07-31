import 'package:riven/shared/domain/entities/champion_counter.dart';

class ChampionCounterMapper {
  static ChampionCounter fromMap(Map<String, dynamic> map) {
    return ChampionCounter(
        gamesCount: int.parse(
          map['gamesCount'].toString().replaceAll('games', '').trim(),
        ),
        name: map['name'],
        portraitUrl: map['src'],
        winrate: double.parse(
          map['winrate'].toString().replaceAll('% WR', '').trim(),
        ));
  }
}
