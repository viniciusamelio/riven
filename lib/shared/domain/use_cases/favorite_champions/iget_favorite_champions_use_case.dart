import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/repositories/favorite_champions.dart';

abstract class IGetFavoriteChampionsUseCase {
  final FavoriteChampionsRepository repository;

  IGetFavoriteChampionsUseCase(this.repository);

  Future<List<Build>> call();
}
