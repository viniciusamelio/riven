import 'package:equatable/equatable.dart';

class SummonerSpell extends Equatable {
  SummonerSpell({
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String imageUrl;

  @override
  List<Object> get props => [name, imageUrl];
}
