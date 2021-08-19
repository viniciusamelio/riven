import 'package:riven/shared/domain/repositories/favorite_champions.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/iremove_favorite_champion_use_case.dart';

class RemoveFavoriteChampion implements IRemoveFavoriteChampionUseCase {
  final FavoriteChampionsRepository repository;

  RemoveFavoriteChampion(this.repository);

  void call(String key) {
    repository.remove(key);
  }
}
