import 'package:riven/shared/domain/entities/rune.dart';

class RuneMapper {
  static Rune fromMap(Map<String, dynamic> map) {
    return Rune(
      name: map['name'],
      imageUrl: map['src'],
    );
  }

  static Map<String, dynamic> toMap(Rune rune) {
    return {
      'name': rune.name,
      'src': rune.imageUrl,
    };
  }
}
