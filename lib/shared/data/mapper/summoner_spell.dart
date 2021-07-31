import 'package:riven/shared/domain/entities/summoner_spell.dart';

class SpellMapper {
  static SummonerSpell fromMap(Map<String, dynamic> map) {
    return SummonerSpell(
      name: map['name'],
      imageUrl: map['src'],
    );
  }

  static Map<String, dynamic> toMap(SummonerSpell spell) {
    return {
      'name': spell.name,
      'src': spell.imageUrl,
    };
  }
}
