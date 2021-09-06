import 'package:riven/shared/data/mapper/build.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/repositories/favorite_champions.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/iget_favorite_champions_use_case.dart';

class GetFavoriteChampions implements IGetFavoriteChampionsUseCase {
  final FavoriteChampionsRepository repository;

  GetFavoriteChampions(this.repository);

  Future<List<Build>> call() async {
    final Iterable result = await repository.list();
    return result
        .map(
          (build) => BuildMapper.fromMap(build),
        )
        .toList();
  }
}
