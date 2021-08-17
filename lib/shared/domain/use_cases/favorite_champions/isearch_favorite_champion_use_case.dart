import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/repositories/favorite_champions.dart';

abstract class ISearchFavoriteChampionUseCase {
  final FavoriteChampionsRepository repository;
  ISearchFavoriteChampionUseCase(this.repository);
  Future<Build> call();
}
