import 'package:equatable/equatable.dart';
import 'package:riven/shared/domain/entities/champion_counter.dart';
import 'package:riven/shared/domain/entities/champion_stats.dart';
import 'package:riven/shared/domain/entities/item.dart';
import 'package:riven/shared/domain/entities/rune_tree.dart';
import 'package:riven/shared/domain/entities/skill.dart';
import 'package:riven/shared/domain/entities/summoner_spell.dart';

class Build extends Equatable {
  final ChampionStats? champion;
  final List<ChampionCounter>? countereds;
  final List<ChampionCounter>? counters;
  final List<Item>? items;
  final List<RuneTree>? runes;
  final List<Skill>? skillPriority;
  final List<SummonerSpell>? spells;

  Build(
      {this.champion,
      this.countereds,
      this.counters,
      this.items,
      this.runes,
      this.skillPriority,
      this.spells});

  @override
  List<Object?> get props => [
        champion,
        countereds,
        counters,
        items,
        runes,
        skillPriority,
        spells,
      ];
}
