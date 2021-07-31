import 'package:riven/shared/domain/entities/skill.dart';

class SkillMapper {
  static Skill fromMap(Map<String, dynamic> map) {
    return Skill(
      key: map['key'],
      name: map['name'],
      imageUrl: map['src'],
    );
  }

  static Map<String, dynamic> toMap(Skill skill) {
    return {
      'key': skill.key,
      'name': skill.name,
      'src': skill.imageUrl,
    };
  }
}
