import 'package:riven/shared/data/mapper/build.dart';
import 'package:riven/shared/domain/datasources/local_storage.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/repositories/favorite_champions.dart';

class FavoriteChampionsRepositoryImpl implements FavoriteChampionsRepository {
  final LocalStorage _dataSource;

  FavoriteChampionsRepositoryImpl(this._dataSource);

  @override
  list() async {
    final Iterable favoritedBuilds = await _dataSource.list();
    return favoritedBuilds;
  }

  @override
  void remove(String key) {
    _dataSource.remove(key);
  }

  @override
  void save(String key, Build build) {
    _dataSource.save(
      key,
      BuildMapper.toMap(build),
    );
  }
}
