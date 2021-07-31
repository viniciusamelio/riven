import 'package:riven/shared/data/mapper/champion_counter.dart';
import 'package:riven/shared/data/mapper/champion_stats.dart';
import 'package:riven/shared/data/mapper/item.dart';
import 'package:riven/shared/data/mapper/rune_tree.dart';
import 'package:riven/shared/data/mapper/skill.dart';
import 'package:riven/shared/data/mapper/summoner_spell.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/entities/champion_counter.dart';
import 'package:riven/shared/domain/entities/item.dart';
import 'package:riven/shared/domain/entities/rune_tree.dart';
import 'package:riven/shared/domain/entities/skill.dart';
import 'package:riven/shared/domain/entities/summoner_spell.dart';

class BuildMapper {
  static Build fromMap(dynamic map) {
    final List<ChampionCounter> countereds = [];

    for (var countered in map['countered']) {
      countereds.add(ChampionCounterMapper.fromMap(countered));
    }

    final List<ChampionCounter> counters = [];

    for (var counter in map['counters']) {
      counters.add(ChampionCounterMapper.fromMap(counter));
    }

    final List<Item> items = [];

    for (var item in map['items']['starting']) {
      items.add(ItemMapper.fromMap(item));
    }

    for (var item in map['items']['endgame']) {
      items.add(ItemMapper.fromMap(item));
    }

    final List<RuneTree> runes = [];

    for (var rune in map['runes']) {
      runes.add(RuneTreeMapper.fromMap(rune));
    }

    final List<Skill> skills = [];

    for (var skill in map['skillsPriority']) {
      skills.add(SkillMapper.fromMap(skill));
    }

    final List<SummonerSpell> spells = [];

    for (var spell in map['spells']) {
      spells.add(SpellMapper.fromMap(spell));
    }

    return Build(
      champion: ChampionStatsMapper.fromMap(
        map['champion'],
      ),
      countereds: countereds,
      counters: counters,
      items: items,
      runes: runes,
      skillPriority: skills,
      spells: spells,
    );
  }
}
