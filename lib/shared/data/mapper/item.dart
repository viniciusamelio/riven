import 'package:riven/shared/domain/entities/item.dart';

class ItemMapper {
  static Item fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'],
      imageUrl: map['src'],
    );
  }
}
