import 'package:riven/shared/domain/repositories/favorite_champions.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/iget_favorite_champions_use_case.dart';

class GetFavoriteChampions implements IGetFavoriteChampionsUseCase {
  final FavoriteChampionsRepository repository;

  GetFavoriteChampions(this.repository);

  Future<List> call() async {
    final result = await repository.list();
    return result;
  }
}
