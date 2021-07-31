import 'package:equatable/equatable.dart';

class ChampionCounter extends Equatable {
  ChampionCounter({
    required this.gamesCount,
    required this.name,
    required this.portraitUrl,
    required this.winrate,
  });
  final int gamesCount;
  final String name;
  final String portraitUrl;
  final double winrate;

  @override
  @override
  List<Object> get props => [gamesCount, name, portraitUrl, winrate];
}
