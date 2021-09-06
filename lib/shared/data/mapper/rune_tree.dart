import 'package:riven/shared/data/mapper/rune.dart';
import 'package:riven/shared/domain/entities/rune.dart';
import 'package:riven/shared/domain/entities/rune_tree.dart';

class RuneTreeMapper {
  static RuneTree fromMap(Map<String, dynamic> map) {
    final List<Rune> runes = [];

    for (var rune in map['runes']) {
      runes.add(RuneMapper.fromMap(rune));
    }

    return RuneTree(
      name: map['perkName'],
      imageUrl: map['src'],
      runes: runes,
    );
  }

  static Map<String, dynamic> toMap(RuneTree runeTree) {
    final List<Map<String, dynamic>> runes = [];

    runeTree.runes.map(
      (rune) => runes.add(
        RuneMapper.toMap(rune),
      ),
    );
    return {
      'perkName': runeTree.name,
      'src': runeTree.imageUrl,
      'runes': runeTree.runes
          .map(
            (rune) => RuneMapper.toMap(rune),
          )
          .toList(),
    };
  }
}
