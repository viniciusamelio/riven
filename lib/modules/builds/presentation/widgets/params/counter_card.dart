import 'package:riven/shared/domain/entities/champion_counter.dart';

class CounterCardParams {
  final ChampionCounter champion;
  final Function onTap;

  CounterCardParams({
    required this.champion,
    required this.onTap,
  });
}
