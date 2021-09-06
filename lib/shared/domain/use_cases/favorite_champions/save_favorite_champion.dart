import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/repositories/favorite_champions.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/isave_favorite_champion_use_case.dart';

class SaveFavoriteChampion implements ISaveFavoriteChampionUseCase {
  final FavoriteChampionsRepository repository;

  SaveFavoriteChampion(this.repository);

  void call(String key, Build value) {
    repository.save(key, value);
  }
}
