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

    final List<Item> earlyItems = [];
    final List<Item> endgameItems = [];

    for (var item in map['items']['starting']) {
      earlyItems.add(ItemMapper.fromMap(item));
    }

    for (var item in map['items']['endgame']) {
      endgameItems.add(ItemMapper.fromMap(item));
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
      earlyItems: earlyItems,
      items: endgameItems,
      runes: runes,
      skillPriority: skills,
      spells: spells,
    );
  }

  static Map<String, dynamic> toMap(Build build) {
    final List<ChampionCounter> countereds = [];
    final List<ChampionCounter> counters = [];
    final List<Item> earlyItems = [];
    final List<Item> endgameItems = [];
    final List<RuneTree> runes = [];
    final List<Skill> skillPriority = [];
    final List<SummonerSpell> spells = [];

    build.countereds!.map(
      (champion) => ChampionCounterMapper.toMap(champion),
    );

    build.counters!.map(
      (champion) => ChampionCounterMapper.toMap(champion),
    );

    build.earlyItems!.map(
      (item) => ItemMapper.toMap(item),
    );

    build.items!.map(
      (item) => ItemMapper.toMap(item),
    );

    build.runes!.map(
      (rune) => RuneTreeMapper.toMap(rune),
    );

    build.skillPriority!.map(
      (skill) => SkillMapper.toMap(skill),
    );

    build.spells!.map(
      (spell) => SpellMapper.toMap(spell),
    );

    return {
      'champion': ChampionStatsMapper.toMap(build.champion!),
      'countereds': countereds,
      'counters': counters,
      'earlyItems': earlyItems,
      'items': endgameItems,
      'runes': runes,
      'skillPriority': skillPriority,
      'spells': spells,
    };
  }
}
