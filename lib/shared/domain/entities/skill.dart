import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  Skill({
    required this.key,
    required this.name,
    required this.imageUrl,
  });

  final String key;
  final String name;
  final String imageUrl;

  @override
  List<Object> get props => [key, name, imageUrl];
}
