import 'package:riven/shared/domain/repositories/favorite_champions.dart';

abstract class IRemoveFavoriteChampionUseCase {
  final FavoriteChampionsRepository repository;
  IRemoveFavoriteChampionUseCase(this.repository);

  void call(String key);
}
