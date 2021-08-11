import 'package:riven/shared/domain/entities/champion_counter.dart';

class CountersSectionParams {
  final String championName;
  final List<ChampionCounter> champions;
  CountersSectionParams({
    required this.champions,
    required this.championName,
  });
}
