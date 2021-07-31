import 'package:equatable/equatable.dart';

class ChampionStats extends Equatable {
  ChampionStats({
    required this.banrate,
    required this.gamesAnalyzed,
    required this.name,
    required this.pickrate,
    required this.portraitUrl,
    required this.role,
    required this.tier,
    required this.winrate,
  });

  final double banrate;
  final int gamesAnalyzed;
  final String name;
  final double pickrate;
  final String portraitUrl;
  final String role;
  final String tier;
  final double winrate;

  @override
  List<Object> get props => [
        banrate,
        gamesAnalyzed,
        name,
        pickrate,
        portraitUrl,
        role,
        tier,
        winrate
      ];
}
