import 'package:equatable/equatable.dart';
import 'package:riven/shared/domain/entities/rune.dart';

class RuneTree extends Equatable {
  RuneTree({
    required this.name,
    required this.imageUrl,
    required this.runes,
  });

  final String name;
  final String imageUrl;
  final List<Rune> runes;

  @override
  List<Object> get props => [name, imageUrl, runes];
}
