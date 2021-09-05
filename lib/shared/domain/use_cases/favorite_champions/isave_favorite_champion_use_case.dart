import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/repositories/favorite_champions.dart';

abstract class ISaveFavoriteChampionUseCase {
  final FavoriteChampionsRepository repository;

  ISaveFavoriteChampionUseCase(this.repository);

  void call(String key, Build build);
}
